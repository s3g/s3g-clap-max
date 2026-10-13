#!/usr/bin/env python3
"""Generate fixed Array Calibrate and multichannel Processor Live devices."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_m4l_calibration_processors_base",
    ROOT / "scripts/generate-m4l-next-batch.py",
)
assert spec is not None and spec.loader is not None
next_batch = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = next_batch
spec.loader.exec_module(next_batch)
base = next_batch.base
effects = next_batch.effects
P = base.FixedParameter


def keep_title_visible(document: dict[str, object]) -> None:
    """Leave enough Live device-header width for these longer plugin names."""
    patch = document["patcher"]
    width = base.fit_presentation_width(patch["boxes"], 300.0)
    patch["devicewidth"] = width
    patch["openrect"][2] = width


def add_no_input_safety_face(document: dict[str, object]) -> None:
    """Keep the audition gain and ceiling reachable beside a real PANIC."""
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    controls = (
        ("obj-param-1", "OUT", 12.0, 65.0),
        ("obj-param-2", "CEIL", 140.0, 196.0),
    )
    for object_id, label, label_x, control_x in controls:
        control = boxes[object_id]
        control.update(
            presentation=1,
            presentation_rect=[control_x, 45.0, 67.0, base.CONTROL_HEIGHT],
            fontname=base.UI_FONT,
            fontsize=base.UI_FONT_SIZE,
            bgcolor=base.COLOR_CELL,
            activebgcolor=base.COLOR_CELL,
            textcolor=base.COLOR_TEXT,
            activetextcolor=base.COLOR_TEXT,
            triangle=1,
            tricolor=base.COLOR_ACCENT,
        )
        patch["boxes"].append(base.box(
            f"{object_id}-label", "comment", [2050.0, 90.0 if label == "OUT" else 140.0,
                                                 48.0, base.CONTROL_HEIGHT],
            text=label,
            presentation_rect=[label_x, 45.0, 48.0, base.CONTROL_HEIGHT],
            fontname=base.UI_FONT,
            fontsize=base.UI_FONT_SIZE,
            textcolor=base.COLOR_DIM,
            ignoreclick=1,
        ))
    panic = boxes["obj-kill-button"]
    panic["activebgcolor"] = [0.35, 0.15, 0.14, 1.0]
    panic["activebgoncolor"] = [0.52, 0.20, 0.18, 1.0]
    panic["activetextcolor"] = [0.86, 0.79, 0.78, 1.0]


def main() -> None:
    for channels in (16, 26, 32):
        name = f"s3g Array Calibrate {channels}"
        document = effects.make_effect(
            name.removeprefix("s3g "), name,
            f"org.s3g.s3g-dsp.array-calibrate-{channels}", channels,
            (
                P(1, "Active Channels", "Channels", 1, channels, channels, "int"),
                P(2, "Output", "Output", -60, 18, 0),
                P(3, "Bypass", "Bypass", 0, 1, 0, "enum", ("Off", "On")),
                P(10, "Cutoff", "Cutoff", 20, 240, 90),
            ),
            input_channels=channels, device_name=name,
        )
        document["patcher"]["tags"] = "s3g CLAP fixed speaker-array calibration"
        keep_title_visible(document)
        base.write_device(name, document, arrange=False)

    fault_name = "s3g Processor Fault 8"
    fault = next_batch.make_instrument(
        fault_name, "org.s3g.s3g-dsp.fault", 8,
        (
            P(56, "Performance Mode", "Mode", 0, 1, 0, "enum",
              ("Free", "MIDI")),
            P(1, "Scan Rate", "Scan", 0, 1, .44),
            P(8, "Fold", "Fold", 0, 1, .68),
            P(17, "Output Gain", "Output", -60, 6, -12),
        ),
        play_message="midievent 144 60 100",
        kill_message="midievent 128 60 0",
        play_label="NOTE", kill_label="OFF",
    )
    fault["patcher"]["tags"] = "s3g CLAP fixed MIDI multichannel instrument"
    keep_title_visible(fault)
    for entry in fault["patcher"]["boxes"]:
        item = entry["box"]
        if item["id"] == "obj-play-button":
            item["annotation"] = "Audition C4 when Performance Mode is MIDI."
        elif item["id"] == "obj-kill-button":
            item["annotation"] = "Release the wrapper's C4 audition note."
    base.write_device(fault_name, fault, arrange=False)

    grain_name = "s3g Processor Ambi Grain 16"
    grain = next_batch.make_instrument(
        grain_name, "org.s3g.s3g-dsp.ambi-grain-processor", 16,
        (
            P(1, "Order", "Order", 1, 3, 3, "int"),
            P(2, "Mode", "Mode", 0, 3, 0, "enum",
              ("Scan", "Cloud", "Freeze", "Jump")),
            P(3, "Density", "Density", .1, 160, 28),
            P(4, "Grain Size", "Grain", 8, 4000, 90),
            P(12, "Output Gain", "Output", -60, 6, -12),
        ),
        midi_input=False, action_buttons=False,
    )
    grain["patcher"]["tags"] = "s3g CLAP fixed ambisonic file instrument"
    grain["patcher"]["description"] += (
        " Load a file and use its transport in the CLAP editor. "
        "In Ableton Live, use LINK or EMBED for sample storage; PROJECT "
        "does not collect media into the Live Set."
    )
    grain["patcher"]["digest"] = grain["patcher"]["description"]
    keep_title_visible(grain)
    base.write_device(grain_name, grain, arrange=False)

    mixer_name = "s3g Processor No Input Mixer 8"
    mixer = next_batch.make_instrument(
        mixer_name, "org.s3g.s3g-dsp.no-input-mixer-8ch", 8,
        (
            P(1, "Out", "Output", -60, 6, -18),
            P(2, "Ceiling", "Ceiling", -18, 0, -1),
            P(3, "Limiter", "Limiter", 0, 1, 1, "enum", ("Off", "On")),
            P(4, "DC Block", "DC Block", 0, 1, 1, "enum", ("Off", "On")),
            P(5, "Feedback", "Feedback", 0, 1.25, .82),
            P(6, "Coupling", "Coupling", 0, 1.25, .42),
        ),
        play_message="midievent 159 120 127",
        kill_message="midievent 159 123 127",
        play_label="NEW", kill_label="PANIC",
    )
    mixer["patcher"]["tags"] = "s3g CLAP fixed feedback instrument"
    mixer["patcher"]["description"] += (
        " NEW reseeds the current patch; PANIC invokes the plug-in's own "
        "channel-16 safety command. Start with monitor level low and leave "
        "the limiter enabled. The plug-in's MIDI controller feedback is not "
        "forwarded to Live's MIDI output by this wrapper."
    )
    mixer["patcher"]["digest"] = mixer["patcher"]["description"]
    for entry in mixer["patcher"]["boxes"]:
        item = entry["box"]
        if item["id"] == "obj-play-button":
            item["annotation"] = "Reseed the current No Input Mixer patch."
        elif item["id"] == "obj-kill-button":
            item["annotation"] = "Immediately invoke No Input Mixer's PANIC command."
    add_no_input_safety_face(mixer)
    keep_title_visible(mixer)
    base.write_device(mixer_name, mixer, arrange=False)


if __name__ == "__main__":
    main()
