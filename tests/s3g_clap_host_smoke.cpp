#include "s3g_clap_engine.h"
#if defined(__APPLE__)
#include "s3g_clap_editor.h"
#include <clap/ext/gui.h>
#endif

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

namespace {

constexpr uint32_t kMaximumTestChannels = 128;
constexpr uint32_t kTestFrames = 64;

int runSmoke(int argc, char** argv)
{
    if (argc != 2) {
        std::cerr << "usage: s3g_clap_host_smoke /path/to/plugin.clap\n";
        return 2;
    }

    s3g::max_host::ClapEngine engine(
        kMaximumTestChannels, kMaximumTestChannels);
    std::string error;
    if (!engine.open(argv[1], {}, error)) {
        std::cerr << "open failed: " << error << '\n';
        return 1;
    }
    if (engine.outputChannels() == 0
        || engine.outputChannels() > kMaximumTestChannels
        || engine.inputChannels() > kMaximumTestChannels) {
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
    s3g::max_host::ClapEngine secondInstance(
        kMaximumTestChannels, kMaximumTestChannels);
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
