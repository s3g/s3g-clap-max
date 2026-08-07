#pragma once

#include "s3g_clap_module.h"
#include "s3g_clap_plugin_host.h"

#include <clap/ext/audio-ports.h>
#include <clap/ext/params.h>

#include <array>
#include <atomic>
#include <cstdint>
#include <mutex>
#include <string>
#include <vector>

namespace s3g::max_host {

struct ClapParameter {
    clap_id id = CLAP_INVALID_ID;
    uint32_t flags = 0;
    double minimum = 0.0;
    double maximum = 1.0;
    double defaultValue = 0.0;
    std::string name;
    std::string module;
};

struct ClapOutputEvent {
    enum class Type { Parameter, Midi } type = Type::Parameter;
    clap_id parameterId = CLAP_INVALID_ID;
    double value = 0.0;
    uint16_t port = 0;
    std::array<uint8_t, 3> midi {};
};

class ClapEngine {
public:
    ClapEngine(uint32_t maximumInputs, uint32_t maximumOutputs);
    ~ClapEngine();

    ClapEngine(const ClapEngine&) = delete;
    ClapEngine& operator=(const ClapEngine&) = delete;

    bool open(const std::string& path, const std::string& requestedPluginId,
        std::string& error);
    void close();

    bool activate(double sampleRate, uint32_t maximumFrames,
        std::string& error);
    void deactivate();
    bool process(double** inputs, uint32_t inputCount, double** outputs,
        uint32_t outputCount, uint32_t frames);

    bool enqueueParameter(uint32_t oneBasedIndex, double value);
    bool enqueueParameterById(clap_id id, double value);
    bool enqueueMidi(uint16_t port, uint8_t status, uint8_t data1,
        uint8_t data2);

    bool parameterValue(uint32_t oneBasedIndex, double& value,
        std::string& display) const;
    bool saveState(std::vector<uint8_t>& destination) const;
    bool loadState(const std::vector<uint8_t>& source);

    bool popOutputEvent(ClapOutputEvent& event);
    bool hasOutputEvents() const;

    bool isOpen() const { return plugin_.isCreated(); }
    bool isActive() const { return plugin_.isActive(); }
    uint32_t inputChannels() const { return inputChannels_; }
    uint32_t outputChannels() const { return outputChannels_; }
    const std::string& pluginId() const { return pluginId_; }
    const std::string& pluginName() const { return pluginName_; }
    const std::string& path() const { return module_.path(); }
    const std::vector<ClapParameter>& parameters() const { return parameters_; }
    const clap_plugin_t* pluginHandle() const { return plugin_.plugin(); }
    std::vector<ClapPluginDescriptor> descriptors() const
    {
        return module_.descriptors();
    }

    bool takeRestartRequest() { return plugin_.takeRestartRequest(); }
    bool takeCallbackRequest() { return plugin_.takeCallbackRequest(); }
    bool hasRestartRequest() const { return plugin_.hasRestartRequest(); }
    bool hasCallbackRequest() const { return plugin_.hasCallbackRequest(); }
    bool hasGuiRequest() const { return plugin_.hasGuiRequest(); }
    void serviceMainThreadCallback() { plugin_.serviceMainThreadCallback(); }
    bool takeGuiResizeRequest(uint32_t& width, uint32_t& height)
    {
        return plugin_.takeGuiResizeRequest(width, height);
    }
    bool takeGuiShowRequest() { return plugin_.takeGuiShowRequest(); }
    bool takeGuiHideRequest() { return plugin_.takeGuiHideRequest(); }
    bool takeGuiClosed(bool& wasDestroyed)
    {
        return plugin_.takeGuiClosed(wasDestroyed);
    }

private:
    struct AudioPort {
        uint32_t channels = 0;
        uint32_t flags = 0;
    };

    struct PendingEvent {
        enum class Type { Parameter, Midi } type = Type::Parameter;
        clap_id parameterId = CLAP_INVALID_ID;
        double value = 0.0;
        uint16_t port = 0;
        std::array<uint8_t, 3> midi {};
    };

    struct ProcessEvent {
        PendingEvent::Type type = PendingEvent::Type::Parameter;
        clap_event_param_value_t parameter {};
        clap_event_midi_t midi {};
    };

    struct InputEventView {
        const ProcessEvent* events = nullptr;
        uint32_t count = 0;
    };

    static uint32_t inputEventCount(const clap_input_events_t* list);
    static const clap_event_header_t* inputEventGet(
        const clap_input_events_t* list, uint32_t index);
    static bool outputEventPush(const clap_output_events_t* list,
        const clap_event_header_t* event);

    bool configurePorts(std::string& error);
    void configureAudioStorage(uint32_t maximumFrames);
    void cacheParameters();
    const ClapParameter* parameterAt(uint32_t oneBasedIndex) const;
    bool queueEvent(const PendingEvent& event);
    bool captureOutputEvent(const clap_event_header_t* event);
    void clearOutputs(double** outputs, uint32_t count, uint32_t frames) const;

    static constexpr uint32_t kMaximumEvents = 256;
    static constexpr uint32_t kOutputQueueSize = 512;

    uint32_t maximumInputs_ = 0;
    uint32_t maximumOutputs_ = 0;
    uint32_t inputChannels_ = 0;
    uint32_t outputChannels_ = 0;
    uint32_t maximumFrames_ = 0;
    uint64_t steadyTime_ = 0;
    bool useDoublePrecision_ = false;

    ClapModule module_;
    s3g::clap_host::Plugin plugin_;
    std::string pluginId_;
    std::string pluginName_;
    std::vector<AudioPort> inputPorts_;
    std::vector<AudioPort> outputPorts_;
    std::vector<ClapParameter> parameters_;

    std::vector<clap_audio_buffer_t> inputBuffers_;
    std::vector<clap_audio_buffer_t> outputBuffers_;
    std::vector<std::vector<double*>> inputDoublePointers_;
    std::vector<std::vector<double*>> outputDoublePointers_;
    std::vector<std::vector<float*>> inputFloatPointers_;
    std::vector<std::vector<float*>> outputFloatPointers_;
    std::vector<std::vector<float>> inputFloatStorage_;
    std::vector<std::vector<float>> outputFloatStorage_;

    mutable std::mutex pendingMutex_;
    std::vector<PendingEvent> pendingEvents_;

    std::array<ClapOutputEvent, kOutputQueueSize> outputQueue_ {};
    std::atomic<uint32_t> outputWrite_ { 0 };
    std::atomic<uint32_t> outputRead_ { 0 };
};

} // namespace s3g::max_host
