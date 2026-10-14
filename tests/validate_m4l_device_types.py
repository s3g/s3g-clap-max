#!/usr/bin/env python3
"""Check that Live's device class agrees with each generated patch."""

from __future__ import annotations

import json
import os
from pathlib import Path
import struct


REPO = Path(__file__).resolve().parents[1]
ROOT = Path(os.environ.get("S3G_M4L_GENERATED_ROOT", REPO))
SOURCE = ROOT / "source" / "m4l"
DEVICES = ROOT / "package" / "devices"
MIDI_EFFECTS = {
    "s3g Tracker",
    "s3g Relay",
    "s3g Utility NIM Gesture",
    "s3g Utility Neon MIDI",
    "s3g MIDI Bus to Live",
}
TYPES = {
    "audio": (1633771873, b"aaaa"),
    "instrument": (1768515945, b"iiii"),
    "midi": (1835887981, b"mmmm"),
}


def main() -> None:
    counts = {key: 0 for key in TYPES}
    source_paths = sorted(SOURCE.glob("*.maxpat"))
    assert len(source_paths) == 128, len(source_paths)
    for source in source_paths:
        name = source.stem
        raw = source.read_bytes()
        patch = json.loads(raw)["patcher"]
        boxes = {entry["box"]["id"]: entry["box"]
                 for entry in patch["boxes"]}
        if name in MIDI_EFFECTS:
            category = "midi"
        elif ("obj-clap" in boxes and
              boxes["obj-clap"].get("text", "").startswith("s3g.clap~ 0 ")):
            category = "instrument"
        else:
            category = "audio"
        expected_type, marker = TYPES[category]
        assert patch["project"]["amxdtype"] == expected_type, name
        amxd = (DEVICES / f"{name}.amxd").read_bytes()
        assert len(amxd) >= 33, name
        header = struct.unpack("<4sI4s4sII4sI", amxd[:32])
        assert header == (b"ampf", 4, marker, b"meta", 4, 1,
                          b"ptch", len(raw) + 1), name
        assert amxd[32:] == raw + b"\0", name
        if name in MIDI_EFFECTS:
            assert "obj-midi-out" in boxes or "obj-live-midi-out" in boxes, name
            assert "obj-midi-in" in boxes, name
        counts[category] += 1
    assert counts == {"audio": 75, "instrument": 48, "midi": 5}, counts
    print(f"validated Live device classes: {counts}")


if __name__ == "__main__":
    main()
