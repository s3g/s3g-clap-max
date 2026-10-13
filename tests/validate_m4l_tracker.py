#!/usr/bin/env python3
"""Check Tracker's channel-preserving bus and every opt-in MIDI receiver."""

from __future__ import annotations

import json
import os
from pathlib import Path
import struct


REPO = Path(__file__).resolve().parents[1]
ROOT = Path(os.environ.get("S3G_M4L_GENERATED_ROOT", REPO))
SOURCE = ROOT / "source" / "m4l"
DEVICES = ROOT / "package" / "devices"


def load(name: str) -> dict[str, object]:
    source = SOURCE / f"{name}.maxpat"
    device = DEVICES / f"{name}.amxd"
    raw = source.read_bytes()
    packed = device.read_bytes()
    assert packed[:4] == b"ampf" and packed[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", packed, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    background = next(entry["box"] for entry in patch["boxes"]
                      if entry["box"].get("id") == "obj-ui-background")
    assert background["presentation_rect"] == [
        0.0, 0.0, patch["devicewidth"], patch["openrect"][3],
    ], name
    assert background["bgcolor"] == patch["locked_bgcolor"], name
    return patch


def graph(patch: dict[str, object]) -> tuple[dict[str, object],
                                               set[tuple[str, int, str, int]]]:
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    lines = {(*entry["patchline"]["source"],
              *entry["patchline"]["destination"])
             for entry in patch["lines"]}
    assert len(boxes) == len(patch["boxes"])
    for source, outlet, destination, inlet in lines:
        # Older Drum/Sample generators retain an unused obj-device reference
        # without creating that object. This check scopes graph validity to
        # the Tracker additions; fixing legacy state startup is separate.
        if source not in boxes or destination not in boxes:
            assert not source.startswith("obj-tracker-")
            assert not destination.startswith("obj-tracker-")
            continue
        assert 0 <= outlet < boxes[source]["numoutlets"], source
        assert 0 <= inlet < boxes[destination]["numinlets"], destination
    return boxes, lines


def check_no_overlap(name: str, patch: dict[str, object]) -> None:
    entries = [entry["box"] for entry in patch["boxes"]
               if entry["box"]["id"] != "obj-ui-background"]
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            if name != "s3g Tracker" and not (
                first["id"].startswith("obj-tracker-midi-") or
                second["id"].startswith("obj-tracker-midi-")):
                continue
            sx, sy, sw, sh = second["patching_rect"]
            assert not (min(x + width, sx + sw) > max(x, sx)
                        and min(y + height, sy + sh) > max(y, sy)), (
                            name, first["id"], second["id"])


def check_tracker() -> None:
    patch = load("s3g Tracker")
    boxes, lines = graph(patch)
    assert boxes["obj-clap"]["text"] == "s3g.clap~ 0 1"
    assert boxes["obj-clap"]["numinlets"] == 1
    assert boxes["obj-default-open"]["text"] == (
        'openifempty "s3g Tracker" org.s3g.s3g-dsp.tracker')
    assert boxes["obj-tracker-output-route"]["text"] == "route midioutat"
    assert boxes["obj-tracker-prepend"]["text"] == "prepend midieventat"
    assert boxes["obj-tracker-forward"]["text"] == "forward"
    assert boxes["obj-tracker-bus-label"]["text"] == "MIDI OUT"
    assert patch["parameters"]["obj-tracker-bus-number"] == [
        "Tracker MIDI Bus", "TRK Bus", 0,
    ]
    assert boxes["obj-tracker-bus-number"]["parameter_enable"] == 1
    assert boxes["obj-tracker-bus-number"]["saved_attribute_attributes"][
        "valueof"]["parameter_initial"] == [0]
    assert ("obj-clap", 1, "obj-tracker-output-route", 0) in lines
    assert ("obj-tracker-output-route", 0, "obj-tracker-prepend", 0) in lines
    assert ("obj-tracker-prepend", 0, "obj-tracker-gate", 1) in lines
    assert ("obj-tracker-gate", 0, "obj-tracker-forward", 0) in lines
    assert ("obj-tracker-bus-address", 0, "obj-tracker-forward", 0) in lines
    assert boxes["obj-tracker-bus-safe"]["text"] == (
        "expr ($i1 > 0) && ($i1 != $i2)")
    assert ("obj-tracker-bus-safe", 0, "obj-tracker-gate", 0) in lines
    assert ("obj-tracker-midi-bus-number", 0,
            "obj-tracker-bus-pair", 1) in lines
    assert boxes["obj-tracker-bus-change"]["text"] == "change"
    assert boxes["obj-tracker-bus-switch"]["text"] == "t i b"
    assert boxes["obj-tracker-old-bus-panic"]["text"] == "killvoices"
    assert ("obj-tracker-bus-number", 0,
            "obj-tracker-bus-change", 0) in lines
    assert ("obj-tracker-bus-switch", 1,
            "obj-tracker-old-bus-panic", 0) in lines
    assert ("obj-tracker-old-bus-panic", 0,
            "obj-tracker-forward", 0) in lines
    assert ("obj-tracker-bus-switch", 0,
            "obj-tracker-bus-order", 0) in lines
    assert ("obj-midi-parse", 7, "obj-clap", 0) in lines
    assert ("obj-plugsync", 0, "obj-transport-pack", 0) in lines
    assert all(("obj-clap", 0, "obj-plugout", channel) in lines
               for channel in (0, 1))
    assert boxes["obj-tracker-midi-receive"]["text"] == "receive"
    assert boxes["obj-tracker-midi-bus-label"]["text"] == "MIDI IN"
    assert ("obj-tracker-midi-receive", 0, "obj-clap", 0) in lines
    check_no_overlap("s3g Tracker", patch)


def check_receivers() -> None:
    count = 0
    for source in sorted(SOURCE.glob("*.maxpat")):
        if source.stem == "s3g Tracker":
            continue
        patch = load(source.stem)
        try:
            boxes, lines = graph(patch)
        except AssertionError as error:
            raise AssertionError((source.stem, error)) from error
        if "obj-midi-in" not in boxes:
            assert "obj-tracker-midi-receive" not in boxes, source.stem
            continue
        count += 1
        assert boxes["obj-tracker-midi-receive"]["text"] == "receive", source.stem
        assert boxes["obj-tracker-midi-symbol"]["text"] == (
            "sprintf s3g-tracker-midi-%ld"), source.stem
        carrier = boxes["obj-tracker-midi-bus-number"]
        assert boxes["obj-tracker-midi-bus-label"]["text"] in (
            "MIDI BUS", "MIDI IN")
        assert patch["parameters"]["obj-tracker-midi-bus-number"] == [
            "Tracker MIDI Bus", "TRK Bus", 0,
        ]
        assert carrier["parameter_enable"] == 1, source.stem
        assert carrier["saved_attribute_attributes"]["valueof"][
            "parameter_initial"] == [0], source.stem
        assert "obj-tracker-midi-bus-number" in patch["parameters"]
        assert boxes["obj-tracker-midi-change"]["text"] == "change"
        assert boxes["obj-tracker-midi-switch"]["text"] == "t i b"
        assert boxes["obj-tracker-midi-panic"]["text"] == "killvoices"
        assert ("obj-tracker-midi-bus-number", 0,
                "obj-tracker-midi-change", 0) in lines, source.stem
        assert ("obj-tracker-midi-change", 0,
                "obj-tracker-midi-switch", 0) in lines, source.stem
        assert ("obj-tracker-midi-switch", 1,
                "obj-tracker-midi-panic", 0) in lines, source.stem
        assert ("obj-tracker-midi-panic", 0,
                "obj-clap", 0) in lines, source.stem
        assert ("obj-tracker-midi-switch", 0,
                "obj-tracker-midi-symbol", 0) in lines, source.stem
        assert ("obj-tracker-midi-symbol", 0,
                "obj-tracker-midi-set", 0) in lines, source.stem
        assert ("obj-tracker-midi-set", 0,
                "obj-tracker-midi-receive", 0) in lines, source.stem
        assert ("obj-tracker-midi-receive", 0,
                "obj-clap", 0) in lines, source.stem
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, source.stem
        assert ("obj-tracker-midi-bus-replay", 0,
                "obj-tracker-midi-bus-number", 0) in lines, source.stem
        assert patch["devicewidth"] >= (
            boxes["obj-tracker-midi-bus-number-menu"]["presentation_rect"][0]
            + boxes["obj-tracker-midi-bus-number-menu"]["presentation_rect"][2]
            + 12), source.stem
        check_no_overlap(source.stem, patch)
    assert count >= 44, count
    print(f"validated Tracker and {count} opt-in MIDI receiving wrappers")


if __name__ == "__main__":
    check_tracker()
    check_receivers()
