#include "ext.h"
#include "ext_obex.h"
#include "ext_path.h"
#include "z_dsp.h"

#include "s3g_clap_discovery.h"
#include "s3g_clap_engine.h"
#if defined(__APPLE__)
#include "s3g_clap_bundle_picker.h"
#include "s3g_clap_editor.h"
#endif

#include <algorithm>
#include <atomic>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <memory>
#include <mutex>
#include <new>
#include <string>
#include <vector>

namespace {

constexpr long kDefaultInputs = 2;
constexpr long kDefaultOutputs = 2;
constexpr long kMaximumChannels = 128;

struct MaxClap {
    t_pxobject object;
    void* statusOutlet = nullptr;
    void* deferred = nullptr;
    struct Implementation* implementation = nullptr;
};

struct Implementation {
    Implementation(MaxClap* owner, uint32_t inputs, uint32_t outputs)
        : owner(owner), inputCount(inputs), outputCount(outputs),
          engine(inputs, outputs)
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
#if defined(__APPLE__)
    S3GClapEditor* editor = nullptr;
#endif
};

t_class* gClass = nullptr;

void emit(MaxClap* object, const char* selector, long count, t_atom* atoms)
{
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

void destroyEditor(Implementation* implementation)
{
#if defined(__APPLE__)
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
#if defined(__APPLE__)
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
        }
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

    const bool ok = implementation->engine.process(inputs,
        static_cast<uint32_t>(inputCount), outputs,
        static_cast<uint32_t>(outputCount), static_cast<uint32_t>(frames));
    if (!ok && implementation->engine.isActive())
        implementation->processError.store(true, std::memory_order_release);
    if (implementation->engine.hasOutputEvents()
        || implementation->engine.hasCallbackRequest()
        || implementation->engine.hasRestartRequest()
        || implementation->engine.hasGuiRequest()
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
        }
    }
    object_method(dsp, gensym("dsp_add64"), object, perform64, 0, nullptr);
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
            && std::filesystem::exists(maxResolved, filesystemError)
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
        std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
        std::string error;
        destroyEditor(implementation);
        if (!implementation->engine.open(path, requestedId, error)) {
            emitError(object, error);
            return;
        }
        if (implementation->sampleRate > 0.0 && implementation->vectorSize > 0
            && !implementation->engine.activate(implementation->sampleRate,
                implementation->vectorSize, error)) {
            implementation->engine.close();
            emitError(object, error);
            return;
        }
        emitLoaded(object);
    } catch (const std::exception& exception) {
        emitError(object, exception.what());
    }
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
#if defined(__APPLE__)
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
    emitError(object, "native CLAP editors are currently implemented on macOS");
#endif
}

void setParameter(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 2) return;
    const long index = atom_getlong(argv);
    const double value = atom_getfloat(argv + 1);
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (index < 1 || !implementation->engine.enqueueParameter(
            static_cast<uint32_t>(index), value))
        emitError(object, "invalid, read-only, or full CLAP parameter event");
}

void setParameterById(MaxClap* object, t_symbol*, long argc, t_atom* argv)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation || argc < 2) return;
    const t_atom_long id = atom_getlong(argv);
    const double value = atom_getfloat(argv + 1);
    if (id < 0) {
        emitError(object, "CLAP parameter id must be non-negative");
        return;
    }
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.enqueueParameterById(
            static_cast<clap_id>(id), value))
        emitError(object, "invalid, read-only, or full CLAP parameter event");
}

void getParameter(MaxClap* object, long index)
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
        port = static_cast<uint16_t>(std::clamp<long>(atom_getlong(argv),
            0, 65535));
        offset = 1;
    }
    const auto byte = [&](long index) {
        return static_cast<uint8_t>(std::clamp<long>(
            atom_getlong(argv + offset + index), 0, 255));
    };
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (!implementation->engine.enqueueMidi(port, byte(0), byte(1), byte(2)))
        emitError(object, "CLAP event queue is full");
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
    std::ofstream stream(destination, std::ios::binary | std::ios::trunc);
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
    std::ifstream stream(source, std::ios::binary);
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
}

void status(MaxClap* object)
{
    auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    std::lock_guard<std::recursive_mutex> lock(implementation->engineMutex);
    if (implementation->engine.isOpen()) emitLoaded(object);
    else emit(object, "closed", 0, nullptr);
}

void assist(MaxClap* object, void*, long message, long argument, char* text)
{
    const auto* implementation = object ? object->implementation : nullptr;
    if (!implementation) return;
    if (message == ASSIST_INLET) {
        snprintf_zero(text, 256, "Signal input %ld; CLAP control messages",
            argument + 1);
    } else if (static_cast<uint32_t>(argument)
        < implementation->outputCount) {
        snprintf_zero(text, 256, "CLAP signal output %ld", argument + 1);
    } else {
        snprintf_zero(text, 256, "CLAP status, parameter, and MIDI messages");
    }
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

    long inputs = kDefaultInputs;
    long outputs = kDefaultOutputs;
    if (argc > 0 && atom_gettype(argv) == A_LONG)
        inputs = std::clamp<long>(atom_getlong(argv), 0, kMaximumChannels);
    if (argc > 1 && atom_gettype(argv + 1) == A_LONG)
        outputs = std::clamp<long>(atom_getlong(argv + 1), 0,
            kMaximumChannels);

    dsp_setup(reinterpret_cast<t_pxobject*>(object), inputs);
    object->statusOutlet = outlet_new(object, nullptr);
    for (long channel = outputs; channel > 0; --channel)
        outlet_new(object, "signal");
    object->implementation = new (std::nothrow) Implementation(object,
        static_cast<uint32_t>(inputs), static_cast<uint32_t>(outputs));
    if (!object->implementation) {
        object_error(reinterpret_cast<t_object*>(object),
            "could not allocate the CLAP host");
        return object;
    }
    object->deferred = qelem_new(object, reinterpret_cast<method>(deferredTick));

    if (argc > 2 && atom_gettype(argv + 2) == A_SYM)
        openPlugin(object, gensym("open"), argc - 2, argv + 2);
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
    class_addmethod(klass, reinterpret_cast<method>(openPlugin), "open",
        A_GIMME, 0);
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
    class_addmethod(klass, reinterpret_cast<method>(getParameter), "getparam",
        A_LONG, 0);
    class_addmethod(klass, reinterpret_cast<method>(midiEvent), "midievent",
        A_GIMME, 0);
    class_addmethod(klass, reinterpret_cast<method>(stateWrite), "statewrite",
        A_SYM, 0);
    class_addmethod(klass, reinterpret_cast<method>(stateRead), "stateread",
        A_SYM, 0);
    class_addmethod(klass, reinterpret_cast<method>(status), "status", 0);
    class_dspinit(klass);
    class_register(CLASS_BOX, klass);
    gClass = klass;
}
