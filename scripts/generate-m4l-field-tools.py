#!/usr/bin/env python3
"""Generate the next six fixed 36-slot Ambisonic field-tool wrappers.

The shared Bus Receive/Send devices own cross-track routing. A 64-channel
CLAP descriptor is hosted on its first 36 lanes here; the Live controls for
order start at 5OA so a new instance fits that transport without changing
the plug-in's own descriptor or a restored state.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_m4l_field_effects", ROOT / "scripts/generate-m4l-extra-effects.py"
)
assert spec is not None and spec.loader is not None
effects = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = effects
spec.loader.exec_module(effects)
base = effects.base
P = base.FixedParameter


# Name, installed CLAP bundle name, stable descriptor ID, I/O width exposed in
# Live, and selected stable parameter IDs/ranges from s3g-dsp's descriptors.
FIELD_TOOLS = (
    (
        "s3g Ambi Transform Depth 16", "s3g Ambi Transform Depth 16",
        "org.s3g.s3g-dsp.ambi-depth-16", 16,
        (P(1, "Depth", "Depth", -1, 1, 0),
         P(3, "Focus", "Focus", -1, 1, 0),
         P(8, "Tail", "Tail", 0, 1, 0),
         P(7, "Output", "Output", -60, 12, 0)),
    ),
    (
        "s3g Ambi Transform Rot 64", "s3g Ambi Transform Rot 64",
        "org.s3g.s3g-dsp.ambisonic-rotate-64", 36,
        (P(1, "Ambisonic Order", "Order", 1, 7, 5, "int"),
         P(2, "Yaw", "Yaw", -180, 180, 0),
         P(3, "Pitch", "Pitch", -90, 90, 0),
         P(4, "Roll", "Roll", -180, 180, 0)),
    ),
    (
        "s3g Ambi Transform Order Band 64",
        "s3g Ambi Transform Order Band 64",
        "org.s3g.s3g-dsp.ambisonic-order-band-tool-64", 36,
        (P(1, "Active Order", "Order", 1, 7, 5, "int"),
         P(2, "Weighting", "Weight", 0, 3, 0, "enum",
           ("Flat", "MaxRE", "In-phase", "Custom")),
         P(3, "Weighting Amount", "Amount", 0, 1, 1),
         P(4, "Output Gain", "Output", -60, 12, 0)),
    ),
    (
        "s3g Processor Ambi Imprint 64", "s3g Processor Ambi Imprint 64",
        "org.s3g.s3g-dsp.ambi-imprint-64", 36,
        (P(1, "Order", "Order", 1, 7, 5, "int"),
         P(2, "Mix", "Mix", 0, 1, .5),
         P(3, "Directional Focus", "Focus", 0, 1, 1),
         P(5, "Output Gain", "Output", -60, 12, 0)),
    ),
    (
        "s3g Analyzer Meter 64", "s3g Analyzer Meter 64",
        "org.s3g.s3g-dsp.multichannel-meter-64", 36,
        (P(1, "Visible Channels", "Channels", 1, 64, 36, "int"),
         P(2, "Meter View", "View", 0, 2, 0, "enum",
           ("Grid", "Field", "Heat"))),
    ),
    (
        "s3g Analyzer Ambi Energy 64", "s3g Analyzer Ambi Energy 64",
        "org.s3g.s3g-dsp.ambisonic-energy-visualizer-64", 36,
        (P(2, "Map", "Map", 0, 7, 0, "enum",
           ("Field", "Blue", "Ink", "Volt", "Classic", "Inferno",
            "Viridis", "Magma")),),
    ),
)


def main() -> None:
    for name, bundle_name, plugin_id, channels, parameters in FIELD_TOOLS:
        document = effects.make_effect(
            name.removeprefix("s3g "), bundle_name, plugin_id, channels,
            parameters, input_channels=channels, device_name=name,
        )
        patch = document["patcher"]
        patch["tags"] = "s3g CLAP fixed multichannel field tool"
        patch["description"] = (
            f"Fixed {bundle_name} wrapper. Reads the first {channels} auxiliary "
            "slots from a preceding s3g Bus Receive 36 and publishes the "
            f"first {channels} output slots to the next device. Follow with "
            f"Bus Send 36 set to INPUT=CHAIN 36 and CH={channels}; there is no "
            "embedded receive or hardware output. The normal Live stereo "
            "lane remains silent after Bus Receive."
        )
        if channels == 36:
            patch["description"] += (
                " This 64-channel CLAP descriptor is limited to 36 lanes "
                "and at most 5OA in this workflow."
            )
        patch["digest"] = patch["description"]
        base.write_device(name, document, arrange=False)


if __name__ == "__main__":
    main()
