#include "s3g_clap_module.h"

#include <array>
#include <cstring>
#include <filesystem>
#include <memory>
#include <mutex>
#include <unordered_map>

#if defined(__APPLE__)
#include <CoreFoundation/CoreFoundation.h>
#elif defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <dlfcn.h>
#endif

namespace s3g::max_host {
namespace {

std::filesystem::path filesystemPath(const std::string& path)
{
#if defined(_WIN32)
    const int length = MultiByteToWideChar(CP_UTF8, 0, path.c_str(),
        static_cast<int>(path.size()), nullptr, 0);
    if (length <= 0) return {};
    std::wstring native(static_cast<size_t>(length), L'\0');
    MultiByteToWideChar(CP_UTF8, 0, path.c_str(),
        static_cast<int>(path.size()), native.data(), length);
    return std::filesystem::path(native);
#else
    return std::filesystem::path(path);
#endif
}

std::string pathText(const std::filesystem::path& path)
{
#if defined(_WIN32)
    const std::wstring& native = path.native();
    const int length = WideCharToMultiByte(CP_UTF8, 0, native.c_str(),
        static_cast<int>(native.size()), nullptr, 0, nullptr, nullptr);
    if (length <= 0) return {};
    std::string result(static_cast<size_t>(length), '\0');
    WideCharToMultiByte(CP_UTF8, 0, native.c_str(),
        static_cast<int>(native.size()), result.data(), length, nullptr,
        nullptr);
    return result;
#else
    return path.string();
#endif
}

template <typename Function>
Function loadEntrySymbol(void* handle)
{
#if defined(__APPLE__)
    if (!handle) return nullptr;
    auto* bundle = static_cast<CFBundleRef>(handle);
    return reinterpret_cast<Function>(CFBundleGetDataPointerForName(
        bundle, CFSTR("clap_entry")));
#elif defined(_WIN32)
    return handle ? reinterpret_cast<Function>(GetProcAddress(
        static_cast<HMODULE>(handle), "clap_entry")) : nullptr;
#else
    return handle ? reinterpret_cast<Function>(dlsym(handle, "clap_entry"))
                  : nullptr;
#endif
}

void unloadNative(void* handle)
{
    if (!handle) return;
#if defined(__APPLE__)
    auto* bundle = static_cast<CFBundleRef>(handle);
    CFBundleUnloadExecutable(bundle);
    CFRelease(bundle);
#elif defined(_WIN32)
    FreeLibrary(static_cast<HMODULE>(handle));
#else
    dlclose(handle);
#endif
}

void* loadNative(const std::string& path, std::string& error)
{
#if defined(__APPLE__)
    CFURLRef url = CFURLCreateFromFileSystemRepresentation(
        kCFAllocatorDefault,
        reinterpret_cast<const UInt8*>(path.c_str()),
        static_cast<CFIndex>(path.size()), true);
    if (!url) {
        error = "could not create a bundle URL";
        return nullptr;
    }
    CFBundleRef bundle = CFBundleCreate(kCFAllocatorDefault, url);
    CFRelease(url);
    if (!bundle) {
        error = "path is not a loadable macOS bundle";
        return nullptr;
    }
    CFErrorRef loadError = nullptr;
    if (!CFBundleLoadExecutableAndReturnError(bundle, &loadError)) {
        error = "could not load the CLAP bundle executable";
        if (loadError) {
            CFStringRef description = CFErrorCopyDescription(loadError);
            if (description) {
                std::array<char, 2048> text {};
                if (CFStringGetCString(description, text.data(),
                        static_cast<CFIndex>(text.size()),
                        kCFStringEncodingUTF8))
                    error += std::string(": ") + text.data();
                CFRelease(description);
            }
            CFRelease(loadError);
        }
        CFRelease(bundle);
        return nullptr;
    }
    return bundle;
#elif defined(_WIN32)
    HMODULE module = LoadLibraryW(filesystemPath(path).c_str());
    if (!module)
        error = "LoadLibraryW failed with Windows error "
            + std::to_string(GetLastError());
    return module;
#else
    void* module = dlopen(path.c_str(), RTLD_LOCAL | RTLD_NOW);
    if (!module) {
        const char* message = dlerror();
        error = message ? message : "dlopen failed";
    }
    return module;
#endif
}

std::string safeString(const char* value)
{
    return value ? value : "";
}

} // namespace

class SharedClapModule {
public:
    ~SharedClapModule()
    {
        factory = nullptr;
        if (entryInitialized && entry && entry->deinit) entry->deinit();
        entryInitialized = false;
        entry = nullptr;
        unloadNative(nativeHandle);
        nativeHandle = nullptr;
    }

    void* nativeHandle = nullptr;
    const clap_plugin_entry_t* entry = nullptr;
    const clap_plugin_factory_t* factory = nullptr;
    std::string path;
    bool entryInitialized = false;
};

namespace {

struct ProcessModuleRegistry {
    std::mutex mutex;
    std::unordered_map<std::string, std::shared_ptr<SharedClapModule>> modules;
};

ProcessModuleRegistry& processModuleRegistry()
{
    // Native CLAP GUIs may leave platform objects or callbacks pending after
    // their final instance closes. Keep initialized modules mapped for Max's
    // process lifetime so those references cannot point into unloaded code.
    // Allocating the registry itself for process lifetime also avoids unsafe
    // static-destruction ordering.
    static auto* registry = new ProcessModuleRegistry;
    return *registry;
}

std::string normalizedPath(const std::string& path)
{
    std::error_code error;
    const std::filesystem::path canonical =
        std::filesystem::weakly_canonical(filesystemPath(path), error);
    return error ? path : pathText(canonical);
}

std::shared_ptr<SharedClapModule> loadSharedModule(const std::string& path,
    std::string& error)
{
    const std::string key = normalizedPath(path);
    auto& registry = processModuleRegistry();
    std::lock_guard<std::mutex> registryLock(registry.mutex);
    const auto existing = registry.modules.find(key);
    if (existing != registry.modules.end()) return existing->second;

    auto shared = std::make_shared<SharedClapModule>();
    shared->nativeHandle = loadNative(key, error);
    if (!shared->nativeHandle) return {};
    shared->entry = loadEntrySymbol<const clap_plugin_entry_t*>(
        shared->nativeHandle);
    if (!shared->entry) {
        error = "bundle does not export clap_entry";
        return {};
    }
    if (!clap_version_is_compatible(shared->entry->clap_version)) {
        error = "plugin uses an incompatible CLAP ABI";
        return {};
    }
    if (!shared->entry->init || !shared->entry->init(key.c_str())) {
        error = "CLAP entry initialization failed";
        return {};
    }
    shared->entryInitialized = true;
    shared->factory = shared->entry->get_factory
        ? static_cast<const clap_plugin_factory_t*>(
            shared->entry->get_factory(CLAP_PLUGIN_FACTORY_ID))
        : nullptr;
    if (!shared->factory || !shared->factory->get_plugin_count
        || !shared->factory->get_plugin_descriptor
        || !shared->factory->create_plugin) {
        error = "bundle has no usable CLAP plugin factory";
        return {};
    }
    shared->path = key;
    registry.modules.emplace(key, shared);
    return shared;
}

} // namespace

ClapModule::~ClapModule() { close(); }

bool ClapModule::open(const std::string& path, std::string& error)
{
    close();
    error.clear();
    if (path.empty()) {
        error = "empty CLAP path";
        return false;
    }
    if (!std::filesystem::exists(filesystemPath(path))) {
        error = "CLAP path does not exist";
        return false;
    }

    state_ = loadSharedModule(path, error);
    return state_ != nullptr;
}

void ClapModule::close()
{
    state_.reset();
}

bool ClapModule::isOpen() const
{
    return state_ && state_->entry;
}

const std::string& ClapModule::path() const
{
    static const std::string empty;
    return state_ ? state_->path : empty;
}

const clap_plugin_entry_t* ClapModule::entry() const
{
    return state_ ? state_->entry : nullptr;
}

const clap_plugin_factory_t* ClapModule::factory() const
{
    return state_ ? state_->factory : nullptr;
}

std::vector<ClapPluginDescriptor> ClapModule::descriptors() const
{
    std::vector<ClapPluginDescriptor> result;
    const auto* pluginFactory = factory();
    if (!pluginFactory) return result;
    const uint32_t count = pluginFactory->get_plugin_count(pluginFactory);
    result.reserve(count);
    for (uint32_t i = 0; i < count; ++i) {
        const clap_plugin_descriptor_t* descriptor =
            pluginFactory->get_plugin_descriptor(pluginFactory, i);
        if (!descriptor || !descriptor->id) continue;
        result.push_back({
            safeString(descriptor->id), safeString(descriptor->name),
            safeString(descriptor->vendor), safeString(descriptor->version),
        });
    }
    return result;
}

} // namespace s3g::max_host
