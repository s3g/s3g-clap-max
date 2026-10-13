#!/usr/bin/env python3
"""Build the Tracker sequencer and opt-in, channel-preserving MIDI bus inputs.

This runs after the other M4L generators. Live routes ordinary inter-track MIDI
on channel 1, so Tracker messages travel between our devices as named Max
messages instead. The receiving CLAP's MIDI RECEIVE setting remains the
channel filter. Bus 0 is intentionally disconnected on every new device.
"""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_m4l_tracker_base", ROOT / "scripts" / "generate-m4l-devices.py"
)
assert spec is not None and spec.loader is not None
base = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = base
spec.loader.exec_module(base)

TRACKER_NAME = "s3g Tracker"
TRACKER_ID = "org.s3g.s3g-dsp.tracker"
BUS_PREFIX = "s3g-tracker-midi"
BUS_LABELS = ["OFF", *(f"{number:02d}" for number in range(1, 17))]


def bus_controls(prefix: str, x: float, label: str = "MIDI BUS") -> list[dict[str, object]]:
    controls = base.routing_menu_controls(
        f"{prefix}-number", "Tracker MIDI Bus", "TRK Bus",
        0, 16, 0, x + 58.0, 58.0, labels=BUS_LABELS,
    )
    controls.append(base.box(
        f"{prefix}-label", "comment", [x, 10.0, 58.0, 20.0],
        text=label, presentation_rect=[x, 10.0, 58.0, 20.0],
        fontname=base.UI_FONT, fontsize=base.UI_FONT_SIZE,
        textcolor=base.COLOR_DIM,
        annotation="Tracker MIDI bus; OFF disconnects this device.",
    ))
    return controls


def bus_replay(prefix: str, trigger: str = "obj-device") -> tuple[
        list[dict[str, object]], list[dict[str, object]]]:
    boxes = [
        base.new_object(f"{prefix}-replay-delay", "delay 250", 0, 0,
                        76, 1, 1),
        base.box(f"{prefix}-replay", "message", [0, 0, 92, 22],
                 text="outputvalue"),
    ]
    lines = [
        base.line(trigger, 0, f"{prefix}-replay-delay", 0),
        base.line(f"{prefix}-replay-delay", 0, f"{prefix}-replay", 0),
        base.line(f"{prefix}-replay", 0, f"{prefix}-number", 0),
    ]
    return boxes, lines


def tracker_device(name: str = TRACKER_NAME, plugin_id: str = TRACKER_ID,
                   parameters: tuple[base.FixedParameter, ...] = ()) -> dict[str, object]:
    """A Max Instrument so a zero-audio-output CLAP still gets DSP ticks."""
    boxes = base.common_ui(False, base.COMPACT_DEVICE_HEIGHT,
                           allow_plugin_picker=False)
    clap = base.clap_box("s3g.clap~ 0 1", 40, 270, 0, 1)
    clap["box"]["numinlets"] = 1  # message inlet despite zero signal input
    boxes.extend([
        clap,
        base.new_object("obj-plugout", "plugout~ 1 2", 40, 380,
                        110, 2, 2, ["signal", "signal"]),
        base.new_object("obj-device", "s3g.live.thisdevice", 700, 100,
                        125, 1, 1),
        *bus_controls("obj-tracker-bus", 84.0, "MIDI OUT"),
        base.new_object("obj-tracker-output-route", "route midioutat",
                        400, 270, 125, 1, 2),
        base.new_object("obj-tracker-prepend", "prepend midieventat",
                        400, 325, 145, 1, 1),
        base.new_object("obj-tracker-gate", "gate 1 0", 400, 380,
                        70, 2, 1),
        base.new_object("obj-tracker-forward", "forward", 400, 435,
                        65, 1, 0),
        base.new_object("obj-tracker-bus-change", "change", 680, 320,
                        56, 1, 1),
        base.new_object("obj-tracker-bus-switch", "t i b", 680, 370,
                        52, 1, 2),
        base.box("obj-tracker-old-bus-panic", "message",
                 [780, 370, 76, 22], text="killvoices"),
        base.new_object("obj-tracker-bus-order", "t i i", 700, 155,
                        45, 1, 2),
        base.new_object("obj-tracker-bus-pair", "pak i i", 700, 210,
                        60, 2, 1),
        base.new_object("obj-tracker-bus-unpack", "unpack i i", 700, 250,
                        75, 1, 2),
        base.new_object("obj-tracker-bus-safe",
                        "expr ($i1 > 0) && ($i1 != $i2)", 700, 290,
                        235, 2, 1),
        base.new_object("obj-tracker-bus-symbol",
                        f"sprintf {BUS_PREFIX}-%ld", 800, 210,
                        220, 1, 1),
        base.new_object("obj-tracker-bus-address", "prepend send",
                        800, 265, 96, 1, 1),
    ])
    runtime_boxes, runtime_lines = base.common_runtime(
        1, name, allow_plugin_picker=False,
        fixed_parameters=bool(parameters), default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = base.fixed_parameter_runtime(
        parameters, (),
    ) if parameters else ([], [])
    replay_boxes, replay_lines = bus_replay("obj-tracker-bus")
    midi_boxes, midi_lines = base.midi_input_bridge()
    boxes.extend((*runtime_boxes, *replay_boxes, *midi_boxes, *parameter_boxes))
    lines = [
        base.line("obj-clap", 0, "obj-plugout", 0),
        base.line("obj-clap", 0, "obj-plugout", 1),
        base.line("obj-clap", 1, "obj-tracker-output-route", 0),
        base.line("obj-tracker-output-route", 0, "obj-tracker-prepend", 0),
        base.line("obj-tracker-prepend", 0, "obj-tracker-gate", 1),
        base.line("obj-tracker-gate", 0, "obj-tracker-forward", 0),
        base.line("obj-tracker-bus-number", 0, "obj-tracker-bus-change", 0),
        base.line("obj-tracker-bus-change", 0, "obj-tracker-bus-switch", 0),
        # Reset voices on the *old* destination before forward is retargeted.
        base.line("obj-tracker-bus-switch", 1,
                  "obj-tracker-old-bus-panic", 0),
        base.line("obj-tracker-old-bus-panic", 0,
                  "obj-tracker-forward", 0),
        base.line("obj-tracker-bus-switch", 0,
                  "obj-tracker-bus-order", 0),
        # trigger fires right-to-left: address the bus before opening its gate
        base.line("obj-tracker-bus-order", 1, "obj-tracker-bus-symbol", 0),
        base.line("obj-tracker-bus-symbol", 0, "obj-tracker-bus-address", 0),
        base.line("obj-tracker-bus-address", 0, "obj-tracker-forward", 0),
        base.line("obj-tracker-bus-order", 0, "obj-tracker-bus-pair", 0),
        base.line("obj-tracker-bus-pair", 0, "obj-tracker-bus-unpack", 0),
        # unpack fires right-to-left, updating the input bus before output
        # number triggers expr. Identical IN/OUT numbers close the send gate.
        base.line("obj-tracker-bus-unpack", 1, "obj-tracker-bus-safe", 1),
        base.line("obj-tracker-bus-unpack", 0, "obj-tracker-bus-safe", 0),
        base.line("obj-tracker-bus-safe", 0, "obj-tracker-gate", 0),
        *base.routing_menu_lines("obj-tracker-bus-number"),
        *runtime_lines, *replay_lines, *midi_lines, *parameter_lines,
    ]
    document = base.patcher(
        name,
        "MIDI-only CLAP. Its channel-addressed output is sent to a "
        "selected private s3g MIDI bus; the audio outlet is silent but keeps "
        "the CLAP process clock active. The bus defaults to OFF.",
        boxes, lines, False, instrument=True,
        minimum_width=base.DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    document["patcher"]["tags"] = "s3g CLAP MIDI sequencer"
    document["patcher"]["parameters"]["obj-tracker-bus-number"] = [
        "Tracker MIDI Bus", "TRK Bus", 0,
    ]
    if parameters:
        base.register_fixed_parameters(document, parameters)
    arrange_tracker_debug(document)
    return document


def arrange_tracker_debug(document: dict[str, object]) -> None:
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    positions = {
        "obj-clap": (40, 260), "obj-plugout": (40, 370),
        "obj-midi-in": (40, 100), "obj-midi-parse": (40, 160),
        "obj-plugsync": (40, 630), "obj-timesig": (220, 630),
        "obj-transport-pack": (40, 700), "obj-transport": (40, 770),
        "obj-route-status": (40, 450), "obj-latency-message": (40, 510),
        "obj-thispatcher": (40, 560), "obj-print": (210, 510),
        "obj-tracker-output-route": (400, 260),
        "obj-tracker-prepend": (400, 320),
        "obj-tracker-gate": (400, 380),
        "obj-tracker-forward": (400, 440),
        "obj-tracker-bus-change": (680, 380),
        "obj-tracker-bus-switch": (680, 440),
        "obj-tracker-old-bus-panic": (780, 500),
        "obj-tracker-bus-order": (680, 560),
        "obj-tracker-bus-pair": (680, 620),
        "obj-tracker-bus-unpack": (680, 680),
        "obj-tracker-bus-safe": (680, 740),
        "obj-tracker-bus-symbol": (780, 620),
        "obj-tracker-bus-address": (780, 680),
        "obj-tracker-bus-number": (680, 260),
        "obj-tracker-bus-number-menu": (780, 260),
        "obj-tracker-bus-number-menu-to-value": (880, 320),
        "obj-tracker-bus-number-value-to-menu": (780, 320),
        "obj-tracker-bus-number-menu-set": (980, 320),
        "obj-tracker-bus-label": (680, 200),
        "obj-tracker-bus-replay-delay": (680, 800),
        "obj-tracker-bus-replay": (780, 800),
        "obj-gui-button": (680, 40),
        "obj-editor-trigger": (780, 40), "obj-editor": (880, 40),
        "obj-loadbang": (1120, 100),
        "obj-delayed-load": (1120, 160),
        "obj-default-open": (1120, 220),
        "obj-clap-state": (1120, 310),
        "obj-state-valid": (1120, 370),
        "obj-state-restore": (1120, 430),
        "obj-state-restore-init": (1120, 490),
        "obj-state-capture-enable": (1210, 550),
        "obj-state-capture-gate": (1320, 550),
        "obj-state-change-bang": (1120, 550),
        "obj-state-capture-delay": (1120, 610),
        "obj-state-get": (1120, 670),
        "obj-device": (1530, 100),
        "obj-ui-background": (1770, 40),
    }
    if "obj-param-gate" in boxes:
        positions.update({
            "obj-param-loaded-trigger": (1770, 160),
            "obj-param-enable": (1880, 160),
            "obj-param-resync-delay": (1770, 220),
            "obj-param-gate": (1770, 280),
            "obj-paramchanged-route": (1770, 340),
        })
        for row, object_id in enumerate(sorted(
                key for key in boxes if key.startswith("obj-param-")
                and key not in positions)):
            positions[object_id] = (1770 + 140 * (row % 3),
                                    420 + 60 * (row // 3))
    if set(boxes) != set(positions):
        raise ValueError(f"Tracker layout missed {sorted(set(boxes) - set(positions))}")
    for object_id, (x, y) in positions.items():
        boxes[object_id]["patching_rect"][:2] = [x, y]
    patch["rect"] = [120.0, 90.0, 2350.0, 1200.0]


def augment_receiver(name: str, document: dict[str, object]) -> None:
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    if "obj-midi-in" not in boxes:
        return
    if "obj-tracker-midi-bus-number" in boxes:
        return
    # A zero-signal-input s3g.clap~ still has its Max message inlet. Several
    # older generated boxes advertised zero inlets despite already receiving
    # midievent there; make that metadata truthful for this new connection.
    boxes["obj-clap"]["numinlets"] = max(1, boxes["obj-clap"]["numinlets"])
    top_right = max(
        entry["box"]["presentation_rect"][0]
        + entry["box"]["presentation_rect"][2]
        for entry in patch["boxes"]
        if entry["box"].get("presentation") == 1
        and entry["box"]["id"] != "obj-ui-background"
        and entry["box"]["presentation_rect"][1] < 31.0
    )
    label_x = top_right + 8.0
    prefix = "obj-tracker-midi-bus"
    additions = [
        *bus_controls(prefix, label_x, "MIDI IN"),
        base.new_object("obj-tracker-midi-receive",
                        "receive", 0, 0, 80, 1, 1),
        base.new_object("obj-tracker-midi-symbol",
                        f"sprintf {BUS_PREFIX}-%ld", 0, 0, 220, 1, 1),
        base.new_object("obj-tracker-midi-set", "prepend set", 0, 0,
                        90, 1, 1),
        base.new_object("obj-tracker-midi-change", "change", 0, 0,
                        60, 1, 1),
        base.new_object("obj-tracker-midi-switch", "t i b", 0, 0,
                        60, 1, 2),
        base.box("obj-tracker-midi-panic", "message", [0, 0, 80, 22],
                 text="killvoices"),
    ]
    replay_boxes, replay_lines = bus_replay(
        prefix, "obj-device" if "obj-device" in boxes else "obj-loadbang"
    )
    additions.extend(replay_boxes)
    # A separate patching lane leaves the existing top-down audio and CLAP
    # state graph untouched, with no visual object collisions.
    right = max(box["patching_rect"][0] + box["patching_rect"][2]
                for box in boxes.values())
    lane_x = (int((right + 99) // 50) + 1) * 50
    for row, entry in enumerate(additions):
        entry["box"]["patching_rect"][:2] = [lane_x, 80.0 + row * 58.0]
    patch["boxes"].extend(additions)
    patch["lines"].extend([
        *base.routing_menu_lines(f"{prefix}-number"),
        base.line(f"{prefix}-number", 0, "obj-tracker-midi-change", 0),
        base.line("obj-tracker-midi-change", 0,
                  "obj-tracker-midi-switch", 0),
        # Leaving a bus resets held voices before receive is renamed.
        base.line("obj-tracker-midi-switch", 1,
                  "obj-tracker-midi-panic", 0),
        base.line("obj-tracker-midi-panic", 0, "obj-clap", 0),
        base.line("obj-tracker-midi-switch", 0,
                  "obj-tracker-midi-symbol", 0),
        base.line("obj-tracker-midi-symbol", 0, "obj-tracker-midi-set", 0),
        base.line("obj-tracker-midi-set", 0, "obj-tracker-midi-receive", 0),
        base.line("obj-tracker-midi-receive", 0, "obj-clap", 0),
        *replay_lines,
    ])
    if "obj-tracker-bus-pair" in boxes:
        patch["lines"].append(base.line(
            f"{prefix}-number", 0, "obj-tracker-bus-pair", 1))
    patch["parameters"][f"{prefix}-number"] = [
        "Tracker MIDI Bus", "TRK Bus", 0,
    ]
    patch["devicewidth"] = base.fit_presentation_width(
        patch["boxes"], patch["devicewidth"])
    patch["openrect"][2] = patch["devicewidth"]
    boxes["obj-ui-background"]["presentation_rect"][2] = patch["devicewidth"]
    patch["rect"][2] = max(patch["rect"][2], lane_x + 340.0)
    patch["rect"][3] = max(patch["rect"][3], 850.0)
    patch["description"] += " Tracker MIDI bus is opt-in and preserves channels."
    patch["digest"] = patch["description"]


def main() -> None:
    tracker = tracker_device()
    augment_receiver(TRACKER_NAME, tracker)
    base.write_device(TRACKER_NAME, tracker, arrange=False)
    count = 0
    for path in sorted(base.SOURCE_DIR.glob("*.maxpat")):
        if path.stem == TRACKER_NAME:
            continue
        document = json.loads(path.read_text(encoding="utf-8"))
        if not any(entry["box"]["id"] == "obj-midi-in"
                   for entry in document["patcher"]["boxes"]):
            continue
        augment_receiver(path.stem, document)
        base.write_device(path.stem, document, arrange=False)
        count += 1
    print(f"Tracker MIDI bus enabled in {count} receiving wrappers")


if __name__ == "__main__":
    main()
