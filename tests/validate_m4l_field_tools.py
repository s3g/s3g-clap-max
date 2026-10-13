#!/usr/bin/env python3
"""Validate the fixed Ambisonic field-tool M4L batch without opening Live."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
SPECS = {
    "s3g Ambi Transform Depth 16": (
        "s3g Ambi Transform Depth 16", "org.s3g.s3g-dsp.ambi-depth-16",
        16, {1, 3, 8, 7}, None),
    "s3g Ambi Transform Rot 64": (
        "s3g Ambi Transform Rot 64", "org.s3g.s3g-dsp.ambisonic-rotate-64",
        36, {1, 2, 3, 4}, 5),
    "s3g Ambi Transform Order Band 64": (
        "s3g Ambi Transform Order Band 64",
        "org.s3g.s3g-dsp.ambisonic-order-band-tool-64",
        36, {1, 2, 3, 4}, 5),
    "s3g Processor Ambi Imprint 64": (
        "s3g Processor Ambi Imprint 64", "org.s3g.s3g-dsp.ambi-imprint-64",
        36, {1, 2, 3, 5}, 5),
    "s3g Analyzer Meter 64": (
        "s3g Analyzer Meter 64", "org.s3g.s3g-dsp.multichannel-meter-64",
        36, {1, 2}, None),
    "s3g Analyzer Ambi Energy 64": (
        "s3g Analyzer Ambi Energy 64",
        "org.s3g.s3g-dsp.ambisonic-energy-visualizer-64",
        36, {2}, None),
}


def validate(name: str, bundle: str, plugin_id: str, channels: int,
             parameter_ids: set[int], initial_order: int | None) -> None:
    source = ROOT / "source/m4l" / f"{name}.maxpat"
    device = ROOT / "package/devices" / f"{name}.amxd"
    raw = source.read_bytes()
    data = device.read_bytes()
    assert data[:4] == b"ampf" and data[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", data, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    assert len(boxes) == len(patch["boxes"]), name
    lines = {
        (*entry["patchline"]["source"], *entry["patchline"]["destination"])
        for entry in patch["lines"]
    }
    assert boxes["obj-default-open"]["text"] == (
        f'openifempty "{bundle}" {plugin_id}'), name
    assert boxes["obj-clap"]["text"] == f"s3g.clap~ {channels} {channels}", name
    assert boxes["obj-plugin"]["numoutlets"] == 38, name
    assert boxes["obj-plugout"]["numinlets"] == 38, name
    assert boxes["obj-bus-insert"]["text"] == "s3g.bus.insert", name
    assert boxes["obj-next-send"]["text"] == (
        "s3g.bus.send s3g-chain-next"), name
    assert "obj-bus-receive" not in boxes, name
    assert boxes["obj-clap-state"]["saved_object_attributes"][
        "parameter_enable"] == 1, name
    assert ("obj-device", 0, "obj-state-restore-init", 0) in lines, name
    assert ("obj-next-delay", 0, "obj-next-store", 0) in lines, name
    for channel in range(channels):
        assert ("obj-plugin", channel + 2, "obj-clap", channel) in lines, name
        assert ("obj-clap", channel, "obj-plugout", channel + 2) in lines, name
    for channel in range(2):
        assert ("obj-plugin", channel, "obj-plugout", channel) in lines, name
    assert not any(destination == "obj-plugout" and inlet >= channels + 2
                   for _, _, destination, inlet in lines), name
    assert {int(key.removeprefix("obj-param-"))
            for key in patch["parameters"] if key.startswith("obj-param-")
            } == parameter_ids, name
    for parameter_id in parameter_ids:
        control = f"obj-param-{parameter_id}"
        assert boxes[control]["parameter_enable"] == 1, name
        assert boxes[f"obj-param-message-{parameter_id}"]["text"] == (
            f"automateparamid {parameter_id} $1"), name
    if initial_order is not None:
        assert boxes["obj-param-1"]["saved_attribute_attributes"]["valueof"][
            "parameter_initial"] == [initial_order], name
    for source_id, source_outlet, destination_id, destination_inlet in lines:
        assert source_id in boxes and destination_id in boxes, name
        assert source_outlet < boxes[source_id]["numoutlets"], name
        assert destination_inlet < boxes[destination_id]["numinlets"], name
    entries = list(boxes.values())
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
    print(f"validated {len(SPECS)} fixed field-tool wrappers")


if __name__ == "__main__":
    main()
