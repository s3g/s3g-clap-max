#!/usr/bin/env python3
"""Check the final 32-slot samplers and MIDI-only Live wrappers."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
SAMPLES = {
    "s3g Sample Neon 32": ("org.s3g.s3g-dsp.sample-neon", {2, 3, 5}, 36),
    "s3g Sample Decks 32": ("org.s3g.s3g-dsp.sample-decks", {1, 2, 4}, 96),
}
MIDI_ONLY = {
    "s3g Relay": ("org.s3g.s3g-dsp.relay", {1, 2, 3}),
    "s3g Utility NIM Gesture": ("org.s3g.s3g-dsp.nim-gesture", {1, 2, 5}),
    "s3g Utility Neon MIDI": ("org.s3g.s3g-dsp.utility-neon-midi", {1, 3, 4}),
}


def load(name: str):
    source = (ROOT / "source/m4l" / f"{name}.maxpat").read_bytes()
    device = (ROOT / "package/devices" / f"{name}.amxd").read_bytes()
    assert device[:4] == b"ampf" and device[32:] == source + b"\0", name
    assert struct.unpack_from("<I", device, 28)[0] == len(source) + 1, name
    patch = json.loads(source)["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    lines = {(*entry["patchline"]["source"],
              *entry["patchline"]["destination"])
             for entry in patch["lines"]}
    assert len(boxes) == len(patch["boxes"]), name
    assert boxes["obj-ui-background"]["presentation_rect"] == [
        0.0, 0.0, patch["devicewidth"], patch["openrect"][3]], name
    for src, outlet, dst, inlet in lines:
        assert src in boxes and dst in boxes, (name, src, dst)
        assert 0 <= outlet < boxes[src]["numoutlets"], (name, src, outlet)
        assert 0 <= inlet < boxes[dst]["numinlets"], (name, dst, inlet)
    entries = [box for key, box in boxes.items() if key != "obj-ui-background"]
    for index, first in enumerate(entries):
        x, y, w, h = first["patching_rect"]
        for second in entries[index + 1:]:
            xx, yy, ww, hh = second["patching_rect"]
            assert not (min(x + w, xx + ww) > max(x, xx)
                        and min(y + h, yy + hh) > max(y, yy)), (
                            name, first["id"], second["id"])
    assert boxes["obj-clap-state"]["text"].startswith("pattr clap_state"), name
    return patch, boxes, lines


def check_samples() -> None:
    for name, (plugin_id, params, note) in SAMPLES.items():
        patch, boxes, lines = load(name)
        assert boxes["obj-clap"]["text"] == "s3g.clap~ 32 32", name
        assert boxes["obj-default-open"]["text"] == (
            f'openifempty "{name}" {plugin_id}'), name
        assert boxes["obj-audition-message"]["text"] == (
            f"midievent 144 {note} 100"), name
        assert boxes["obj-kill-message"]["text"] == "killvoices", name
        if "Decks" in name:
            assert boxes["obj-deck-b-message"]["text"] == (
                "midievent 145 96 100"), name
            assert ("obj-deck-b-message", 0, "obj-clap", 0) in lines, name
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, name
        assert ("obj-tracker-midi-receive", 0, "obj-clap", 0) in lines, name
        assert ("obj-kill-message", 0, "obj-clap", 0) in lines, name
        assert all(("obj-plugin", channel + 2, "obj-clap", channel) in lines
                   for channel in range(32)), name
        assert all(("obj-clap", channel, "obj-plugout", channel + 2) in lines
                   for channel in range(32)), name
        assert all(f"obj-param-{param}" in patch["parameters"]
                   for param in params), name


def check_midi() -> None:
    for name, (plugin_id, params) in MIDI_ONLY.items():
        patch, boxes, lines = load(name)
        assert boxes["obj-clap"]["text"] == "s3g.clap~ 0 1", name
        assert boxes["obj-default-open"]["text"] == (
            f'openifempty "{name}" {plugin_id}'), name
        assert boxes["obj-tracker-bus-label"]["text"] == "MIDI OUT", name
        assert boxes["obj-tracker-midi-bus-label"]["text"] == "MIDI IN", name
        assert boxes["obj-tracker-output-route"]["text"] == "route midioutat"
        assert boxes["obj-tracker-bus-safe"]["text"] == (
            "expr ($i1 > 0) && ($i1 != $i2)"), name
        assert ("obj-tracker-output-route", 0,
                "obj-tracker-prepend", 0) in lines, name
        assert ("obj-tracker-midi-receive", 0, "obj-clap", 0) in lines, name
        assert ("obj-tracker-midi-bus-number", 0,
                "obj-tracker-bus-pair", 1) in lines, name
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, name
        assert all(("obj-clap", 0, "obj-plugout", outlet) in lines
                   for outlet in (0, 1)), name
        for param in params:
            assert f"obj-param-{param}" in patch["parameters"], name
            assert (f"obj-param-message-{param}", 0,
                    "obj-param-gate", 1) in lines, name


def main() -> None:
    check_samples()
    check_midi()
    print("validated 2 capture samplers and 3 MIDI-only wrappers")


if __name__ == "__main__":
    main()
