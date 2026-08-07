#pragma once

#include <clap/clap.h>

#include <atomic>
#include <cstdint>
#include <string>
#include <vector>

namespace s3g::clap_host {

// Owns one initialized CLAP entry and its factory. Multiple plugin
// instances may be created from the session. The graph must destroy every
// such instance before explicitly deinitializing (or destroying) the session;
// these are all control-thread lifecycle operations.
class EntrySession {
public:
    EntrySession() = default;
    ~EntrySession();

    EntrySession(const EntrySession&) = delete;
    EntrySession& operator=(
        const EntrySession&) = delete;

    bool initialize(const clap_plugin_entry_t* entry,
        const char* pluginPath);
    void deinitialize();

    bool isInitialized() const { return initialized_; }
    const clap_plugin_entry_t* entry() const { return entry_; }
    const clap_plugin_factory_t* factory() const { return factory_; }

private:
    const clap_plugin_entry_t* entry_ = nullptr;
    const clap_plugin_factory_t* factory_ = nullptr;
    std::string pluginPath_;
    bool initialized_ = false;
};

// Minimal in-process CLAP host used by the Max external. The host communicates
// with plugins only through the public CLAP ABI.
class Plugin {
public:
    Plugin();
    ~Plugin();

    Plugin(const Plugin&) = delete;
    Plugin& operator=(const Plugin&) = delete;

    bool create(const clap_plugin_entry_t* entry, const char* pluginId,
        const char* hostName);
    // Creates from a factory whose entry lifecycle is owned by an external
    // session (for example, a dynamically loaded CLAP module).
    bool create(const clap_plugin_entry_t* entry,
        const clap_plugin_factory_t* factory, const char* pluginId,
        const char* hostName);
    bool create(const EntrySession& entrySession,
        const char* pluginId, const char* hostName);
    void destroy();

    bool activate(double sampleRate, uint32_t minFrames, uint32_t maxFrames);
    void deactivate();
    void reset();
    clap_process_status process(const clap_process_t& processBlock) const;

    const clap_plugin_t* plugin() const { return plugin_; }
    const clap_plugin_entry_t* entry() const { return entry_; }
    bool isCreated() const { return plugin_ != nullptr; }
    bool isActive() const { return active_; }

    template <typename Extension>
    const Extension* extension(const char* id) const
    {
        return plugin_ && plugin_->get_extension
            ? static_cast<const Extension*>(plugin_->get_extension(plugin_, id))
            : nullptr;
    }

    bool saveState(std::vector<uint8_t>& destination) const;
    bool loadState(const std::vector<uint8_t>& source);

    // Thread-safe host requests are latched for the Cocoa/main-thread owner.
    bool takeRestartRequest();
    bool takeProcessRequest();
    bool takeCallbackRequest();
    bool hasRestartRequest() const
    {
        return restartRequested_.load(std::memory_order_acquire);
    }
    bool hasCallbackRequest() const
    {
        return callbackRequested_.load(std::memory_order_acquire);
    }
    bool hasGuiRequest() const
    {
        return guiResizeRequest_.load(std::memory_order_acquire) != 0u
            || guiShowRequested_.load(std::memory_order_acquire)
            || guiHideRequested_.load(std::memory_order_acquire)
            || guiClosedState_.load(std::memory_order_acquire) != 0u;
    }
    bool takeStateDirty();
    bool takeGuiResizeRequest(uint32_t& width, uint32_t& height);
    bool takeGuiShowRequest();
    bool takeGuiHideRequest();
    bool takeGuiClosed(bool& wasDestroyed);
    void serviceMainThreadCallback();

    // Extension callbacks use these thread-safe notification points.
    void notifyProcessRequested();
    void notifyStateDirty();
    void notifyGuiResizeRequested(uint32_t width, uint32_t height);
    void notifyGuiShowRequested();
    void notifyGuiHideRequested();
    void notifyGuiClosed(bool wasDestroyed);

private:
    static Plugin* fromHost(const clap_host_t* host);
    static const void* hostGetExtension(const clap_host_t* host,
        const char* extensionId);
    static void hostRequestRestart(const clap_host_t* host);
    static void hostRequestProcess(const clap_host_t* host);
    static void hostRequestCallback(const clap_host_t* host);

    clap_host_t host_ {};
    const clap_plugin_entry_t* entry_ = nullptr;
    const clap_plugin_t* plugin_ = nullptr;
    std::string hostName_;
    std::string pluginPath_;
    bool entryInitialized_ = false;
    bool active_ = false;
    bool processing_ = false;

    std::atomic<bool> restartRequested_ { false };
    std::atomic<bool> processRequested_ { false };
    std::atomic<bool> callbackRequested_ { false };
    std::atomic<bool> stateDirty_ { false };
    std::atomic<uint64_t> guiResizeRequest_ { 0u };
    std::atomic<bool> guiShowRequested_ { false };
    std::atomic<bool> guiHideRequested_ { false };
    std::atomic<uint32_t> guiClosedState_ { 0u };
};

} // namespace s3g::clap_host
