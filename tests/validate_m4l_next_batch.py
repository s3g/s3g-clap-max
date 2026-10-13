#!/usr/bin/env python3
"""Validate the fixed Processor, Macro, and Sample M4L device batch."""

from __future__ import annotations

import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]

# name: (stable CLAP ID, audio inputs, audio outputs, exposed parameter IDs)
SPECS = {
    "s3g Processor Conduit 2": (
        "org.s3g.s3g-dsp.processor-conduit", 2, 2, {3, 10, 11}),
    "s3g Processor Formant Matrix 2": (
        "org.s3g.s3g-dsp.formant-matrix", 2, 2, {9, 15, 24}),
    "s3g Processor Errant 2": (
        "org.s3g.s3g-dsp.processor-errant", 0, 2, {4, 6, 17}),
    "s3g Processor LF Synth 2": (
        "org.s3g.s3g-dsp.low-frequency-synth", 0, 2, {4, 24, 21}),
    "s3g Processor Lowform 2": (
        "org.s3g.s3g-dsp.processor-lowform", 0, 2, {11, 20, 1}),
    "s3g Processor Stack 2": (
        "org.s3g.s3g-dsp.processor-stack", 0, 2, {13, 19, 26}),
    "s3g Macro Delay 8": (
        "org.s3g.s3g-dsp.macro-delay-8ch", 8, 8, {1, 2, 9, 10}),
    "s3g Macro Delay 24": (
        "org.s3g.s3g-dsp.macro-delay-24ch", 24, 24, {1, 2, 9, 10}),
    "s3g Macro Pitch 8": (
        "org.s3g.s3g-dsp.macro-pitch-8ch", 8, 8, {1, 2, 9, 10}),
    "s3g Macro Pitch 24": (
        "org.s3g.s3g-dsp.macro-pitch-24ch", 24, 24, {1, 2, 9, 10}),
    "s3g Macro Fracture Mono 1": (
        "org.s3g.s3g-dsp.macro-fracture-mono", 1, 1, {3, 4, 13, 14}),
    "s3g Macro Fracture 8": (
        "org.s3g.s3g-dsp.macro-fracture-8ch", 8, 8, {3, 4, 13, 14}),
    "s3g Macro Fracture 24": (
        "org.s3g.s3g-dsp.macro-fracture-24ch", 24, 24, {3, 4, 13, 14}),
    "s3g Macro Shred Mono 1": (
        "org.s3g.s3g-dsp.macro-shred-mono", 1, 1, {2, 3, 4, 14}),
    "s3g Macro Shred 8": (
        "org.s3g.s3g-dsp.macro-shred-8ch", 8, 8, {2, 3, 4, 14}),
    "s3g Macro Shred 24": (
        "org.s3g.s3g-dsp.macro-shred-24ch", 24, 24, {2, 3, 4, 14}),
    "s3g Sample Cutups 32": (
        "org.s3g.s3g-dsp.sample-cutups-32", 0, 32, {1, 4, 20}),
    "s3g Sample Grains 32": (
        "org.s3g.s3g-dsp.sample-grains-32", 0, 32, {1, 48, 49}),
    "s3g Sample Kit 32": (
        "org.s3g.s3g-dsp.sample-kit", 0, 32, {1, 2, 5}),
    "s3g Sample Lanes 32": (
        "org.s3g.s3g-dsp.sample-lanes-32", 0, 32, {1, 4, 20}),
    "s3g Sample Motion 32": (
        "org.s3g.s3g-dsp.sample-motion-32", 0, 32, {1, 8, 19}),
    "s3g Sample Player 16": (
        "org.s3g.s3g-dsp.sample-player-16", 0, 16, {6, 13}),
    "s3g Sample Rings 8": (
        "org.s3g.s3g-dsp.sample-rings-8", 8, 8, {1, 8, 13}),
    "s3g Sample Slicer 2": (
        "org.s3g.s3g-dsp.breakbeat-slicer-stereo", 0, 2, {1, 2}),
    "s3g Sample Slicer 16": (
        "org.s3g.s3g-dsp.breakbeat-slicer", 0, 16, {1, 2}),
    "s3g Sample Wavesets 32": (
        "org.s3g.s3g-dsp.sample-wavesets-32", 0, 32, {1, 11, 17}),
}

SAMPLE_BUNDLE_REFERENCES = {
    **{f"s3g Sample {kind} 32": f"s3g Sample {kind} 2"
       for kind in ("Cutups", "Grains", "Lanes", "Motion", "Wavesets")},
    "s3g Sample Player 16": "s3g Sample Player 2",
    "s3g Sample Slicer 2": "s3g Sample Slicer 16",
}


def routes(patch: dict[str, object]) -> set[tuple[str, int, str, int]]:
    return {(*entry["patchline"]["source"],
             *entry["patchline"]["destination"])
            for entry in patch["lines"]}


def validate(name: str, plugin_id: str, inputs: int, outputs: int,
             parameter_ids: set[int]) -> None:
    source = ROOT / "source/m4l" / f"{name}.maxpat"
    device = ROOT / "package/devices" / f"{name}.amxd"
    raw = source.read_bytes()
    data = device.read_bytes()
    assert data[:4] == b"ampf" and data[32:] == raw + b"\0", name
    assert struct.unpack_from("<I", data, 28)[0] == len(raw) + 1, name
    patch = json.loads(raw)["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    lines = routes(patch)
    assert len(boxes) == len(patch["boxes"]), name
    assert boxes["obj-clap"]["text"] == f"s3g.clap~ {inputs} {outputs}", name
    bundle_reference = SAMPLE_BUNDLE_REFERENCES.get(name, name)
    assert boxes["obj-default-open"]["text"] == (
        f'openifempty "{bundle_reference}" {plugin_id}'), name
    assert boxes["obj-clap-state"]["saved_object_attributes"][
        "parameter_enable"] == 1, name
    assert ("obj-device", 0, "obj-state-restore-init", 0) in lines, name
    assert ("obj-clap", outputs, "obj-route-status", 0) in lines, name
    for source_id, outlet, destination_id, inlet in lines:
        assert source_id in boxes and destination_id in boxes, name
        assert 0 <= outlet < boxes[source_id]["numoutlets"], name
        assert 0 <= inlet < boxes[destination_id]["numinlets"], name
    for parameter_id in parameter_ids:
        control = f"obj-param-{parameter_id}"
        assert boxes[control]["parameter_enable"] == 1, name
        assert control in patch["parameters"], name
        assert boxes[f"obj-param-message-{parameter_id}"]["text"] == (
            f"automateparamid {parameter_id} $1"), name
        assert (control, 0, f"obj-param-message-{parameter_id}", 0) in lines
    assert {int(item.removeprefix("obj-param-")) for item in boxes
            if item.startswith("obj-param-") and item[10:].isdigit()} == parameter_ids, name

    if outputs > 2:
        assert boxes["obj-plugout"]["numinlets"] == 38, name
        assert boxes["obj-bus-insert"]["text"] == "s3g.bus.insert", name
        assert boxes["obj-next-send"]["text"] == (
            "s3g.bus.send s3g-chain-next"), name
        assert "obj-bus-receive" not in boxes, name
        assert ("obj-start-route", 1, "obj-bus-insert", 0) in lines, name
        for channel in range(outputs):
            assert ("obj-clap", channel, "obj-plugout", channel + 2) in lines
        if inputs:
            for channel in range(2):
                assert ("obj-plugin", channel, "obj-plugout", channel) in lines
    else:
        assert boxes["obj-plugout"]["numinlets"] == 2, name
        assert "obj-next-send" not in boxes, name
        if outputs == 1:
            assert all(("obj-clap", 0, "obj-plugout", channel) in lines
                       for channel in range(2)), name
            assert ("obj-plugin", 0, "obj-mono-sum", 0) in lines, name
            assert ("obj-plugin", 1, "obj-mono-sum", 1) in lines, name
            assert ("obj-mono-sum", 0, "obj-mono-half", 0) in lines, name
            assert ("obj-mono-half", 0, "obj-clap", 0) in lines, name
        else:
            for channel in range(2):
                assert ("obj-clap", channel, "obj-plugout", channel) in lines

    if inputs > 2:
        assert boxes["obj-plugin"]["numoutlets"] == 38, name
        for channel in range(inputs):
            assert ("obj-plugin", channel + 2, "obj-clap", channel) in lines
    elif inputs == 2:
        for channel in range(2):
            assert ("obj-plugin", channel, "obj-clap", channel) in lines
    elif inputs == 0:
        assert "obj-plugin" not in boxes, name

    if inputs == 0 or name == "s3g Sample Rings 8":
        assert boxes["obj-midi-in"]["text"] == "midiin", name
        assert ("obj-midi-parse", 7, "obj-clap", 0) in lines, name
        for action in ("play", "kill"):
            assert (f"obj-{action}-button", 0,
                    f"obj-{action}-message", 0) in lines, name
            assert (f"obj-{action}-message", 0, "obj-clap", 0) in lines, name

    # The presentation background is a non-interactive backdrop; its
    # patching rectangle can overlap the Tracker MIDI lane after augmentation.
    entries = [box for box in boxes.values()
               if box["id"] != "obj-ui-background"]
    for index, first in enumerate(entries):
        x, y, width, height = first["patching_rect"]
        for second in entries[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            assert not (min(x + width, sx + sw) > max(x, sx)
                        and min(y + height, sy + sh) > max(y, sy)), (
                name, first["id"], second["id"])


def main() -> None:
    assert len(SPECS) == 26
    for name, values in SPECS.items():
        validate(name, *values)
    for excluded in ("s3g Sample Neon 32", "s3g Sample Decks 32"):
        assert not (ROOT / "source/m4l" / f"{excluded}.maxpat").exists()
        assert not (ROOT / "package/devices" / f"{excluded}.amxd").exists()
    print(f"validated {len(SPECS)} new fixed M4L wrappers")


if __name__ == "__main__":
    main()
