#!/usr/bin/env python3
"""Stage Windows AMXD copies without changing the shared macOS source devices."""

from __future__ import annotations

import json
from pathlib import Path
import struct
import sys


AMXD_HEADER = struct.Struct("<4sI4s4sII4sI")
EXCLUDED = {"s3g Analyzer Ambi Energy 64.amxd"}
EXPECTED_SOURCE_DEVICE_COUNT = 128
MAC_EXTERNAL = "s3g.clap~.mxo"
WINDOWS_EXTERNAL = "s3g.clap~.mxe64"


def prepare_device(data: bytes) -> bytes:
    if len(data) < AMXD_HEADER.size:
        raise ValueError("truncated AMXD header")
    magic, version, device_type, meta, meta_size, meta_version, ptch, length = (
        AMXD_HEADER.unpack_from(data)
    )
    if (
        magic != b"ampf"
        or version != 4
        or device_type not in (b"aaaa", b"iiii", b"mmmm")
        or meta != b"meta"
        or meta_size != 4
        or meta_version != 1
        or ptch != b"ptch"
        or length != len(data) - AMXD_HEADER.size
        or not data.endswith(b"\0")
    ):
        raise ValueError("unsupported AMXD header or payload")
    document = json.loads(data[AMXD_HEADER.size : -1])
    dependencies = document["patcher"].get("dependency_cache", [])
    for dependency in dependencies:
        if dependency.get("name") == MAC_EXTERNAL:
            if dependency.get("type") != "iLaX":
                raise ValueError("unexpected Mac external dependency type")
            dependency["name"] = WINDOWS_EXTERNAL
            dependency["type"] = "mx64"
    payload = (json.dumps(document, indent=2, ensure_ascii=False) + "\n").encode(
        "utf-8"
    ) + b"\0"
    header = AMXD_HEADER.pack(
        magic, version, device_type, meta, meta_size, meta_version, ptch,
        len(payload),
    )
    result = header + payload
    if MAC_EXTERNAL.encode() in result:
        raise ValueError("Mac external dependency remains in Windows AMXD")
    return result


def stage(source: Path, destination: Path) -> None:
    devices = sorted(source.glob("*.amxd"))
    if len(devices) != EXPECTED_SOURCE_DEVICE_COUNT:
        raise ValueError(
            f"expected {EXPECTED_SOURCE_DEVICE_COUNT} source devices, "
            f"found {len(devices)}"
        )
    if not EXCLUDED <= {device.name for device in devices}:
        raise ValueError("expected Mac-only device is missing")
    destination.mkdir(parents=True, exist_ok=True)
    for device in devices:
        if device.name in EXCLUDED:
            continue
        (destination / device.name).write_bytes(prepare_device(device.read_bytes()))
    print(f"Staged {len(devices) - len(EXCLUDED)} Windows AMXD devices")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("usage: windows_release_devices.py SOURCE_DIR DEST_DIR")
    stage(Path(sys.argv[1]), Path(sys.argv[2]))
