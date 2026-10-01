#!/usr/bin/env python3
"""Structural checks for the generated Max for Live device bundle."""

from __future__ import annotations

import json
import struct
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = ROOT / "source" / "m4l"
DEVICE_DIR = ROOT / "package" / "devices"
ROUTING_ROOT = ROOT / "package" / "patchers" / "s3g-routing"
VENDOR_ROOT = ROOT / "vendor" / "envelop-for-live" / "patchers"

DEVICE_WIDTH = 425.0
COMPACT_HEIGHT = 169.0
MAIN_OUT_HEIGHT = 169.0
COLOR_BACKGROUND = [0.05098, 0.05098, 0.05098, 1.0]

EXPECTED = {
    "s3g CLAP 3OA Source": (
        18, "s3g.clap~ 2 16", 16,
        'openifempty "s3g Ambi Encoder Medium 16"', (), ()
    ),
    "s3g CLAP 3OA Path Encoder": (
        18, "s3g.clap~ 2 16", 16,
        (
            'openifempty "s3g Ambi Encoder Path 64" '
            "org.s3g.s3g-dsp.ambi-path-encoder-64"
        ),
        (3, 4, 5, 6, 7, 8, 9, 10, 17, 18, 11, 12, 13, 14, 15, 19, 20, 16),
        ((1, 2), (2, 3)),
    ),
    "s3g CLAP 3OA Insert": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Gain 64"', (), ()
    ),
    "s3g CLAP 3OA Main Out": (
        34, "s3g.clap~ 16 32", 32,
        'openifempty "s3g Ambi Decoder Head 2"', (), ()
    ),
    "s3g CLAP 3OA Speaker Main Out": (
        34, "s3g.clap~ 16 32", 32,
        (
            'openifempty "s3g Ambi Decoder Speaker 64" '
            "org.s3g.s3g-dsp.ambi-speaker-decoder-64"
        ),
        (1, 2, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16),
        ((3, 3),),
    ),
}


def read_amxd(path: Path) -> dict[str, object]:
    data = path.read_bytes()
    if len(data) < 33:
        raise ValueError(f"{path}: truncated AMXD")
    magic, version, marker, meta_chunk, meta_length, meta_flags, patch_chunk, length = (
        struct.unpack("<4sI4s4sII4sI", data[:32])
    )
    if (magic, version, marker) != (b"ampf", 4, b"aaaa"):
        raise ValueError(f"{path}: invalid AMXD header")
    if (meta_chunk, meta_length, meta_flags) != (b"meta", 4, 1):
        raise ValueError(f"{path}: invalid AMXD metadata chunk")
    if patch_chunk != b"ptch":
        raise ValueError(f"{path}: missing AMXD patch chunk")
    payload = data[32:]
    if len(payload) != length or not payload.endswith(b"\0"):
        raise ValueError(f"{path}: invalid AMXD payload length")
    return json.loads(payload[:-1].decode("utf-8"))


def validate(name: str, expected_outputs: int, clap_prefix: str,
             status_outlet: int, default_open: str,
             fixed_parameter_ids: tuple[int, ...],
             fixed_topology: tuple[tuple[int, int], ...]) -> None:
    source_path = SOURCE_DIR / f"{name}.maxpat"
    device_path = DEVICE_DIR / f"{name}.amxd"
    source = json.loads(source_path.read_text(encoding="utf-8"))
    device = read_amxd(device_path)
    if source != device:
        raise ValueError(f"{name}: editable source and packaged AMXD differ")
    patcher = source["patcher"]
    if patcher["project"]["amxdtype"] != 1633771873:
        raise ValueError(f"{name}: not marked as a Max audio device")
    if patcher.get("minimum_live_version") != "12.0":
        raise ValueError(f"{name}: multichannel routing requires Live 12")
    expected_height = MAIN_OUT_HEIGHT if name.endswith("Main Out") else COMPACT_HEIGHT
    if patcher.get("devicewidth") != DEVICE_WIDTH:
        raise ValueError(f"{name}: unexpected device width")
    if patcher.get("openrect") != [0.0, 0.0, DEVICE_WIDTH, expected_height]:
        raise ValueError(f"{name}: unexpected presentation bounds")
    if patcher.get("locked_bgcolor") != COLOR_BACKGROUND:
        raise ValueError(f"{name}: missing s3g presentation background")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    required_ui = {
        "obj-ui-background", "obj-title-strip", "obj-title-accent",
        "obj-title", "obj-gui-button",
        "obj-latency-label", "obj-latency-number",
    }
    required_ui.add("obj-fixed-label" if fixed_parameter_ids else "obj-load-button")
    if not required_ui.issubset(boxes):
        raise ValueError(f"{name}: incomplete s3g presentation layer")
    for current in boxes.values():
        rect = current.get("presentation_rect")
        if not rect:
            continue
        if (rect[0] < 0.0 or rect[1] < 0.0
                or rect[0] + rect[2] > DEVICE_WIDTH
                or rect[1] + rect[3] > expected_height):
            raise ValueError(
                f"{name}: {current['id']} exceeds the presentation bounds"
            )
    clap = boxes["obj-clap"]
    if clap["text"] != clap_prefix:
        raise ValueError(f"{name}: unexpected CLAP channel topology")
    if clap["outlettype"] != (["signal"] * status_outlet) + ["list"]:
        raise ValueError(f"{name}: unexpected CLAP signal/status outlet types")
    default_plugin = default_open.split('"')[1]
    if default_plugin in clap["text"]:
        raise ValueError(f"{name}: CLAP must not load during object construction")
    if clap.get("varname") != "clap":
        raise ValueError(f"{name}: CLAP host is not addressable by pattr")
    if (clap.get("parameter_enable") == 1
            or "obj-clap" in patcher["parameters"]):
        raise ValueError(f"{name}: unsupported direct CLAP parameter remains")
    state_carrier = boxes["obj-clap-state"]
    state = state_carrier["saved_attribute_attributes"]["valueof"]
    state_parameter = state_carrier["saved_object_attributes"]
    if (state_carrier.get("text")
            != "pattr clap_state @autorestore 1 @thru 0"
            or state_carrier.get("varname") != "clap_state"
            or state_parameter.get("parameter_enable") != 1
            or state_parameter.get("parameter_mappable") != 0
            or state.get("parameter_type") != 3
            or state.get("parameter_invisible") != 1
            or patcher["parameters"].get("obj-clap-state")
            != ["CLAP State", "CLAP State", 0]):
        raise ValueError(f"{name}: CLAP state is not a pattr-backed Blob parameter")
    plugout = boxes["obj-plugout"]
    if plugout["numinlets"] != expected_outputs:
        raise ValueError(f"{name}: unexpected Live output channel count")
    line_pairs = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    if (("obj-clap", status_outlet), ("obj-route-status", 0)) not in line_pairs:
        raise ValueError(f"{name}: CLAP status outlet is not connected")
    state_outlet = 5 if fixed_parameter_ids else 4
    statechanged_outlet = 6 if fixed_parameter_ids else 5
    state_lines = {
        (("obj-clap-state", 0), ("obj-state-valid", 0)),
        (("obj-state-valid", 0), ("obj-state-restore", 0)),
        (("obj-state-restore", 0), ("obj-clap", 0)),
        (("obj-device", 0), ("obj-state-restore-init", 0)),
        (("obj-state-restore-init", 2), ("obj-clap-state", 0)),
        (("obj-state-restore-init", 1),
         ("obj-state-capture-enable", 0)),
        (("obj-state-capture-enable", 0),
         ("obj-state-capture-gate", 0)),
        (("obj-state-restore-init", 0), ("obj-state-change-bang", 0)),
        (("obj-route-status", state_outlet), ("obj-clap-state", 0)),
        (("obj-route-status", 2), ("obj-state-change-bang", 0)),
        (("obj-route-status", 3), ("obj-state-change-bang", 0)),
        (("obj-route-status", statechanged_outlet),
         ("obj-state-change-bang", 0)),
        (("obj-state-change-bang", 0), ("obj-state-capture-gate", 1)),
        (("obj-state-capture-gate", 0), ("obj-state-capture-delay", 0)),
        (("obj-state-capture-delay", 0), ("obj-state-get", 0)),
        (("obj-state-get", 0), ("obj-clap", 0)),
    }
    if (boxes["obj-state-valid"].get("text")
            != "routepass s3g.clap.state.1"
            or boxes["obj-state-restore"].get("text") != "prepend setstate"
            or boxes["obj-state-get"].get("text") != "getstate"
            or boxes["obj-state-capture-gate"].get("text") != "gate 1 0"
            or not state_lines.issubset(line_pairs)):
        raise ValueError(f"{name}: explicit CLAP state bridge is incomplete")
    if boxes["obj-default-open"]["text"] != default_open:
        raise ValueError(f"{name}: wrong deferred default CLAP")
    deferred_open = {
        (("obj-loadbang", 0), ("obj-delayed-load", 0)),
        (("obj-delayed-load", 0), ("obj-default-open", 0)),
        (("obj-default-open", 0), ("obj-clap", 0)),
    }
    if not deferred_open.issubset(line_pairs):
        raise ValueError(f"{name}: default CLAP load is not deferred")
    button_paths = {
        (("obj-gui-button", 0), ("obj-editor-trigger", 0)),
        (("obj-editor-trigger", 0), ("obj-editor", 0)),
    }
    if fixed_parameter_ids:
        if any(object_id in boxes for object_id in (
                "obj-load-button", "obj-load-trigger", "obj-open")):
            raise ValueError(f"{name}: fixed wrapper still allows plugin replacement")
    else:
        button_paths.update({
            (("obj-load-button", 0), ("obj-load-trigger", 0)),
            (("obj-load-trigger", 0), ("obj-open", 0)),
        })
    if not button_paths.issubset(line_pairs):
        raise ValueError(f"{name}: Load or Editor button is not bang-normalized")
    if name in ("s3g CLAP 3OA Source", "s3g CLAP 3OA Path Encoder"):
        stereo_input_lines = {
            (("obj-plugin", 0), ("obj-plugout", 0)),
            (("obj-plugin", 1), ("obj-plugout", 1)),
            (("obj-plugin", 0), ("obj-input-meter", 0)),
            (("obj-plugin", 1), ("obj-input-meter", 1)),
            (("obj-input-meter", 0), ("obj-input-mute-1-gain", 0)),
            (("obj-input-meter", 1), ("obj-input-mute-2-gain", 0)),
            (("obj-input-mute-1", 0), ("obj-input-mute-1-invert", 0)),
            (("obj-input-mute-2", 0), ("obj-input-mute-2-invert", 0)),
            (("obj-input-mute-1-invert", 0), ("obj-input-mute-1-gain", 1)),
            (("obj-input-mute-2-invert", 0), ("obj-input-mute-2-gain", 1)),
            (("obj-input-mute-1-gain", 0), ("obj-clap", 0)),
            (("obj-input-mute-2-gain", 0), ("obj-clap", 1)),
        }
        if not stereo_input_lines.issubset(line_pairs):
            raise ValueError(f"{name}: stereo input monitor/mute path is incomplete")
        direct_input_lines = {
            (("obj-plugin", 0), ("obj-clap", 0)),
            (("obj-plugin", 1), ("obj-clap", 1)),
        }
        if direct_input_lines.intersection(line_pairs):
            raise ValueError(f"{name}: CLAP input bypasses the monitor/mute path")
        if "obj-sum" in boxes or "obj-half" in boxes:
            raise ValueError(f"{name}: legacy mono downmix is still present")
        meter = boxes["obj-input-meter"]
        if (meter.get("maxclass") != "live.gain~"
                or meter.get("channels") != 2
                or meter.get("orientation") != 1
                or meter.get("ignoreclick") != 0
                or meter.get("tricolor") == COLOR_BACKGROUND
                or meter.get("trioncolor") != meter.get("tricolor")
                or meter.get("presentation_rect") != [16.0, 121.0, 268.0, 32.0]):
            raise ValueError(f"{name}: stereo input gain is not the expected live.gain~")
        meter_state = meter["saved_attribute_attributes"]["valueof"]
        expected_gain_name = (
            "Path Input Gain" if name.endswith("Path Encoder")
            else "Source Input Gain"
        )
        if (meter_state.get("parameter_longname") != expected_gain_name
                or meter_state.get("parameter_initial") != [0]):
            raise ValueError(f"{name}: stereo input gain is not stored at unity")

        if name == "s3g CLAP 3OA Source":
            stereo_parameter_lines = {
                (("obj-route-status", 2), ("obj-source-getparams", 0)),
                (("obj-source-getparams", 0), ("obj-clap", 0)),
                (("obj-clap", status_outlet),
                 ("obj-source-route-paraminfo", 0)),
                (("obj-source-route-paraminfo", 0),
                 ("obj-source-split-paraminfo", 0)),
                (("obj-source-split-paraminfo", 1),
                 ("obj-source-param-id", 0)),
                (("obj-source-param-id", 0),
                 ("obj-source-input-count-id", 1)),
                (("obj-source-split-paraminfo", 0),
                 ("obj-source-input-count-name", 0)),
                (("obj-source-input-count-name", 0),
                 ("obj-source-is-input-count", 0)),
                (("obj-source-is-input-count", 0),
                 ("obj-source-input-count-id", 0)),
                (("obj-source-input-count-id", 0),
                 ("obj-source-set-input-count", 0)),
                (("obj-source-set-input-count", 0), ("obj-clap", 0)),
            }
            if not stereo_parameter_lines.issubset(line_pairs):
                raise ValueError(
                    f"{name}: automatic stereo Input Count path is incomplete"
                )
            if boxes["obj-route-status"]["text"] != (
                    "route latency error loaded paramchanged state statechanged"):
                raise ValueError(f"{name}: loaded CLAP status is not routed")
            if boxes["obj-source-is-input-count"]["text"] != 'sel "Input Count"':
                raise ValueError(f"{name}: Input Count is not matched by exact name")
            if boxes["obj-source-set-input-count"]["text"] != "paramid $1 2":
                raise ValueError(f"{name}: encoder Input Count is not fixed to stereo")
        for channel in (1, 2):
            mute = boxes[f"obj-input-mute-{channel}"]
            state = mute["saved_attribute_attributes"]["valueof"]
            if (mute.get("maxclass") != "live.text"
                    or mute.get("text") != f"{channel} LIVE"
                    or mute.get("texton") != f"{channel} MUTE"
                    or mute.get("activebgcolor") == mute.get("activebgoncolor")
                    or state.get("parameter_initial") != [0]
                    or state.get("parameter_enum") != ["Live", "Mute"]):
                raise ValueError(f"{name}: input {channel} mute is not explicit")
        source_parameters = patcher["parameters"]
        expected_input_parameters = {
            "obj-input-meter", "obj-input-mute-1", "obj-input-mute-2"
        }
        if not expected_input_parameters.issubset(source_parameters):
            raise ValueError(f"{name}: input monitor controls are not stored")
    if name in (
        "s3g CLAP 3OA Source",
        "s3g CLAP 3OA Path Encoder",
        "s3g CLAP 3OA Insert",
    ):
        chain = boxes["obj-chain"]
        if (chain.get("maxclass") != "live.text"
                or chain.get("text") != "NEXT OFF"
                or chain.get("texton") != "NEXT ON"
                or chain.get("activebgcolor") == chain.get("activebgoncolor")
                or chain.get("activetextcolor") == chain.get("activetextoncolor")):
            raise ValueError(f"{name}: NEXT state button lacks explicit contrast")
        chain_state = chain["saved_attribute_attributes"]["valueof"]
        if (chain_state.get("parameter_initial") != [0]
                or chain_state.get("parameter_enum") != ["Off", "On"]):
            raise ValueError(f"{name}: NEXT state parameter is not an off/on toggle")
    required = {"obj-plugsync", "obj-transport-pack", "obj-transport",
                "obj-latency-message", "obj-thispatcher", "obj-delayed-load"}
    if not required.issubset(boxes):
        raise ValueError(f"{name}: missing transport or latency forwarding")
    e4l_objects = [
        entry.get("text", "") for entry in boxes.values()
        if entry.get("text", "").startswith("e4l.")
    ]
    if e4l_objects:
        raise ValueError(f"{name}: still instantiates E4L objects: {e4l_objects}")
    if name.endswith("Main Out"):
        selectors = [
            boxes[f"obj-output-selector-{pair_index}"]
            for pair_index in range(1, 17)
        ]
        if any(
            selector.get("name") != "s3g.live.routing.channel_selector.maxpat"
            or selector.get("args") != [pair_index]
            or selector.get("presentation_rect", [0, 0, 0, 0])[2:] != [64.0, 16.0]
            for pair_index, selector in enumerate(selectors, 1)
        ):
            raise ValueError(f"{name}: invalid hardware-output pair selectors")
        selector_positions = {
            (
                selector["presentation_rect"][0],
                selector["presentation_rect"][1],
            )
            for selector in selectors
        }
        if (len({x for x, _ in selector_positions}) != 4
                or len({y for _, y in selector_positions}) != 4):
            raise ValueError(f"{name}: output selectors are not a compact 4x4 matrix")
        required_output_lines = {
            (("obj-plugin", 0), ("obj-plugout", 0)),
            (("obj-plugin", 1), ("obj-plugout", 1)),
            (("obj-once", 0), ("obj-output-init", 0)),
        }
        required_output_lines.update(
            (("obj-plugin", channel + 2), ("obj-clap", channel))
            for channel in range(16)
        )
        required_output_lines.update(
            (("obj-clap", channel), ("obj-plugout", channel + 2))
            for channel in range(32)
        )
        required_output_lines.update(
            (("obj-device", 0), (f"obj-output-selector-{pair_index}", 0))
            for pair_index in range(1, 17)
        )
        if not required_output_lines.issubset(line_pairs):
            raise ValueError(f"{name}: incomplete direct hardware-output routing")
        initializer_text = json.dumps(boxes["obj-output-init"])
        if 'routing_type \\"Ext. Out\\"' not in initializer_text:
            raise ValueError(f"{name}: output pairs are not initialized for Ext. Out")
        if 'routing_channel \\"No Output\\"' not in initializer_text:
            raise ValueError(f"{name}: output pairs lack a safe initial route")

    if fixed_parameter_ids:
        if boxes["obj-route-status"]["text"] != (
                "route latency error loaded paramchanged paraminfo state "
                "statechanged"):
            raise ValueError(f"{name}: fixed parameter statuses are not routed")
        if boxes["obj-param-gate"]["text"] != "gate 1 0":
            raise ValueError(f"{name}: parameter output gate is not load-safe")
        fixed_lines = {
            (("obj-route-status", 2), ("obj-param-loaded-trigger", 0)),
            (("obj-route-status", 3), ("obj-paramchanged-route", 0)),
            (("obj-route-status", 4), ("obj-paraminfo-skip-index", 0)),
            (("obj-param-enable", 0), ("obj-param-gate", 0)),
            (("obj-param-gate", 0), ("obj-clap", 0)),
            (("obj-param-getparams", 0), ("obj-clap", 0)),
        }
        if not fixed_lines.issubset(line_pairs):
            raise ValueError(f"{name}: fixed parameter synchronization is incomplete")
        for parameter_id in fixed_parameter_ids:
            parameter_object_id = f"obj-param-{parameter_id}"
            parameter = boxes[parameter_object_id]
            reflect_message = boxes[f"obj-param-reflect-{parameter_id}"]
            state = parameter["saved_attribute_attributes"]["valueof"]
            if (parameter.get("maxclass") != "live.numbox"
                    or parameter.get("parameter_enable") != 1
                    or state.get("parameter_invisible") != 0
                    or parameter_object_id not in patcher["parameters"]):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} is not Live-visible"
                )
            if reflect_message.get("text") != "set $1":
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} does not use "
                    "feedback-safe reflection"
                )
            parameter_lines = {
                ((parameter_object_id, 0),
                 (f"obj-param-message-{parameter_id}", 0)),
                ((f"obj-param-message-{parameter_id}", 0),
                 ("obj-param-gate", 1)),
                ((parameter_object_id, 0),
                 ("obj-state-change-bang", 0)),
                (("obj-paramchanged-route", fixed_parameter_ids.index(parameter_id)),
                 (f"obj-param-reflect-{parameter_id}", 0)),
                ((f"obj-paraminfo-value-{parameter_id}", 0),
                 (f"obj-param-reflect-{parameter_id}", 0)),
                ((f"obj-param-reflect-{parameter_id}", 0),
                 (parameter_object_id, 0)),
            }
            if not parameter_lines.issubset(line_pairs):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} has incomplete wiring"
                )
        for topology_index, (parameter_id, value) in enumerate(fixed_topology, 1):
            topology_id = f"obj-param-topology-{topology_index}"
            if (boxes[topology_id]["text"] != f"paramid {parameter_id} {value}"
                    or ((topology_id, 0), ("obj-clap", 0)) not in line_pairs):
                raise ValueError(f"{name}: fixed topology is not enforced")


def main() -> int:
    for name, values in EXPECTED.items():
        validate(name, *values)
    installer = (ROOT / "scripts/install-live-devices.sh").read_text(
        encoding="utf-8"
    )
    missing_installer_devices = [
        name for name in EXPECTED
        if f'"{name}.amxd"' not in installer
    ]
    if missing_installer_devices:
        raise ValueError(
            "Live installer omits generated devices: "
            + ", ".join(missing_installer_devices)
        )
    routing_files = [
        "bus/s3g.bus.send.maxpat",
        "bus/s3g.bus.insert.maxpat",
        "bus/s3g.bus.receive.maxpat",
        "bus/s3g.bus.chain_index.maxpat",
        "bus/s3g.bus.clear_device_outputs.maxpat",
        "live/s3g.live.thisdevice.maxpat",
        "live/s3g.live.routing.channel_selector.maxpat",
        "live/s3g.live.routing.maxpat",
        "live/s3g.live.object.maxpat",
        "live/s3g.live.device_track.maxpat",
        "live/s3g.live.once.maxpat",
        "live/s3g.live.count_aux_inputs.maxpat",
        "live/s3g.dict.list.maxpat",
    ]
    missing = [name for name in routing_files if not (ROUTING_ROOT / name).is_file()]
    if missing:
        raise ValueError("missing s3g routing files: " + ", ".join(missing))

    if (ROOT / "package" / "patchers" / "e4l-compat").exists():
        raise ValueError("legacy e4l-named abstractions remain on the Max package search path")

    for relative in routing_files:
        document = json.loads((ROUTING_ROOT / relative).read_text(encoding="utf-8"))
        text = json.dumps(document)
        if "e4l." in text.lower():
            raise ValueError(f"{relative}: runtime routing still uses the e4l namespace")
        credits = [
            entry["box"].get("text", "")
            for entry in document["patcher"]["boxes"]
            if entry["box"].get("id") == "obj-s3g-envelop-credit"
        ]
        if (len(credits) != 1 or "Envelop for Live" not in credits[0]
                or "LGPL-2.1" not in credits[0]):
            raise ValueError(f"{relative}: missing in-patcher Envelop attribution")

    vendor_licenses = [
        VENDOR_ROOT / "bus" / "LICENSE.txt",
        VENDOR_ROOT / "live" / "LICENSE.txt",
    ]
    if not all(path.is_file() for path in vendor_licenses):
        raise ValueError("vendored Envelop source or LGPL license is missing")

    receiver = json.loads(
        (ROUTING_ROOT / "bus/s3g.bus.receive.maxpat").read_text(encoding="utf-8")
    )
    receiver_text = json.dumps(receiver)
    if "CheckFirstTrackDevice" in receiver_text or "must come first" in receiver_text:
        raise ValueError("s3g receiver still contains the E4L placement guard")
    if "r s3g.bus.syn" not in receiver_text or "s s3g.bus.ack" not in receiver_text:
        raise ValueError("s3g receiver lost its private bus handshake")

    sender_text = (ROUTING_ROOT / "bus/s3g.bus.send.maxpat").read_text(
        encoding="utf-8"
    )
    if "s s3g.bus.syn" not in sender_text or "r s3g.bus.ack" not in sender_text:
        raise ValueError("s3g sender lost its private bus handshake")

    selector = json.loads(
        (ROUTING_ROOT / "live/s3g.live.routing.channel_selector.maxpat")
        .read_text(encoding="utf-8")
    )
    selector_boxes = {
        entry["box"]["id"]: entry["box"]
        for entry in selector["patcher"]["boxes"]
    }
    if selector_boxes["obj-20"].get("presentation_rect") != [0.0, -2.0, 64.0, 20.0]:
        raise ValueError("output routing menu does not fit the compact device matrix")
    if selector_boxes["obj-11"].get("presentation_rect") != [0.0, 0.0, 64.0, 16.0]:
        raise ValueError("output routing menu background has unexpected bounds")
    print("validated 5 generated M4L devices and native s3g routing layer")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (KeyError, TypeError, ValueError, json.JSONDecodeError) as error:
        print(error, file=sys.stderr)
        raise SystemExit(1)
