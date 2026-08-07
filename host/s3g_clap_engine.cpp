#include "s3g_clap_engine.h"

#include <algorithm>
#include <cmath>
#include <cstring>
#include <limits>
#include <sstream>

namespace s3g::max_host {
namespace {

std::string safeString(const char* value)
{
    return value ? value : "";
}

} // namespace

ClapEngine::ClapEngine(uint32_t maximumInputs, uint32_t maximumOutputs)
    : maximumInputs_(maximumInputs), maximumOutputs_(maximumOutputs)
{
    pendingEvents_.reserve(kMaximumEvents);
}

ClapEngine::~ClapEngine() { close(); }

bool ClapEngine::open(const std::string& path,
    const std::string& requestedPluginId, std::string& error)
{
    close();
    if (!module_.open(path, error)) return false;

    const auto available = module_.descriptors();
    if (available.empty()) {
        error = "CLAP bundle contains no plugins";
        close();
        return false;
    }

    const ClapPluginDescriptor* selected = nullptr;
    if (requestedPluginId.empty()) {
        selected = &available.front();
    } else {
        const auto found = std::find_if(available.begin(), available.end(),
            [&](const ClapPluginDescriptor& descriptor) {
                return descriptor.id == requestedPluginId;
            });
        if (found != available.end()) selected = &*found;
    }
    if (!selected) {
        error = "requested plugin id is not present in this bundle";
        close();
        return false;
    }

    if (!plugin_.create(module_.entry(), module_.factory(),
            selected->id.c_str(), "s3g.clap~")) {
        error = "CLAP plugin creation or initialization failed";
        close();
        return false;
    }
    pluginId_ = selected->id;
    pluginName_ = selected->name;
    if (!configurePorts(error)) {
        close();
        return false;
    }
    cacheParameters();
    return true;
}

void ClapEngine::close()
{
    plugin_.destroy();
    module_.close();
    pluginId_.clear();
    pluginName_.clear();
    inputPorts_.clear();
    outputPorts_.clear();
    parameters_.clear();
    inputBuffers_.clear();
    outputBuffers_.clear();
    inputDoublePointers_.clear();
    outputDoublePointers_.clear();
    inputFloatPointers_.clear();
    outputFloatPointers_.clear();
    inputFloatStorage_.clear();
    outputFloatStorage_.clear();
    inputChannels_ = 0;
    outputChannels_ = 0;
    maximumFrames_ = 0;
    steadyTime_ = 0;
    {
        std::lock_guard<std::mutex> lock(pendingMutex_);
        pendingEvents_.clear();
    }
    outputRead_.store(0, std::memory_order_relaxed);
    outputWrite_.store(0, std::memory_order_relaxed);
}

bool ClapEngine::configurePorts(std::string& error)
{
    const auto* ports = plugin_.extension<clap_plugin_audio_ports_t>(
        CLAP_EXT_AUDIO_PORTS);
    if (!ports || !ports->count || !ports->get) {
        error = "plugin does not expose CLAP audio ports";
        return false;
    }

    auto collect = [&](bool isInput, std::vector<AudioPort>& destination,
                       uint32_t& channelTotal) {
        const uint32_t count = ports->count(plugin_.plugin(), isInput);
        destination.reserve(count);
        for (uint32_t i = 0; i < count; ++i) {
            clap_audio_port_info_t info {};
            if (!ports->get(plugin_.plugin(), i, isInput, &info)) return false;
            destination.push_back({ info.channel_count, info.flags });
            if (channelTotal > std::numeric_limits<uint32_t>::max()
                    - info.channel_count) return false;
            channelTotal += info.channel_count;
        }
        return true;
    };

    inputChannels_ = 0;
    outputChannels_ = 0;
    if (!collect(true, inputPorts_, inputChannels_)
        || !collect(false, outputPorts_, outputChannels_)) {
        error = "plugin reported invalid CLAP audio ports";
        return false;
    }
    if (inputChannels_ > maximumInputs_) {
        std::ostringstream message;
        message << "plugin needs " << inputChannels_
                << " input channels, but this s3g.clap~ has "
                << maximumInputs_ << "; recreate it as [s3g.clap~ "
                << inputChannels_ << ' '
                << std::max(outputChannels_, maximumOutputs_) << ']';
        error = message.str();
        return false;
    }
    if (outputChannels_ > maximumOutputs_) {
        std::ostringstream message;
        message << "plugin needs " << outputChannels_
                << " output channels, but this s3g.clap~ has "
                << maximumOutputs_ << "; recreate it as [s3g.clap~ "
                << std::max(inputChannels_, maximumInputs_) << ' '
                << outputChannels_ << ']';
        error = message.str();
        return false;
    }

    useDoublePrecision_ = true;
    const auto supportsDouble = [](const AudioPort& port) {
        return (port.flags & CLAP_AUDIO_PORT_SUPPORTS_64BITS) != 0u;
    };
    for (const auto& port : inputPorts_)
        useDoublePrecision_ = useDoublePrecision_ && supportsDouble(port);
    for (const auto& port : outputPorts_)
        useDoublePrecision_ = useDoublePrecision_ && supportsDouble(port);
    return true;
}

void ClapEngine::cacheParameters()
{
    parameters_.clear();
    const auto* params = plugin_.extension<clap_plugin_params_t>(
        CLAP_EXT_PARAMS);
    if (!params || !params->count || !params->get_info) return;
    const uint32_t count = params->count(plugin_.plugin());
    parameters_.reserve(count);
    for (uint32_t i = 0; i < count; ++i) {
        clap_param_info_t info {};
        if (!params->get_info(plugin_.plugin(), i, &info)) continue;
        parameters_.push_back({
            info.id, info.flags, info.min_value, info.max_value,
            info.default_value, safeString(info.name), safeString(info.module),
        });
    }
}

void ClapEngine::configureAudioStorage(uint32_t maximumFrames)
{
    maximumFrames_ = maximumFrames;
    inputBuffers_.assign(inputPorts_.size(), {});
    outputBuffers_.assign(outputPorts_.size(), {});
    inputDoublePointers_.resize(inputPorts_.size());
    outputDoublePointers_.resize(outputPorts_.size());
    inputFloatPointers_.resize(inputPorts_.size());
    outputFloatPointers_.resize(outputPorts_.size());

    for (size_t i = 0; i < inputPorts_.size(); ++i) {
        inputDoublePointers_[i].assign(inputPorts_[i].channels, nullptr);
        inputFloatPointers_[i].assign(inputPorts_[i].channels, nullptr);
    }
    for (size_t i = 0; i < outputPorts_.size(); ++i) {
        outputDoublePointers_[i].assign(outputPorts_[i].channels, nullptr);
        outputFloatPointers_[i].assign(outputPorts_[i].channels, nullptr);
    }

    if (!useDoublePrecision_) {
        inputFloatStorage_.assign(inputChannels_,
            std::vector<float>(maximumFrames_, 0.0f));
        outputFloatStorage_.assign(outputChannels_,
            std::vector<float>(maximumFrames_, 0.0f));
    }
}

bool ClapEngine::activate(double sampleRate, uint32_t maximumFrames,
    std::string& error)
{
    error.clear();
    if (!plugin_.isCreated()) {
        error = "no CLAP plugin is open";
        return false;
    }
    if (sampleRate <= 0.0 || maximumFrames == 0) {
        error = "invalid MSP sample rate or vector size";
        return false;
    }
    plugin_.deactivate();
    configureAudioStorage(maximumFrames);
    if (!plugin_.activate(sampleRate, 1, maximumFrames)) {
        error = "CLAP activation failed";
        return false;
    }
    steadyTime_ = 0;
    return true;
}

void ClapEngine::deactivate() { plugin_.deactivate(); }

void ClapEngine::clearOutputs(double** outputs, uint32_t count,
    uint32_t frames) const
{
    if (!outputs) return;
    for (uint32_t channel = 0; channel < count; ++channel) {
        if (outputs[channel])
            std::fill(outputs[channel], outputs[channel] + frames, 0.0);
    }
}

uint32_t ClapEngine::inputEventCount(const clap_input_events_t* list)
{
    const auto* view = list
        ? static_cast<const InputEventView*>(list->ctx) : nullptr;
    return view ? view->count : 0;
}

const clap_event_header_t* ClapEngine::inputEventGet(
    const clap_input_events_t* list, uint32_t index)
{
    const auto* view = list
        ? static_cast<const InputEventView*>(list->ctx) : nullptr;
    if (!view || index >= view->count) return nullptr;
    const ProcessEvent& event = view->events[index];
    return event.type == PendingEvent::Type::Parameter
        ? &event.parameter.header : &event.midi.header;
}

bool ClapEngine::outputEventPush(const clap_output_events_t* list,
    const clap_event_header_t* event)
{
    auto* engine = list ? static_cast<ClapEngine*>(list->ctx) : nullptr;
    return engine ? engine->captureOutputEvent(event) : false;
}

bool ClapEngine::captureOutputEvent(const clap_event_header_t* header)
{
    if (!header || header->space_id != CLAP_CORE_EVENT_SPACE_ID) return true;
    ClapOutputEvent captured {};
    if (header->type == CLAP_EVENT_PARAM_VALUE
        && header->size >= sizeof(clap_event_param_value_t)) {
        const auto* event = reinterpret_cast<const clap_event_param_value_t*>(
            header);
        captured.type = ClapOutputEvent::Type::Parameter;
        captured.parameterId = event->param_id;
        captured.value = event->value;
    } else if (header->type == CLAP_EVENT_MIDI
        && header->size >= sizeof(clap_event_midi_t)) {
        const auto* event = reinterpret_cast<const clap_event_midi_t*>(header);
        captured.type = ClapOutputEvent::Type::Midi;
        captured.port = event->port_index;
        std::copy(std::begin(event->data), std::end(event->data),
            captured.midi.begin());
    } else {
        return true;
    }

    const uint32_t write = outputWrite_.load(std::memory_order_relaxed);
    const uint32_t next = (write + 1u) % kOutputQueueSize;
    if (next == outputRead_.load(std::memory_order_acquire)) return false;
    outputQueue_[write] = captured;
    outputWrite_.store(next, std::memory_order_release);
    return true;
}

bool ClapEngine::process(double** inputs, uint32_t inputCount,
    double** outputs, uint32_t outputCount, uint32_t frames)
{
    if (!plugin_.isActive() || frames == 0 || frames > maximumFrames_) {
        clearOutputs(outputs, outputCount, frames);
        return false;
    }

    std::array<ProcessEvent, kMaximumEvents> processEvents {};
    uint32_t eventCount = 0;
    {
        std::unique_lock<std::mutex> lock(pendingMutex_, std::try_to_lock);
        if (lock.owns_lock()) {
            eventCount = static_cast<uint32_t>(pendingEvents_.size());
            for (uint32_t i = 0; i < eventCount; ++i) {
                const PendingEvent& pending = pendingEvents_[i];
                ProcessEvent& event = processEvents[i];
                event.type = pending.type;
                if (pending.type == PendingEvent::Type::Parameter) {
                    event.parameter.header = {
                        sizeof(clap_event_param_value_t), 0,
                        CLAP_CORE_EVENT_SPACE_ID, CLAP_EVENT_PARAM_VALUE,
                        CLAP_EVENT_IS_LIVE,
                    };
                    event.parameter.param_id = pending.parameterId;
                    event.parameter.cookie = nullptr;
                    event.parameter.note_id = -1;
                    event.parameter.port_index = -1;
                    event.parameter.channel = -1;
                    event.parameter.key = -1;
                    event.parameter.value = pending.value;
                } else {
                    event.midi.header = {
                        sizeof(clap_event_midi_t), 0,
                        CLAP_CORE_EVENT_SPACE_ID, CLAP_EVENT_MIDI,
                        CLAP_EVENT_IS_LIVE,
                    };
                    event.midi.port_index = pending.port;
                    std::copy(pending.midi.begin(), pending.midi.end(),
                        event.midi.data);
                }
            }
            pendingEvents_.clear();
        }
    }

    uint32_t flatInput = 0;
    uint32_t flatOutput = 0;
    for (size_t port = 0; port < inputPorts_.size(); ++port) {
        auto& buffer = inputBuffers_[port];
        buffer.channel_count = inputPorts_[port].channels;
        buffer.latency = 0;
        buffer.constant_mask = 0;
        if (useDoublePrecision_) {
            for (uint32_t channel = 0; channel < buffer.channel_count;
                 ++channel, ++flatInput)
                inputDoublePointers_[port][channel] =
                    flatInput < inputCount ? inputs[flatInput] : nullptr;
            buffer.data64 = inputDoublePointers_[port].data();
            buffer.data32 = nullptr;
        } else {
            for (uint32_t channel = 0; channel < buffer.channel_count;
                 ++channel, ++flatInput) {
                float* destination = inputFloatStorage_[flatInput].data();
                const double* source = flatInput < inputCount
                    ? inputs[flatInput] : nullptr;
                for (uint32_t frame = 0; frame < frames; ++frame)
                    destination[frame] = source
                        ? static_cast<float>(source[frame]) : 0.0f;
                inputFloatPointers_[port][channel] = destination;
            }
            buffer.data32 = inputFloatPointers_[port].data();
            buffer.data64 = nullptr;
        }
    }
    for (size_t port = 0; port < outputPorts_.size(); ++port) {
        auto& buffer = outputBuffers_[port];
        buffer.channel_count = outputPorts_[port].channels;
        buffer.latency = 0;
        buffer.constant_mask = 0;
        if (useDoublePrecision_) {
            for (uint32_t channel = 0; channel < buffer.channel_count;
                 ++channel, ++flatOutput)
                outputDoublePointers_[port][channel] =
                    flatOutput < outputCount ? outputs[flatOutput] : nullptr;
            buffer.data64 = outputDoublePointers_[port].data();
            buffer.data32 = nullptr;
        } else {
            for (uint32_t channel = 0; channel < buffer.channel_count;
                 ++channel, ++flatOutput) {
                float* destination = outputFloatStorage_[flatOutput].data();
                std::fill(destination, destination + frames, 0.0f);
                outputFloatPointers_[port][channel] = destination;
            }
            buffer.data32 = outputFloatPointers_[port].data();
            buffer.data64 = nullptr;
        }
    }

    InputEventView eventView { processEvents.data(), eventCount };
    clap_input_events_t inputEvents {
        &eventView, inputEventCount, inputEventGet,
    };
    clap_output_events_t outputEvents { this, outputEventPush };
    clap_process_t block {};
    block.steady_time = static_cast<int64_t>(steadyTime_);
    block.frames_count = frames;
    block.audio_inputs = inputBuffers_.data();
    block.audio_outputs = outputBuffers_.data();
    block.audio_inputs_count = static_cast<uint32_t>(inputBuffers_.size());
    block.audio_outputs_count = static_cast<uint32_t>(outputBuffers_.size());
    block.in_events = &inputEvents;
    block.out_events = &outputEvents;

    const clap_process_status status = plugin_.process(block);
    steadyTime_ += frames;
    if (status == CLAP_PROCESS_ERROR) {
        clearOutputs(outputs, outputCount, frames);
        return false;
    }

    if (!useDoublePrecision_) {
        for (uint32_t channel = 0; channel < outputChannels_; ++channel) {
            if (channel >= outputCount || !outputs[channel]) continue;
            const float* source = outputFloatStorage_[channel].data();
            for (uint32_t frame = 0; frame < frames; ++frame)
                outputs[channel][frame] = static_cast<double>(source[frame]);
        }
    }
    for (uint32_t channel = outputChannels_; channel < outputCount; ++channel)
        if (outputs[channel])
            std::fill(outputs[channel], outputs[channel] + frames, 0.0);
    return true;
}

const ClapParameter* ClapEngine::parameterAt(uint32_t oneBasedIndex) const
{
    if (oneBasedIndex == 0 || oneBasedIndex > parameters_.size()) return nullptr;
    return &parameters_[oneBasedIndex - 1u];
}

bool ClapEngine::queueEvent(const PendingEvent& event)
{
    std::lock_guard<std::mutex> lock(pendingMutex_);
    if (pendingEvents_.size() >= kMaximumEvents) return false;
    pendingEvents_.push_back(event);
    return true;
}

bool ClapEngine::enqueueParameter(uint32_t oneBasedIndex, double value)
{
    const ClapParameter* parameter = parameterAt(oneBasedIndex);
    return parameter && enqueueParameterById(parameter->id, value);
}

bool ClapEngine::enqueueParameterById(clap_id id, double value)
{
    const auto found = std::find_if(parameters_.begin(), parameters_.end(),
        [&](const ClapParameter& parameter) { return parameter.id == id; });
    if (found == parameters_.end() || !std::isfinite(value)
        || (found->flags & CLAP_PARAM_IS_READONLY) != 0u) return false;
    value = std::clamp(value, found->minimum, found->maximum);
    PendingEvent event {};
    event.type = PendingEvent::Type::Parameter;
    event.parameterId = id;
    event.value = value;
    return queueEvent(event);
}

bool ClapEngine::enqueueMidi(uint16_t port, uint8_t status, uint8_t data1,
    uint8_t data2)
{
    PendingEvent event {};
    event.type = PendingEvent::Type::Midi;
    event.port = port;
    event.midi = { status, data1, data2 };
    return queueEvent(event);
}

bool ClapEngine::parameterValue(uint32_t oneBasedIndex, double& value,
    std::string& display) const
{
    const ClapParameter* parameter = parameterAt(oneBasedIndex);
    const auto* params = plugin_.extension<clap_plugin_params_t>(
        CLAP_EXT_PARAMS);
    if (!parameter || !params || !params->get_value
        || !params->get_value(plugin_.plugin(), parameter->id, &value))
        return false;
    display.clear();
    if (params->value_to_text) {
        std::array<char, CLAP_NAME_SIZE> text {};
        if (params->value_to_text(plugin_.plugin(), parameter->id, value,
                text.data(), static_cast<uint32_t>(text.size())))
            display = text.data();
    }
    return true;
}

bool ClapEngine::saveState(std::vector<uint8_t>& destination) const
{
    return plugin_.saveState(destination);
}

bool ClapEngine::loadState(const std::vector<uint8_t>& source)
{
    return plugin_.loadState(source);
}

bool ClapEngine::hasOutputEvents() const
{
    return outputRead_.load(std::memory_order_relaxed)
        != outputWrite_.load(std::memory_order_acquire);
}

bool ClapEngine::popOutputEvent(ClapOutputEvent& event)
{
    const uint32_t read = outputRead_.load(std::memory_order_relaxed);
    if (read == outputWrite_.load(std::memory_order_acquire)) return false;
    event = outputQueue_[read];
    outputRead_.store((read + 1u) % kOutputQueueSize,
        std::memory_order_release);
    return true;
}

} // namespace s3g::max_host
