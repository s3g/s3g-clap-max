#!/usr/bin/env python3
"""Generate fixed Processor, Macro, and multichannel Sample Live devices.

IDs, ports, and selected parameter ranges mirror s3g-dsp CLAP descriptors.
Other settings remain in the CLAP editor and opaque saved state.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]


def load_generator(name: str, filename: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / "scripts" / filename)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


base = load_generator("s3g_m4l_next_base", "generate-m4l-devices.py")
effects = load_generator("s3g_m4l_next_effects", "generate-m4l-extra-effects.py")
P = base.FixedParameter

# Max resolves the first openifempty argument against the CLAP bundle's file
# and Info.plist names, not against every descriptor inside that bundle. The
# requested CLAP ID below still selects the intended multichannel variant.
SAMPLE_BUNDLE_REFERENCES = {
    **{f"s3g Sample {kind} 32": f"s3g Sample {kind} 2"
       for kind in ("Cutups", "Grains", "Lanes", "Motion", "Wavesets")},
    "s3g Sample Player 16": "s3g Sample Player 2",
    "s3g Sample Slicer 2": "s3g Sample Slicer 16",
}


# (name, CLAP ID, accepts MIDI, selected Live parameters)
STEREO_PROCESSORS = (
    ("Conduit", "org.s3g.s3g-dsp.processor-conduit", False, (
        P(3, "Driver", "Driver", 0, 1, .45),
        P(10, "Mix", "Mix", 0, 1, .82),
        P(11, "Output", "Output", -60, 6, -6),
    )),
    ("Formant Matrix", "org.s3g.s3g-dsp.formant-matrix", True, (
        P(9, "Brightness", "Bright", 0, 1, .48),
        P(15, "Intensity", "Intensity", 0, 1, .78),
        P(24, "Output Gain", "Output", -24, 12, -3),
    )),
)

# These four Processors have no audio input.
STEREO_INSTRUMENTS = (
    ("Errant", "org.s3g.s3g-dsp.processor-errant", (
        P(4, "Density", "Density", 0, 1, .58),
        P(6, "Mutation", "Mutation", 0, 1, .42),
        P(17, "Output Gain", "Output", -36, 6, -8),
    )),
    ("LF Synth", "org.s3g.s3g-dsp.low-frequency-synth", (
        P(4, "Modal Body", "Body", 0, 1, .70),
        P(24, "Cutoff", "Cutoff", 30, 12000, 1200),
        P(21, "Output", "Output", -36, 6, -8),
    )),
    ("Lowform", "org.s3g.s3g-dsp.processor-lowform", (
        P(11, "Body Level", "Body", 0, 1.16, .62),
        P(20, "Cutoff", "Cutoff", 20, 20000, 820),
        P(1, "Output", "Output", -36, 6, -12),
    )),
    ("Stack", "org.s3g.s3g-dsp.processor-stack", (
        P(13, "Stack", "Stack", 0, 1, .62),
        P(19, "Feedback", "Feedback", 0, 1, .56),
        P(26, "Output", "Output", -36, 6, -12),
    )),
)


def macro_params(kind: str) -> tuple[P, ...]:
    if kind == "Delay":
        return (P(1, "Time", "Time", 5, 2000, 260),
                P(2, "Feedback", "Feedback", 0, .78, .32),
                P(9, "Mix", "Mix", 0, 1, .35),
                P(10, "Output", "Output", -60, 12, 0))
    if kind == "Pitch":
        return (P(1, "Pitch", "Pitch", -24, 24, 0),
                P(2, "Fine", "Fine", -100, 100, 0),
                P(9, "Mix", "Mix", 0, 1, .35),
                P(10, "Output", "Output", -60, 12, 0))
    if kind == "Fracture":
        return (P(3, "Amount", "Amount", 0, 1, .55),
                P(4, "Color", "Color", 0, 1, .50),
                P(13, "Mix", "Mix", 0, 1, .72),
                P(14, "Output", "Output", -60, 6, -3))
    if kind == "Shred":
        return (P(2, "Pressure", "Pressure", 0, 1, .28),
                P(3, "Shred", "Shred", 0, 1, .18),
                P(4, "Feedback", "Feedback", 0, 1, .12),
                P(14, "Output", "Output", -60, 6, -3))
    raise ValueError(kind)


# Fixed-width source descriptors; mono exists only for Fracture and Shred.
MACROS = (
    ("Delay", 8, "org.s3g.s3g-dsp.macro-delay-8ch"),
    ("Delay", 24, "org.s3g.s3g-dsp.macro-delay-24ch"),
    ("Pitch", 8, "org.s3g.s3g-dsp.macro-pitch-8ch"),
    ("Pitch", 24, "org.s3g.s3g-dsp.macro-pitch-24ch"),
    ("Fracture", 1, "org.s3g.s3g-dsp.macro-fracture-mono"),
    ("Fracture", 8, "org.s3g.s3g-dsp.macro-fracture-8ch"),
    ("Fracture", 24, "org.s3g.s3g-dsp.macro-fracture-24ch"),
    ("Shred", 1, "org.s3g.s3g-dsp.macro-shred-mono"),
    ("Shred", 8, "org.s3g.s3g-dsp.macro-shred-8ch"),
    ("Shred", 24, "org.s3g.s3g-dsp.macro-shred-24ch"),
)


def arrange_debug(document: dict[str, object], parameters: tuple[P, ...]) -> None:
    """Lay out Max edit mode as nonoverlapping audio, MIDI, state, and bus lanes."""
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    positions = {
        "obj-plugin": (40, 100), "obj-mono-sum": (40, 155),
        "obj-mono-half": (40, 210), "obj-clap": (40, 270),
        "obj-plugout": (40, 380), "obj-midi-in": (400, 270),
        "obj-midi-parse": (400, 325),
        "obj-route-status": (40, 500), "obj-latency-message": (40, 560),
        "obj-thispatcher": (40, 620), "obj-print": (200, 560),
        "obj-plugsync": (40, 740), "obj-timesig": (200, 740),
        "obj-transport-pack": (40, 810), "obj-transport": (40, 870),
        "obj-gui-button": (700, 40), "obj-editor-trigger": (800, 40),
        "obj-editor": (900, 40), "obj-play-button": (700, 100),
        "obj-play-message": (800, 100), "obj-kill-button": (700, 155),
        "obj-kill-message": (800, 155),
        "obj-loadbang": (700, 225), "obj-delayed-load": (700, 275),
        "obj-default-open": (700, 325),
        "obj-clap-state": (700, 420), "obj-state-valid": (700, 475),
        "obj-state-restore": (700, 530),
        "obj-state-restore-init": (700, 590),
        "obj-state-capture-enable": (900, 590),
        "obj-state-capture-gate": (1000, 590),
        "obj-state-change-bang": (700, 650),
        "obj-state-capture-delay": (900, 650),
        "obj-state-get": (900, 705),
        "obj-param-loaded-trigger": (1150, 100),
        "obj-param-enable": (1250, 100),
        "obj-param-resync-delay": (1150, 160),
        "obj-param-gate": (1150, 220),
        "obj-paramchanged-route": (1150, 300),
        "obj-device": (1550, 100), "obj-start-route": (1550, 160),
        "obj-bus-insert": (1550, 220),
        "obj-next-order": (1550, 300),
        "obj-next-delay": (1550, 365),
        "obj-next-store": (1550, 425),
        "obj-next-trigger": (1700, 365),
        "obj-next-mode": (1800, 425),
        "obj-next-send": (1700, 485),
        "obj-ui-background": (2100, 40),
    }
    for row, parameter in enumerate(parameters):
        y = 430 + row * 90
        positions[f"obj-param-{parameter.clap_id}"] = (1150, y)
        positions[f"obj-param-message-{parameter.clap_id}"] = (1260, y)
        positions[f"obj-param-reflect-{parameter.clap_id}"] = (1400, y)
    if set(boxes) - set(positions):
        raise ValueError(f"unplaced Max objects: {sorted(set(boxes) - set(positions))}")
    for object_id, item in boxes.items():
        item["patching_rect"][:2] = list(positions[object_id])
    entries = list(boxes.values())
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            if min(x + width, sx + sw) > max(x, sx) and min(y + height, sy + sh) > max(y, sy):
                raise ValueError(f"overlapping Max objects: {first['id']}, {second['id']}")
    patch["rect"] = [120, 90, 2500, 1100]


def add_bus_handoff(boxes: list[dict[str, object]],
                    lines: list[dict[str, object]]) -> None:
    """Use the same Bus 36 chain handshake as existing fixed wrappers."""
    boxes.extend((
        base.new_object("obj-bus-insert", "s3g.bus.insert", 1550, 220,
                        100, 1, 0),
        base.new_object("obj-start-route", "t l l", 1550, 160,
                        45, 1, 2, ["list", "list"]),
        base.new_object("obj-next-order", "t b l l", 1550, 300,
                        60, 1, 3, ["bang", "list", "list"]),
        base.new_object("obj-next-delay", "delay 300", 1550, 365,
                        75, 1, 1, ["bang"]),
        base.new_object("obj-next-store", "zl.reg", 1550, 425,
                        55, 2, 2),
        base.new_object("obj-next-trigger", "t l b", 1700, 365,
                        50, 1, 2, ["list", "bang"]),
        base.box("obj-next-mode", "message", [1800, 425, 30, 22], text="1"),
        base.new_object("obj-next-send", "s3g.bus.send s3g-chain-next",
                        1700, 485, 220, 3, 0),
    ))
    lines.extend((
        base.line("obj-device", 0, "obj-start-route", 0),
        base.line("obj-start-route", 1, "obj-bus-insert", 0),
        base.line("obj-start-route", 0, "obj-next-order", 0),
        base.line("obj-next-order", 2, "obj-next-store", 1),
        base.line("obj-next-order", 1, "obj-next-trigger", 0),
        base.line("obj-next-order", 0, "obj-next-delay", 0),
        base.line("obj-next-delay", 0, "obj-next-store", 0),
        base.line("obj-next-store", 0, "obj-next-trigger", 0),
        base.line("obj-next-trigger", 1, "obj-next-mode", 0),
        base.line("obj-next-mode", 0, "obj-next-send", 1),
        base.line("obj-next-trigger", 0, "obj-next-send", 0),
    ))


def make_instrument(
    name: str, plugin_id: str, outputs: int,
    parameters: tuple[P, ...], *, inputs: int = 0,
    play_message: str = "midievent 144 60 100",
    kill_message: str = "killvoices",
) -> dict[str, object]:
    """Zero-input MIDI instrument, or Rings' Bus-36-fed capture effect."""
    if inputs not in (0, 8) or outputs not in (2, 8, 16, 32):
        raise ValueError(f"unsupported {name} port count")
    wide = outputs > 2
    clap = base.clap_box(f"s3g.clap~ {inputs} {outputs}", 40, 270,
                         inputs, outputs)
    # The external still has its message inlet when it has no signal inputs.
    clap["box"]["numinlets"] = max(1, inputs)
    boxes = base.common_ui(False, base.COMPACT_DEVICE_HEIGHT,
                           allow_plugin_picker=False)
    boxes.extend((
        base.action_button("obj-play-button", [700, 100, 64, 24],
                           [84, 10, 64, base.CONTROL_HEIGHT], "PLAY",
                           annotation="Audition the loaded sound or start its transport."),
        base.action_button("obj-kill-button", [700, 155, 64, 24],
                           [156, 10, 64, base.CONTROL_HEIGHT],
                           "STOP" if inputs else "KILL",
                           annotation="Stop or reset the current sound."),
        base.box("obj-play-message", "message", [800, 100, 210, 22],
                 text=play_message),
        base.box("obj-kill-message", "message", [800, 155, 210, 22],
                 text=kill_message),
        clap,
        base.new_object("obj-plugout", "plugout~ " + " ".join(
            str(channel) for channel in range(1, (38 if wide else 2) + 1)),
            40, 380, 620 if wide else 110,
            38 if wide else 2, 38 if wide else 2,
            ["signal"] * (38 if wide else 2)),
        base.new_object("obj-device", "s3g.live.thisdevice", 1550, 100,
                        125, 1, 1),
    ))
    if inputs:
        boxes.append(base.new_object(
            "obj-plugin", "plugin~ " + " ".join(str(channel)
                for channel in range(1, 39)), 40, 100, 620,
            38, 38, ["signal"] * 38,
        ))
    runtime_boxes, runtime_lines = base.common_runtime(
        outputs, SAMPLE_BUNDLE_REFERENCES.get(name, name),
        allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = base.fixed_parameter_runtime(
        parameters, (),
    )
    midi_boxes, midi_lines = base.midi_input_bridge()
    boxes.extend((*runtime_boxes, *parameter_boxes, *midi_boxes))
    lines = [
        base.line("obj-play-button", 0, "obj-play-message", 0),
        base.line("obj-play-message", 0, "obj-clap", 0),
        base.line("obj-kill-button", 0, "obj-kill-message", 0),
        base.line("obj-kill-message", 0, "obj-clap", 0),
        *runtime_lines, *parameter_lines, *midi_lines,
    ]
    if inputs:
        lines.extend(base.line("obj-plugin", channel + 2, "obj-clap", channel)
                     for channel in range(inputs))
        lines.extend(base.line("obj-plugin", channel, "obj-plugout", channel)
                     for channel in range(2))
    if wide:
        lines.extend(base.line("obj-clap", channel, "obj-plugout", channel + 2)
                     for channel in range(outputs))
        add_bus_handoff(boxes, lines)
    else:
        lines.extend(base.line("obj-clap", channel, "obj-plugout", channel)
                     for channel in range(2))
    detail = (f"Takes {inputs} capture channels from a preceding Bus Receive 36. "
              if inputs else "Receives Live MIDI without an audio input. ")
    detail += (f"Publishes {outputs} chain slots; follow with Bus Send 36 "
               f"(INPUT=CHAIN 36, CH={outputs})." if wide else
               "Returns ordinary Live stereo audio.")
    document = base.patcher(
        name, f"Fixed {name} wrapper. {detail} Saved CLAP state and selected "
        "Live automation are retained.", boxes, lines, False,
        instrument=not inputs, minimum_width=base.DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    document["patcher"]["tags"] = "s3g CLAP fixed MIDI instrument"
    base.register_fixed_parameters(document, parameters)
    arrange_debug(document, parameters)
    return document


def make_mono_macro(name: str, plugin_id: str,
                    parameters: tuple[P, ...]) -> dict[str, object]:
    """Average Live L/R into the mono CLAP; return dual mono to Live."""
    boxes = base.common_ui(False, base.COMPACT_DEVICE_HEIGHT,
                           allow_plugin_picker=False)
    boxes.extend((
        base.new_object("obj-plugin", "plugin~ 1 2", 40, 100,
                        110, 2, 2, ["signal"] * 2),
        base.new_object("obj-mono-sum", "+~", 40, 155,
                        45, 2, 1, ["signal"]),
        base.new_object("obj-mono-half", "*~ 0.5", 40, 210,
                        60, 2, 1, ["signal"]),
        base.clap_box("s3g.clap~ 1 1", 40, 270, 1, 1),
        base.new_object("obj-plugout", "plugout~ 1 2", 40, 380,
                        110, 2, 2, ["signal"] * 2),
        base.new_object("obj-device", "s3g.live.thisdevice", 1550, 100,
                        125, 1, 1),
    ))
    runtime_boxes, runtime_lines = base.common_runtime(
        1, name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = base.fixed_parameter_runtime(
        parameters, (),
    )
    boxes.extend((*runtime_boxes, *parameter_boxes))
    lines = [
        base.line("obj-plugin", 0, "obj-mono-sum", 0),
        base.line("obj-plugin", 1, "obj-mono-sum", 1),
        base.line("obj-mono-sum", 0, "obj-mono-half", 0),
        base.line("obj-mono-half", 0, "obj-clap", 0),
        base.line("obj-clap", 0, "obj-plugout", 0),
        base.line("obj-clap", 0, "obj-plugout", 1),
        *runtime_lines, *parameter_lines,
    ]
    document = base.patcher(
        name, f"Fixed {name} mono insert. Sums Live L/R at half gain before "
        "the mono CLAP and returns dual mono to Live.", boxes, lines, False,
        minimum_width=base.DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    document["patcher"]["tags"] = "s3g CLAP fixed mono Macro"
    base.register_fixed_parameters(document, parameters)
    arrange_debug(document, parameters)
    return document


def main() -> None:
    for kind, plugin_id, midi_input, parameters in STEREO_PROCESSORS:
        name = f"s3g Processor {kind} 2"
        document = effects.make_effect(
            kind, name, plugin_id, 2, parameters,
            device_name=name, midi_input=midi_input,
            audition_label="NOTE",
        )
        if midi_input:
            button = next(entry["box"] for entry in document["patcher"]["boxes"]
                          if entry["box"]["id"] == "obj-audition-button")
            button["annotation"] = "Audition Formant Matrix with MIDI note 36."
        base.write_device(name, document)
    for kind, plugin_id, parameters in STEREO_INSTRUMENTS:
        name = f"s3g Processor {kind} 2"
        base.write_device(name, make_instrument(name, plugin_id, 2, parameters))
    for kind, channels, plugin_id in MACROS:
        name = (f"s3g Macro {kind} Mono 1" if channels == 1 else
                f"s3g Macro {kind} {channels}")
        parameters = macro_params(kind)
        document = (make_mono_macro(name, plugin_id, parameters)
                    if channels == 1 else effects.make_effect(
                        kind, name, plugin_id, channels, parameters,
                        input_channels=channels, device_name=name,
                    ))
        base.write_device(name, document)

    stereo_sample_parameters = {
        kind: parameters for kind, parameters in base.SAMPLE_INSTRUMENT_SPECS
    }
    for kind in ("Cutups", "Grains", "Lanes", "Motion", "Wavesets"):
        name = f"s3g Sample {kind} 32"
        base.write_device(name, make_instrument(
            name, f"org.s3g.s3g-dsp.sample-{kind.lower()}-32", 32,
            stereo_sample_parameters[kind],
            kill_message="midievent 176 123 0",
        ))
    player_name = "s3g Sample Player 16"
    base.write_device(player_name, make_instrument(
        player_name, "org.s3g.s3g-dsp.sample-player-16", 16,
        tuple(parameter for parameter in stereo_sample_parameters["Player"]
              if parameter.clap_id != 14),
    ))
    kit_name = "s3g Sample Kit 32"
    base.write_device(kit_name, make_instrument(
        kit_name, "org.s3g.s3g-dsp.sample-kit", 32, (
            P(1, "Active Output Pairs", "Pairs", 1, 16, 1, "int"),
            P(2, "Master Gain", "Gain", -60, 12, -6),
            P(5, "Global Tune", "Tune", -24, 24, 0),
        ), play_message="midievent 144 36 100",
    ))
    for channels, plugin_id in (
        (2, "org.s3g.s3g-dsp.breakbeat-slicer-stereo"),
        (16, "org.s3g.s3g-dsp.breakbeat-slicer"),
    ):
        name = f"s3g Sample Slicer {channels}"
        base.write_device(name, make_instrument(
            name, plugin_id, channels, (
                P(1, "Output Gain", "Output", -60, 12, -6),
                P(2, "Velocity Sensitivity", "Velocity", 0, 1, 1),
            ), play_message="midievent 144 48 100",
        ))
    rings_name = "s3g Sample Rings 8"
    base.write_device(rings_name, make_instrument(
        rings_name, "org.s3g.s3g-dsp.sample-rings-8", 8, (
            P(1, "Playback Rate", "Rate", .125, 4, 1),
            P(8, "Ring Blend", "Blend", 0, 1, 1),
            P(13, "Output Gain", "Output", -60, 12, -9),
        ), inputs=8, play_message="paramid 16 1",
        kill_message="paramid 16 0",
    ))


if __name__ == "__main__":
    main()
