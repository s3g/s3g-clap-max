#!/usr/bin/env python3
"""Validate fixed multichannel Live devices without opening Live."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
SPECS = {
    **{
        f"s3g Array Calibrate {channels}": (
            f"org.s3g.s3g-dsp.array-calibrate-{channels}",
            channels, channels, {1, 2, 3, 10}, False,
        )
        for channels in (16, 26, 32)
    },
    "s3g Processor Fault 8": (
        "org.s3g.s3g-dsp.fault", 0, 8, {56, 1, 8, 17}, True,
    ),
    "s3g Processor Ambi Grain 16": (
        "org.s3g.s3g-dsp.ambi-grain-processor", 0, 16,
        {1, 2, 3, 4, 12}, False,
    ),
    "s3g Processor No Input Mixer 8": (
        "org.s3g.s3g-dsp.no-input-mixer-8ch", 0, 8,
        {1, 2, 3, 4, 5, 6}, True,
    ),
}


def validate(name: str, plugin_id: str, inputs: int, outputs: int,
             parameter_ids: set[int], midi_input: bool) -> None:
    source = ROOT / "source/m4l" / f"{name}.maxpat"
    device = ROOT / "package/devices" / f"{name}.amxd"
    raw = source.read_bytes()
    data = device.read_bytes()
    assert data[:4] == b"ampf" and data[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", data, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    assert patch["devicewidth"] >= 300, name
    assert patch["openrect"][2] == patch["devicewidth"], name
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    assert len(boxes) == len(patch["boxes"]), name
    lines = {
        (*entry["patchline"]["source"],
         *entry["patchline"]["destination"])
        for entry in patch["lines"]
    }

    assert boxes["obj-clap"]["text"] == f"s3g.clap~ {inputs} {outputs}", name
    assert boxes["obj-default-open"]["text"] == (
        f'openifempty "{name}" {plugin_id}'), name
    assert boxes["obj-clap-state"]["saved_object_attributes"][
        "parameter_enable"] == 1, name
    assert ("obj-device", 0, "obj-state-restore-init", 0) in lines, name
    assert ("obj-clap", outputs, "obj-route-status", 0) in lines, name
    assert boxes["obj-plugout"]["numinlets"] == 38, name
    assert boxes["obj-bus-insert"]["text"] == "s3g.bus.insert", name
    assert boxes["obj-next-send"]["text"] == (
        "s3g.bus.send s3g-chain-next"), name
    assert "obj-bus-receive" not in boxes, name
    assert ("obj-next-delay", 0, "obj-next-store", 0) in lines, name
    for channel in range(outputs):
        assert ("obj-clap", channel, "obj-plugout", channel + 2) in lines, name
    if inputs:
        assert boxes["obj-plugin"]["numoutlets"] == 38, name
        for channel in range(inputs):
            assert ("obj-plugin", channel + 2, "obj-clap", channel) in lines, name
        for channel in range(2):
            assert ("obj-plugin", channel, "obj-plugout", channel) in lines, name
    else:
        assert "obj-plugin" not in boxes, name

    actual_ids = {
        int(object_id.removeprefix("obj-param-"))
        for object_id in patch["parameters"]
        if object_id.startswith("obj-param-")
        and object_id.removeprefix("obj-param-").isdigit()
    }
    assert actual_ids == parameter_ids, name
    for parameter_id in parameter_ids:
        control = f"obj-param-{parameter_id}"
        assert boxes[control]["parameter_enable"] == 1, name
        assert boxes[f"obj-param-message-{parameter_id}"]["text"] == (
            f"automateparamid {parameter_id} $1"), name

    assert ("obj-midi-in" in boxes) == midi_input, name
    assert ("obj-midi-parse" in boxes) == midi_input, name
    if midi_input:
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, name
        if name == "s3g Processor No Input Mixer 8":
            assert boxes["obj-play-message"]["text"] == (
                "midievent 159 120 127"), name
            assert boxes["obj-kill-message"]["text"] == (
                "midievent 159 123 127"), name
            assert boxes["obj-play-button"]["text"] == "NEW", name
            assert boxes["obj-kill-button"]["text"] == "PANIC", name
            for parameter_id in (1, 2):
                assert boxes[f"obj-param-{parameter_id}"]["presentation"] == 1
                assert boxes[f"obj-param-{parameter_id}-label"]["presentation"] == 1
        else:
            assert boxes["obj-play-message"]["text"] == (
                "midievent 144 60 100"), name
            assert boxes["obj-kill-message"]["text"] == (
                "midievent 128 60 0"), name
    elif inputs == 0:
        assert "obj-play-button" not in boxes, name
        assert "obj-kill-button" not in boxes, name

    for source_id, outlet, destination_id, inlet in lines:
        assert source_id in boxes and destination_id in boxes, name
        assert 0 <= outlet < boxes[source_id]["numoutlets"], name
        assert 0 <= inlet < boxes[destination_id]["numinlets"], name
    entries = [item for item in boxes.values()
               if item["id"] != "obj-ui-background"]
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            assert not (min(x + width, sx + sw) > max(x, sx)
                        and min(y + height, sy + sh) > max(y, sy)), (
                name, first["id"], second["id"])


def main() -> None:
    for name, spec in SPECS.items():
        validate(name, *spec)
    print(f"validated {len(SPECS)} calibration/processor wrappers")


if __name__ == "__main__":
    main()
