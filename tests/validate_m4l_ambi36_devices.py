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
    elif name == "s3g Ambi Decoder Speaker Main":
        flow = (
            "obj-plugin", "obj-ambi-input-gain", "obj-clap",
            "obj-mono-matrix", "obj-plugout",
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
    if name in {"s3g Ambi Encoder Stochastic", "s3g Ambi Decoder Speaker Main"}:
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
    insert_source = (
        "obj-device-startup-trigger"
        if name in {"s3g Ambi Encoder Stochastic",
                    "s3g Ambi Decoder Speaker Main"} else "obj-device"
    )
    insert_outlet = 1 if insert_source == "obj-device-startup-trigger" else 0
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

    if is_decoder:
        if "obj-next-send" in boxes:
            raise ValueError(f"{name}: hardware endpoint routes to NEXT")
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
        if name == "s3g Ambi Decoder Speaker Main":
            startup_lines = {
                (("obj-device", 0), ("obj-device-startup-trigger", 0)),
                (("obj-device-startup-trigger", 3), ("obj-state-restore-init", 0)),
                (("obj-device-startup-trigger", 2), ("obj-hardware-routing", 0)),
                (("obj-device-startup-trigger", 1), ("obj-bus-insert", 0)),
                (("obj-device-startup-trigger", 0), ("obj-device-split", 0)),
                (("obj-mono-page-one", 0), ("obj-mono-page-fanout", 0)),
            }
            startup_lines |= {
                (("obj-mono-page-fanout", 8 - index), (destination, 0))
                for index, destination in enumerate(
                    [f"obj-mono-row-label-{row}-number"
                     for row in range(8, 0, -1)] + ["obj-mono-page-order"]
                )
            }
            if (not startup_lines.issubset(lines)
                    or boxes["obj-device-startup-trigger"]["text"] != "t l l l l"
                    or boxes["obj-mono-page-fanout"]["text"] !=
                    "t i i i i i i i i i"):
                raise ValueError(f"{name}: startup/page ordering is not explicit")
            for channel in range(1, 33):
                control = f"obj-mono-output-{channel}"
                store_input = f"{control}-store-input"
                ordered_route = {
                    ((control, 0), (store_input, 0)),
                    ((store_input, 2), (f"{control}-store", 1)),
                    ((store_input, 1), ("obj-mono-redraw", 0)),
                    ((store_input, 0), (f"{control}-trigger", 0)),
                }
                if (boxes[store_input]["text"] != "t i b i"
                        or not ordered_route.issubset(lines)):
                    raise ValueError(f"{name}: mono route {channel} has implicit order")
            gain = boxes["obj-ambi-input-gain"]
            gain_x, gain_y, gain_width, gain_height = gain["presentation_rect"]
            grid_x, grid_y, grid_width, grid_height = boxes["obj-mono-grid"]["presentation_rect"]
            device_width = patch["devicewidth"]
            if (gain.get("ignoreclick") != 0
                    or gain.get("orientation") != 0
                    or gain.get("thickness") != 2
                    or gain_x != boxes["obj-gui-button"]["presentation_rect"][0]
                    or gain_height != 120
                    or (grid_x, grid_y, grid_width, grid_height)
                    != (240.0, 50.0, 448.0, 112.0)
                    or gain_x + gain_width >= grid_x
                    or grid_x + grid_width > device_width
                    or device_width != 700.0
                    or patch["openrect"] != [0.0, 0.0, 700.0, 169.0]):
                raise ValueError(f"{name}: vertical input gain or output grid is clipped")
            top_row = (
                "obj-gui-button", "obj-hardware-button",
                "obj-rec-file-button", "obj-rec-toggle", "obj-rec-time",
                "obj-mono-page-menu",
            )
            if any(boxes[control]["presentation_rect"][1] != 10.0
                   for control in top_row):
                raise ValueError(f"{name}: transport controls left the top row")
            foreground = [
                box for box in boxes.values()
                if box.get("presentation") and box["maxclass"] != "panel"
            ]
            for index, first in enumerate(foreground):
                x, y, width, height = first["presentation_rect"]
                if x < 0 or y < 0 or x + width > device_width or y + height > 169:
                    raise ValueError(f"{name}: {first['id']} exceeds Live device bounds")
                for second in foreground[index + 1:]:
                    other_x, other_y, other_width, other_height = second["presentation_rect"]
                    if (min(x + width, other_x + other_width) > max(x, other_x)
                            and min(y + height, other_y + other_height) > max(y, other_y)):
                        raise ValueError(
                            f"{name}: presentation overlap {first['id']} / {second['id']}"
                        )
            hardware_popup = boxes["obj-hardware-routing"]["patcher"]
            popup_boxes = {entry["box"]["id"]: entry["box"]
                           for entry in hardware_popup["boxes"]}
            if (hardware_popup["locked_bgcolor"] != [0.82, 0.82, 0.82, 1.0]
                    or any(popup_boxes[f"obj-output-label-{pair}"]["textcolor"]
                           != [0.20, 0.20, 0.20, 1.0]
                           for pair in range(1, 17))):
                raise ValueError(f"{name}: hardware popup labels lack contrast")
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
        elif is_encoder and "obj-plugin" in boxes and boxes["obj-plugin"]["numoutlets"] == 38:
            for channel in range(clap_inputs):
                if (("obj-plugin", channel + 2), ("obj-clap", channel)) not in lines:
                    raise ValueError(f"{name}: encoder input {channel + 1} is disconnected")


def main() -> None:
    originals = sorted(SOURCE.glob("s3g 3OA *.maxpat"))
    if len(originals) != 41:
        raise ValueError(f"expected 41 original Ambi wrappers, got {len(originals)}")
    for original in originals:
        validate(original.stem.replace("s3g 3OA", "s3g Ambi", 1))
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
    print("validated 41 explicit-bus Ambi wrappers and Bus Send 36")


if __name__ == "__main__":
    main()
