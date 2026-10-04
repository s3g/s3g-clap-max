#!/usr/bin/env python3
"""Build opt-in Ambi wrappers for the explicit 36-channel Live bus workflow.

The existing 3OA devices remain untouched while the new chain is tested in
Live.  This deliberately reuses their stable CLAP/state/automation controls;
only the audio topology and obsolete embedded bus controls are changed.
"""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import re
import sys


ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / "scripts/generate-m4l-devices.py"
spec = importlib.util.spec_from_file_location("s3g_m4l_generator", GENERATOR)
assert spec is not None and spec.loader is not None
generator = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = generator
spec.loader.exec_module(generator)

BUS_CHANNELS = 36
LIVE_CHANNELS = BUS_CHANNELS + 2


def channels_object(object_id: str, kind: str, count: int) -> dict[str, object]:
    return generator.new_object(
        object_id, f"{kind} " + " ".join(map(str, range(1, count + 1))),
        40.0, 180.0 if kind == "plugin~" else 365.0,
        610.0, count, count, ["signal"] * count,
    )


def rewrite_channels(box: dict[str, object], kind: str, count: int) -> None:
    box["text"] = f"{kind} " + " ".join(map(str, range(1, count + 1)))
    box["numinlets"] = count
    box["numoutlets"] = count
    box["outlettype"] = ["signal"] * count


def rewrite_clap(box: dict[str, object], inputs: int, outputs: int) -> None:
    box["text"] = f"s3g.clap~ {inputs} {outputs}"
    # Even a zero-audio-input instrument retains inlet 0 for control/MIDI.
    box["numinlets"] = max(1, inputs)
    box["numoutlets"] = outputs + 1
    box["outlettype"] = ["signal"] * outputs + ["list"]


def rewrite_gain(box: dict[str, object], count: int) -> None:
    box["channels"] = count
    box["numinlets"] = count
    box["numoutlets"] = count + 3
    box["outlettype"] = ["signal"] * count + ["", "float", "list"]
    box["saved_attribute_attributes"]["valueof"]["parameter_shortname"] = "Ambi Gain"


def convert(name: str, document: dict[str, object]) -> tuple[str, dict[str, object]]:
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    old_inputs, old_outputs = map(int, boxes["obj-clap"]["text"].split()[1:])
    new_name = name.replace("s3g 3OA", "s3g Ambi", 1)
    is_decoder = " Decoder " in name
    is_source = name == "s3g 3OA Source"
    is_encoder = " Encoder " in name or is_source
    is_effect = " Effect " in name or name == "s3g 3OA Insert"
    is_multichannel_encoder = is_encoder and "obj-bus-receive" in boxes
    native_sixteen = is_source or (
        is_encoder and " 16\"" in boxes["obj-default-open"]["text"]
    )
    new_inputs = (
        BUS_CHANNELS if is_decoder or is_effect else old_inputs
    )
    new_outputs = (
        old_outputs if is_decoder or native_sixteen else BUS_CHANNELS
    )
    if new_inputs > 64 or new_outputs > 64:
        raise ValueError(f"{name}: CLAP channel budget exceeded")

    removed = {
        object_id for object_id in boxes
        if object_id in {"obj-chain", "obj-bus-send", "obj-bus-receive"}
        or object_id.startswith("obj-input-bus-")
        or (object_id.startswith("obj-param-topology-")
            and re.fullmatch(r"paramid \d+ 3(?:\.0+)?", str(boxes[object_id].get("text", ""))))
    }
    patch["boxes"] = [entry for entry in patch["boxes"]
                      if entry["box"]["id"] not in removed]
    for object_id in removed:
        patch.get("parameters", {}).pop(object_id, None)

    clap = boxes["obj-clap"]
    rewrite_clap(clap, new_inputs, new_outputs)
    if "obj-plugin" in boxes and (is_decoder or is_effect or is_multichannel_encoder):
        rewrite_channels(boxes["obj-plugin"], "plugin~", LIVE_CHANNELS)
    if not is_decoder:
        rewrite_channels(boxes["obj-plugout"], "plugout~", LIVE_CHANNELS)
    if is_decoder:
        rewrite_gain(boxes["obj-ambi-input-gain"], BUS_CHANNELS)
        patch["parameters"]["obj-ambi-input-gain"] = [
            "Ambisonic Input Gain", "Ambi Gain", 0,
        ]
        boxes["obj-rec-writer"]["text"] = f"sfrecord~ {BUS_CHANNELS}"
        boxes["obj-rec-writer"]["numinlets"] = BUS_CHANNELS
        boxes["obj-rec-default-name"]["text"] = "name s3g-ambi.wav"
        boxes["obj-rec-print"]["text"] = "print s3g-ambi-recorder"
        for object_id in ("obj-rec-file-button", "obj-rec-toggle"):
            annotation = boxes[object_id].get("annotation", "")
            boxes[object_id]["annotation"] = annotation.replace("16-channel", "36-channel")

    original_lines = patch["lines"]
    patch["lines"] = []
    for entry in original_lines:
        connection = entry["patchline"]
        source_id, source_outlet = connection["source"]
        destination_id, _ = connection["destination"]
        if source_id in removed or destination_id in removed:
            continue
        if source_id == "obj-clap" and source_outlet == old_outputs:
            connection["source"][1] = new_outputs
        if (source_id == "obj-clap" and destination_id == "obj-plugout"
                and not is_decoder):
            continue
        if (source_id == "obj-plugin" and destination_id == "obj-clap"
                and (is_effect or is_multichannel_encoder)):
            continue
        if is_decoder and (
            (source_id == "obj-plugin" and destination_id == "obj-ambi-input-gain")
            or (source_id == "obj-ambi-input-gain"
                and destination_id in {"obj-clap", "obj-rec-writer"})
        ):
            continue
        patch["lines"].append(entry)

    if is_decoder:
        for channel in range(BUS_CHANNELS):
            patch["lines"].extend((
                generator.line("obj-plugin", channel + 2, "obj-ambi-input-gain", channel),
                generator.line("obj-ambi-input-gain", channel, "obj-clap", channel),
                generator.line("obj-ambi-input-gain", channel, "obj-rec-writer", channel),
            ))
    else:
        if is_effect:
            for channel in range(BUS_CHANNELS):
                patch["lines"].append(generator.line(
                    "obj-plugin", channel + 2, "obj-clap", channel,
                ))
        elif is_multichannel_encoder:
            for channel in range(new_inputs):
                patch["lines"].append(generator.line(
                    "obj-plugin", channel + 2, "obj-clap", channel,
                ))
        for channel in range(new_outputs):
            patch["lines"].append(generator.line(
                "obj-clap", channel, "obj-plugout", channel + 2,
            ))

    if "obj-bus-insert" not in boxes:
        patch["boxes"].append(generator.new_object(
            "obj-bus-insert", "s3g.bus.insert", 470.0, 230.0,
            100.0, 1, 0,
        ))
        patch["lines"].append(generator.line(
            "obj-device", 0, "obj-bus-insert", 0,
        ))
    if not is_decoder:
        patch["boxes"].extend([
            generator.new_object("obj-next-trigger", "t l b", 470.0,
                                 260.0, 48.0, 1, 2, ["list", "bang"]),
            generator.box("obj-next-mode", "message", [530.0, 260.0, 30.0, 22.0],
                          text="1"),
            generator.new_object("obj-next-send", "s3g.bus.send s3g-chain-next",
                                 470.0, 300.0, 220.0, 3, 0),
        ])
        patch["lines"].extend([
            generator.line("obj-device", 0, "obj-next-trigger", 0),
            generator.line("obj-next-trigger", 1, "obj-next-mode", 0),
            generator.line("obj-next-mode", 0, "obj-next-send", 1),
            generator.line("obj-next-trigger", 0, "obj-next-send", 0),
        ])
    if new_name == "s3g Ambi Encoder Stochastic":
        # NEXT can be discovered before a later device has finished loading.
        # Replay only the routing ID after the receiving insert is ready;
        # never reopen CLAP or recall its saved state for this retry.
        patch["boxes"].extend([
            generator.new_object(
                "obj-device-startup-trigger", "t l l l", 1300.0, 750.0,
                60.0, 1, 3, ["list", "list", "list"],
            ),
            generator.new_object(
                "obj-status-trigger", "t l l", 500.0, 450.0,
                45.0, 1, 2, ["list", "list"],
            ),
            generator.new_object(
                "obj-next-retry-trigger", "t b l l", 1580.0, 700.0,
                60.0, 1, 3, ["bang", "list", "list"],
            ),
            generator.new_object(
                "obj-next-retry-delay", "delay 300", 1580.0, 770.0,
                72.0, 1, 1, ["bang"],
            ),
            generator.new_object(
                "obj-next-retry-store", "zl.reg", 1580.0, 840.0,
                54.0, 2, 2, ["", ""],
            ),
        ])
        patch["lines"] = [
            entry for entry in patch["lines"]
            if not (
                (entry["patchline"]["source"] == ["obj-device", 0]
                 and entry["patchline"]["destination"][0] in {
                     "obj-state-restore-init", "obj-bus-insert", "obj-next-trigger",
                 })
                or (entry["patchline"]["source"] == ["obj-route-status", 3]
                    and entry["patchline"]["destination"][0] in {
                        "obj-paramchanged-route", "obj-state-change-bang",
                    })
            )
        ]
        patch["lines"].extend([
            generator.line("obj-device", 0, "obj-device-startup-trigger", 0),
            generator.line("obj-device-startup-trigger", 2, "obj-state-restore-init", 0),
            generator.line("obj-device-startup-trigger", 1, "obj-bus-insert", 0),
            generator.line("obj-device-startup-trigger", 0, "obj-next-retry-trigger", 0),
            generator.line("obj-route-status", 3, "obj-status-trigger", 0),
            generator.line("obj-status-trigger", 1, "obj-paramchanged-route", 0),
            generator.line("obj-status-trigger", 0, "obj-state-change-bang", 0),
            generator.line("obj-next-retry-trigger", 2, "obj-next-retry-store", 1),
            generator.line("obj-next-retry-trigger", 1, "obj-next-trigger", 0),
            generator.line("obj-next-retry-trigger", 0, "obj-next-retry-delay", 0),
            generator.line("obj-next-retry-delay", 0, "obj-next-retry-store", 0),
            generator.line("obj-next-retry-store", 0, "obj-next-trigger", 0),
        ])

    patch["name"] = new_name
    patch["tags"] = "s3g CLAP Ambisonics explicit 36-channel bus"
    if is_decoder:
        patch["description"] = (
            "Takes 36 Ambisonic channels from the preceding s3g Bus Receive 36, "
            "records the post-gain bed, and decodes to Live stereo or hardware. "
            "No embedded named bus; maximum bus order is 5OA."
        )
    elif is_encoder:
        patch["description"] = (
            "Encodes to the next device on this track automatically. "
            "Use s3g Bus Receive 36 before multichannel-input encoders and "
            "s3g Bus Send 36 after the chain to reach another track. "
            + ("This CLAP has at most 16 Ambisonic outputs."
               if native_sixteen else "The 36-channel bus carries up to 5OA.")
        )
    else:
        patch["description"] = (
            "Processes the 36-channel Ambisonic chain and passes it to the "
            "next device on this track. Use explicit s3g Bus Send/Receive 36 "
            "devices for cross-track routing."
        )
    patch["digest"] = patch["description"]
    return new_name, document


def main() -> None:
    generator.write_device(
        "s3g Bus Send 36",
        generator.multichannel_to_bus_send_device(
            slot_count=generator.FIFTH_ORDER_SLOT_COUNT,
            bus_prefix="s3g-bus36",
            title="s3g Bus Send 36",
        ),
    )
    sources = sorted((ROOT / "source/m4l").glob("s3g 3OA *.maxpat"))
    if len(sources) < 40:
        raise RuntimeError(f"expected complete 3OA wrapper family, found {len(sources)}")
    for path in sources:
        name, document = convert(path.stem, json.loads(path.read_text(encoding="utf-8")))
        generator.write_device(name, document)
    print(f"generated {len(sources)} explicit-bus Ambi wrappers")


if __name__ == "__main__":
    main()
