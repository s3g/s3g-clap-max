#include "ext.h"
#include "ext_obex.h"
#include "ext_path.h"
#include "z_dsp.h"

#include "s3g_clap_discovery.h"
#include "s3g_clap_engine.h"
#include "s3g_clap_state_codec.h"
#if defined(__APPLE__)
#include "s3g_clap_bundle_picker.h"
#endif
#if defined(__APPLE__) || defined(_WIN32)
#include "s3g_clap_editor.h"
#endif

#include <algorithm>
#include <atomic>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <limits>
#include <memory>
#include <mutex>
#include <new>
#include <string>
#include <utility>
#include <vector>

namespace {

constexpr long kDefaultInputs = 2;
constexpr long kDefaultOutputs = 2;
constexpr long kMaximumChannels = 128;
constexpr size_t kMaximumEmbeddedStateBytes = 64u * 1024u * 1024u;
constexpr size_t kEmbeddedStateHeaderAtoms = 4u;
constexpr size_t kCompressedStateHeaderAtoms = 5u;
constexpr const char* kEmbeddedStateTag = "s3g.clap.state.1";

struct MaxClap {
    t_pxobject object;
    void* statusOutlet = nullptr;
    void* deferred = nullptr;
    struct Implementation* implementation = nullptr;
    long mc = 0;
};

struct Implementation {
    Implementation(MaxClap* owner, uint32_t inputs, uint32_t outputs)
        : owner(owner), inputCount(inputs), outputCount(outputs)
    {
    }

    MaxClap* owner = nullptr;
    uint32_t inputCount = 0;
    uint32_t outputCount = 0;
    double sampleRate = 0.0;
    uint32_t vectorSize = 0;
    std::recursive_mutex engineMutex;
    s3g::max_host::ClapEngine engine;
    std::atomic<bool> processError { false };
    std::atomic<bool> voiceResetPending { false };
    std::atomic<bool> latencyReportPending { false };
#if defined(__APPLE__) || defined(_WIN32)
    S3GClapEditor* editor = nullptr;
#endif
};

t_class* gClass = nullptr;

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

bool attributeEnabled(long argc, t_atom* argv, const char* name,
    bool fallback)
{
    if (!argv || !name) return fallback;
    for (long index = 0; index < argc - 1; ++index) {
        if (atom_gettype(argv + index) != A_SYM) continue;
        const auto* symbol = atom_getsym(argv + index);
        if (symbol && symbol->s_name && symbol->s_name[0] == '@'
            && std::strcmp(symbol->s_name + 1, name) == 0)
            return atom_getlong(argv + index + 1) != 0;
    }
    return fallback;
}

void emit(MaxClap* object, const char* selector, long count, t_atom* atoms)
{
    if (count < 0 || static_cast<size_t>(count)
        > s3g::max_host::state_codec::kMaxMessageAtoms) {
        if (object)
            object_error(reinterpret_cast<t_object*>(object),
                "Max message exceeds the signed-short atom limit");
        return;
    }
    if (object && object->statusOutlet)
        outlet_anything(object->statusOutlet, gensym(selector),
            static_cast<short>(count), atoms);
}

void emitSymbol(MaxClap* object, const char* selector, const std::string& value)
{
    t_atom atom;
    atom_setsym(&atom, gensym(value.c_str()));
    emit(object, selector, 1, &atom);
}

std::string absolutePath(t_symbol* path)
{
    if (!path || !path->s_name || path->s_name[0] == '\0') return {};
    t_symbol* resolved = nullptr;
    if (path_absolutepath(&resolved, path, nullptr, 0) == MAX_ERR_NONE
        && resolved && resolved->s_name)
        return resolved->s_name;
    char native[MAX_PATH_CHARS] {};
    if (path_nameconform(path->s_name, native, PATH_STYLE_NATIVE,
            PATH_TYPE_ABSOLUTE) == 0 && native[0] != '\0')
        return native;
    return path->s_name;
}

void emitLoaded(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    auto& engine = implementation->engine;
    t_atom atoms[6];
    atom_setsym(atoms, gensym(engine.pluginName().c_str()));
    atom_setsym(atoms + 1, gensym(engine.pluginId().c_str()));
    atom_setlong(atoms + 2, static_cast<t_atom_long>(engine.inputChannels()));
    atom_setlong(atoms + 3, static_cast<t_atom_long>(engine.outputChannels()));
    atom_setlong(atoms + 4,
        static_cast<t_atom_long>(engine.parameters().size()));
    atom_setsym(atoms + 5, gensym(engine.path().c_str()));
    emit(object, "loaded", 6, atoms);
}

void emitError(MaxClap* object, const std::string& message)
{
    if (object) object_error(reinterpret_cast<t_object*>(object), "%s",
        message.c_str());
    emitSymbol(object, "error", message);
}

void emitLatency(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    t_atom atom;
    atom_setlong(&atom, static_cast<t_atom_long>(
        implementation->engine.latencySamples()));
    emit(object, "latency", 1, &atom);
}

void notifyValueChanged(MaxClap* object)
{
    if (object)
        object_notify(reinterpret_cast<t_object*>(object),
            gensym("modified"), nullptr);
}

void destroyEditor(Implementation* implementation)
{
#if defined(__APPLE__) || defined(_WIN32)
    if (implementation && implementation->editor) {
        s3gDestroyClapEditor(implementation->editor);
        implementation->editor = nullptr;
    }
#else
    (void)implementation;
#endif
}

void deferredTick(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    auto& engine = implementation->engine;

    engine.serviceMainThreadCallback();
#if defined(__APPLE__) || defined(_WIN32)
    uint32_t editorWidth = 0;
    uint32_t editorHeight = 0;
    if (engine.takeGuiResizeRequest(editorWidth, editorHeight)
        && implementation->editor)
        s3gResizeClapEditor(implementation->editor, editorWidth,
            editorHeight);
    if (engine.takeGuiShowRequest() && implementation->editor)
        s3gShowClapEditor(implementation->editor);
    if (engine.takeGuiHideRequest() && implementation->editor)
        s3gHideClapEditor(implementation->editor);
    bool guiWasDestroyed = false;
    if (engine.takeGuiClosed(guiWasDestroyed) && implementation->editor) {
        s3gClapEditorPluginClosed(implementation->editor, guiWasDestroyed);
        if (guiWasDestroyed) {
            s3gDestroyClapEditor(implementation->editor);
            implementation->editor = nullptr;
        }
        t_atom atom;
        atom_setlong(&atom, 0);
        emit(object, "editor", 1, &atom);
    }
#endif
    if (engine.takeRestartRequest()) {
        std::string error;
        engine.deactivate();
        if (implementation->sampleRate > 0.0 && implementation->vectorSize > 0
            && !engine.activate(implementation->sampleRate,
                implementation->vectorSize, error)) {
            emitError(object, error);
        } else {
            emit(object, "restarted", 0, nullptr);
            implementation->latencyReportPending.store(true,
                std::memory_order_release);
        }
    }

    if (engine.takeLatencyChanged()
        || implementation->latencyReportPending.exchange(false,
            std::memory_order_acq_rel))
        emitLatency(object);
    if (engine.takeStateDirty()) {
        notifyValueChanged(object);
        emit(object, "statechanged", 0, nullptr);
    }

    s3g::max_host::ClapOutputEvent output;
    while (engine.popOutputEvent(output)) {
        if (output.type
            == s3g::max_host::ClapOutputEvent::Type::Parameter) {
            t_atom atoms[2];
            atom_setlong(atoms,
                static_cast<t_atom_long>(output.parameterId));
            atom_setfloat(atoms + 1, output.value);
            emit(object, "paramchanged", 2, atoms);
            notifyValueChanged(object);
        } else {
            t_atom atoms[4];
            atom_setlong(atoms, output.port);
            atom_setlong(atoms + 1, output.midi[0]);
            atom_setlong(atoms + 2, output.midi[1]);
            atom_setlong(atoms + 3, output.midi[2]);
            emit(object, "midiout", 4, atoms);
        }
    }
    if (implementation->processError.exchange(false,
            std::memory_order_acq_rel))
        emitSymbol(object, "error", "CLAP process returned an error");
}

void scheduleDeferred(MaxClap* object)
{
    if (object && object->deferred) qelem_set(object->deferred);
}

void perform64(MaxClap* object, t_object*, double** inputs, long inputCount,
    double** outputs, long outputCount, long frames, long, void*)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) {
        for (long channel = 0; channel < outputCount; ++channel)
            if (outputs[channel])
                std::fill(outputs[channel], outputs[channel] + frames, 0.0);
        return;
    }

    std::unique_lock<std::recursive_mutex> lock(implementation->engineMutex,
        std::try_to_lock);
    if (!lock.owns_lock()) {
        for (long channel = 0; channel < outputCount; ++channel)
            if (outputs[channel])
                std::fill(outputs[channel], outputs[channel] + frames, 0.0);
        return;
    }

    const uint32_t availableInputs = inputCount > 0
        ? static_cast<uint32_t>(inputCount) : 0u;
    const uint32_t availableOutputs = outputCount > 0
        ? static_cast<uint32_t>(outputCount) : 0u;
    const uint32_t visibleInputs = std::min(availableInputs,
        implementation->inputCount);
    const uint32_t visibleOutputs = std::min(availableOutputs,
        implementation->outputCount);
    // CLAP reset is an audio-thread operation. The UI only requests it; this
    // block owns the engine lock and runs it before rendering the next vector.
    if (implementation->engine.isActive()
        && implementation->voiceResetPending.exchange(false,
            std::memory_order_acq_rel))
        implementation->engine.resetVoices();
    const bool ok = implementation->engine.process(inputs, visibleInputs,
        outputs, visibleOutputs, static_cast<uint32_t>(frames));
    for (long channel = static_cast<long>(visibleOutputs);
         channel < outputCount; ++channel)
        if (outputs[channel])
            std::fill(outputs[channel], outputs[channel] + frames, 0.0);
    if (!ok && implementation->engine.isActive())
        implementation->processError.store(true, std::memory_order_release);
    if (implementation->engine.hasOutputEvents()
        || implementation->engine.hasCallbackRequest()
        || implementation->engine.hasRestartRequest()
        || implementation->engine.hasGuiRequest()
        || implementation->engine.hasStateDirty()
        || implementation->engine.hasLatencyChanged()
        || implementation->latencyReportPending.load(
            std::memory_order_acquire)
        || implementation->processError.load(std::memory_order_acquire))
        scheduleDeferred(object);
}

void dsp64(MaxClap* object, t_object* dsp, short*, double sampleRate,
    long maximumFrames, long)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    {
        std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
        implementation->sampleRate = sampleRate;
        implementation->vectorSize = static_cast<uint32_t>(maximumFrames);
        if (implementation->engine.isOpen()) {
            std::string error;
            if (!implementation->engine.activate(sampleRate,
                    implementation->vectorSize, error))
                emitError(object, error);
            else
                implementation->latencyReportPending.store(true,
                    std::memory_order_release);
        }
    }
    object_method(dsp, gensym("dsp_add64"), object, perform64, 0, nullptr);
}

bool installPlugin(MaxClap* object, const std::string& path,
    const std::string& requestedId, const std::vector<uint8_t>* state,
    bool valueChanged, std::string& error)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) {
        error = "CLAP host is not initialized";
        return false;
    }
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    destroyEditor(implementation);
    if (!implementation->engine.open(path, requestedId, error)) return false;
    if (state && !implementation->engine.loadState(*state)) {
        implementation->engine.close();
        error = "CLAP state load failed";
        return false;
    }
    if (implementation->sampleRate > 0.0 && implementation->vectorSize > 0
        && !implementation->engine.activate(implementation->sampleRate,
            implementation->vectorSize, error)) {
        implementation->engine.close();
        return false;
    }
    emitLoaded(object);
    emitLatency(object);
    if (valueChanged) notifyValueChanged(object);
    return true;
}

void openPlugin(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;

    std::string path;
    std::string requestedId;
    if (argc > 0 && atom_gettype(argv) == A_SYM) {
        t_symbol* referenceSymbol = atom_getsym(argv);
        std::string reference = referenceSymbol && referenceSymbol->s_name
            ? referenceSymbol->s_name : "";
        const std::string maxResolved = absolutePath(referenceSymbol);
        std::error_code filesystemError;
        if (!maxResolved.empty()
            && std::filesystem::exists(filesystemPath(maxResolved),
                filesystemError)
            && !filesystemError)
            reference = maxResolved;
        std::string resolutionError;
        if (!s3g::max_host::resolveClapBundle(reference, path,
                resolutionError)) {
            emitError(object, resolutionError);
            return;
        }
        if (argc > 1 && atom_gettype(argv + 1) == A_SYM)
            requestedId = atom_getsym(argv + 1)->s_name;
    } else {
#if defined(__APPLE__)
        std::string pickerError;
        if (!s3gChooseClapBundle(path, pickerError)) {
            if (!pickerError.empty()) emitError(object, pickerError);
            return;
        }
#else
        char filename[MAX_FILENAME_CHARS] {};
        char fullPath[MAX_PATH_CHARS] {};
        short pathId = 0;
        t_fourcc type = 0;
        if (open_dialog(filename, &pathId, &type, nullptr, 0) != 0) return;
        if (path_toabsolutesystempath(pathId, filename, fullPath)
            != MAX_ERR_NONE) {
            emitError(object, "could not resolve the selected CLAP path");
            return;
        }
        path = fullPath;
#endif
    }

    try {
        std::string error;
        if (!installPlugin(object, path, requestedId, nullptr, true, error)) {
            emitError(object, error);
            return;
        }
    } catch (const std::exception& exception) {
        emitError(object, exception.what());
    }
}

void openPluginIfEmpty(MaxClap* object, t_symbol* selector, long argc,
    t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    {
        std::lock_guard<std::recursive_mutex> lock(
            implementation->engineMutex);
        if (implementation->engine.isOpen()) return;
    }
    openPlugin(object, selector, argc, argv);
}

void outputSearchPaths(MaxClap* object)
{
    const auto paths = s3g::max_host::clapSearchPaths();
    for (size_t index = 0; index < paths.size(); ++index) {
        t_atom atoms[2];
        atom_setlong(atoms, static_cast<t_atom_long>(index + 1));
        atom_setsym(atoms + 1, gensym(paths[index].c_str()));
        emit(object, "clappath", 2, atoms);
    }
    t_atom count;
    atom_setlong(&count, static_cast<t_atom_long>(paths.size()));
    emit(object, "clappathsdone", 1, &count);
}

void closePlugin(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    destroyEditor(implementation);
    implementation->engine.close();
    emit(object, "closed", 0, nullptr);
    emitLatency(object);
    notifyValueChanged(object);
}

void outputPluginList(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.isOpen()) {
        emitError(object, "no CLAP bundle is open");
        return;
    }
    const auto plugins = implementation->engine.descriptors();
    for (size_t i = 0; i < plugins.size(); ++i) {
        t_atom atoms[5];
        atom_setlong(atoms, static_cast<t_atom_long>(i + 1));
        atom_setsym(atoms + 1, gensym(plugins[i].id.c_str()));
        atom_setsym(atoms + 2, gensym(plugins[i].name.c_str()));
        atom_setsym(atoms + 3, gensym(plugins[i].vendor.c_str()));
        atom_setsym(atoms + 4, gensym(plugins[i].version.c_str()));
        emit(object, "plugin", 5, atoms);
    }
}

void outputParameterList(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.isOpen()) {
        emitError(object, "open a CLAP plugin before requesting parameters");
        return;
    }
    const auto& parameters = implementation->engine.parameters();
    t_atom countAtom;
    atom_setlong(&countAtom,
        static_cast<t_atom_long>(parameters.size()));
    emit(object, "params", 1, &countAtom);
    for (size_t i = 0; i < parameters.size(); ++i) {
        const auto& parameter = parameters[i];
        double currentValue = parameter.defaultValue;
        std::string display;
        implementation->engine.parameterValue(
            static_cast<uint32_t>(i + 1), currentValue, display);
        t_atom atoms[10];
        atom_setlong(atoms, static_cast<t_atom_long>(i + 1));
        atom_setlong(atoms + 1, static_cast<t_atom_long>(parameter.id));
        atom_setfloat(atoms + 2, currentValue);
        atom_setfloat(atoms + 3, parameter.minimum);
        atom_setfloat(atoms + 4, parameter.maximum);
        atom_setfloat(atoms + 5, parameter.defaultValue);
        atom_setlong(atoms + 6, static_cast<t_atom_long>(parameter.flags));
        atom_setsym(atoms + 7, gensym(parameter.name.c_str()));
        atom_setsym(atoms + 8, gensym(parameter.module.c_str()));
        atom_setsym(atoms + 9, gensym(display.c_str()));
        emit(object, "paraminfo", 10, atoms);
    }
    emit(object, "paramsdone", 1, &countAtom);
}

void editorMessage(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    const bool shouldShow = argc == 0 || atom_getlong(argv) != 0;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.isOpen()) {
        emitError(object, "open a CLAP plugin before requesting its editor");
        return;
    }
#if defined(__APPLE__) || defined(_WIN32)
    if (shouldShow) {
        if (!implementation->editor) {
            std::string error;
            const std::string title = implementation->engine.pluginName()
                + " — s3g.clap~";
            implementation->editor = s3gCreateClapEditor(
                implementation->engine.pluginHandle(), title, error);
            if (!implementation->editor) {
                emitError(object, error);
                return;
            }
        } else if (!s3gShowClapEditor(implementation->editor)) {
            emitError(object, "plugin refused to show its CLAP GUI");
            return;
        }
    } else if (implementation->editor
        && !s3gHideClapEditor(implementation->editor)) {
        emitError(object, "plugin refused to hide its CLAP GUI");
        return;
    }
    t_atom atom;
    atom_setlong(&atom, shouldShow ? 1 : 0);
    emit(object, "editor", 1, &atom);
#else
    (void)shouldShow;
    emitError(object,
        "native CLAP editors are currently implemented on macOS and Windows");
#endif
}

void setParameter(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 2) return;
    const t_atom_long index = atom_getlong(argv);
    const double value = atom_getfloat(argv + 1);
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    const bool queued = index >= 1
        && static_cast<uint64_t>(index)
            <= std::numeric_limits<uint32_t>::max()
        && implementation->engine.enqueueParameter(
            static_cast<uint32_t>(index), value);
    if (!queued)
        emitError(object, "invalid, read-only, or full CLAP parameter event");
    else
        notifyValueChanged(object);
}

void setParameterById(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 2) return;
    const t_atom_long id = atom_getlong(argv);
    const double value = atom_getfloat(argv + 1);
    if (id < 0 || static_cast<uint64_t>(id)
            > std::numeric_limits<clap_id>::max()) {
        emitError(object, "CLAP parameter id must be non-negative");
        return;
    }
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.enqueueParameterById(
            static_cast<clap_id>(id), value))
        emitError(object, "invalid, read-only, or full CLAP parameter event");
    else
        notifyValueChanged(object);
}

void automateParameterById(MaxClap* object, t_symbol*, long argc,
    t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 2) return;
    const t_atom_long id = atom_getlong(argv);
    const double value = atom_getfloat(argv + 1);
    if (id < 0 || static_cast<uint64_t>(id)
            > std::numeric_limits<clap_id>::max()) {
        emitError(object, "CLAP parameter id must be non-negative");
        return;
    }
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.enqueueParameterById(
            static_cast<clap_id>(id), value))
        emitError(object, "invalid, read-only, or full CLAP parameter event");
    // Live already owns and stores the automatable live.* parameter that
    // produced this message.  Do not mark the opaque s3g.clap~ state modified
    // for every Arrangement automation sample: doing so makes Live treat the
    // processor as manually changed and can override the active envelope.
}

void getParameter(MaxClap* object, t_atom_long index)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || index < 1) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    double value = 0.0;
    std::string display;
    if (!implementation->engine.parameterValue(
            static_cast<uint32_t>(index), value, display)) {
        emitError(object, "CLAP parameter index is invalid");
        return;
    }
    t_atom atoms[3];
    atom_setlong(atoms, index);
    atom_setfloat(atoms + 1, value);
    atom_setsym(atoms + 2, gensym(display.c_str()));
    emit(object, "paramvalue", 3, atoms);
}

void midiEvent(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 3) return;
    long offset = 0;
    uint16_t port = 0;
    if (argc >= 4) {
        port = static_cast<uint16_t>(std::clamp<t_atom_long>(
            atom_getlong(argv), 0, 65535));
        offset = 1;
    }
    const auto byte = [&](long index) {
        return static_cast<uint8_t>(std::clamp<t_atom_long>(
            atom_getlong(argv + offset + index), 0, 255));
    };
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.enqueueMidi(port, byte(0), byte(1), byte(2)))
        emitError(object, "CLAP event queue is full");
}

void killVoices(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (implementation)
        implementation->voiceResetPending.store(true,
            std::memory_order_release);
}

void stateWrite(MaxClap* object, t_symbol* path)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || !path || !path->s_name) return;
    std::vector<uint8_t> state;
    {
        std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
        if (!implementation->engine.saveState(state)) {
            emitError(object, "plugin does not support CLAP state saving");
            return;
        }
    }
    const std::string destination = absolutePath(path);
    std::ofstream stream(filesystemPath(destination),
        std::ios::binary | std::ios::trunc);
    stream.write(reinterpret_cast<const char*>(state.data()),
        static_cast<std::streamsize>(state.size()));
    if (!stream) {
        emitError(object, "could not write CLAP state file");
        return;
    }
    emitSymbol(object, "statewritten", destination);
}

void stateRead(MaxClap* object, t_symbol* path)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || !path || !path->s_name) return;
    const std::string source = absolutePath(path);
    std::ifstream stream(filesystemPath(source), std::ios::binary);
    if (!stream) {
        emitError(object, "could not open CLAP state file");
        return;
    }
    std::vector<uint8_t> state((std::istreambuf_iterator<char>(stream)),
        std::istreambuf_iterator<char>());
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.loadState(state)) {
        emitError(object, "CLAP state load failed");
        return;
    }
    emitSymbol(object, "stateread", source);
    notifyValueChanged(object);
}

t_max_err getValueOf(MaxClap* object, long* argc, t_atom** argv)
{
    if (!argc || !argv) return MAX_ERR_INVALID_PTR;
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return MAX_ERR_GENERIC;

    std::vector<uint8_t> state;
    std::string path;
    std::string pluginId;
    {
        std::lock_guard<std::recursive_mutex> lock(
            implementation->engineMutex);
        if (!implementation->engine.isOpen()) {
            *argc = 0;
            return MAX_ERR_NONE;
        }
        if (!implementation->engine.saveState(state)
            || state.size() > kMaximumEmbeddedStateBytes)
            return MAX_ERR_GENERIC;
        path = implementation->engine.path();
        pluginId = implementation->engine.pluginId();
    }

    std::vector<uint8_t> compressed;
    const bool useCompression = !s3g::max_host::state_codec::fitsMessage(
        state.size(), kEmbeddedStateHeaderAtoms);
    if (useCompression) {
        compressed = s3g::max_host::state_codec::encode(state);
        if (!s3g::max_host::state_codec::fitsMessage(
                compressed.size(), kCompressedStateHeaderAtoms))
            return MAX_ERR_OUT_OF_MEM;
    }
    const auto& payload = useCompression ? compressed : state;
    const size_t headerAtoms = useCompression
        ? kCompressedStateHeaderAtoms : kEmbeddedStateHeaderAtoms;
    const size_t wordCount = (payload.size() + 3u) / 4u;
    const size_t atomCount = headerAtoms + wordCount;
    if (atomCount > static_cast<size_t>(
            std::numeric_limits<long>::max()))
        return MAX_ERR_OUT_OF_MEM;
    const long required = static_cast<long>(atomCount);
    if (*argv && *argc < required) return MAX_ERR_OUT_OF_MEM;
    if (!*argv) {
        *argv = reinterpret_cast<t_atom*>(getbytes(
            atomCount * sizeof(t_atom)));
        if (!*argv) return MAX_ERR_OUT_OF_MEM;
    }
    *argc = required;
    atom_setsym(*argv, gensym(kEmbeddedStateTag));
    atom_setsym(*argv + 1, gensym(path.c_str()));
    atom_setsym(*argv + 2, gensym(pluginId.c_str()));
    // A negative byte count denotes the new compressed representation.
    // Existing Sets with a nonnegative count retain the original raw format.
    atom_setlong(*argv + 3, useCompression
        ? -1 - static_cast<t_atom_long>(state.size())
        : static_cast<t_atom_long>(state.size()));
    if (useCompression)
        atom_setlong(*argv + 4, static_cast<t_atom_long>(payload.size()));
    for (size_t wordIndex = 0; wordIndex < wordCount; ++wordIndex) {
        uint32_t word = 0u;
        for (size_t byteIndex = 0; byteIndex < 4u; ++byteIndex) {
            const size_t stateIndex = wordIndex * 4u + byteIndex;
            if (stateIndex < payload.size())
                word |= static_cast<uint32_t>(payload[stateIndex])
                    << static_cast<uint32_t>(byteIndex * 8u);
        }
        atom_setlong(*argv + headerAtoms + wordIndex,
            static_cast<t_atom_long>(word));
    }
    return MAX_ERR_NONE;
}

t_max_err setValueOf(MaxClap* object, long argc, t_atom* argv)
{
    if (!object || !object->implementation || argc == 0 || !argv)
        return MAX_ERR_NONE;
    if (argc < static_cast<long>(kEmbeddedStateHeaderAtoms)
        || atom_gettype(argv) != A_SYM
        || std::strcmp(atom_getsym(argv)->s_name, kEmbeddedStateTag) != 0
        || atom_gettype(argv + 1) != A_SYM
        || atom_gettype(argv + 2) != A_SYM)
        return MAX_ERR_GENERIC;

    const t_atom_long byteCountValue = atom_getlong(argv + 3);
    const bool compressed = byteCountValue < 0;
    const uint64_t byteCountUnsigned = compressed
        ? static_cast<uint64_t>(-(byteCountValue + 1))
        : static_cast<uint64_t>(byteCountValue);
    if (byteCountUnsigned
            > kMaximumEmbeddedStateBytes)
        return MAX_ERR_GENERIC;
    const size_t byteCount = static_cast<size_t>(byteCountUnsigned);
    const size_t headerAtoms = compressed
        ? kCompressedStateHeaderAtoms : kEmbeddedStateHeaderAtoms;
    if (argc < static_cast<long>(headerAtoms)) return MAX_ERR_GENERIC;
    size_t payloadBytes = byteCount;
    if (compressed) {
        const t_atom_long compressedBytes = atom_getlong(argv + 4);
        if (compressedBytes < 0
            || !s3g::max_host::state_codec::fitsMessage(
                static_cast<size_t>(compressedBytes), headerAtoms))
            return MAX_ERR_GENERIC;
        payloadBytes = static_cast<size_t>(compressedBytes);
    }
    const size_t wordCount = (payloadBytes + 3u) / 4u;
    if (static_cast<size_t>(argc)
        < headerAtoms + wordCount)
        return MAX_ERR_GENERIC;

    std::vector<uint8_t> payload(payloadBytes, 0u);
    for (size_t wordIndex = 0; wordIndex < wordCount; ++wordIndex) {
        const uint32_t word = static_cast<uint32_t>(atom_getlong(
            argv + headerAtoms + wordIndex));
        for (size_t byteIndex = 0; byteIndex < 4u; ++byteIndex) {
            const size_t stateIndex = wordIndex * 4u + byteIndex;
            if (stateIndex < payload.size())
                payload[stateIndex] = static_cast<uint8_t>(
                    (word >> static_cast<uint32_t>(byteIndex * 8u)) & 0xffu);
        }
    }
    std::vector<uint8_t> state;
    if (compressed) {
        if (!s3g::max_host::state_codec::decode(
                payload, byteCount, state))
            return MAX_ERR_GENERIC;
    } else {
        state = std::move(payload);
    }

    const std::string storedPath = atom_getsym(argv + 1)->s_name;
    const std::string pluginId = atom_getsym(argv + 2)->s_name;
    std::string resolvedPath;
    std::string error;
    if (!s3g::max_host::resolveClapBundle(storedPath, resolvedPath, error)) {
        const std::string bundleName = filesystemPath(storedPath)
            .stem().string();
        if (bundleName.empty()
            || !s3g::max_host::resolveClapBundle(
                bundleName, resolvedPath, error)) {
            emitError(object, error);
            return MAX_ERR_GENERIC;
        }
    }
    try {
        auto* implementation = object->implementation;
        {
            std::lock_guard<std::recursive_mutex> lock(
                implementation->engineMutex);
            auto& engine = implementation->engine;
            if (engine.isOpen() && engine.path() == resolvedPath
                && engine.pluginId() == pluginId) {
                if (!engine.loadState(state)) {
                    emitError(object, "CLAP state load failed");
                    return MAX_ERR_GENERIC;
                }
                // Keep the current plugin instance and editor alive. Reopening
                // the same plugin here used to destroy an NSWindow from Live's
                // AudioCalc thread when a state carrier echoed its capture.
                emitLoaded(object);
                emitLatency(object);
                notifyValueChanged(object);
                return MAX_ERR_NONE;
            }
        }
        if (!installPlugin(object, resolvedPath, pluginId, &state, false,
                error)) {
            emitError(object, error);
            return MAX_ERR_GENERIC;
        }
    } catch (const std::exception& exception) {
        emitError(object, exception.what());
        return MAX_ERR_GENERIC;
    }
    return MAX_ERR_NONE;
}

void outputEmbeddedState(MaxClap* object)
{
    long argc = 0;
    t_atom* argv = nullptr;
    const t_max_err result = getValueOf(object, &argc, &argv);
    if (result != MAX_ERR_NONE) {
        emitError(object, result == MAX_ERR_OUT_OF_MEM
            ? "CLAP state cannot fit a Max message after compression, or memory is exhausted"
            : "could not capture embedded CLAP state");
        return;
    }
    if (argc > 0 && argv)
        emit(object, "state", argc, argv);
    if (argv)
        freebytes(argv, static_cast<size_t>(argc) * sizeof(t_atom));
}

void restoreEmbeddedState(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    if (setValueOf(object, argc, argv) != MAX_ERR_NONE) {
        emitError(object, "invalid embedded CLAP state");
        return;
    }
    emit(object, "staterestored", 0, nullptr);
}

void transportMessage(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 6 || !argv) return;
    s3g::max_host::ClapTransportState transport;
    transport.available = true;
    transport.hasTempo = true;
    transport.hasBeatsTimeline = true;
    transport.hasSecondsTimeline = true;
    transport.hasTimeSignature = true;
    transport.playing = atom_getlong(argv) != 0;
    transport.tempo = atom_getfloat(argv + 1);
    transport.songBeats = atom_getfloat(argv + 2);
    transport.songSeconds = atom_getfloat(argv + 3);
    transport.timeSignatureNumerator = static_cast<uint16_t>(
        std::clamp<t_atom_long>(atom_getlong(argv + 4), 1, 65535));
    transport.timeSignatureDenominator = static_cast<uint16_t>(
        std::clamp<t_atom_long>(atom_getlong(argv + 5), 1, 65535));
    if (argc > 6) transport.recording = atom_getlong(argv + 6) != 0;
    if (argc > 7) transport.loopActive = atom_getlong(argv + 7) != 0;
    if (argc > 8) transport.loopStartBeats = atom_getfloat(argv + 8);
    if (argc > 9) transport.loopEndBeats = atom_getfloat(argv + 9);
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    implementation->engine.setTransport(transport);
}

void transportSyncMessage(MaxClap* object, t_symbol*, long argc,
    t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 7 || !argv) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    const double sampleRate = implementation->sampleRate;
    const double samplesPerBeat = atom_getfloat(argv + 3);
    const t_atom_long flags = atom_getlong(argv + 6);
    s3g::max_host::ClapTransportState transport;
    transport.available = true;
    transport.hasBeatsTimeline = (flags & 2) != 0;
    transport.hasTimeSignature = (flags & 4) != 0;
    transport.hasTempo = (flags & 8) != 0 && sampleRate > 0.0
        && samplesPerBeat > 0.0;
    transport.hasSecondsTimeline = (flags & 1) != 0 && sampleRate > 0.0;
    transport.playing = (flags & 16) != 0 && atom_getlong(argv) != 0;
    transport.songBeats = atom_getfloat(argv + 1);
    transport.songSeconds = transport.hasSecondsTimeline
        ? atom_getfloat(argv + 2) / sampleRate : 0.0;
    transport.tempo = transport.hasTempo
        ? sampleRate * 60.0 / samplesPerBeat : 120.0;
    transport.timeSignatureNumerator = static_cast<uint16_t>(
        std::clamp<t_atom_long>(atom_getlong(argv + 4), 1, 65535));
    transport.timeSignatureDenominator = static_cast<uint16_t>(
        std::clamp<t_atom_long>(atom_getlong(argv + 5), 1, 65535));
    implementation->engine.setTransport(transport);
}

void transportClear(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    implementation->engine.clearTransport();
}

void getLatency(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    emitLatency(object);
}

void status(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (implementation->engine.isOpen()) {
        emitLoaded(object);
        emitLatency(object);
    }
    else emit(object, "closed", 0, nullptr);
}

void assist(MaxClap* object, void*, long message, long argument, char* text)
{
    const auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    if (message == ASSIST_INLET) {
        if (object->mc && implementation->inputCount > 0) {
            snprintf_zero(text, 256,
                "MC CLAP signal input (%u channels); control messages",
                implementation->inputCount);
        } else if (implementation->inputCount > 0) {
            snprintf_zero(text, 256,
                "Signal input %ld; CLAP control messages", argument + 1);
        } else {
            snprintf_zero(text, 256, "CLAP control messages (no audio input)");
        }
    } else if (object->mc && implementation->outputCount > 0
        && argument == 0) {
        snprintf_zero(text, 256, "MC CLAP signal output (%u channels)",
            implementation->outputCount);
    } else if (!object->mc && static_cast<uint32_t>(argument)
        < implementation->outputCount) {
        snprintf_zero(text, 256, "CLAP signal output %ld", argument + 1);
    } else {
        snprintf_zero(text, 256, "CLAP status, parameter, and MIDI messages");
    }
}

long multichannelOutputs(MaxClap* object, long index)
{
    const auto* implementation = object ? object->implementation : nullptr;
    if (!object || !implementation || index < 0) return 0;
    if (object->mc)
        return index == 0
            ? static_cast<long>(implementation->outputCount) : 0;
    return static_cast<uint32_t>(index) < implementation->outputCount ? 1 : 0;
}

long inputChanged(MaxClap*, long, long) { return false; }

t_max_err setMcAttribute(MaxClap* object, void*, long argc, t_atom* argv)
{
    const long requested = argc > 0 && argv && atom_getlong(argv) != 0 ? 1 : 0;
    if (object && object->implementation && requested != object->mc) {
        object_warn(reinterpret_cast<t_object*>(object),
            "mc is construction-time only; recreate object to change MC mode");
        return MAX_ERR_NONE;
    }
    if (object) object->mc = requested;
    return MAX_ERR_NONE;
}

void freeObject(MaxClap* object)
{
    if (!object) return;
    dsp_free(reinterpret_cast<t_pxobject*>(object));
    if (object->deferred) qelem_free(object->deferred);
    if (object->implementation) {
        std::lock_guard<std::recursive_mutex> lock(
            object->implementation->engineMutex);
        destroyEditor(object->implementation);
    }
    delete object->implementation;
    object->implementation = nullptr;
}

void* newObject(t_symbol*, long argc, t_atom* argv)
{
    auto* object = static_cast<MaxClap*>(object_alloc(gClass));
    if (!object) return nullptr;
    object->statusOutlet = nullptr;
    object->deferred = nullptr;
    object->implementation = nullptr;
    object->mc = attributeEnabled(argc, argv, "mc", false) ? 1 : 0;

    const long positionalCount = attr_args_offset(
        static_cast<short>(argc), argv);

    long inputs = kDefaultInputs;
    long outputs = kDefaultOutputs;
    if (positionalCount > 0 && atom_gettype(argv) == A_LONG)
        inputs = static_cast<long>(std::clamp<t_atom_long>(
            atom_getlong(argv), 0, kMaximumChannels));
    if (positionalCount > 1 && atom_gettype(argv + 1) == A_LONG)
        outputs = static_cast<long>(std::clamp<t_atom_long>(
            atom_getlong(argv + 1), 0, kMaximumChannels));

    object->statusOutlet = listout(object);
    if (object->mc) {
        dsp_setup(reinterpret_cast<t_pxobject*>(object), inputs > 0 ? 1 : 0);
        object->object.z_misc |= Z_NO_INPLACE;
        if (inputs > 0) object->object.z_misc |= Z_MC_INLETS;
        if (outputs > 0) outlet_new(object, "multichannelsignal");
    } else {
        dsp_setup(reinterpret_cast<t_pxobject*>(object), inputs);
        object->object.z_misc |= Z_NO_INPLACE;
        for (long channel = outputs; channel > 0; --channel)
            outlet_new(object, "signal");
    }
    object->implementation = new (std::nothrow) Implementation(object,
        static_cast<uint32_t>(inputs), static_cast<uint32_t>(outputs));
    if (!object->implementation) {
        object_error(reinterpret_cast<t_object*>(object),
            "could not allocate the CLAP host");
        return object;
    }
    object->deferred = qelem_new(object, reinterpret_cast<method>(deferredTick));
    attr_args_process(object, static_cast<short>(argc), argv);

    if (positionalCount > 2 && atom_gettype(argv + 2) == A_SYM)
        openPlugin(object, gensym("open"), positionalCount - 2, argv + 2);
    return object;
}

} // namespace

extern "C" void ext_main(void*)
{
    t_class* klass = class_new("s3g.clap~",
        reinterpret_cast<method>(newObject),
        reinterpret_cast<method>(freeObject), sizeof(MaxClap), nullptr,
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(dsp64), "dsp64", A_CANT,
        0);
    class_addmethod(klass, reinterpret_cast<method>(assist), "assist", A_CANT,
        0);
    class_addmethod(klass, reinterpret_cast<method>(multichannelOutputs),
        "multichanneloutputs", A_CANT, 0);
    class_addmethod(klass, reinterpret_cast<method>(inputChanged),
        "inputchanged", A_CANT, 0);
    class_addmethod(klass, reinterpret_cast<method>(openPlugin), "open",
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(openPluginIfEmpty),
        "openifempty", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(closePlugin), "close", 0);
    class_addmethod(klass, reinterpret_cast<method>(outputPluginList),
        "getplugins", 0);
    class_addmethod(klass, reinterpret_cast<method>(outputSearchPaths),
        "getpaths", 0);
    class_addmethod(klass, reinterpret_cast<method>(outputParameterList),
        "getparams", 0);
    class_addmethod(klass, reinterpret_cast<method>(editorMessage), "editor",
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(setParameter), "param",
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(setParameterById),
        "paramid", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(automateParameterById),
        "automateparamid", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(getParameter), "getparam",
        A_LONG, 0);
    class_addmethod(klass, reinterpret_cast<method>(midiEvent), "midievent",
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(killVoices), "killvoices",
        0);
    class_addmethod(klass, reinterpret_cast<method>(stateWrite), "statewrite",
        A_SYM, 0);
    class_addmethod(klass, reinterpret_cast<method>(stateRead), "stateread",
        A_SYM, 0);
    class_addmethod(klass, reinterpret_cast<method>(outputEmbeddedState),
        "getstate", 0);
    class_addmethod(klass, reinterpret_cast<method>(restoreEmbeddedState),
        "setstate", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(getValueOf), "getvalueof",
        A_CANT, 0);
    class_addmethod(klass, reinterpret_cast<method>(setValueOf), "setvalueof",
        A_CANT, 0);
    class_addmethod(klass, reinterpret_cast<method>(transportMessage),
        "transport", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(transportSyncMessage),
        "transportsync", A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(transportClear),
        "transportclear", 0);
    class_addmethod(klass, reinterpret_cast<method>(getLatency), "getlatency",
        0);
    class_addmethod(klass, reinterpret_cast<method>(status), "status", 0);
    CLASS_ATTR_LONG(klass, "mc", 0, MaxClap, mc);
    CLASS_ATTR_ACCESSORS(klass, "mc", nullptr, setMcAttribute);
    CLASS_ATTR_FILTER_CLIP(klass, "mc", 0, 1);
    CLASS_ATTR_LABEL(klass, "mc", 0, "MC Mode");
    CLASS_ATTR_DEFAULT(klass, "mc", 0, "0");
    CLASS_ATTR_SAVE(klass, "mc", 0);
    class_dspinit(klass);
    class_register(CLASS_BOX, klass);
    gClass = klass;
}
