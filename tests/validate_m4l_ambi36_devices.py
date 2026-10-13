#!/usr/bin/env python3
"""Structural regression checks for opt-in explicit-bus Ambi wrappers."""

from __future__ import annotations

import json
from pathlib import Path
import re
import struct


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "source/m4l"
DEVICE = ROOT / "package/devices"
RETIRED_GENERIC_DEVICES = (
    "s3g Ambi Source",
    "s3g Ambi Insert",
    "s3g Ambi Decoder Main",
)


def line_set(patch: dict[str, object]) -> set[tuple[tuple[str, int], tuple[str, int]]]:
    return {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patch["lines"]
    }


def validate_debug_layout(name: str, patch: dict[str, object]) -> None:
    """The active bus path must remain readable in Max's patching view."""
    boxes = [entry["box"] for entry in patch["boxes"]]
    for index, first in enumerate(boxes):
        x, y, width, height = first["patching_rect"]
        for second in boxes[index + 1:]:
            other_x, other_y, other_width, other_height = second["patching_rect"]
            if (min(x + width, other_x + other_width) > max(x, other_x)
                    and min(y + height, other_y + other_height) > max(y, other_y)):
                raise ValueError(
                    f"{name}: patching objects overlap: "
                    f"{first['id']} / {second['id']}"
                )
    by_id = {item["id"]: item for item in boxes}
    if name == "s3g Ambi Encoder Stochastic":
        flow = ("obj-midi-in", "obj-midi-parse", "obj-clap", "obj-plugout")
    elif name == "s3g Bus Send 36":
        flow = ("obj-plugin", "obj-route-matrix", "obj-bus-gain", "obj-plugout")
    elif name == "s3g Ambi Decoder Speaker":
        flow = (
            "obj-plugin", "obj-ambi-input-gain", "obj-clap", "obj-plugout",
        )
    else:
        flow = ("obj-plugin", "obj-monitor-left", "obj-plugout")
    if [by_id[item]["patching_rect"][1] for item in flow] != sorted(
            by_id[item]["patching_rect"][1] for item in flow):
        raise ValueError(f"{name}: main signal path is not top-to-bottom")


def validate(name: str) -> None:
    source_path = SOURCE / f"{name}.maxpat"
    device_path = DEVICE / f"{name}.amxd"
    document = json.loads(source_path.read_text(encoding="utf-8"))
    data = device_path.read_bytes()
    if len(data) < 33 or data[:4] != b"ampf":
        raise ValueError(f"{name}: invalid AMXD")
    length = struct.unpack_from("<I", data, 28)[0]
    if data[32:] != (source_path.read_bytes() + b"\0") or len(data) != 32 + length:
        raise ValueError(f"{name}: AMXD does not match Max source")
    patch = document["patcher"]
    if name in {"s3g Ambi Encoder Stochastic", "s3g Ambi Decoder Speaker"}:
        validate_debug_layout(name, patch)
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    if len(boxes) != len(patch["boxes"]):
        raise ValueError(f"{name}: duplicate object ID")
    lines = line_set(patch)
    for (source_id, source_outlet), (destination_id, destination_inlet) in lines:
        if source_id not in boxes or destination_id not in boxes:
            raise ValueError(f"{name}: dangling patch cord")
        if source_outlet >= boxes[source_id]["numoutlets"]:
            raise ValueError(f"{name}: outlet beyond {source_id}")
        if destination_inlet >= boxes[destination_id]["numinlets"]:
            raise ValueError(f"{name}: inlet beyond {destination_id}")
    if any(object_id in boxes for object_id in (
        "obj-chain", "obj-bus-send", "obj-bus-receive", "obj-input-bus-number"
    )):
        raise ValueError(f"{name}: old routing control remains")
    if any(re.fullmatch(r"paramid \d+ 3(?:\.0+)?", str(box.get("text", "")))
           for object_id, box in boxes.items()
           if object_id.startswith("obj-param-topology-")):
        raise ValueError(f"{name}: third order is still forced")
    if boxes["obj-bus-insert"]["text"] != "s3g.bus.insert":
        raise ValueError(f"{name}: no same-track insert discovery")
    multichannel_decoder = name in {
        "s3g Ambi Decoder Speaker", "s3g Ambi Decoder Object",
        "s3g Ambi Decoder Adaptive", "s3g Ambi Decoder Sub",
    }
    insert_source = (
        "obj-chain-init" if multichannel_decoder else
        "obj-device-startup-trigger" if name == "s3g Ambi Encoder Stochastic"
        else "obj-device"
    )
    insert_outlet = 1 if insert_source in {
        "obj-device-startup-trigger", "obj-chain-init",
    } else 0
    if ((insert_source, insert_outlet), ("obj-bus-insert", 0)) not in lines:
        raise ValueError(f"{name}: insert discovery not initialized")
    if "3OA" in patch["digest"] or "master bus" in patch["digest"]:
        raise ValueError(f"{name}: obsolete routing description")

    is_decoder = " Decoder " in name
    is_source = name == "s3g Ambi Source"
    is_encoder = " Encoder " in name or is_source
    is_effect = " Effect " in name or name == "s3g Ambi Insert"
    clap_inputs, clap_outputs = map(int, boxes["obj-clap"]["text"].split()[1:])
    if clap_inputs > 36 or clap_outputs > 36:
        raise ValueError(f"{name}: CLAP exceeds fifth-order budget")
    if (("obj-clap", clap_outputs), ("obj-route-status", 0)) not in lines:
        raise ValueError(f"{name}: CLAP status outlet is misplaced")

    if multichannel_decoder:
        if (boxes["obj-plugin"]["numoutlets"] != 38
                or boxes["obj-ambi-input-gain"]["channels"] != 36
                or boxes["obj-rec-writer"]["text"] != "sfrecord~ 36"
                or boxes["obj-plugout"]["numinlets"] != 38
                or clap_inputs != 36 or clap_outputs != 32
                or boxes["obj-next-send"]["text"] !=
                "s3g.bus.send s3g-chain-next"):
            raise ValueError(f"{name}: multichannel decoder topology is incomplete")
        if any(object_id.startswith(("obj-mono-", "obj-hardware-"))
               for object_id in boxes):
            raise ValueError(f"{name}: hardware controls remain in processor")
        ordered = {
            (("obj-device", 0), ("obj-chain-init", 0)),
            (("obj-chain-init", 2), ("obj-state-restore-init", 0)),
            (("obj-chain-init", 1), ("obj-bus-insert", 0)),
            (("obj-chain-init", 0), ("obj-next-order", 0)),
            (("obj-next-order", 2), ("obj-next-store", 1)),
            (("obj-next-order", 1), ("obj-next-trigger", 0)),
            (("obj-next-order", 0), ("obj-next-delay", 0)),
            (("obj-next-delay", 0), ("obj-next-store", 0)),
            (("obj-next-store", 0), ("obj-next-trigger", 0)),
            (("obj-next-trigger", 1), ("obj-next-mode", 0)),
            (("obj-next-mode", 0), ("obj-next-send", 1)),
            (("obj-next-trigger", 0), ("obj-next-send", 0)),
        }
        if (not ordered.issubset(lines)
                or boxes["obj-chain-init"]["text"] != "t l l l"
                or boxes["obj-next-delay"]["text"] != "delay 300"
                or boxes["obj-next-mode"]["text"] != "1"):
            raise ValueError(f"{name}: automatic next-chain startup is broken")
        for channel in range(36):
            required = {
                (("obj-plugin", channel + 2), ("obj-ambi-input-gain", channel)),
                (("obj-ambi-input-gain", channel), ("obj-clap", channel)),
                (("obj-ambi-input-gain", channel), ("obj-rec-writer", channel)),
            }
            if not required.issubset(lines):
                raise ValueError(f"{name}: input channel {channel + 1} is disconnected")
        for channel in range(32):
            if (("obj-clap", channel), ("obj-plugout", channel + 2)) not in lines:
                raise ValueError(f"{name}: chain channel {channel + 1} is disconnected")
        if any((("obj-plugin", channel), ("obj-plugout", channel)) in lines
               for channel in (0, 1)):
            raise ValueError(f"{name}: Live stereo bypasses decoder")
        return

    if is_decoder:
        if "obj-next-send" in boxes:
            raise ValueError(f"{name}: stereo decoder routes to NEXT")
        if (boxes["obj-plugin"]["numoutlets"] != 38
                or boxes["obj-ambi-input-gain"]["channels"] != 36
                or boxes["obj-rec-writer"]["text"] != "sfrecord~ 36"
                or clap_inputs != 36):
            raise ValueError(f"{name}: decoder input not 36-channel")
        for channel in range(36):
            required = {
                (("obj-plugin", channel + 2), ("obj-ambi-input-gain", channel)),
                (("obj-ambi-input-gain", channel), ("obj-clap", channel)),
                (("obj-ambi-input-gain", channel), ("obj-rec-writer", channel)),
            }
            if not required.issubset(lines):
                raise ValueError(f"{name}: decoder channel {channel + 1} is disconnected")
    else:
        if (boxes["obj-plugout"]["numinlets"] != 38
                or boxes["obj-next-send"]["text"] != "s3g.bus.send s3g-chain-next"
                or boxes["obj-next-mode"]["text"] != "1"):
            raise ValueError(f"{name}: automatic NEXT topology is incomplete")
        next_lines = {
            (("obj-next-trigger", 1), ("obj-next-mode", 0)),
            (("obj-next-mode", 0), ("obj-next-send", 1)),
            (("obj-next-trigger", 0), ("obj-next-send", 0)),
        }
        if name == "s3g Ambi Encoder Stochastic":
            next_lines |= {
                (("obj-device", 0), ("obj-device-startup-trigger", 0)),
                (("obj-device-startup-trigger", 2), ("obj-state-restore-init", 0)),
                (("obj-device-startup-trigger", 1), ("obj-bus-insert", 0)),
                (("obj-device-startup-trigger", 0), ("obj-next-retry-trigger", 0)),
                (("obj-route-status", 3), ("obj-status-trigger", 0)),
                (("obj-status-trigger", 1), ("obj-paramchanged-route", 0)),
                (("obj-status-trigger", 0), ("obj-state-change-bang", 0)),
                (("obj-next-retry-trigger", 2), ("obj-next-retry-store", 1)),
                (("obj-next-retry-trigger", 1), ("obj-next-trigger", 0)),
                (("obj-next-retry-trigger", 0), ("obj-next-retry-delay", 0)),
                (("obj-next-retry-delay", 0), ("obj-next-retry-store", 0)),
                (("obj-next-retry-store", 0), ("obj-next-trigger", 0)),
            }
            if (boxes["obj-next-retry-delay"]["text"] != "delay 300"
                    or boxes["obj-device-startup-trigger"]["text"] != "t l l l"
                    or boxes["obj-status-trigger"]["text"] != "t l l"):
                raise ValueError(f"{name}: startup NEXT retry interval changed")
        else:
            next_lines.add((("obj-device", 0), ("obj-next-trigger", 0)))
        if not next_lines.issubset(lines):
            raise ValueError(f"{name}: NEXT is not initialized before device ID")
        for channel in range(clap_outputs):
            if (("obj-clap", channel), ("obj-plugout", channel + 2)) not in lines:
                raise ValueError(f"{name}: Ambi output {channel + 1} is disconnected")
        if is_effect:
            if boxes["obj-plugin"]["numoutlets"] != 38 or clap_inputs != 36:
                raise ValueError(f"{name}: effect does not process 36 channels")
            for channel in range(36):
                if (("obj-plugin", channel + 2), ("obj-clap", channel)) not in lines:
                    raise ValueError(f"{name}: effect input {channel + 1} is disconnected")
            order_default = boxes.get("obj-ambi-order-default", {})
            new_instance_order = {
                (("obj-state-valid", 0), ("obj-ambi-order-restored", 0)),
                (("obj-ambi-order-restored", 0), ("obj-ambi-order-state", 1)),
                (("obj-route-status", 2), ("obj-ambi-order-loaded-delay", 0)),
                (("obj-ambi-order-loaded-delay", 0), ("obj-ambi-order-state", 0)),
                (("obj-ambi-order-state", 0), ("obj-ambi-order-new", 0)),
                (("obj-ambi-order-new", 0), ("obj-ambi-order-default", 0)),
                (("obj-ambi-order-default", 0), ("obj-clap", 0)),
            }
            if (boxes.get("obj-ambi-order-state", {}).get("text") != "i 0"
                    or boxes.get("obj-ambi-order-loaded-delay", {}).get("text")
                    != "delay 50"
                    or boxes.get("obj-ambi-order-new", {}).get("text") != "sel 0"
                    or not re.fullmatch(
                        r"paramid \d+ 5", str(order_default.get("text", "")))
                    or not new_instance_order.issubset(lines)):
                raise ValueError(
                    f"{name}: new-only fifth-order default is incomplete"
                )
        elif is_encoder and "obj-plugin" in boxes and boxes["obj-plugin"]["numoutlets"] == 38:
            for channel in range(clap_inputs):
                if (("obj-plugin", channel + 2), ("obj-clap", channel)) not in lines:
                    raise ValueError(f"{name}: encoder input {channel + 1} is disconnected")


def main() -> None:
    # Field-transform inserts have their own width/identity validator; this
    # legacy-conversion check covers only its 38 encoder/effect/decoder faces.
    current = sorted(
        source for source in SOURCE.glob("s3g Ambi *.maxpat")
        if not source.stem.startswith("s3g Ambi Transform ")
    )
    if len(current) != 38:
        raise ValueError(f"expected 38 current Ambi wrappers, got {len(current)}")
    if any(source.stem in RETIRED_GENERIC_DEVICES for source in current):
        raise ValueError("retired general-purpose source remains")
    for name in RETIRED_GENERIC_DEVICES:
        for directory, suffix in ((SOURCE, ".maxpat"), (DEVICE, ".amxd")):
            if (directory / f"{name}{suffix}").exists():
                raise ValueError(f"retired generic device remains: {name}{suffix}")
    for directory, suffix in ((SOURCE, ".maxpat"), (DEVICE, ".amxd")):
        legacy = list(directory.glob(f"s3g 3OA *{suffix}"))
        if legacy:
            raise ValueError(f"legacy 3OA devices remain: {legacy}")
    for source in current:
        validate(source.stem)
    send = json.loads((SOURCE / "s3g Bus Send 36.maxpat").read_text(encoding="utf-8"))
    send_boxes = {entry["box"]["id"]: entry["box"]
                  for entry in send["patcher"]["boxes"]}
    validate_debug_layout("s3g Bus Send 36", send["patcher"])
    send_lines = line_set(send["patcher"])
    ordered_send = {
        (("obj-device", 0), ("obj-device-startup-trigger", 0)),
        (("obj-device-startup-trigger", 2), ("obj-bus-number-replay-ready", 0)),
        (("obj-device-startup-trigger", 1), ("obj-bus-insert", 0)),
        (("obj-device-startup-trigger", 0), ("obj-bus-send", 0)),
        (("obj-channel-count", 0), ("obj-width-fanout-trigger", 0)),
        (("obj-width-fanout-trigger", 2), ("obj-source-last-values", 1)),
        (("obj-width-fanout-trigger", 1), ("obj-channel-count-value-to-menu", 0)),
        (("obj-width-fanout-trigger", 0), ("obj-route-values", 1)),
        (("obj-source-first", 0), ("obj-from-fanout-trigger", 0)),
        (("obj-from-fanout-trigger", 2), ("obj-source-last-values", 0)),
        (("obj-from-fanout-trigger", 1), ("obj-source-first-value-to-menu", 0)),
        (("obj-from-fanout-trigger", 0), ("obj-route-values", 2)),
    }
    if (not ordered_send.issubset(send_lines)
            or send_boxes["obj-device-startup-trigger"]["text"] != "t l l l"
            or send_boxes["obj-width-fanout-trigger"]["text"] != "t i i i"
            or send_boxes["obj-from-fanout-trigger"]["text"] != "t i i i"):
        raise ValueError("Bus Send 36 startup/control order is not explicit")
    if send_boxes["obj-bus-insert"]["text"] != "s3g.bus.insert":
        raise ValueError("Bus Send 36 does not announce itself to previous insert")
    if (("obj-device-startup-trigger", 1), ("obj-bus-insert", 0)) not in send_lines:
        raise ValueError("Bus Send 36 insert discovery is disconnected")
    if (send_boxes["obj-bus-send"]["text"] != "s3g.bus.send s3g-bus36-1"
            or send_boxes["obj-bus-mode"]["text"] != "0"
            or send_boxes["obj-route-values"]["text"] != "pak 1 2 1 1"):
        raise ValueError("Bus Send 36 lost the proven bus-mode handshake or safe defaults")
    receive = json.loads(
        (SOURCE / "s3g Bus Receive 36.maxpat").read_text(encoding="utf-8")
    )["patcher"]
    receive_boxes = {entry["box"]["id"]: entry["box"]
                     for entry in receive["boxes"]}
    validate_debug_layout("s3g Bus Receive 36", receive)
    receive_lines = line_set(receive)
    if (receive_boxes["obj-bus-receive"]["text"] !=
            "s3g.bus.receive s3g-bus36-1"
            or receive_boxes["obj-chain-send"]["text"] !=
            "s3g.bus.send s3g-bus36-chain"
            or receive_boxes["obj-chain-mode"]["text"] != "1"
            or receive_boxes["obj-identity-retry"]["text"] != "delay 500"
            or receive_boxes["obj-identity-path"]["text"] != "live.path"
            or receive_boxes["obj-identity-valid"]["text"] !=
            "split 1 2147483647"
            or receive_boxes["obj-chain-start-trigger"]["text"] != "t b l"):
        raise ValueError("Bus Receive 36 lost the prior receive-to-NEXT handoff")
    required_identity_flow = {
        (("obj-device", 0), ("obj-identity-start", 0)),
        (("obj-identity-start", 1), ("obj-identity-retry", 0)),
        (("obj-identity-start", 0), ("obj-identity-query", 0)),
        (("obj-identity-retry", 0), ("obj-identity-tick", 0)),
        (("obj-identity-tick", 1), ("obj-identity-retry", 0)),
        (("obj-identity-tick", 0), ("obj-identity-query", 0)),
        (("obj-identity-query", 0), ("obj-identity-path", 0)),
        (("obj-identity-path", 1), ("obj-identity-defer", 0)),
        (("obj-identity-defer", 0), ("obj-identity-route", 0)),
        (("obj-identity-route", 0), ("obj-identity-valid", 0)),
        (("obj-identity-valid", 0), ("obj-identity-attach", 0)),
        (("obj-identity-attach", 0), ("obj-identity-to-buses", 0)),
        (("obj-identity-to-buses", 1), ("obj-bus-receive", 0)),
        (("obj-identity-to-buses", 0), ("obj-chain-start-trigger", 0)),
        (("obj-chain-start-trigger", 1), ("obj-chain-send", 0)),
        (("obj-chain-start-trigger", 0), ("obj-chain-mode", 0)),
        (("obj-chain-mode", 0), ("obj-chain-send", 1)),
        (("obj-bus-receive", 0), ("obj-identity-stop", 0)),
        (("obj-identity-stop", 0), ("obj-identity-retry", 0)),
    }
    if not required_identity_flow.issubset(receive_lines):
        raise ValueError("Bus Receive 36 cannot re-query until its track resolves")
    print("validated 38 explicit-bus Ambi wrappers and Bus Send 36")


if __name__ == "__main__":
    main()
