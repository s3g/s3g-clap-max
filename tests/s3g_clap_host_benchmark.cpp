#include "s3g_clap_engine.h"

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <limits>
#include <string>
#include <vector>

namespace {

constexpr double kSampleRate = 48000.0;
constexpr uint32_t kDefaultFrames = 64;
constexpr uint32_t kDefaultBlocks = 100000;
constexpr uint32_t kWarmupBlocks = 2000;

bool parsePositive(const char* text, uint32_t& value)
{
    if (!text || text[0] == '\0') return false;
    char* end = nullptr;
    const unsigned long parsed = std::strtoul(text, &end, 10);
    if (!end || end[0] != '\0' || parsed == 0
        || parsed > std::numeric_limits<uint32_t>::max())
        return false;
    value = static_cast<uint32_t>(parsed);
    return true;
}

int runBenchmark(int argc, char** argv)
{
    if (argc < 2 || argc > 5) {
        std::cerr << "usage: s3g_clap_host_benchmark /path/to/plugin.clap "
                     "[blocks] [frames] [visible-channels]\n";
        return 2;
    }

    uint32_t blocks = kDefaultBlocks;
    uint32_t frames = kDefaultFrames;
    uint32_t visibleChannels = 0;
    if ((argc >= 3 && !parsePositive(argv[2], blocks))
        || (argc >= 4 && !parsePositive(argv[3], frames))
        || (argc >= 5 && !parsePositive(argv[4], visibleChannels))) {
        std::cerr << "blocks, frames, and visible-channels must be positive "
                     "32-bit integers\n";
        return 2;
    }

    s3g::max_host::ClapEngine engine;
    std::string error;
    if (!engine.open(argv[1], {}, error)) {
        std::cerr << "open failed: " << error << '\n';
        return 1;
    }
    if (!engine.activate(kSampleRate, frames, error)) {
        std::cerr << "activation failed: " << error << '\n';
        return 1;
    }

    const uint32_t inputCount = visibleChannels == 0
        ? engine.inputChannels()
        : std::min(visibleChannels, engine.inputChannels());
    const uint32_t outputCount = visibleChannels == 0
        ? engine.outputChannels()
        : std::min(visibleChannels, engine.outputChannels());
    std::vector<std::vector<double>> input(inputCount,
        std::vector<double>(frames));
    std::vector<std::vector<double>> output(outputCount,
        std::vector<double>(frames));
    std::vector<double*> inputPointers;
    std::vector<double*> outputPointers;
    inputPointers.reserve(input.size());
    outputPointers.reserve(output.size());
    for (uint32_t channel = 0; channel < inputCount; ++channel) {
        for (uint32_t frame = 0; frame < frames; ++frame) {
            input[channel][frame] = 0.01 * std::sin(
                0.013 * static_cast<double>((channel + 1u) * (frame + 1u)));
        }
        inputPointers.push_back(input[channel].data());
    }
    for (auto& channel : output) outputPointers.push_back(channel.data());

    const auto processBlock = [&]() {
        return engine.process(inputPointers.empty() ? nullptr
                                      : inputPointers.data(),
            inputCount, outputPointers.empty() ? nullptr
                                               : outputPointers.data(),
            outputCount, frames);
    };
    for (uint32_t block = 0; block < kWarmupBlocks; ++block) {
        if (!processBlock()) {
            std::cerr << "warmup processing failed at block " << block
                      << '\n';
            return 1;
        }
    }

    const auto start = std::chrono::steady_clock::now();
    for (uint32_t block = 0; block < blocks; ++block) {
        if (!processBlock()) {
            std::cerr << "processing failed at block " << block << '\n';
            return 1;
        }
    }
    const auto stop = std::chrono::steady_clock::now();
    const double elapsed = std::chrono::duration<double>(stop - start).count();
    const double audioDuration = static_cast<double>(blocks) * frames
        / kSampleRate;
    double checksum = 0.0;
    for (const auto& channel : output)
        for (double sample : channel) checksum += sample;

    std::cout << std::fixed << std::setprecision(3)
              << "plugin=\"" << engine.pluginName() << "\""
              << " plugin_inputs=" << engine.inputChannels()
              << " plugin_outputs=" << engine.outputChannels()
              << " sample_format="
              << (engine.usesDoublePrecision() ? "float64" : "float32")
              << " visible_inputs=" << inputCount
              << " visible_outputs=" << outputCount
              << " frames=" << frames
              << " blocks=" << blocks
              << " elapsed_ms=" << elapsed * 1000.0
              << " ns_per_block=" << elapsed * 1.0e9 / blocks
              << " realtime_percent=" << elapsed / audioDuration * 100.0
              << " checksum=" << checksum << '\n';
    return 0;
}

} // namespace

int main(int argc, char** argv)
{
    return runBenchmark(argc, argv);
}
