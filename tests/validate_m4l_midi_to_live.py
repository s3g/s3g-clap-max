#!/usr/bin/env python3
"""Validate the Live MIDI-effect bridge and its release payload."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
NAME = "s3g MIDI Bus to Live"


def main() -> None:
    source = (ROOT / "source" / "m4l" / f"{NAME}.maxpat").read_bytes()
    device = (ROOT / "package" / "devices" / f"{NAME}.amxd").read_bytes()
    assert device[:4] == b"ampf"
    assert device[8:12] == b"mmmm"  # Match Live's Max MIDI Effect template.
    assert struct.unpack_from("<I", device, 28)[0] == len(source) + 1
    assert device[32:] == source + b"\0"
    patch = json.loads(source)["patcher"]
    assert patch["project"]["amxdtype"] == 1835887981
    assert patch["parameters"]["obj-bus-number"] == [
        "s3g MIDI Input Bus", "MIDI In", 0,
    ]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    assert len(boxes) == len(patch["boxes"])
    links = {
        (*entry["patchline"]["source"], *entry["patchline"]["destination"])
        for entry in patch["lines"]
    }
    for start, outlet, end, inlet in links:
        assert start in boxes and end in boxes
        assert 0 <= outlet < boxes[start]["numoutlets"], start
        assert 0 <= inlet < boxes[end]["numinlets"], end

    expected = {
        "obj-midi-in": "midiin",
        "obj-midi-out": "midiout",
        "obj-bus-receive": "receive",
        "obj-bus-symbol": "sprintf s3g-tracker-midi-%ld",
        "obj-bus-route": "route midieventat killvoices",
        "obj-event-slice": "zl slice 2",
        "obj-event-order": "t l l",
        "obj-status-length": (
            "expr (($i1 >= 128) && ($i1 <= 239)) + "
            "(($i1 >= 192) && ($i1 <= 223))"
        ),
        "obj-status-gate": "gate 2",
        "obj-two-byte-slice": "zl slice 2",
        "obj-midi-bytes": "iter",
        "obj-midi-flush": "midiflush",
    }
    for key, text in expected.items():
        assert boxes[key]["text"] == text, key
    assert boxes["obj-bus-number"]["parameter_enable"] == 1
    assert boxes["obj-bus-number"]["saved_attribute_attributes"][
        "valueof"]["parameter_initial"] == [0]
    assert ("obj-midi-in", 0, "obj-midi-out", 0) in links
    assert boxes["obj-bus-replay-delay"]["text"] == "delay 250"
    assert ("obj-bus-replay", 0, "obj-bus-number", 0) in links
    assert ("obj-bus-number", 0, "obj-bus-change", 0) in links
    assert ("obj-bus-switch", 1, "obj-midi-flush", 0) in links
    assert ("obj-bus-set", 0, "obj-bus-receive", 0) in links
    assert ("obj-bus-route", 1, "obj-panic-bang", 0) in links
    assert ("obj-panic-bang", 0, "obj-midi-flush", 0) in links
    assert ("obj-panic-button", 0, "obj-midi-flush", 0) in links
    assert ("obj-event-slice", 1, "obj-event-order", 0) in links
    assert ("obj-event-order", 1, "obj-status-unpack", 0) in links
    assert ("obj-status-length", 0, "obj-status-gate", 0) in links
    assert ("obj-event-order", 0, "obj-status-gate", 1) in links
    assert ("obj-status-gate", 0, "obj-midi-bytes", 0) in links
    assert ("obj-status-gate", 1, "obj-two-byte-slice", 0) in links
    assert ("obj-two-byte-slice", 0, "obj-midi-bytes", 0) in links
    assert ("obj-midi-bytes", 0, "obj-midi-flush", 0) in links
    assert ("obj-midi-flush", 0, "obj-midi-out", 0) in links
    assert boxes["obj-ui-background"]["presentation_rect"] == [
        0.0, 0.0, patch["devicewidth"], patch["openrect"][3],
    ]
    visible = [box for box in boxes.values()
               if box.get("presentation") == 1
               and box["id"] != "obj-ui-background"]
    for box in visible:
        x, y, width, height = box["presentation_rect"]
        assert x >= 0 and y >= 0
        assert x + width <= patch["devicewidth"]
        assert y + height <= patch["openrect"][3]
    debug = [box for box in boxes.values() if box["id"] != "obj-ui-background"]
    for index, first in enumerate(debug):
        x, y, width, height = first["patching_rect"]
        for second in debug[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            assert not (min(x + width, sx + sw) > max(x, sx)
                        and min(y + height, sy + sh) > max(y, sy)), (
                            first["id"], second["id"])
    print("validated MIDI bus-to-Live Max MIDI Effect")


if __name__ == "__main__":
    main()
