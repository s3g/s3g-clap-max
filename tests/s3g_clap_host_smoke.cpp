#include "s3g_clap_discovery.h"
#include "s3g_clap_engine.h"
#if defined(__APPLE__)
#include "s3g_clap_editor.h"
#include <clap/ext/gui.h>
#endif

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <iostream>
#include <string>
#include <utility>
#include <vector>

namespace {

constexpr uint32_t kTestFrames = 64;

void setClapPathEnvironment(const std::string* value)
{
#if defined(_WIN32)
    _putenv_s("CLAP_PATH", value ? value->c_str() : "");
#else
    if (value) setenv("CLAP_PATH", value->c_str(), 1);
    else unsetenv("CLAP_PATH");
#endif
}

class ScopedClapPath {
public:
    explicit ScopedClapPath(const std::string& value)
    {
        if (const char* existing = std::getenv("CLAP_PATH")) {
            previous_ = existing;
            hadPrevious_ = true;
        }
        setClapPathEnvironment(&value);
    }

    ~ScopedClapPath()
    {
        setClapPathEnvironment(hadPrevious_ ? &previous_ : nullptr);
    }

private:
    std::string previous_;
    bool hadPrevious_ = false;
};

class TemporaryTree {
public:
    explicit TemporaryTree(std::filesystem::path path)
        : path_(std::move(path))
    {
    }

    ~TemporaryTree()
    {
        std::error_code error;
        std::filesystem::remove_all(path_, error);
    }

private:
    std::filesystem::path path_;
};

bool verifyDiscoveryRules()
{
    namespace fs = std::filesystem;
    const auto token = std::chrono::steady_clock::now()
        .time_since_epoch().count();
    const fs::path root = fs::temp_directory_path()
        / ("s3g-clap-max-discovery-" + std::to_string(token));
    TemporaryTree cleanup(root);
    std::error_code filesystemError;
    const fs::path unique = root
        / "s3g_clap_max_discovery_fixture.clap";
    fs::create_directories(unique, filesystemError);
    if (filesystemError) {
        std::cerr << "could not create discovery fixture: "
                  << filesystemError.message() << '\n';
        return false;
    }

#if defined(_WIN32)
    constexpr char separator = ';';
#else
    constexpr char separator = ':';
#endif
    std::string searchPath = root.string();
    if (const char* existing = std::getenv("CLAP_PATH");
        existing && existing[0] != '\0')
        searchPath += separator + std::string(existing);
    ScopedClapPath environment(searchPath);

    std::string resolved;
    std::string error;
    if (!s3g::max_host::resolveClapBundle(
            "s3g clap max discovery fixture", resolved, error)
        || fs::weakly_canonical(resolved) != fs::weakly_canonical(unique)) {
        std::cerr << "CLAP_PATH fixture resolution failed: " << error << '\n';
        return false;
    }

    fs::create_directories(root / "s3g_clap_max_ambiguous_alpha.clap",
        filesystemError);
    fs::create_directories(root / "s3g_clap_max_ambiguous_beta.clap",
        filesystemError);
    if (filesystemError) {
        std::cerr << "could not create ambiguity fixtures: "
                  << filesystemError.message() << '\n';
        return false;
    }
    if (s3g::max_host::resolveClapBundle(
            "s3g clap max ambiguous", resolved, error)
        || error.find("ambiguous CLAP name") == std::string::npos) {
        std::cerr << "ambiguous discovery was not rejected: " << error
                  << '\n';
        return false;
    }
    return true;
}

int runSmoke(int argc, char** argv)
{
    if (argc < 2 || argc > 3) {
        std::cerr << "usage: s3g_clap_host_smoke /path/to/plugin.clap "
                     "[plugin-name]\n";
        return 2;
    }

    if (!verifyDiscoveryRules()) return 1;

    const std::string expectedPath = std::filesystem::weakly_canonical(
        argv[1]).string();
    const auto verifyResolution = [&](const std::string& reference) {
        std::string resolved;
        std::string resolutionError;
        if (!s3g::max_host::resolveClapBundle(reference, resolved,
                resolutionError)) {
            std::cerr << "discovery failed for \"" << reference << "\": "
                      << resolutionError << '\n';
            return false;
        }
        if (std::filesystem::weakly_canonical(resolved).string()
            != expectedPath) {
            std::cerr << "discovery resolved \"" << reference << "\" to "
                      << resolved << " instead of " << expectedPath << '\n';
            return false;
        }
        return true;
    };
    if (!verifyResolution(std::filesystem::path(argv[1]).stem().string())
        || (argc == 3 && !verifyResolution(argv[2])))
        return 1;

    s3g::max_host::ClapEngine engine;
    std::string error;
    if (!engine.open(argv[1], {}, error)) {
        std::cerr << "open failed: " << error << '\n';
        return 1;
    }
    if (engine.outputChannels() == 0) {
        std::cerr << "unexpected channel topology: "
                  << engine.inputChannels() << " in, "
                  << engine.outputChannels() << " out\n";
        return 1;
    }
    if (!engine.activate(48000.0, kTestFrames, error)) {
        std::cerr << "activation failed: " << error << '\n';
        return 1;
    }

    // A CLAP entry is initialized once per loaded module, not once per Max
    // object. Keep a second instance alive to exercise the shared-module path.
    s3g::max_host::ClapEngine secondInstance;
    if (!secondInstance.open(argv[1], {}, error)
        || !secondInstance.activate(48000.0, kTestFrames, error)) {
        std::cerr << "second instance failed: " << error << '\n';
        return 1;
    }

#if defined(__APPLE__)
    const auto* gui = engine.pluginHandle() && engine.pluginHandle()->get_extension
        ? static_cast<const clap_plugin_gui_t*>(
            engine.pluginHandle()->get_extension(
                engine.pluginHandle(), CLAP_EXT_GUI))
        : nullptr;
    if (gui) {
        S3GClapEditor* editor = s3gCreateClapEditor(engine.pluginHandle(),
            "s3g.clap~ GUI smoke", error);
        if (!editor || !s3gHideClapEditor(editor)
            || !s3gShowClapEditor(editor)) {
            std::cerr << "CLAP GUI lifecycle failed: " << error << '\n';
            s3gDestroyClapEditor(editor);
            return 1;
        }
        s3gDestroyClapEditor(editor);
    }
#endif

    if (!engine.parameters().empty()) {
        const auto& parameter = engine.parameters().front();
        if (!engine.enqueueParameter(1, parameter.defaultValue)) {
            std::cerr << "parameter enqueue failed\n";
            return 1;
        }
    }

    std::vector<std::vector<double>> input(engine.inputChannels(),
        std::vector<double>(kTestFrames, 0.0));
    std::vector<std::vector<double>> output(engine.outputChannels(),
        std::vector<double>(kTestFrames, 0.0));
    if (!input.empty()) input.front().front() = 0.25;
    if (input.size() > 1) input[1].front() = -0.25;
    std::vector<double*> inputPointers;
    std::vector<double*> outputPointers;
    inputPointers.reserve(input.size());
    outputPointers.reserve(output.size());
    for (auto& channel : input) inputPointers.push_back(channel.data());
    for (auto& channel : output) outputPointers.push_back(channel.data());

    for (int block = 0; block < 8; ++block) {
        if (!engine.process(inputPointers.data(), engine.inputChannels(),
                outputPointers.data(), engine.outputChannels(), kTestFrames)) {
            std::cerr << "processing failed at block " << block << '\n';
            return 1;
        }
        for (const auto& channel : output)
            if (!std::all_of(channel.begin(), channel.end(), [](double value) {
                    return std::isfinite(value);
                })) {
                std::cerr << "non-finite audio output\n";
                return 1;
            }
        for (auto& channel : input)
            std::fill(channel.begin(), channel.end(), 0.0);
    }

    if (engine.inputChannels() > 0) {
        for (auto& channel : output)
            std::fill(channel.begin(), channel.end(), 0.0);
        if (!engine.process(nullptr, 0, outputPointers.data(),
                engine.outputChannels(), kTestFrames)) {
            std::cerr << "silent missing-input processing failed\n";
            return 1;
        }
        for (const auto& channel : output)
            if (!std::all_of(channel.begin(), channel.end(), [](double value) {
                    return std::isfinite(value);
                })) {
                std::cerr << "non-finite missing-input audio output\n";
                return 1;
            }
    }

    const uint32_t visibleOutputs = std::min<uint32_t>(
        16, engine.outputChannels());
    std::vector<std::vector<double>> narrowOutput(visibleOutputs,
        std::vector<double>(kTestFrames, 0.0));
    std::vector<double*> narrowOutputPointers;
    narrowOutputPointers.reserve(narrowOutput.size());
    for (auto& channel : narrowOutput)
        narrowOutputPointers.push_back(channel.data());
    const uint32_t visibleInputs = std::min<uint32_t>(
        3, engine.inputChannels());
    if (!engine.process(inputPointers.data(), visibleInputs,
            narrowOutputPointers.data(), visibleOutputs, kTestFrames)) {
        std::cerr << "narrow visible-channel processing failed\n";
        return 1;
    }
    for (const auto& channel : narrowOutput)
        if (!std::all_of(channel.begin(), channel.end(), [](double value) {
                return std::isfinite(value);
            })) {
            std::cerr << "non-finite narrow-channel audio output\n";
            return 1;
        }

    std::vector<uint8_t> state;
    if (engine.saveState(state)) {
        if (state.empty() || !engine.loadState(state)) {
            std::cerr << "CLAP state round trip failed\n";
            return 1;
        }
    }

    // Closing the final instances after exercising a Cocoa editor used to
    // unload the plugin bundle before the surrounding autorelease pool was
    // drained. Reopen it here to verify process-lifetime module retention.
    secondInstance.close();
    engine.close();
    if (!engine.open(argv[1], {}, error)) {
        std::cerr << "reopen after final close failed: " << error << '\n';
        return 1;
    }

    std::cout << "loaded " << engine.pluginName() << " ("
              << engine.pluginId() << "), " << engine.inputChannels()
              << " in, " << engine.outputChannels() << " out, "
              << engine.parameters().size() << " parameters\n";
    return 0;
}

} // namespace

int main(int argc, char** argv)
{
#if defined(__APPLE__)
    @autoreleasepool {
        return runSmoke(argc, argv);
    }
#else
    return runSmoke(argc, argv);
#endif
}
