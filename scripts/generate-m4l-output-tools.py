#!/usr/bin/env python3
"""Generate 32-slot Live profiles of fixed 64-channel speaker-output CLAPs."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location(
    "s3g_m4l_output_effects", ROOT / "scripts/generate-m4l-extra-effects.py",
)
assert spec is not None and spec.loader is not None
effects = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = effects
spec.loader.exec_module(effects)
base = effects.base
P = base.FixedParameter


OUTPUT_TOOLS = (
    (
        "s3g Matrix Upmix 64", "org.s3g.s3g-dsp.format-upscale-64",
        (
            P(6, "Upscale Amount", "Amount", 0, 100, 100),
            P(13, "Output Gain", "Output", -24, 12, 0),
        ),
        "Choose input and output formats with no more than 32 active channels. "
        "Formats and custom layouts above 32 channels cannot pass through this "
        "Live profile; the plug-in's 64-channel descriptor is unchanged.",
    ),
    (
        "s3g Output Crossover 64", "org.s3g.s3g-dsp.sub-crossover",
        (
            P(6, "Cutoff", "Cutoff", 20, 240, 90),
            P(8, "Sub Gain", "Sub Gain", -60, 18, 0),
            P(9, "High Gain", "High Gain", -60, 18, 0),
        ),
        "Use at most 32 total output slots: High Channels must fit in 1-32 "
        "and Sub Offset + Sub Count - 1 must be no greater than 32. "
        "Subwoofer outputs placed above slot 32 are inaudible in this Live "
        "profile; the plug-in's 64-channel descriptor is unchanged.",
    ),
)


def add_live_limit(document: dict[str, object]) -> None:
    patch = document["patcher"]
    patch["boxes"].append(base.box(
        "obj-live-limit", "comment", [2050.0, 100.0, 165.0,
                                       base.CONTROL_HEIGHT],
        text="LIVE: 32 IN / OUT",
        presentation_rect=[12.0, 45.0, 165.0, base.CONTROL_HEIGHT],
        fontname=base.UI_FONT, fontsize=base.UI_FONT_SIZE,
        textcolor=base.COLOR_DIM, ignoreclick=1,
    ))
    width = base.fit_presentation_width(patch["boxes"], 300.0)
    patch["devicewidth"] = width
    patch["openrect"][2] = width


def main() -> None:
    for name, plugin_id, parameters, limitation in OUTPUT_TOOLS:
        document = effects.make_effect(
            name.removeprefix("s3g "), name, plugin_id, 32,
            parameters, input_channels=32, device_name=name,
        )
        patch = document["patcher"]
        patch["tags"] = "s3g CLAP fixed speaker output, 32-slot Live profile"
        patch["description"] += " " + limitation
        patch["digest"] = patch["description"]
        add_live_limit(document)
        base.write_device(name, document, arrange=False)


if __name__ == "__main__":
    main()
