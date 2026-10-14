#!/usr/bin/env python3
"""Check that Windows AMXD metadata is platform-correct and Mac files stay intact."""

from __future__ import annotations

import json
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from windows_release_devices import (  # noqa: E402
    AMXD_HEADER,
    EXCLUDED,
    EXPECTED_SOURCE_DEVICE_COUNT,
    MAC_EXTERNAL,
    WINDOWS_EXTERNAL,
    prepare_device,
)


def validate() -> None:
    paths = sorted((ROOT / "package/devices").glob("*.amxd"))
    assert len(paths) == EXPECTED_SOURCE_DEVICE_COUNT
    assert EXCLUDED <= {path.name for path in paths}
    hosted = 0
    for path in paths:
        original = path.read_bytes()
        converted = prepare_device(original)
        assert path.read_bytes() == original, path.name
        assert len(converted) - AMXD_HEADER.size == AMXD_HEADER.unpack_from(converted)[-1]
        assert MAC_EXTERNAL.encode() not in converted, path.name
        document = json.loads(converted[AMXD_HEADER.size : -1])
        dependencies = document["patcher"].get("dependency_cache", [])
        windows_dependencies = [
            item for item in dependencies if item.get("name") == WINDOWS_EXTERNAL
        ]
        if MAC_EXTERNAL.encode() in original:
            assert len(windows_dependencies) == 1, path.name
            assert windows_dependencies[0]["type"] == "mx64", path.name
            hosted += 1
        else:
            assert not windows_dependencies, path.name
            assert converted == original, path.name
    assert hosted == 124, hosted
    print("Windows AMXD staging validated: 124 hosted, 4 routing devices")


if __name__ == "__main__":
    validate()
