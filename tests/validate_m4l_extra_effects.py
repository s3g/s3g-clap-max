#!/usr/bin/env python3
"""Check fixed Effect wrappers against the declared CLAP/Live port contract."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
SPECS = {
    "s3g Effect Spectral Spray": (
        "s3g Effect Spectral Spray 2", "org.s3g.s3g-dsp.spectral-spray",
        2, 2, {1, 4, 5, 12}),
    "s3g Effect Delay Field": (
        "s3g Effect Delay Field 16", "org.s3g.s3g-dsp.delay-field",
        2, 16, {1, 3, 101, 112}),
    "s3g Effect Spectral Spray 8": (
        "s3g Effect Spectral Spray 8", "org.s3g.s3g-dsp.8ch-spectral-spray",
        8, 8, {1, 4, 5, 12}),
    "s3g Processor Buffer 8": (
        "s3g Processor Buffer 8", "org.s3g.s3g-dsp.buffer-processor",
        8, 8, {1, 2, 4, 12}),
    "s3g Processor Delay 8": (
        "s3g Processor Delay 8", "org.s3g.s3g-dsp.delay-processor-8ch",
        8, 8, {1, 2, 3, 14}),
    "s3g Processor Delay 24": (
        "s3g Processor Delay 24", "org.s3g.s3g-dsp.delay-processor-24ch",
        24, 24, {1, 2, 3, 14}),
    "s3g Processor Wave Geometry 8": (
        "s3g Processor Wave Geometry 8",
        "org.s3g.s3g-dsp.wave-geometry-processor",
        8, 8, {1, 2, 10, 11}),
    "s3g Processor Spectral 8": (
        "s3g Processor Spectral 8",
        "org.s3g.s3g-dsp.spectral-topology-processor",
        8, 8, {1, 18, 31, 10}),
    "s3g Processor Spectral 24": (
        "s3g Processor Spectral 24",
        "org.s3g.s3g-dsp.spectral-topology-processor-24ch",
        24, 24, {1, 18, 31, 10}),
    "s3g Processor Feedback Shift 8": (
        "s3g Processor Feedback Shift 8",
        "org.s3g.s3g-dsp.feedback-shift",
        8, 8, {1, 3, 20, 12}),
    "s3g Processor Fissure 8": (
        "s3g Processor Fissure 8",
        "org.s3g.s3g-dsp.processor-fissure",
        2, 8, {1, 46, 21, 10}),
    "s3g Matrix Group 32": (
        "s3g Matrix Group 32", "org.s3g.s3g-dsp.group-matrix-32",
        32, 32, {1000, 1001, 1005, 1009}),
}
RETIRED = (
    "s3g Effect Cascade Taps",
    "s3g Effect Orbit Delay",
    "s3g Effect Shard Scatter",
)
MIDI_EFFECTS = {
    "s3g Processor Feedback Shift 8",
    "s3g Processor Fissure 8",
}


def lines_of(patch: dict[str, object]) -> set[tuple[str, int, str, int]]:
    return {
        (*entry["patchline"]["source"], *entry["patchline"]["destination"])
        for entry in patch["lines"]
    }


def validate(name: str, plugin_name: str, plugin_id: str,
             inputs: int, outputs: int, parameter_ids: set[int]) -> None:
    source = ROOT / "source/m4l" / f"{name}.maxpat"
    device = ROOT / "package/devices" / f"{name}.amxd"
    raw = source.read_bytes()
    data = device.read_bytes()
    assert data[:4] == b"ampf" and data[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", data, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    assert len(boxes) == len(patch["boxes"]), name
    lines = lines_of(patch)
    assert boxes["obj-clap"]["text"] == f"s3g.clap~ {inputs} {outputs}", name
    assert boxes["obj-default-open"]["text"] == (
        f'openifempty "{plugin_name}" {plugin_id}'
    ), name
    assert ("obj-clap", outputs, "obj-route-status", 0) in lines, name
    assert ("obj-device", 0, "obj-state-restore-init", 0) in lines, name
    assert boxes["obj-clap-state"]["saved_object_attributes"][
        "parameter_enable"] == 1, name
    for source_id, source_outlet, destination_id, destination_inlet in lines:
        assert source_id in boxes and destination_id in boxes, name
        assert source_outlet < boxes[source_id]["numoutlets"], name
        assert destination_inlet < boxes[destination_id]["numinlets"], name
    assert boxes["obj-plugin"]["numoutlets"] == (38 if inputs > 2 else 2), name
    for channel in range(inputs):
        assert ("obj-plugin", channel + (2 if inputs > 2 else 0),
                "obj-clap", channel) in lines, name
    for parameter_id in parameter_ids:
        control = f"obj-param-{parameter_id}"
        assert boxes[control]["parameter_enable"] == 1, name
        assert control in patch["parameters"], name
        assert boxes[f"obj-param-message-{parameter_id}"]["text"] == (
            f"automateparamid {parameter_id} $1"
        ), name
    if name in MIDI_EFFECTS:
        assert boxes["obj-midi-in"]["text"] == "midiin", name
        assert boxes["obj-midi-parse"]["text"] == "midiparse", name
        assert ("obj-midi-in", 0, "obj-midi-parse", 0) in lines, name
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, name
        assert boxes["obj-audition-message"]["text"] == (
            "midievent 144 36 100"
        ), name
        assert ("obj-audition-button", 0, "obj-audition-message", 0) in lines
        assert ("obj-audition-message", 0, "obj-clap", 0) in lines
    else:
        assert "obj-midi-in" not in boxes, name
    assert not any(key.startswith("obj-param-topology") for key in boxes), name
    if outputs > 2:
        assert boxes["obj-plugout"]["numinlets"] == 38, name
        assert boxes["obj-bus-insert"]["text"] == "s3g.bus.insert", name
        assert boxes["obj-next-send"]["text"] == (
            "s3g.bus.send s3g-chain-next"
        ), name
        assert "obj-bus-receive" not in boxes, name
        assert ("obj-start-route", 1, "obj-bus-insert", 0) in lines, name
        assert ("obj-next-delay", 0, "obj-next-store", 0) in lines, name
        for channel in range(2):
            assert ("obj-plugin", channel, "obj-plugout", channel) in lines
        for channel in range(outputs):
            assert ("obj-clap", channel, "obj-plugout", channel + 2) in lines
        assert not any(destination_id == "obj-plugout" and inlet >= outputs + 2
                       for _, _, destination_id, inlet in lines), name
    else:
        assert boxes["obj-plugout"]["numinlets"] == 2, name
        assert "obj-next-send" not in boxes, name
        for channel in range(2):
            assert ("obj-clap", channel, "obj-plugout", channel) in lines
    entries = list(boxes.values())
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            assert not (min(x + width, sx + sw) > max(x, sx)
                        and min(y + height, sy + sh) > max(y, sy)), (
                name, first["id"], second["id"]
            )


def main() -> None:
    for name, values in SPECS.items():
        validate(name, *values)
    for name in RETIRED:
        assert not (ROOT / "source/m4l" / f"{name}.maxpat").exists(), name
        assert not (ROOT / "package/devices" / f"{name}.amxd").exists(), name
    print(f"validated {len(SPECS)} fixed Effect/Processor wrappers")


if __name__ == "__main__":
    main()
