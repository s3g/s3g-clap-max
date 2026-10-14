#!/usr/bin/env python3
"""Generate the 32-slot capture samplers and MIDI-only utility wrappers."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]


def load(name: str, filename: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / "scripts" / filename)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


effects = load("s3g_final_effects", "generate-m4l-extra-effects.py")
tracker = load("s3g_final_tracker", "generate-m4l-tracker.py")
base = effects.base
P = base.FixedParameter


SAMPLES = (
    ("s3g Sample Neon 32", "org.s3g.s3g-dsp.sample-neon",
     (P(2, "Master Gain", "Gain", -60, 12, -6),
      P(3, "Mangle", "Mangle", 0, 1, 0),
      P(5, "Neon Active Owner", "Owner", 0, 1, 0, "enum", ("Off", "On"))),
     36),
    ("s3g Sample Decks 32", "org.s3g.s3g-dsp.sample-decks",
     (P(1, "Output", "Output", -60, 12, -6),
      P(2, "Crossfade", "Xfade", 0, 1, .5),
      P(4, "Format", "Format", 0, 5, 0, "enum",
        ("Stereo", "Quad", "Octo", "1OA", "2OA", "3OA"))),
     96),
)

MIDI_ONLY = (
    ("s3g Relay", "org.s3g.s3g-dsp.relay",
     (P(1, "Enabled", "Enabled", 0, 1, 1, "enum", ("Off", "On")),
      P(2, "Energy", "Energy", 0, 1, .58),
      P(3, "Coupling", "Coupling", 0, 1, .48))),
    ("s3g Utility NIM Gesture", "org.s3g.s3g-dsp.nim-gesture",
     (P(1, "Record", "Record", 0, 1, 0, "enum", ("Off", "On")),
      P(2, "Playback", "Play", 0, 1, 0, "enum", ("Off", "On")),
      P(5, "Live Takeover", "Takeover", 0, 5000, 650))),
    ("s3g Utility Neon MIDI", "org.s3g.s3g-dsp.utility-neon-midi",
     (P(1, "Bank", "Bank", 0, 3, 0, "int"),
      P(3, "Output Channel", "Channel", 1, 16, 1, "int"),
      P(4, "Control Route", "Route", 0, 1, 1, "enum",
        ("Notes Only", "Tracker + Sample Neon")))),
)


def sample_device(name: str, plugin_id: str,
                  parameters: tuple[P, ...], note: int) -> dict[str, object]:
    document = effects.make_effect(
        name.removeprefix("s3g "), name, plugin_id, 32, parameters,
        input_channels=32, device_name=name, midi_input=True,
        audition_label="PLAY",
    )
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    boxes["obj-audition-message"]["text"] = f"midievent 144 {note} 100"
    boxes["obj-audition-button"]["annotation"] = (
        "Start or toggle Deck A in the default Beatpad 2 MIDI mode."
        if "Decks" in name else
        f"Audition MIDI note {note}; use KILL to stop sounding voices."
    )
    if "Decks" in name:
        boxes["obj-audition-button"]["text"] = "A PLAY"
        boxes["obj-audition-button"]["texton"] = "A PLAY"
    patch["boxes"].extend((
        base.action_button("obj-kill-button", [950, 125, 70, 24],
                           [164, 10, 70, base.CONTROL_HEIGHT], "KILL",
                           annotation="Stop all sounding sample voices."),
        base.box("obj-kill-message", "message", [1040, 125, 90, 22],
                 text="killvoices"),
    ))
    patch["lines"].extend((
        base.line("obj-kill-button", 0, "obj-kill-message", 0),
        base.line("obj-kill-message", 0, "obj-clap", 0),
    ))
    if "Decks" in name:
        patch["boxes"].extend((
            base.action_button("obj-deck-b-button", [950, 190, 70, 24],
                               [244, 10, 70, base.CONTROL_HEIGHT], "B PLAY",
                               annotation="Start or toggle Deck B in Beatpad 2 MIDI mode."),
            base.box("obj-deck-b-message", "message", [1040, 190, 100, 22],
                     text="midievent 145 96 100"),
        ))
        patch["lines"].extend((
            base.line("obj-deck-b-button", 0, "obj-deck-b-message", 0),
            base.line("obj-deck-b-message", 0, "obj-clap", 0),
        ))
    patch["tags"] = "s3g CLAP fixed 32-channel capture sampler"
    patch["description"] = (
        f"{name}: Bus Receive 36 supplies 32 capture channels. The CLAP's "
        "32 outputs occupy chain slots 1-32; follow with Bus Send 36 at "
        "INPUT=CHAIN 36, CH=32, or Main Hardware Out 32. Live stereo remains "
        "dry. The plugin's output format determines active slots. "
        "For media, use LINK or EMBED; PROJECT does not collect into a Live Set."
        + (" A/B PLAY use the default Beatpad 2 MIDI mode."
           if "Decks" in name else "")
    )
    patch["digest"] = patch["description"]
    patch["devicewidth"] = base.fit_presentation_width(patch["boxes"], 310)
    patch["openrect"][2] = patch["devicewidth"]
    boxes["obj-ui-background"]["presentation_rect"][2] = patch["devicewidth"]
    return document


def midi_device(name: str, plugin_id: str,
                parameters: tuple[P, ...]) -> dict[str, object]:
    document = tracker.tracker_device(name, plugin_id, parameters)
    patch = document["patcher"]
    patch["tags"] = "s3g CLAP fixed MIDI effect"
    patch["description"] = (
        f"{name} processes Live MIDI and optional MIDI IN bus messages. "
        "Its channel-preserving CLAP MIDI output goes directly to the next "
        "Live instrument and optionally to the selected MIDI OUT bus. "
        "Matching MIDI IN and OUT bus numbers suppress bus output to prevent "
        "feedback. The dummy audio outlet keeps the CLAP clock running but "
        "is silent."
    )
    patch["digest"] = patch["description"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    for index, parameter in enumerate(parameters):
        control = boxes[f"obj-param-{parameter.clap_id}"]
        control["presentation"] = 1
        control["presentation_rect"] = [12 + index * 98, 45, 90,
                                        base.CONTROL_HEIGHT]
        control["bgcolor"] = base.COLOR_CELL
        control["textcolor"] = base.COLOR_TEXT
    patch["devicewidth"] = base.fit_presentation_width(patch["boxes"], 380)
    patch["openrect"][2] = patch["devicewidth"]
    boxes["obj-ui-background"]["presentation_rect"][2] = patch["devicewidth"]
    return document


def main() -> None:
    for name, plugin_id, parameters, note in SAMPLES:
        base.write_device(name, sample_device(name, plugin_id, parameters, note),
                          arrange=False)
    for name, plugin_id, parameters in MIDI_ONLY:
        base.write_device(name, midi_device(name, plugin_id, parameters),
                          arrange=False)


if __name__ == "__main__":
    main()
