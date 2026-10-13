#!/usr/bin/env python3
"""Validate 32-slot Live profiles of Matrix Upmix and Output Crossover."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
SPECS = {
    "s3g Matrix Upmix 64": (
        "org.s3g.s3g-dsp.format-upscale-64", {6, 13},
    ),
    "s3g Output Crossover 64": (
        "org.s3g.s3g-dsp.sub-crossover", {6, 8, 9},
    ),
}


def validate(name: str, plugin_id: str, parameter_ids: set[int]) -> None:
    source = ROOT / "source/m4l" / f"{name}.maxpat"
    device = ROOT / "package/devices" / f"{name}.amxd"
    raw = source.read_bytes()
    data = device.read_bytes()
    assert data[:4] == b"ampf" and data[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", data, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    lines = {
        (*entry["patchline"]["source"],
         *entry["patchline"]["destination"])
        for entry in patch["lines"]
    }
    assert len(boxes) == len(patch["boxes"]), name
    assert patch["devicewidth"] >= 300, name
    assert patch["openrect"][2] == patch["devicewidth"], name
    assert boxes["obj-live-limit"]["text"] == "LIVE: 32 IN / OUT", name
    assert boxes["obj-live-limit"]["presentation"] == 1, name
    assert boxes["obj-default-open"]["text"] == (
        f'openifempty "{name}" {plugin_id}'), name
    assert boxes["obj-clap"]["text"] == "s3g.clap~ 32 32", name
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
    assert ("obj-clap", 32, "obj-route-status", 0) in lines, name
    for channel in range(32):
        assert ("obj-plugin", channel + 2, "obj-clap", channel) in lines, name
        assert ("obj-clap", channel, "obj-plugout", channel + 2) in lines, name
    for channel in range(2):
        assert ("obj-plugin", channel, "obj-plugout", channel) in lines, name
    assert not any(destination == "obj-plugout" and inlet >= 34
                   for _, _, destination, inlet in lines), name
    actual_ids = {
        int(key.removeprefix("obj-param-"))
        for key in patch["parameters"]
        if key.startswith("obj-param-")
        and key.removeprefix("obj-param-").isdigit()
    }
    assert actual_ids == parameter_ids, name
    for parameter_id in parameter_ids:
        control = f"obj-param-{parameter_id}"
        assert boxes[control]["parameter_enable"] == 1, name
        assert boxes[f"obj-param-message-{parameter_id}"]["text"] == (
            f"automateparamid {parameter_id} $1"), name
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
    print(f"validated {len(SPECS)} 32-slot speaker-output wrappers")


if __name__ == "__main__":
    main()
