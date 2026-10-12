#!/usr/bin/env python3
"""Generate fixed Effect wrappers whose ports fit Live's stereo/36ch lanes."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_m4l_generator", ROOT / "scripts/generate-m4l-devices.py"
)
assert spec is not None and spec.loader is not None
base = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = base
spec.loader.exec_module(base)


# CLAP identity, port topology, and stable parameter IDs/ranges are taken from
# the matching s3g-dsp descriptors. Other controls remain in the CLAP editor
# and are captured by the existing opaque state parameter.
EFFECTS = (
    (
        "Spectral Spray", "s3g Effect Spectral Spray 2",
        "org.s3g.s3g-dsp.spectral-spray", 2,
        (
            base.FixedParameter(1, "Spray Bins", "Bins", 0, 256, 18),
            base.FixedParameter(4, "Freeze", "Freeze", 0, 1, 0, "int"),
            base.FixedParameter(5, "Feedback", "Feedback", 0, .85, .18),
            base.FixedParameter(12, "Mix", "Mix", 0, 1, 1),
        ),
    ),
    (
        "Delay Field", "s3g Effect Delay Field 16",
        "org.s3g.s3g-dsp.delay-field", 16,
        (
            base.FixedParameter(1, "Model", "Model", 0, 3, 0, "int"),
            base.FixedParameter(3, "Out Rotate", "Rotate", -180, 180, 0),
            base.FixedParameter(101, "Density", "Density", .2, 24, 5),
            base.FixedParameter(112, "Shard Wet", "Wet", 0, 1, .9),
        ),
    ),
)

BUS_EFFECTS = (
    (
        "s3g Effect Spectral Spray 8", "s3g Effect Spectral Spray 8",
        "org.s3g.s3g-dsp.8ch-spectral-spray", 8,
        (
            base.FixedParameter(1, "Spray Bins", "Bins", 0, 256, 18),
            base.FixedParameter(4, "Freeze", "Freeze", 0, 1, 0, "int"),
            base.FixedParameter(5, "Feedback", "Feedback", 0, .85, .18),
            base.FixedParameter(12, "Mix", "Mix", 0, 1, 1),
        ),
    ),
    (
        "s3g Processor Buffer 8", "s3g Processor Buffer 8",
        "org.s3g.s3g-dsp.buffer-processor", 8,
        (
            base.FixedParameter(1, "Size", "Size", 8, 1200, 160),
            base.FixedParameter(2, "Rate", "Rate", -2, 2, 1),
            base.FixedParameter(4, "Repeat", "Repeat", 0, 1, .65),
            base.FixedParameter(12, "Mix", "Mix", 0, 1, .45),
        ),
    ),
    (
        "s3g Processor Delay 8", "s3g Processor Delay 8",
        "org.s3g.s3g-dsp.delay-processor-8ch", 8,
        (
            base.FixedParameter(1, "Delay Time", "Delay", 20, 1995, 280),
            base.FixedParameter(2, "Feedback", "Feedback", 0, .82, .35),
            base.FixedParameter(3, "Mix", "Mix", 0, 1, .45),
            base.FixedParameter(14, "Pitch", "Pitch", -24, 24, 0),
        ),
    ),
    (
        "s3g Processor Delay 24", "s3g Processor Delay 24",
        "org.s3g.s3g-dsp.delay-processor-24ch", 24,
        (
            base.FixedParameter(1, "Delay Time", "Delay", 20, 1995, 280),
            base.FixedParameter(2, "Feedback", "Feedback", 0, .82, .35),
            base.FixedParameter(3, "Mix", "Mix", 0, 1, .45),
            base.FixedParameter(14, "Pitch", "Pitch", -24, 24, 0),
        ),
    ),
    (
        "s3g Processor Wave Geometry 8", "s3g Processor Wave Geometry 8",
        "org.s3g.s3g-dsp.wave-geometry-processor", 8,
        (
            base.FixedParameter(1, "Fold", "Fold", 0, 1, .22),
            base.FixedParameter(2, "Drive", "Drive", 0, 1, .18),
            base.FixedParameter(10, "Mix", "Mix", 0, 1, 1),
            base.FixedParameter(11, "Output", "Output", -60, 12, -3),
        ),
    ),
    (
        "s3g Processor Spectral 8", "s3g Processor Spectral 8",
        "org.s3g.s3g-dsp.spectral-topology-processor", 8,
        (
            base.FixedParameter(1, "Spray Bins", "Bins", 0, 192, 18),
            base.FixedParameter(18, "Propagation Velocity", "Velocity", 0, 1, 1),
            base.FixedParameter(31, "Topology Amount", "Topology", 0, 1, .35),
            base.FixedParameter(10, "Mix", "Mix", 0, 1, 1),
        ),
    ),
    (
        "s3g Processor Spectral 24", "s3g Processor Spectral 24",
        "org.s3g.s3g-dsp.spectral-topology-processor-24ch", 24,
        (
            base.FixedParameter(1, "Spray Bins", "Bins", 0, 192, 18),
            base.FixedParameter(18, "Propagation Velocity", "Velocity", 0, 1, 1),
            base.FixedParameter(31, "Topology Amount", "Topology", 0, 1, .35),
            base.FixedParameter(10, "Mix", "Mix", 0, 1, 1),
        ),
    ),
    (
        "s3g Processor Feedback Shift 8", "s3g Processor Feedback Shift 8",
        "org.s3g.s3g-dsp.feedback-shift", 8,
        (
            base.FixedParameter(1, "Internal Noise", "Noise", 0, 1, .24),
            base.FixedParameter(3, "Morph", "Morph", 0, 1, 0),
            base.FixedParameter(20, "Splice Amount", "Splice", 0, 1, .64),
            base.FixedParameter(12, "Output Gain", "Output", -60, 6, -18),
        ),
    ),
    (
        "s3g Matrix Group 32", "s3g Matrix Group 32",
        "org.s3g.s3g-dsp.group-matrix-32", 32,
        (
            base.FixedParameter(1000, "Depth", "Depth", 0, 1, 0),
            base.FixedParameter(1001, "Spread", "Spread", 0, 1, 0),
            base.FixedParameter(1005, "Rate", "Rate", 0, 1, .15),
            base.FixedParameter(1009, "Output", "Output", -60, 12, 0),
        ),
    ),
)

# Fissure is a stereo-input, eight-output audio effect with internal excitation.
# Unlike the matching-width bus effects, it does not need Bus Receive 36 first.
STEREO_BUS_PROCESSORS = (
    (
        "s3g Processor Fissure 8", "s3g Processor Fissure 8",
        "org.s3g.s3g-dsp.processor-fissure", 8,
        (
            base.FixedParameter(1, "Pressure", "Pressure", 0, 1, .30),
            base.FixedParameter(46, "Rate", "Rate", 0, 1, .34),
            base.FixedParameter(21, "Output Mode", "Mode", 0, 2, 2,
                                "enum", ("Stereo", "Quad", "8 Direct")),
            base.FixedParameter(10, "Output Gain", "Output", -60, 6, -12),
        ),
    ),
)


def arrange_debug_view(document: dict[str, object],
                       parameters: tuple[base.FixedParameter, ...],
                       multichannel: bool) -> None:
    """Make the Max edit view readable as a left-to-right signal-flow map."""
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    placed: set[str] = set()

    def put(object_id: str, x: float, y: float) -> None:
        boxes[object_id]["patching_rect"][:2] = [x, y]
        placed.add(object_id)

    positions = {
        "obj-ui-background": (2100, 40),
        "obj-plugin": (40, 100), "obj-clap": (40, 270) if "obj-midi-in" in boxes else (40, 240),
        "obj-plugout": (40, 380),
        "obj-route-status": (40, 500),
        "obj-latency-message": (40, 560),
        "obj-thispatcher": (40, 620), "obj-print": (200, 560),
        "obj-plugsync": (40, 740), "obj-timesig": (200, 740),
        "obj-transport-pack": (40, 810), "obj-transport": (40, 880),
        "obj-gui-button": (700, 80),
        "obj-editor-trigger": (800, 80), "obj-editor": (900, 80),
        "obj-loadbang": (700, 180), "obj-delayed-load": (700, 240),
        "obj-default-open": (700, 300),
        "obj-clap-state": (700, 400), "obj-state-valid": (700, 460),
        "obj-state-restore": (700, 520),
        "obj-state-restore-init": (700, 600),
        "obj-state-change-bang": (800, 660),
        "obj-state-capture-enable": (900, 660),
        "obj-state-capture-gate": (1000, 660),
        "obj-state-capture-delay": (1000, 520),
        "obj-state-get": (1000, 580),
        "obj-param-loaded-trigger": (1150, 100),
        "obj-param-enable": (1250, 100),
        "obj-param-resync-delay": (1150, 160),
        "obj-param-gate": (1150, 220),
        "obj-paramchanged-route": (1150, 300),
        "obj-device": (1550, 100),
    }
    if multichannel:
        positions.update({
            "obj-start-route": (1550, 160),
            "obj-bus-insert": (1550, 220),
            "obj-next-order": (1550, 300),
            "obj-next-trigger": (1700, 360),
            "obj-next-delay": (1550, 360),
            "obj-next-store": (1550, 420),
            "obj-next-mode": (1800, 420),
            "obj-next-send": (1700, 480),
        })
    if "obj-midi-in" in boxes:
        positions.update({
            "obj-midi-in": (40, 155),
            "obj-midi-parse": (40, 205),
            "obj-audition-button": (700, 125),
            "obj-audition-message": (800, 125),
        })
    for object_id, (x, y) in positions.items():
        put(object_id, x, y)
    for row, parameter in enumerate(parameters):
        y = 430 + row * 90
        put(f"obj-param-{parameter.clap_id}", 1150, y)
        put(f"obj-param-message-{parameter.clap_id}", 1260, y)
        put(f"obj-param-reflect-{parameter.clap_id}", 1400, y)
    if set(boxes) != placed:
        raise ValueError(f"unplaced Max objects: {sorted(set(boxes) - placed)}")
    entries = list(boxes.values())
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            if min(x + width, sx + sw) > max(x, sx) and min(y + height, sy + sh) > max(y, sy):
                raise ValueError(f"overlapping Max objects: {first['id']}, {second['id']}")
    patch["rect"] = [120, 90, 2500, 1100]


def make_effect(
    kind: str, plugin_name: str, plugin_id: str, output_channels: int,
    parameters: tuple[base.FixedParameter, ...],
    *, input_channels: int = 2, device_name: str | None = None,
    midi_input: bool = False, audition_label: str = "STRIKE",
) -> dict[str, object]:
    """Keep Live's stereo lane separate from a plug-in's bus-width bed."""
    assert 2 <= input_channels <= 36 and 2 <= output_channels <= 36
    assert input_channels == 2 or output_channels > 2
    multichannel = output_channels > 2
    from_bus = input_channels > 2
    name = device_name or f"s3g Effect {kind}"
    boxes = base.common_ui(False, base.COMPACT_DEVICE_HEIGHT,
                           allow_plugin_picker=False)
    boxes.extend((
        base.new_object(
            "obj-plugin",
            "plugin~ " + " ".join(map(str, range(
                1, base.FIFTH_ORDER_LIVE_CHANNELS + 1 if from_bus else 3
            ))),
            40, 100, 620 if from_bus else 110,
            base.FIFTH_ORDER_LIVE_CHANNELS if from_bus else 2,
            base.FIFTH_ORDER_LIVE_CHANNELS if from_bus else 2,
            ["signal"] * (base.FIFTH_ORDER_LIVE_CHANNELS if from_bus else 2),
        ),
        base.clap_box(f"s3g.clap~ {input_channels} {output_channels}",
                      40, 240, input_channels, output_channels),
        base.new_object(
            "obj-plugout",
            "plugout~ " + " ".join(map(str, range(
                1, base.FIFTH_ORDER_LIVE_CHANNELS + 1
                if multichannel else 3
            ))),
            40, 380, 620 if multichannel else 110,
            base.FIFTH_ORDER_LIVE_CHANNELS if multichannel else 2,
            base.FIFTH_ORDER_LIVE_CHANNELS if multichannel else 2,
            ["signal"] * (base.FIFTH_ORDER_LIVE_CHANNELS if multichannel else 2),
        ),
        base.new_object("obj-device", "s3g.live.thisdevice", 1050, 100,
                        125, 1, 1),
    ))
    runtime_boxes, runtime_lines = base.common_runtime(
        output_channels, plugin_name, allow_plugin_picker=False,
        fixed_parameters=True, default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = base.fixed_parameter_runtime(
        parameters, (),
    )
    boxes.extend((*runtime_boxes, *parameter_boxes))
    if midi_input:
        midi_boxes, midi_lines = base.midi_input_bridge()
        boxes.extend((*midi_boxes, base.action_button(
            "obj-audition-button", [700.0, 125.0, 70.0, 24.0],
            [84.0, 10.0, 70.0, base.CONTROL_HEIGHT], audition_label,
            annotation="Audition the first node/cell with MIDI note 36.",
        ), base.box(
            "obj-audition-message", "message", [800.0, 125.0, 150.0, 22.0],
            text="midievent 144 36 100",
        )))
    lines = [base.line("obj-plugin", channel + (2 if from_bus else 0),
                       "obj-clap", channel)
             for channel in range(input_channels)]
    if multichannel:
        # Live channels 1/2 carry the unchanged source. The plug-in's outputs
        # occupy auxiliary slots 1-N (Live channels 3..N+2); unused slots stay
        # silent. A following Bus Send 36 can take CHAIN 36 with CH=N.
        lines.extend(base.line("obj-plugin", channel, "obj-plugout", channel)
                     for channel in range(2))
        lines.extend(base.line("obj-clap", channel, "obj-plugout", channel + 2)
                     for channel in range(output_channels))
        boxes.extend((
            base.new_object("obj-bus-insert", "s3g.bus.insert", 1050, 180,
                            100, 1, 0),
            base.new_object("obj-start-route", "t l l", 1050, 140,
                            45, 1, 2, ["list", "list"]),
            base.new_object("obj-next-order", "t b l l", 1050, 250,
                            60, 1, 3, ["bang", "list", "list"]),
            base.new_object("obj-next-delay", "delay 300", 1050, 310,
                            75, 1, 1, ["bang"]),
            base.new_object("obj-next-store", "zl.reg", 1050, 370,
                            55, 2, 2),
            base.new_object("obj-next-trigger", "t l b", 1170, 250,
                            50, 1, 2, ["list", "bang"]),
            base.box("obj-next-mode", "message", [1250, 310, 30, 22],
                     text="1"),
            base.new_object("obj-next-send", "s3g.bus.send s3g-chain-next",
                            1170, 370, 220, 3, 0),
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
    else:
        lines.extend(base.line("obj-clap", channel, "obj-plugout", channel)
                     for channel in range(2))
    lines.extend((*runtime_lines, *parameter_lines))
    if midi_input:
        lines.extend((*midi_lines, base.line(
            "obj-audition-button", 0, "obj-audition-message", 0,
        ), base.line("obj-audition-message", 0, "obj-clap", 0)))
    if from_bus:
        detail = (
            f"Takes {input_channels} channels from a preceding s3g Bus Receive 36. "
            f"Produces {output_channels} multichannel slots for a following "
            f"s3g Bus Send 36 (INPUT=CHAIN 36, CH={output_channels}); "
            "no embedded receive bus. Live stereo remains dry."
        )
    elif multichannel:
        detail = (
            f"Stereo input produces {output_channels} multichannel slots for a "
            f"following s3g Bus Send 36 (INPUT=CHAIN 36, CH={output_channels}); "
            "no embedded receive bus. Live stereo remains dry."
        )
    else:
        detail = "Stereo insert on Live's normal stereo track."
    description = f"Fixed {plugin_name} wrapper. " + detail
    if midi_input:
        description += " MIDI reaches the CLAP note port; the face auditions note 36."
    document = base.patcher(name, description, boxes, lines, False,
                            minimum_width=240)
    document["patcher"]["tags"] = "s3g CLAP fixed Effect"
    base.register_fixed_parameters(document, parameters)
    arrange_debug_view(document, parameters, multichannel)
    return document


def main() -> None:
    for spec in EFFECTS:
        name = f"s3g Effect {spec[0]}"
        base.write_device(name, make_effect(*spec))
    for name, plugin_name, plugin_id, channels, parameters in BUS_EFFECTS:
        base.write_device(name, make_effect(
            name.removeprefix("s3g "), plugin_name, plugin_id, channels,
            parameters, input_channels=channels, device_name=name,
            midi_input=name == "s3g Processor Feedback Shift 8",
            audition_label="EXCITE",
        ))
    for name, plugin_name, plugin_id, channels, parameters in STEREO_BUS_PROCESSORS:
        base.write_device(name, make_effect(
            name.removeprefix("s3g "), plugin_name, plugin_id, channels,
            parameters, device_name=name, midi_input=True,
        ))


if __name__ == "__main__":
    main()
