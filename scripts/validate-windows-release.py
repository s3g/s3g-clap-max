#!/usr/bin/env python3
"""Verify a staged Windows release ZIP without executing Windows binaries."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import struct
import sys
import zipfile

from windows_release_devices import (
    EXCLUDED as WINDOWS_EXCLUDED_DEVICES,
    EXPECTED_SOURCE_DEVICE_COUNT,
    MAC_EXTERNAL,
    WINDOWS_EXTERNAL,
    prepare_device,
)


ROOT = Path(__file__).resolve().parents[1]
PACKAGE = ROOT / "package"
HASH_LINE = re.compile(r"([0-9a-f]{64})  (.+)")


def fail(message: str) -> None:
    raise SystemExit(f"Windows release validation failed: {message}")


def is_x64_pe_dll(payload: bytes) -> bool:
    if len(payload) < 0x40 or payload[:2] != b"MZ":
        return False
    pe_offset = struct.unpack_from("<I", payload, 0x3C)[0]
    if pe_offset + 24 > len(payload) or payload[pe_offset : pe_offset + 4] != b"PE\0\0":
        return False
    machine = struct.unpack_from("<H", payload, pe_offset + 4)[0]
    characteristics = struct.unpack_from("<H", payload, pe_offset + 22)[0]
    return machine == 0x8664 and bool(characteristics & 0x2000)


def validate(archive: Path) -> None:
    version = json.loads((PACKAGE / "package-info.json").read_text())[
        "version"
    ]
    expected_name = f"s3g-clap-max-{version}-windows-x64-experimental.zip"
    if archive.name != expected_name:
        fail(f"expected archive name {expected_name}, got {archive.name}")
    release_root = f"s3g-clap-max-{version}-windows"
    package_root = f"{release_root}/s3g-clap-max"
    manifest_path = f"{release_root}/SHA256SUMS.txt"

    with zipfile.ZipFile(archive) as bundle:
        files = {}
        for entry in bundle.infolist():
            if entry.is_dir():
                continue
            path = PurePosixPath(entry.filename)
            if path.is_absolute() or ".." in path.parts:
                fail(f"unsafe archive path: {entry.filename}")
            if not entry.filename.startswith(f"{release_root}/"):
                fail(f"unexpected archive root: {entry.filename}")
            if entry.filename in files:
                fail(f"duplicate archive path: {entry.filename}")
            files[entry.filename] = bundle.read(entry)

    required = {
        manifest_path,
        f"{release_root}/INSTALL-WINDOWS.md",
        f"{package_root}/package-info.json",
        f"{package_root}/README.md",
        f"{package_root}/INSTALL-WINDOWS.md",
        f"{package_root}/LICENSE",
        f"{package_root}/THIRD_PARTY_NOTICES.md",
        f"{package_root}/externals/s3g.clap~.mxe64",
    }
    if missing := required - files.keys():
        fail(f"missing required files: {sorted(missing)}")
    if any(name.endswith(".mxo/Contents/MacOS/s3g.clap~") for name in files):
        fail("macOS external is present in the Windows ZIP")

    package_info = json.loads(files[f"{package_root}/package-info.json"])
    if package_info.get("name") != "s3g-clap-max" or package_info.get(
        "version"
    ) != version:
        fail("Max package identity or version is wrong")

    external_path = f"{package_root}/externals/s3g.clap~.mxe64"
    external = files[external_path]
    if not is_x64_pe_dll(external):
        fail("Max external is not a Windows x64 DLL")
    if external != (PACKAGE / "externals/s3g.clap~.mxe64").read_bytes():
        fail("Max external differs from the built candidate")

    source_devices = {
        path.name: path.read_bytes() for path in (PACKAGE / "devices").glob("*.amxd")
    }
    if len(source_devices) != EXPECTED_SOURCE_DEVICE_COUNT:
        fail(
            f"expected {EXPECTED_SOURCE_DEVICE_COUNT} source devices, "
            f"got {len(source_devices)}"
        )
    for excluded in WINDOWS_EXCLUDED_DEVICES:
        if excluded not in source_devices:
            fail(f"missing expected Windows exclusion: {excluded}")
        del source_devices[excluded]
    expected_devices = {
        name: prepare_device(data) for name, data in source_devices.items()
    }
    archived_devices = {
        PurePosixPath(name).name: payload
        for name, payload in files.items()
        if name.startswith(f"{package_root}/devices/") and name.endswith(".amxd")
    }
    if archived_devices != expected_devices:
        fail("archived Live devices differ from Windows-staged source devices")
    hosted = sum(WINDOWS_EXTERNAL.encode() in data for data in archived_devices.values())
    if hosted != 123 or any(MAC_EXTERNAL.encode() in data for data in archived_devices.values()):
        fail("Windows AMXD external dependency metadata is wrong")

    hashes = {}
    for line in files[manifest_path].decode("utf-8").splitlines():
        match = HASH_LINE.fullmatch(line)
        if not match or match.group(2) in hashes:
            fail(f"invalid or duplicate SHA256SUMS line: {line}")
        hashes[match.group(2)] = match.group(1)
    payload_files = {
        name.removeprefix(f"{release_root}/"): payload
        for name, payload in files.items()
        if name != manifest_path
    }
    if hashes.keys() != payload_files.keys():
        fail("SHA256SUMS does not cover exactly the release files")
    for name, payload in payload_files.items():
        if hashlib.sha256(payload).hexdigest() != hashes[name]:
            fail(f"checksum mismatch: {name}")

    print(
        f"Windows release validated: {len(archived_devices)} devices, "
        f"x64 Max external, {len(payload_files)} checksummed files"
    )


if __name__ == "__main__":
    if len(sys.argv) != 2:
        fail("usage: validate-windows-release.py ARCHIVE.zip")
    validate(Path(sys.argv[1]).resolve())
