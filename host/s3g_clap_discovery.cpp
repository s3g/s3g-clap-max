#include "s3g_clap_discovery.h"

#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <filesystem>
#include <sstream>
#include <unordered_set>
#include <utility>
#include <vector>

#if defined(__APPLE__)
#include <CoreFoundation/CoreFoundation.h>
#endif

namespace s3g::max_host {
namespace {

namespace fs = std::filesystem;

struct BundleCandidate {
    std::string path;
    std::string label;
    std::vector<std::string> names;
    int score = 0;
};

std::string lowercase(std::string value)
{
    std::transform(value.begin(), value.end(), value.begin(),
        [](unsigned char character) {
            return static_cast<char>(std::tolower(character));
        });
    return value;
}

std::string normalizedName(const std::string& value)
{
    std::string result;
    result.reserve(value.size());
    for (char rawCharacter : value) {
        const auto character = static_cast<unsigned char>(rawCharacter);
        if (std::isalnum(character))
            result.push_back(static_cast<char>(std::tolower(character)));
    }
    return result;
}

bool hasClapExtension(const fs::path& path)
{
    return lowercase(path.extension().string()) == ".clap";
}

fs::path expandedPath(const std::string& value)
{
    if (value.size() >= 2 && value[0] == '~'
        && (value[1] == '/' || value[1] == '\\')) {
        if (const char* home = std::getenv("HOME"))
            return fs::path(home) / value.substr(2);
    }
    return fs::path(value);
}

std::string canonicalPath(const fs::path& path)
{
    std::error_code error;
    const fs::path canonical = fs::weakly_canonical(path, error);
    return (error ? path.lexically_normal() : canonical).string();
}

void appendUniqueRoot(std::vector<std::string>& roots,
    std::unordered_set<std::string>& seen, const fs::path& path)
{
    if (path.empty()) return;
    std::error_code error;
    if (!fs::is_directory(path, error) || error) return;
    const std::string canonical = canonicalPath(path);
    if (seen.insert(canonical).second) roots.push_back(canonical);
}

void appendEnvironmentRoots(std::vector<std::string>& roots,
    std::unordered_set<std::string>& seen)
{
    const char* value = std::getenv("CLAP_PATH");
    if (!value || value[0] == '\0') return;
#if defined(_WIN32)
    constexpr char separator = ';';
#else
    constexpr char separator = ':';
#endif
    std::stringstream stream(value);
    std::string item;
    while (std::getline(stream, item, separator))
        if (!item.empty()) appendUniqueRoot(roots, seen, expandedPath(item));
}

#if defined(__APPLE__)
std::string cfStringValue(CFStringRef value)
{
    if (!value) return {};
    const CFIndex capacity = CFStringGetMaximumSizeForEncoding(
        CFStringGetLength(value), kCFStringEncodingUTF8) + 1;
    if (capacity <= 1) return {};
    std::vector<char> text(static_cast<size_t>(capacity), '\0');
    return CFStringGetCString(value, text.data(), capacity,
               kCFStringEncodingUTF8)
        ? std::string(text.data()) : std::string {};
}

std::vector<std::string> bundleMetadataNames(const fs::path& path)
{
    std::vector<std::string> names;
    const std::string native = path.string();
    CFURLRef url = CFURLCreateFromFileSystemRepresentation(
        kCFAllocatorDefault,
        reinterpret_cast<const UInt8*>(native.c_str()),
        static_cast<CFIndex>(native.size()), true);
    if (!url) return names;
    CFDictionaryRef info = CFBundleCopyInfoDictionaryForURL(url);
    CFRelease(url);
    if (!info) return names;
    const CFStringRef keys[] = {
        CFSTR("CFBundleDisplayName"), CFSTR("CFBundleName"),
        CFSTR("CFBundleIdentifier"),
    };
    for (CFStringRef key : keys) {
        const auto* value = static_cast<CFStringRef>(
            CFDictionaryGetValue(info, key));
        if (!value || CFGetTypeID(value) != CFStringGetTypeID()) continue;
        const std::string name = cfStringValue(value);
        if (!name.empty()
            && std::find(names.begin(), names.end(), name) == names.end())
            names.push_back(name);
    }
    CFRelease(info);
    return names;
}
#else
std::vector<std::string> bundleMetadataNames(const fs::path&)
{
    return {};
}
#endif

std::vector<BundleCandidate> discoverBundles(
    const std::vector<std::string>& roots)
{
    std::vector<BundleCandidate> bundles;
    std::unordered_set<std::string> seen;
    for (const std::string& root : roots) {
        std::vector<fs::path> found;
        std::error_code error;
        fs::recursive_directory_iterator iterator(root,
            fs::directory_options::skip_permission_denied, error);
        const fs::recursive_directory_iterator end;
        while (!error && iterator != end) {
            const fs::path candidate = iterator->path();
            if (hasClapExtension(candidate)) {
                found.push_back(candidate);
                if (iterator->is_directory(error) && !error)
                    iterator.disable_recursion_pending();
                error.clear();
            }
            iterator.increment(error);
            if (error) error.clear();
        }
        std::sort(found.begin(), found.end());
        for (const fs::path& candidatePath : found) {
            const std::string canonical = canonicalPath(candidatePath);
            if (!seen.insert(canonical).second) continue;
            BundleCandidate candidate;
            candidate.path = canonical;
            candidate.names.push_back(candidatePath.filename().string());
            candidate.names.push_back(candidatePath.stem().string());
            auto metadataNames = bundleMetadataNames(candidatePath);
            candidate.names.insert(candidate.names.end(),
                metadataNames.begin(), metadataNames.end());
            candidate.label = metadataNames.empty()
                ? candidatePath.stem().string() : metadataNames.front();
            bundles.push_back(std::move(candidate));
        }
    }
    return bundles;
}

int matchScore(const std::string& reference, const std::string& name)
{
    if (lowercase(reference) == lowercase(name)) return 400;
    const std::string normalizedReference = normalizedName(reference);
    const std::string normalizedCandidate = normalizedName(name);
    if (normalizedReference.empty() || normalizedCandidate.empty()) return 0;
    if (normalizedReference == normalizedCandidate) return 350;
    if (normalizedReference.size() < 4) return 0;
    if (normalizedCandidate.size() >= normalizedReference.size()
        && normalizedCandidate.compare(normalizedCandidate.size()
                - normalizedReference.size(), normalizedReference.size(),
                normalizedReference) == 0)
        return 300;
    if (normalizedCandidate.find(normalizedReference) != std::string::npos)
        return 250;
    return 0;
}

std::string searchFailure(const std::string& reference,
    const std::vector<std::string>& roots)
{
    std::ostringstream message;
    message << "no CLAP bundle named \"" << reference << "\" found";
    if (!roots.empty()) {
        message << "; searched";
        for (const std::string& root : roots) message << " " << root;
    }
    return message.str();
}

} // namespace

std::vector<std::string> clapSearchPaths()
{
    std::vector<std::string> roots;
    std::unordered_set<std::string> seen;
    appendEnvironmentRoots(roots, seen);
#if defined(__APPLE__)
    if (const char* home = std::getenv("HOME"))
        appendUniqueRoot(roots, seen,
            fs::path(home) / "Library/Audio/Plug-Ins/CLAP");
    appendUniqueRoot(roots, seen, "/Library/Audio/Plug-Ins/CLAP");
#elif defined(_WIN32)
    if (const char* common = std::getenv("COMMONPROGRAMFILES"))
        appendUniqueRoot(roots, seen, fs::path(common) / "CLAP");
    if (const char* local = std::getenv("LOCALAPPDATA"))
        appendUniqueRoot(roots, seen,
            fs::path(local) / "Programs/Common/CLAP");
#else
    if (const char* home = std::getenv("HOME"))
        appendUniqueRoot(roots, seen, fs::path(home) / ".clap");
    appendUniqueRoot(roots, seen, "/usr/lib/clap");
#endif
    return roots;
}

bool resolveClapBundle(const std::string& reference, std::string& path,
    std::string& error)
{
    path.clear();
    error.clear();
    if (reference.empty()) {
        error = "empty CLAP path or name";
        return false;
    }

    const fs::path direct = expandedPath(reference);
    std::error_code filesystemError;
    if (fs::exists(direct, filesystemError) && !filesystemError) {
        if (!hasClapExtension(direct)) {
            error = "selected path does not end in .clap";
            return false;
        }
        path = canonicalPath(direct);
        return true;
    }
    if (reference.find('/') != std::string::npos
        || reference.find('\\') != std::string::npos) {
        error = "CLAP path does not exist: " + reference;
        return false;
    }

    const auto roots = clapSearchPaths();
    auto bundles = discoverBundles(roots);
    int bestScore = 0;
    for (auto& bundle : bundles) {
        for (const std::string& name : bundle.names)
            bundle.score = std::max(bundle.score, matchScore(reference, name));
        bestScore = std::max(bestScore, bundle.score);
    }
    if (bestScore == 0) {
        error = searchFailure(reference, roots);
        return false;
    }

    std::vector<const BundleCandidate*> matches;
    for (const auto& bundle : bundles)
        if (bundle.score == bestScore) matches.push_back(&bundle);
    if (matches.size() != 1) {
        std::ostringstream message;
        message << "ambiguous CLAP name \"" << reference << "\"; matches";
        const size_t count = std::min<size_t>(matches.size(), 6u);
        for (size_t index = 0; index < count; ++index)
            message << " " << matches[index]->label << " ("
                    << matches[index]->path << ")";
        if (matches.size() > count) message << " and more";
        error = message.str();
        return false;
    }

    path = matches.front()->path;
    return true;
}

} // namespace s3g::max_host
