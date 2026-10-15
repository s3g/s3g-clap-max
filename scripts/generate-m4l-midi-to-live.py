#!/usr/bin/env python3
"""Generate the private s3g MIDI bus receiver for ordinary Live instruments."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_midi_to_live_base", ROOT / "scripts" / "generate-m4l-devices.py"
)
assert spec is not None and spec.loader is not None
base = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = base
spec.loader.exec_module(base)

NAME = "s3g MIDI Bus to Live"
BUS_PREFIX = "s3g-tracker-midi"
WIDTH = 342.0
HEIGHT = base.COMPACT_DEVICE_HEIGHT


def device() -> dict[str, object]:
    boxes = [
        base.box(
            "obj-ui-background", "panel", [1560.0, 40.0, WIDTH, HEIGHT],
            presentation_rect=[0.0, 0.0, WIDTH, HEIGHT],
            numinlets=1, numoutlets=0, outlettype=[], background=1,
            ignoreclick=1, bgcolor=base.COLOR_BACKGROUND, border=0,
            rounded=0,
        ),
        base.box(
            "obj-bus-label", "comment", [400.0, 240.0, 58.0, 20.0],
            text="MIDI IN", presentation_rect=[12.0, 10.0, 58.0, 20.0],
            fontname=base.UI_FONT, fontsize=base.UI_FONT_SIZE,
            textcolor=base.COLOR_DIM,
            annotation="Receive Relay or Tracker on this private s3g MIDI bus.",
        ),
        *base.routing_menu_controls(
            "obj-bus-number", "s3g MIDI Input Bus", "MIDI In",
            0, 16, 0, 72.0, 58.0,
            labels=["OFF", *(f"{number:02d}" for number in range(1, 17))],
        ),
        base.box(
            "obj-channel-label", "comment", [1000.0, 240.0, 58.0, 20.0],
            text="MIDI CH", presentation_rect=[137.0, 10.0, 58.0, 20.0],
            fontname=base.UI_FONT, fontsize=base.UI_FONT_SIZE,
            textcolor=base.COLOR_DIM,
            annotation="Filter private-bus MIDI by channel; ALL keeps every channel.",
        ),
        *base.routing_menu_controls(
            "obj-channel-number", "s3g MIDI Channel Filter", "MIDI Ch",
            0, 16, 0, 198.0, 54.0,
            labels=["ALL", *(f"{number:02d}" for number in range(1, 17))],
        ),
        base.action_button(
            "obj-panic-button", [1110.0, 1120.0, 70.0, 24.0],
            [263.0, 10.0, 67.0, base.CONTROL_HEIGHT], "PANIC",
            annotation="Send note-offs for held notes from the s3g MIDI bus.",
        ),
        base.new_object("obj-midi-in", "midiin", 40, 100, 60, 0, 1),
        base.new_object("obj-midi-out", "midiout", 800, 1300, 70, 1, 0),
        base.new_object("obj-device", "s3g.live.thisdevice", 400, 100,
                        135, 1, 1),
        base.new_object("obj-bus-replay-delay", "delay 250", 400, 160,
                        75, 1, 1),
        base.box("obj-bus-replay", "message", [400, 210, 92, 22],
                 text="outputvalue"),
        base.new_object("obj-channel-replay-delay", "delay 250", 1000, 160,
                        75, 1, 1),
        base.box("obj-channel-replay", "message", [1000, 210, 92, 22],
                 text="outputvalue"),
        base.new_object("obj-bus-change", "change", 400, 400, 58, 1, 1),
        base.new_object("obj-bus-switch", "t i b", 400, 460, 52, 1, 2),
        base.new_object("obj-channel-change", "change", 1000, 400, 58, 1, 1),
        base.new_object("obj-channel-switch", "t i b", 1000, 460, 52, 1, 2),
        base.new_object("obj-bus-symbol", f"sprintf {BUS_PREFIX}-%ld",
                        400, 520, 220, 1, 1),
        base.new_object("obj-bus-set", "prepend set", 400, 580,
                        95, 1, 1),
        base.new_object("obj-bus-receive", "receive", 400, 640,
                        78, 1, 1),
        base.new_object("obj-bus-route", "route midieventat killvoices",
                        400, 700, 210, 1, 3),
        base.new_object("obj-panic-bang", "t b", 650, 760, 40, 1, 1),
        # A bus event is port, sample offset, status, data1, data2. Live's
        # midiout accepts raw bytes, so discard the first two atoms.
        base.new_object("obj-event-slice", "zl slice 2", 800, 760,
                        80, 2, 2),
        base.new_object("obj-event-order", "t l l", 800, 820, 48, 1, 2),
        base.new_object("obj-status-unpack", "unpack i i i", 1000, 880,
                        90, 1, 3),
        # MIDI channel voice messages 0xC0/0xD0 are two bytes; the others
        # are three. Zero closes the gate for non-channel or filtered events.
        base.new_object(
            "obj-status-length",
            "expr (((($i1 >= 128) && ($i1 <= 239)) + "
            "(($i1 >= 192) && ($i1 <= 223))) * "
            "(($i2 == 0) || ((($i1 % 16) + 1) == $i2)))",
            1000, 940, 610, 2, 1,
        ),
        base.new_object("obj-status-gate", "gate 2", 800, 1000,
                        62, 2, 2),
        base.new_object("obj-two-byte-slice", "zl slice 2", 1000, 1060,
                        80, 2, 2),
        base.new_object("obj-midi-bytes", "iter", 800, 1120,
                        45, 1, 1),
        base.new_object("obj-midi-flush", "midiflush", 800, 1180,
                        78, 1, 1),
    ]
    positions = {
        "obj-bus-number": (400.0, 280.0),
        "obj-bus-number-menu": (500.0, 280.0),
        "obj-bus-number-menu-to-value": (620.0, 340.0),
        "obj-bus-number-value-to-menu": (720.0, 340.0),
        "obj-bus-number-menu-set": (820.0, 340.0),
        "obj-channel-number": (1000.0, 280.0),
        "obj-channel-number-menu": (1100.0, 280.0),
        "obj-channel-number-menu-to-value": (1220.0, 340.0),
        "obj-channel-number-value-to-menu": (1320.0, 340.0),
        "obj-channel-number-menu-set": (1420.0, 340.0),
    }
    for entry in boxes:
        value = entry["box"]
        if value["id"] in positions:
            value["patching_rect"][:2] = positions[value["id"]]

    lines = [
        # Existing Live MIDI clips and keyboard input continue downstream.
        base.line("obj-midi-in", 0, "obj-midi-out", 0),
        base.line("obj-device", 0, "obj-bus-replay-delay", 0),
        base.line("obj-device", 0, "obj-channel-replay-delay", 0),
        base.line("obj-bus-replay-delay", 0, "obj-bus-replay", 0),
        base.line("obj-bus-replay", 0, "obj-bus-number", 0),
        base.line("obj-channel-replay-delay", 0, "obj-channel-replay", 0),
        base.line("obj-channel-replay", 0, "obj-channel-number", 0),
        *base.routing_menu_lines("obj-bus-number"),
        *base.routing_menu_lines("obj-channel-number"),
        base.line("obj-bus-number", 0, "obj-bus-change", 0),
        base.line("obj-channel-number", 0, "obj-channel-change", 0),
        base.line("obj-bus-change", 0, "obj-bus-switch", 0),
        base.line("obj-channel-change", 0, "obj-channel-switch", 0),
        # trigger fires right-to-left: flush old notes before changing bus.
        base.line("obj-bus-switch", 1, "obj-midi-flush", 0),
        base.line("obj-channel-switch", 1, "obj-midi-flush", 0),
        base.line("obj-channel-switch", 0, "obj-status-length", 1),
        base.line("obj-bus-switch", 0, "obj-bus-symbol", 0),
        base.line("obj-bus-symbol", 0, "obj-bus-set", 0),
        base.line("obj-bus-set", 0, "obj-bus-receive", 0),
        base.line("obj-bus-receive", 0, "obj-bus-route", 0),
        base.line("obj-bus-route", 1, "obj-panic-bang", 0),
        base.line("obj-panic-bang", 0, "obj-midi-flush", 0),
        base.line("obj-panic-button", 0, "obj-midi-flush", 0),
        base.line("obj-bus-route", 0, "obj-event-slice", 0),
        base.line("obj-event-slice", 1, "obj-event-order", 0),
        # The right branch sets the gate before the left branch sends data.
        base.line("obj-event-order", 1, "obj-status-unpack", 0),
        base.line("obj-status-unpack", 0, "obj-status-length", 0),
        base.line("obj-status-length", 0, "obj-status-gate", 0),
        base.line("obj-event-order", 0, "obj-status-gate", 1),
        base.line("obj-status-gate", 0, "obj-midi-bytes", 0),
        base.line("obj-status-gate", 1, "obj-two-byte-slice", 0),
        base.line("obj-two-byte-slice", 0, "obj-midi-bytes", 0),
        base.line("obj-midi-bytes", 0, "obj-midi-flush", 0),
        base.line("obj-midi-flush", 0, "obj-midi-out", 0),
    ]
    description = (
        "Receive a private s3g MIDI bus from Relay, Tracker, or a MIDI utility "
        "and send its channel voice messages to the following Live instrument. "
        "MIDI CH filters only the private bus; ordinary Live MIDI passes through. "
        "PANIC releases held bus notes."
    )
    document = base.patcher(
        NAME, description, boxes, lines, False, HEIGHT,
        midi_effect=True, minimum_width=WIDTH,
    )
    patch = document["patcher"]
    patch["rect"] = [120.0, 90.0, 1920.0, 1450.0]
    patch["tags"] = "s3g MIDI bus receiver Live MIDI effect"
    patch["parameters"] = {
        "obj-bus-number": ["s3g MIDI Input Bus", "MIDI In", 0],
        "obj-channel-number": ["s3g MIDI Channel Filter", "MIDI Ch", 0],
        "parameterbanks": {},
        "inherited_shortname": 1,
    }
    patch["dependency_cache"] = [
        {"name": "s3g.live.thisdevice.maxpat", "type": "JSON"},
    ]
    assert patch["project"]["amxdtype"] == 1835887981
    return document


if __name__ == "__main__":
    base.write_device(NAME, device(), arrange=False)
