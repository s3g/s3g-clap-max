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

COMPACT_HEIGHT = 169.0
MAIN_OUT_HEIGHT = 169.0
DEVICE_WIDTHS = {
    "s3g 3OA Source": 324.0,
    "s3g 3OA Encoder Path": 286.0,
    "s3g 3OA Encoder Point": 286.0,
    "s3g 3OA Encoder Cloud": 286.0,
    "s3g 3OA Encoder Surface Terrain": 286.0,
    "s3g 3OA Encoder Cartography": 324.0,
    "s3g 3OA Encoder Ray": 324.0,
    "s3g 3OA Encoder Ray Bilocation": 324.0,
    "s3g 3OA Encoder Modal": 324.0,
    "s3g 3OA Encoder Medium": 324.0,
    **{f"s3g 3OA Encoder {kind}": 268.0 for kind in (
        "Membrane Kick", "Acid", "Horizon", "VOT", "Vox",
        "Wave Terrain", "Stochastic", "Neural Ecology", "Pulsar",
        "Wind", "Water", "Pyrosphere", "Cryosphere", "Insect",
        "Wrangler",
    )},
    "s3g 3OA Insert": 268.0,
    **{f"s3g 3OA Effect {kind}": 268.0 for kind in (
        "DJ Filter", "Delay", "Pitch", "Gain", "Resonance Print",
        "Partial Trace", "Response Trace", "Displacement",
    )},
    "s3g 3OA Decoder Main": 700.0,
    "s3g 3OA Decoder Speaker Main": 700.0,
    "s3g 3OA Decoder Head Main": 196.0,
    "s3g 3OA Decoder Stereo Main": 196.0,
    "s3g 3OA Decoder Object Main": 700.0,
    "s3g 3OA Decoder Adaptive Main": 700.0,
    "s3g 3OA Decoder Sub Main": 700.0,
    **{f"s3g Panner {kind} Main": 700.0 for kind in (
        "Layout", "DBAP", "LBAP", "VBAP",
    )},
    "s3g Output Autogain Stereo": 196.0,
    "s3g Output Autogain Quad Main": 700.0,
    "s3g Send Stereo to 32ch Bus": 360.0,
    "s3g Send Multichannel to 32ch Bus": 648.0,
    "s3g Send Stereo to Drum 16ch Bus": 360.0,
    "s3g Multichannel Receive": 112.0,
    "s3g Bus Send 36": 648.0,
    "s3g Bus Receive 36": 267.0,
    **{f"s3g Drum {kind}": 240.0 for kind in (
        "Kick", "Snare", "Floor Tom", "Concert Bass", "Toms",
        "Hi-Hat", "Clap", "Cowbell", "Crash", "Break",
    )},
    "s3g Drum Overload": 240.0,
    "s3g Drum Echo": 240.0,
    "s3g Drum Mixer 16": 240.0,
    **{f"s3g Sample {kind} 2": 240.0 for kind in (
        "Player", "Doubles", "Wavesets", "Motion", "Lanes",
        "Grains", "Cutups",
    )},
    "s3g Sample Circulator 2": 240.0,
}
COLOR_BACKGROUND = [0.05098, 0.05098, 0.05098, 1.0]
COLOR_BUTTON = [0.20, 0.20, 0.20, 1.0]
COLOR_BUTTON_TEXT = [0.74, 0.74, 0.74, 1.0]
COLOR_ACCENT = [0.65, 0.65, 0.65, 1.0]
EDITOR_RECT = [12.0, 10.0, 64.0, 20.0]

EXPECTED = {
    "s3g 3OA Source": (
        18, "s3g.clap~ 2 16", 16,
        'openifempty "s3g Ambi Encoder Medium 16"', (), ()
    ),
    "s3g 3OA Encoder Path": (
        18, "s3g.clap~ 32 16", 16,
        (
            'openifempty "s3g Ambi Encoder Path 64" '
            "org.s3g.s3g-dsp.ambi-path-encoder-64"
        ),
        (1, 3, 4, 5, 6, 7, 8, 9, 10, 17, 18, 11, 12, 13, 14, 15, 19, 20, 16),
        ((2, 3),),
    ),
    "s3g 3OA Encoder Point": (
        18, "s3g.clap~ 32 16", 16,
        ('openifempty "s3g Ambi Encoder Point 64" '
         'org.s3g.s3g-dsp.ambi-point-encoder-64'),
        (29, 6, 7, 8, 14, 1000, 1001, 1002), ((28, 3),),
    ),
    "s3g 3OA Encoder Cloud": (
        18, "s3g.clap~ 32 16", 16,
        ('openifempty "s3g Ambi Encoder Cloud 64" '
         'org.s3g.s3g-dsp.ambi-cloud-encoder-64'),
        (1, 2, 3, 5, 6, 7, 9, 17), ((4, 3),),
    ),
    "s3g 3OA Encoder Surface Terrain": (
        18, "s3g.clap~ 32 16", 16,
        ('openifempty "s3g Ambi Encoder Surface Terrain 64" '
         'org.s3g.s3g-dsp.ambi-terrain-navigator-64'),
        (20, 30, 2, 3, 4, 5, 17), ((1, 3),),
    ),
    "s3g 3OA Encoder Cartography": (
        18, "s3g.clap~ 2 16", 16,
        ('openifempty "s3g Ambi Encoder Cartography 64" '
         'org.s3g.s3g-dsp.ambi-cartography-encoder-64'),
        (1, 4, 5, 7, 29), ((3, 3),),
    ),
    "s3g 3OA Encoder Ray": (
        18, "s3g.clap~ 1 16", 16,
        ('openifempty "s3g Ambi Encoder Ray 64" '
         'org.s3g.s3g-dsp.ambi-ray-encoder'),
        (2, 3, 4, 5, 6, 7, 13), ((1, 3),),
    ),
    "s3g 3OA Encoder Ray Bilocation": (
        18, "s3g.clap~ 1 16", 16,
        ('openifempty "s3g Ambi Encoder Ray Bilocation 64" '
         'org.s3g.s3g-dsp.ambi-ray-bilocation-encoder'),
        (2, 3, 4, 8, 9, 10, 26), ((1, 3),),
    ),
    "s3g 3OA Encoder Modal": (
        18, "s3g.clap~ 1 16", 16,
        ('openifempty "s3g Ambi Encoder Modal 16" '
         'org.s3g.s3g-dsp.accelerometer-field-encoder-16'),
        (2, 63, 30), ((28, 3), (29, 0)),
    ),
    "s3g 3OA Encoder Medium": (
        18, "s3g.clap~ 1 16", 16,
        ('openifempty "s3g Ambi Encoder Medium 16" '
         'org.s3g.s3g-dsp.ambi-encoder-medium-16'),
        (2, 3, 11), ((1, 3),),
    ),
    "s3g 3OA Encoder Membrane Kick": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Membrane Kick 16" '
         'org.s3g.s3g-dsp.ambi-encoder-membrane-kick-16'),
        (3, 6, 19), ((1, 3),),
    ),
    "s3g 3OA Encoder Acid": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Acid 16" '
         'org.s3g.s3g-dsp.ambi-encoder-acid-16'),
        (2, 9, 26), ((1, 3), (33, 0)),
    ),
    "s3g 3OA Encoder Horizon": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Horizon 64" '
         'org.s3g.s3g-dsp.ambi-horizon-encoder-64'),
        (5, 7, 24), ((2, 3),),
    ),
    "s3g 3OA Encoder VOT": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder VOT 64" '
         'org.s3g.s3g-dsp.ambi-vot-encoder-64'),
        (2, 7, 17), ((1, 3),),
    ),
    "s3g 3OA Encoder Vox": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Vox 64" '
         'org.s3g.s3g-dsp.ambi-vox-encoder-64'),
        (2, 34, 17), ((1, 3),),
    ),
    "s3g 3OA Encoder Wave Terrain": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Wave Terrain 64" '
         'org.s3g.s3g-dsp.ambi-wave-terrain-encoder-64'),
        (2, 9, 40), ((1, 3),),
    ),
    "s3g 3OA Encoder Stochastic": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Stochastic 64" '
         'org.s3g.s3g-dsp.ambi-stochastic-encoder-64'),
        (2, 4, 37), ((1, 3),),
    ),
    "s3g 3OA Encoder Neural Ecology": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Neural Ecology 64" '
         'org.s3g.s3g-dsp.ambi-neural-ecology-64'),
        (4, 5, 33), ((2, 3),),
    ),
    "s3g 3OA Encoder Pulsar": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Pulsar 64" '
         'org.s3g.s3g-dsp.ambi-pulsar-encoder-64'),
        (3, 5, 48), ((2, 3),),
    ),
    "s3g 3OA Encoder Wind": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Wind 64" '
         'org.s3g.s3g-dsp.ambi-wind-encoder-64'),
        (3, 4, 32), ((2, 3),),
    ),
    "s3g 3OA Encoder Water": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Water 64" '
         'org.s3g.s3g-dsp.ambi-water-encoder-64'),
        (3, 4, 34), ((2, 3),),
    ),
    "s3g 3OA Encoder Pyrosphere": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Pyrosphere 64" '
         'org.s3g.s3g-dsp.ambi-pyrosphere-encoder-64'),
        (3, 4, 32), ((2, 3),),
    ),
    "s3g 3OA Encoder Cryosphere": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Cryosphere 64" '
         'org.s3g.s3g-dsp.ambi-cryosphere-encoder-64'),
        (3, 4, 34), ((2, 3),),
    ),
    "s3g 3OA Encoder Insect": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Insect 64" '
         'org.s3g.s3g-dsp.ambi-insect-encoder-64'),
        (3, 5, 32), ((2, 3),),
    ),
    "s3g 3OA Encoder Wrangler": (
        18, "s3g.clap~ 0 16", 16,
        ('openifempty "s3g Ambi Encoder Wrangler 64" '
         'org.s3g.s3g-dsp.ambi-wrangler-encoder-64'),
        (3, 4, 32), ((2, 3),),
    ),
    "s3g 3OA Insert": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Gain 64"', (), ()
    ),
    "s3g 3OA Effect DJ Filter": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect DJ Filter 64" '
        'org.s3g.s3g-dsp.ambi-effect-dj-filter-64',
        (4, 8, 9), ((1, 3),),
    ),
    "s3g 3OA Effect Delay": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Delay 64" '
        'org.s3g.s3g-dsp.ambi-effect-delay-64',
        (4, 5, 11, 12), ((1, 3),),
    ),
    "s3g 3OA Effect Pitch": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Pitch 64" '
        'org.s3g.s3g-dsp.ambi-effect-pitch-64',
        (4, 11, 12), ((1, 3),),
    ),
    "s3g 3OA Effect Gain": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Gain 64" '
        'org.s3g.s3g-dsp.ambi-effect-gain-64',
        (4, 11, 12), ((1, 3),),
    ),
    "s3g 3OA Effect Resonance Print": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Resonance Print 64" '
        'org.s3g.s3g-dsp.ambi-effect-resonance-print-64',
        (12, 19, 20), ((1, 3),),
    ),
    "s3g 3OA Effect Partial Trace": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Partial Trace 64" '
        'org.s3g.s3g-dsp.ambi-effect-partial-trace-64',
        (8, 19, 20), ((1, 3),),
    ),
    "s3g 3OA Effect Response Trace": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Response Trace 64" '
        'org.s3g.s3g-dsp.ambi-effect-response-trace-64',
        (7, 19, 20), ((1, 3),),
    ),
    "s3g 3OA Effect Displacement": (
        18, "s3g.clap~ 16 16", 16,
        'openifempty "s3g Ambi Effect Displacement 64" '
        'org.s3g.s3g-dsp.ambi-effect-displacement-64',
        (4, 17, 13), ((15, 3),),
    ),
    "s3g 3OA Decoder Main": (
        34, "s3g.clap~ 16 32", 32,
        'openifempty "s3g Ambi Decoder Head 2"', (), ()
    ),
    "s3g 3OA Decoder Speaker Main": (
        34, "s3g.clap~ 16 32", 32,
        (
            'openifempty "s3g Ambi Decoder Speaker 64" '
            "org.s3g.s3g-dsp.ambi-speaker-decoder-64"
        ),
        (1, 2, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16),
        ((3, 3),),
    ),
    "s3g 3OA Decoder Head Main": (
        2, "s3g.clap~ 16 2", 2,
        'openifempty "s3g Ambi Decoder Head 2" '
        'org.s3g.s3g-dsp.ambisonic-head-decoder',
        (7, 11, 18), ((1, 3),),
    ),
    "s3g 3OA Decoder Stereo Main": (
        2, "s3g.clap~ 16 2", 2,
        'openifempty "s3g Ambi Decoder Stereo 2" '
        'org.s3g.s3g-dsp.ambisonic-stereo-decoder',
        (4, 6, 13), ((1, 3),),
    ),
    "s3g 3OA Decoder Object Main": (
        34, "s3g.clap~ 16 32", 32,
        'openifempty "s3g Ambi Decoder Object 64" '
        'org.s3g.s3g-dsp.ambi-object-decoder-64',
        (1, 6, 10), ((3, 3),),
    ),
    "s3g 3OA Decoder Adaptive Main": (
        34, "s3g.clap~ 16 32", 32,
        'openifempty "s3g Ambi Decoder Adaptive 64" '
        'org.s3g.s3g-dsp.ambi-adaptive-decoder-64',
        (1, 5, 10), ((3, 3),),
    ),
    "s3g 3OA Decoder Sub Main": (
        34, "s3g.clap~ 16 32", 32,
        'openifempty "s3g Ambi Decoder Sub 8" '
        'org.s3g.s3g-dsp.ambisonic-sub-decoder',
        (2, 3, 5), ((1, 3),),
    ),
}

ROUTING_DEVICES = (
    "s3g Send Stereo to 32ch Bus",
    "s3g Send Multichannel to 32ch Bus",
    "s3g Multichannel Receive",
    "s3g Bus Send 36",
    "s3g Bus Receive 36",
)
DRUM_INSTRUMENT_IDS = {
    "Kick": (1, 8, 26), "Snare": (1, 8, 26),
    "Floor Tom": (1, 8, 26), "Concert Bass": (1, 9, 28),
    "Toms": (1, 10, 26), "Hi-Hat": (1, 9, 26),
    "Clap": (1, 10, 26), "Cowbell": (1, 7, 26),
    "Crash": (1, 9, 26), "Break": (1, 4, 26),
}
DRUM_EFFECT_IDS = {"Overload": (3, 11, 12), "Echo": (3, 4, 12, 13)}
DRUM_DEVICES = (
    "s3g Send Stereo to Drum 16ch Bus",
    *(f"s3g Drum {kind}" for kind in DRUM_INSTRUMENT_IDS),
    *(f"s3g Drum {kind}" for kind in DRUM_EFFECT_IDS),
    "s3g Drum Mixer 16",
)
SAMPLE_INSTRUMENT_IDS = {
    "Player": (13, 6, 14),
    "Doubles": (1, 9, 11),
    "Wavesets": (1, 11, 17),
    "Motion": (1, 8, 19),
    "Lanes": (1, 4, 20),
    "Grains": (1, 48, 49),
    "Cutups": (1, 4, 20),
}
SAMPLE_INSTRUMENTS = tuple(
    f"s3g Sample {kind} 2" for kind in SAMPLE_INSTRUMENT_IDS
)
SAMPLE_CIRCULATOR = "s3g Sample Circulator 2"
PANNER_MAIN_IDS = {
    "Layout": "org.s3g.s3g-dsp.layout-panner",
    "DBAP": "org.s3g.s3g-dsp.dbap-panner",
    "LBAP": "org.s3g.s3g-dsp.lbap-panner",
    "VBAP": "org.s3g.s3g-dsp.vbap-panner",
}
PANNER_MAIN_DEVICES = tuple(
    f"s3g Panner {kind} Main" for kind in PANNER_MAIN_IDS
)
OUTPUT_AUTOGAIN_DEVICES = (
    "s3g Output Autogain Stereo",
    "s3g Output Autogain Quad Main",
)
CURRENT_AMBI_DEVICES = tuple(
    name.replace("s3g 3OA", "s3g Ambi", 1) for name in EXPECTED
)
MAIN_DEVICES = (
    "s3g 3OA Decoder Main",
    "s3g 3OA Decoder Speaker Main",
    "s3g 3OA Decoder Object Main",
    "s3g 3OA Decoder Adaptive Main",
    "s3g 3OA Decoder Sub Main",
)
STEREO_MAIN_DEVICES = (
    "s3g 3OA Decoder Head Main",
    "s3g 3OA Decoder Stereo Main",
)
EFFECT_DEVICES = tuple(f"s3g 3OA Effect {kind}" for kind in (
    "DJ Filter", "Delay", "Pitch", "Gain", "Resonance Print",
    "Partial Trace", "Response Trace", "Displacement",
))
MULTICHANNEL_ENCODERS = (
    "s3g 3OA Encoder Path",
    "s3g 3OA Encoder Point",
    "s3g 3OA Encoder Cloud",
    "s3g 3OA Encoder Surface Terrain",
)
TRACK_INPUT_ENCODERS = {
    "s3g 3OA Encoder Cartography": 2,
    "s3g 3OA Encoder Ray": 1,
    "s3g 3OA Encoder Ray Bilocation": 1,
    "s3g 3OA Encoder Modal": 1,
    "s3g 3OA Encoder Medium": 1,
}
MIDI_INPUT_ENCODERS = {
    "s3g 3OA Encoder Modal",
    "s3g 3OA Encoder Medium",
    "s3g 3OA Encoder Membrane Kick",
    "s3g 3OA Encoder Acid",
    "s3g 3OA Encoder VOT",
    "s3g 3OA Encoder Vox",
    "s3g 3OA Encoder Wave Terrain",
    "s3g 3OA Encoder Stochastic",
    "s3g 3OA Encoder Neural Ecology",
}
INSTRUMENT_ENCODERS = {
    name for name, values in EXPECTED.items() if values[1] == "s3g.clap~ 0 16"
}
MULTICHANNEL_INPUT_COUNT_IDS = {
    "s3g 3OA Encoder Path": 1,
    "s3g 3OA Encoder Point": 29,
    "s3g 3OA Encoder Cloud": 1,
    "s3g 3OA Encoder Surface Terrain": 20,
}
MULTICHANNEL_INPUT_DEFAULTS = {
    "s3g 3OA Encoder Path": 32,
    "s3g 3OA Encoder Point": 16,
    "s3g 3OA Encoder Cloud": 32,
    "s3g 3OA Encoder Surface Terrain": 16,
}
MULTICHANNEL_LIVE_CHANNELS = 34
MULTICHANNEL_SLOT_COUNT = 32
MULTICHANNEL_PAIR_COUNT = 16


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


def validate_action_button(device: str, label: str,
                           button: dict[str, object]) -> None:
    if (button.get("maxclass") != "live.text"
            or button.get("text") != label
            or button.get("texton") != label
            or button.get("mode") != 0
            or button.get("parameter_enable") != 0
            or button.get("numoutlets") != 2
            or button.get("activebgcolor") != COLOR_BUTTON
            or button.get("activebgoncolor") != COLOR_ACCENT
            or button.get("activetextcolor") != COLOR_BUTTON_TEXT
            or button.get("activetextoncolor") != COLOR_BACKGROUND
            or button.get("fontname") != "Arial"
            or button.get("fontsize") != 11.0
            or button.get("presentation_rect", [0, 0, 0, 0])[3] != 20.0):
        raise ValueError(f"{device}: {label} is not a readable native Live button")


def validate_control_layout(device: str,
                            boxes: dict[str, dict[str, object]]) -> None:
    """Visible controls must not cover another control's click target."""
    expected_width = DEVICE_WIDTHS[device]
    if boxes["obj-ui-background"].get("presentation_rect") != [
            0.0, 0.0, expected_width, 169.0]:
        raise ValueError(f"{device}: background does not fill the fitted face")
    right_edge = max(
        b["presentation_rect"][0] + b["presentation_rect"][2]
        for b in boxes.values()
        if b.get("presentation") == 1 and b["id"] != "obj-ui-background"
    )
    title_minimum = (240.0 if device.startswith(("s3g Drum ",
                                                 "s3g Sample ")) else 0.0)
    if expected_width != max(right_edge + 12.0, title_minimum):
        raise ValueError(f"{device}: width does not fit controls or Live title")
    controls = [
        b for b in boxes.values()
        if b.get("presentation") == 1
        and b.get("maxclass") in ("live.text", "live.dial", "live.gain~",
                                  "umenu", "matrixctrl", "bpatcher")
    ]
    for index, control in enumerate(controls):
        x, y, width, height = control["presentation_rect"]
        for other in controls[index + 1:]:
            ox, oy, ow, oh = other["presentation_rect"]
            if (x < ox + ow and ox < x + width
                    and y < oy + oh and oy < y + height):
                raise ValueError(
                    f"{device}: {control['id']} overlaps {other['id']}"
                )


def validate_routing_menu(
    device: str,
    boxes: dict[str, dict[str, object]],
    line_pairs: set[tuple[tuple[str, int], tuple[str, int]]],
    object_id: str,
) -> None:
    """Menus must preserve saved routing values and never echo recall."""
    carrier = boxes[object_id]
    state = carrier["saved_attribute_attributes"]["valueof"]
    menu = boxes[f"{object_id}-menu"]
    minimum = int(state["parameter_mmin"])
    maximum = int(state["parameter_mmax"])
    choices = [item for item in menu.get("items", []) if item != ","]
    if (carrier.get("presentation") == 1
            or menu.get("maxclass") != "umenu"
            or menu.get("presentation") != 1
            or menu.get("parameter_enable") != 0
            or menu.get("presentation_rect", [0, 0, 0, 0])[1] not in (
                (10.0, 42.0, 74.0, 106.0)
                if object_id.startswith("obj-mono-output-") else
                (38.0,) if device in (*PANNER_MAIN_DEVICES,
                                       *OUTPUT_AUTOGAIN_DEVICES)
                and object_id == "obj-input-bus-number" else
                (44.0,) if device == "s3g Output Autogain Quad Main"
                and object_id.startswith("obj-quad-output-") else (10.0,)
            )
            or len(choices) != maximum - minimum + 1):
        raise ValueError(f"{device}: {object_id} menu changes the stored range")
    forward = boxes[f"{object_id}-menu-to-value"].get("text", "").split()
    reverse = boxes[f"{object_id}-value-to-menu"].get("text", "").split()
    if (forward != ["+", str(minimum)]
            or reverse != ["-", str(minimum)]
            or boxes[f"{object_id}-menu-set"].get("text") != "prepend set"):
        raise ValueError(f"{device}: {object_id} menu loses one-based routing")
    guarded = f"{object_id}-menu-write-gate" in boxes
    reverse_source = (
        "obj-width-fanout-trigger" if object_id == "obj-channel-count"
        else "obj-from-fanout-trigger"
        if object_id == "obj-source-first" else object_id
    ) if device == "s3g Bus Send 36" else object_id
    reverse_outlet = 1 if reverse_source != object_id else 0
    required = {
        ((f"{object_id}-menu", 0), (f"{object_id}-menu-to-value", 0)),
        ((reverse_source, reverse_outlet), (f"{object_id}-value-to-menu", 0)),
        ((f"{object_id}-value-to-menu", 0), (f"{object_id}-menu-set", 0)),
        ((f"{object_id}-menu-set", 0), (f"{object_id}-menu", 0)),
    }
    if guarded:
        required.update({
            ((f"{object_id}-menu-to-value", 0),
             (f"{object_id}-menu-write-gate", 1)),
            ((f"{object_id}-menu-write-gate", 0), (object_id, 0)),
        })
        if ((f"{object_id}-menu-to-value", 0), (object_id, 0)) in line_pairs:
            raise ValueError(f"{device}: menu replay bypasses the Live write gate")
    else:
        required.add(((f"{object_id}-menu-to-value", 0), (object_id, 0)))
    if not required.issubset(line_pairs):
        raise ValueError(f"{device}: {object_id} menu is not recalled bidirectionally")
    menu_inputs = {
        source for source, destination in line_pairs
        if destination == (f"{object_id}-menu", 0)
    }
    expected_inputs = {(f"{object_id}-menu-set", 0)}
    if guarded:
        expected_inputs.add((f"{object_id}-replay-order", 1))
    if menu_inputs != expected_inputs:
        raise ValueError(f"{device}: {object_id} menu recall can echo into Live")
    if object_id == "obj-pair-number":
        expected = [f"{pair * 2 - 1:02d}/{pair * 2:02d}"
                    for pair in range(minimum, maximum + 1)]
        if choices != expected:
            raise ValueError(f"{device}: pair labels do not identify their bus slots")


def validate_bus_menu_replay(
    device: str,
    boxes: dict[str, dict[str, object]],
    line_pairs: set[tuple[tuple[str, int], tuple[str, int]]],
    object_id: str,
    init_defer: str,
    outputvalue_message: str,
) -> None:
    """A post-ready menu bang must reassert the saved bus without writing Live."""
    prefix = f"{object_id}-replay"
    gate = f"{object_id}-menu-write-gate"
    expected_text = {
        gate: "gate 1 1",
        f"{prefix}-ready": "t b",
        f"{prefix}-delay": "delay 100",
        f"{prefix}-order": "t b b b b",
        f"{prefix}-close": "0",
        f"{prefix}-open": "1",
    }
    if any(boxes[object].get("text") != value
           for object, value in expected_text.items()):
        raise ValueError(f"{device}: bus menu replay timing or write gate changed")
    required = {
        ((init_defer, 0), (f"{prefix}-delay", 0)),
        (("obj-device-startup-trigger", 2)
         if device == "s3g Bus Send 36" else ("obj-device", 0),
         (f"{prefix}-ready", 0)),
        ((f"{prefix}-ready", 0), (f"{prefix}-delay", 0)),
        ((f"{prefix}-delay", 0), (f"{prefix}-order", 0)),
        ((f"{prefix}-order", 3), (f"{prefix}-close", 0)),
        ((f"{prefix}-close", 0), (gate, 0)),
        ((f"{prefix}-order", 2), (outputvalue_message, 0)),
        ((f"{prefix}-order", 1), (f"{object_id}-menu", 0)),
        ((f"{prefix}-order", 0), (f"{prefix}-open", 0)),
        ((f"{prefix}-open", 0), (gate, 0)),
        ((outputvalue_message, 0), (object_id, 0)),
    }
    if not required.issubset(line_pairs):
        raise ValueError(f"{device}: saved bus is not reasserted after Live is ready")


def validate_recorder(
    device: str,
    patcher: dict[str, object],
    boxes: dict[str, dict[str, object]],
    line_pairs: set[tuple[tuple[str, int], tuple[str, int]]],
) -> None:
    """Check the audio tap and exercise the actual Max message graph offline.

    The harness models message ordering/gates, not native DSP or disk writing.
    A real 16-channel WAV capture remains a Live acceptance test.
    """
    writer = boxes["obj-rec-writer"]
    if (writer.get("text") != "sfrecord~ 16"
            or writer.get("numinlets") != 16
            or writer.get("outlettype") != ["signal"]):
        raise ValueError(f"{device}: recorder is not a 16-channel sfrecord~")
    expected_audio = {
        (("obj-ambi-input-gain", channel), ("obj-rec-writer", channel))
        for channel in range(16)
    }
    actual_audio = {
        (source, destination) for source, destination in line_pairs
        if destination[0] == "obj-rec-writer"
        and boxes[source[0]].get("outlettype", [])[source[1]] == "signal"
    }
    if actual_audio != expected_audio:
        raise ValueError(f"{device}: recorder changes ACN order or taps decoded audio")
    controls = {
        (("obj-rec-format", 0), ("obj-rec-writer", 0)),
        (("obj-rec-open", 0), ("obj-rec-writer", 0)),
        (("obj-rec-start-order", 2), ("obj-rec-writer", 0)),
        (("obj-rec-reset", 1), ("obj-rec-writer", 0)),
    }
    if {pair for pair in line_pairs if pair[1][0] == "obj-rec-writer"} != (
            expected_audio | controls):
        raise ValueError(f"{device}: unexpected recorder start/open path")
    validate_action_button(device, "FILE", boxes["obj-rec-file-button"])
    toggle = boxes["obj-rec-toggle"]
    if (toggle.get("maxclass") != "live.text"
            or toggle.get("mode") != 1 or toggle.get("active") != 0
            or toggle.get("text") != "REC" or toggle.get("texton") != "STOP"):
        raise ValueError(f"{device}: REC must be disabled until FILE is chosen")
    if any(
        b.get("parameter_enable") == 1
        or b.get("saved_object_attributes", {}).get("parameter_enable") == 1
        or object_id in patcher["parameters"]
        for object_id, b in boxes.items() if object_id.startswith("obj-rec-")
    ):
        raise ValueError(f"{device}: recording state/path can be recalled or automated")
    if "Envelop" not in boxes["obj-rec-credit"].get("text", ""):
        raise ValueError(f"{device}: recorder reference credit is missing")

    class MessageHarness:
        """A deliberately small interpreter for this recorder's control objects."""
        bang = object()

        def __init__(self) -> None:
            self.routes: dict[tuple[str, int], list[tuple[str, int]]] = {}
            for entry in patcher["lines"]:
                p = entry["patchline"]
                if (p["source"][0].startswith("obj-rec-")
                        and p["destination"][0].startswith("obj-rec-")):
                    self.routes.setdefault(tuple(p["source"]), []).append(
                        tuple(p["destination"]))
            self.active = {i: b.get("active", 1) for i, b in boxes.items()
                           if i.startswith("obj-rec-")}
            self.values: dict[str, object] = {"obj-rec-toggle": 0}
            self.gates: dict[str, int] = {}
            self.changes: dict[str, object] = {}
            self.events: list[object] = []
            self.pending = False
            self.dialog_requested = False
            self.time = "00:00"
            self.pack = [0, 0]
            self.warnings: list[object] = []
            self.steps = 0

        def emit(self, object_id: str, outlet: int, data: object) -> None:
            for destination, inlet in self.routes.get((object_id, outlet), []):
                self.send(destination, inlet, data)

        def send(self, object_id: str, inlet: int, data: object) -> None:
            self.steps += 1
            if self.steps > 10000:
                raise ValueError(f"{device}: recorder feedback loop")
            b = boxes[object_id]
            kind, text = b["maxclass"], b.get("text", "")
            if kind == "live.text":
                command, value = data
                if command == "active":
                    self.active[object_id] = value
                elif command == "set":
                    self.values[object_id] = value
                else:
                    raise ValueError(f"{device}: unexpected recorder UI message")
            elif kind == "comment":
                assert data[0] == "set"
                self.time = str(data[1])
            elif kind == "message":
                if text in ("0", "1"):
                    value = int(text)
                elif text == "stop":
                    value = "stop"
                else:
                    parts = text.split(maxsplit=1)
                    value = tuple(parts)
                    if parts[0] == "active":
                        value = ("active", int(parts[1]))
                self.emit(object_id, 0, value)
            elif text.startswith("t "):
                arguments = text.split()[1:]
                for outlet in reversed(range(len(arguments))):
                    argument = arguments[outlet]
                    value = (self.bang if argument == "b" else
                             int(data) if argument == "i" else data)
                    self.emit(object_id, outlet, value)
            elif text == "gate 1 0":
                if inlet == 0:
                    self.gates[object_id] = int(data)
                elif self.gates.get(object_id, 0):
                    self.emit(object_id, 0, data)
            elif text == "sel 1 0":
                self.emit(object_id, 0 if data == 1 else 1, self.bang)
            elif text == "savedialog WAVE":
                if data is self.bang:
                    self.dialog_requested = True
            elif text.startswith("prepend "):
                arguments = data if isinstance(data, tuple) else (data,)
                self.emit(object_id, 0, (text.split()[1], *arguments))
            elif text == "append wave":
                self.emit(object_id, 0, (data, "wave"))
            elif text == "sfrecord~ 16":
                self.events.append(data)
            elif text == "!- 1":
                self.emit(object_id, 0, 1 - int(data))
            elif text.startswith("change"):
                if data != self.changes.get(object_id, 0):
                    self.changes[object_id] = data
                    self.emit(object_id, 0, data)
            elif text == "delay 2000":
                self.pending = data != "stop"
            elif text.startswith("print "):
                self.warnings.append(data)
            elif text == "/ 1000.":
                self.emit(object_id, 0, float(data) / 1000.)
            elif text == "i":
                self.emit(object_id, 0, int(data))
            elif text == "/ 60":
                self.emit(object_id, 0, int(data) // 60)
            elif text == "% 60":
                self.emit(object_id, 0, int(data) % 60)
            elif text == "pack i i":
                self.pack[inlet] = int(data)
                if inlet == 0:
                    self.emit(object_id, 0, tuple(self.pack))
            elif text == "sprintf %02ld:%02ld":
                self.emit(object_id, 0, f"{data[0]:02d}:{data[1]:02d}")
            else:
                raise ValueError(f"{device}: unmodeled recorder object {text!r}")

        def click(self, object_id: str) -> bool:
            if not self.active[object_id]:
                return False
            if boxes[object_id]["mode"] == 0:
                data = self.bang
            else:
                data = 1 - self.values[object_id]
                self.values[object_id] = data
            self.emit(object_id, 0, data)
            return True

    h = MessageHarness()
    h.emit("obj-rec-init", 0, h.bang)
    assert h.events == [0] and h.time == "00:00" and not h.pending
    assert not h.click("obj-rec-toggle")
    # Even a forced event cannot bypass the file-ready gate.
    h.emit("obj-rec-toggle", 0, 1)
    assert 1 not in h.events
    assert h.click("obj-rec-file-button") and h.dialog_requested
    h.emit("obj-rec-dialog", 2, h.bang)  # Cancel must not start recording.
    assert not h.active["obj-rec-toggle"] and 1 not in h.events
    assert h.click("obj-rec-file-button")
    path = "/tmp/3OA take with spaces.wav"
    h.emit("obj-rec-dialog", 0, path)
    assert h.events[-2:] == [("samptype", "float32"), ("open", path, "wave")]
    assert h.active["obj-rec-toggle"] and 1 not in h.events
    assert h.click("obj-rec-toggle") and h.events[-1] == 1 and h.pending
    assert not h.click("obj-rec-file-button")  # No file replacement during a take.
    h.emit("obj-rec-clock", 0, 62500.)
    assert h.time == "01:02" and h.pending
    assert h.click("obj-rec-toggle") and h.events[-1] == 0 and not h.pending
    assert h.values["obj-rec-toggle"] == 0 and not h.active["obj-rec-toggle"]
    assert not h.click("obj-rec-toggle")  # Stop closes the file: FILE is needed again.
    assert h.click("obj-rec-file-button")
    h.emit("obj-rec-dialog", 0, "/tmp/next take.wav")
    assert h.time == "00:00" and h.events[-1][0] == "open"
    assert h.click("obj-rec-toggle") and h.pending
    h.emit("obj-rec-watch-timeout", 0, h.bang)  # DSP/disk stalled: reset and warn.
    assert h.events[-1] == 0 and not h.pending and h.warnings
    assert h.values["obj-rec-toggle"] == 0 and h.active["obj-rec-file-button"]
    h.emit("obj-rec-init", 0, h.bang)  # Reload never reopens a path or starts a take.
    assert h.events[-1] == 0 and not h.active["obj-rec-toggle"] and h.time == "00:00"


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
    expected_type = 1835887981 if name in INSTRUMENT_ENCODERS else 1633771873
    if patcher["project"]["amxdtype"] != expected_type:
        raise ValueError(f"{name}: wrong Max for Live device type")
    if patcher.get("minimum_live_version") != "12.0":
        raise ValueError(f"{name}: multichannel routing requires Live 12")
    expected_height = (MAIN_OUT_HEIGHT if name in
                       (*MAIN_DEVICES, *STEREO_MAIN_DEVICES) else COMPACT_HEIGHT)
    expected_width = DEVICE_WIDTHS[name]
    if patcher.get("devicewidth") != expected_width:
        raise ValueError(f"{name}: unexpected device width")
    if patcher.get("openrect") != [0.0, 0.0, expected_width, expected_height]:
        raise ValueError(f"{name}: unexpected presentation bounds")
    if patcher.get("locked_bgcolor") != COLOR_BACKGROUND:
        raise ValueError(f"{name}: missing s3g presentation background")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    required_ui = {"obj-ui-background", "obj-gui-button"}
    if not fixed_parameter_ids:
        required_ui.add("obj-load-button")
    if not required_ui.issubset(boxes):
        raise ValueError(f"{name}: incomplete s3g presentation layer")
    if {"obj-title", "obj-fixed-label", "obj-latency-label",
            "obj-latency-number", "obj-routing-heading"}.intersection(boxes):
        raise ValueError(f"{name}: redundant titles or latency display remain")
    validate_action_button(name, "EDITOR", boxes["obj-gui-button"])
    if boxes["obj-gui-button"].get("presentation_rect") != EDITOR_RECT:
        raise ValueError(f"{name}: inconsistent Editor button position")
    if not fixed_parameter_ids:
        validate_action_button(name, "LOAD CLAP", boxes["obj-load-button"])
    for current in boxes.values():
        rect = current.get("presentation_rect")
        if not rect:
            continue
        if (rect[0] < 0.0 or rect[1] < 0.0
                or rect[0] + rect[2] > expected_width
                or rect[1] + rect[3] > expected_height):
            raise ValueError(
                f"{name}: {current['id']} exceeds the presentation bounds"
            )
    validate_control_layout(name, boxes)
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
    midi_lines = {
        (("obj-midi-in", 0), ("obj-midi-parse", 0)),
        (("obj-midi-parse", 7), ("obj-clap", 0)),
    }
    if name in MIDI_INPUT_ENCODERS:
        if (boxes.get("obj-midi-in", {}).get("text") != "midiin"
                or boxes.get("obj-midi-parse", {}).get("text") != "midiparse"
                or not midi_lines.issubset(line_pairs)):
            raise ValueError(f"{name}: Live MIDI is not forwarded to CLAP")
    elif "obj-midi-in" in boxes or "obj-midi-parse" in boxes:
        raise ValueError(f"{name}: no CLAP note port but MIDI input is wired")
    if name in INSTRUMENT_ENCODERS:
        if "obj-plugin" in boxes:
            raise ValueError(f"{name}: zero-input instrument exposes Live audio")
        instrument_output_lines = {
            (("obj-clap", channel), ("obj-plugout", channel + 2))
            for channel in range(16)
        }
        instrument_output_lines.update({
            (("obj-device", 0), ("obj-bus-send", 0)),
            (("obj-chain", 0), ("obj-bus-send", 1)),
        })
        if not instrument_output_lines.issubset(line_pairs):
            raise ValueError(f"{name}: third-order instrument output is incomplete")
    clap_input_count = int(clap_prefix.split()[1])
    if clap_input_count > 2 and name not in (*MAIN_DEVICES,
                                             *STEREO_MAIN_DEVICES,
                                             *EFFECT_DEVICES):
        forbidden_track_inputs = {
            (("obj-plugin", live_channel), ("obj-clap", clap_channel))
            for live_channel in (0, 1)
            for clap_channel in range(clap_input_count)
        }
        if forbidden_track_inputs.intersection(line_pairs):
            raise ValueError(
                f"{name}: multichannel CLAP accepts Live's ordinary stereo input"
            )
        required_bus_inputs = {
            (("obj-plugin", clap_channel + 2),
             ("obj-clap", clap_channel))
            for clap_channel in range(clap_input_count)
        }
        if not required_bus_inputs.issubset(line_pairs):
            raise ValueError(
                f"{name}: multichannel CLAP is not fed exclusively from bus slots"
            )
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
    if name == "s3g 3OA Source":
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
                or meter.get("presentation_rect") != [12.0, 80.0, 224.0, 72.0]):
            raise ValueError(f"{name}: stereo input gain is not the expected live.gain~")
        meter_state = meter["saved_attribute_attributes"]["valueof"]
        expected_gain_name = "Source Input Gain"
        if (meter_state.get("parameter_longname") != expected_gain_name
                or meter_state.get("parameter_initial") != [0]):
            raise ValueError(f"{name}: stereo input gain is not stored at unity")

        if name == "s3g 3OA Source":
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
    if name in MULTICHANNEL_ENCODERS:
        validate_routing_menu(name, boxes, line_pairs, "obj-input-bus-number")
        validate_bus_menu_replay(
            name, boxes, line_pairs, "obj-input-bus-number",
            "obj-input-bus-init-defer", "obj-input-bus-output",
        )
        if (boxes["obj-input-bus-label"].get("text") != "RCV BUS"
                or boxes["obj-input-bus-label"].get("presentation_rect")
                != [84.0, 10.0, 52.0, 20.0]
                or boxes["obj-input-bus-number-menu"].get("presentation_rect")
                != [142.0, 10.0, 48.0, 20.0]
                or boxes["obj-chain"].get("presentation_rect")
                != [198.0, 10.0, 76.0, 20.0]):
            raise ValueError(f"{name}: receive-bus row is clipped or ambiguous")
        if boxes["obj-plugin"].get("numoutlets") != MULTICHANNEL_LIVE_CHANNELS:
            raise ValueError(f"{name}: does not expose all 32 input-bus slots")
        if "obj-bus-insert" in boxes:
            raise ValueError(f"{name}: still depends on a preceding Receive device")
        bus_number = boxes["obj-input-bus-number"]
        bus_state = bus_number["saved_attribute_attributes"]["valueof"]
        if (bus_number.get("maxclass") != "live.numbox"
                or bus_number.get("parameter_enable") != 1
                or bus_state.get("parameter_initial") != [1]
                or bus_state.get("parameter_mmin") != 1
                or bus_state.get("parameter_mmax") != 16
                or "obj-input-bus-number" not in patcher["parameters"]):
            raise ValueError(f"{name}: input bus is not a stored 1-16 parameter")
        if boxes["obj-bus-receive"].get("text") != (
                "s3g.bus.receive s3g-multichannel-1"):
            raise ValueError(f"{name}: missing integrated multichannel receiver")
        if boxes["obj-input-bus-symbol"].get("text") != (
                "sprintf s3g-multichannel-%ld"):
            raise ValueError(f"{name}: input bus uses the wrong private namespace")
        if any(
            current.get("text", "").startswith(
                f"paramid {MULTICHANNEL_INPUT_COUNT_IDS[name]} "
            )
            for current in boxes.values()
        ):
            raise ValueError(f"{name}: Input Count is still forced on load")
        required_path_lines = {
            (("obj-device", 0), ("obj-bus-receive", 0)),
            (("obj-input-bus-number", 0), ("obj-input-bus-symbol", 0)),
            (("obj-input-bus-symbol", 0), ("obj-bus-receive", 1)),
            (("obj-input-bus-output", 0), ("obj-input-bus-number", 0)),
            (("obj-device", 0), ("obj-bus-send", 0)),
        }
        if not required_path_lines.issubset(line_pairs):
            raise ValueError(f"{name}: incomplete integrated input-bus routing")
        forbidden_path_stereo = {
            (("obj-plugin", channel), ("obj-plugout", channel))
            for channel in (0, 1)
        }
        if forbidden_path_stereo.intersection(line_pairs):
            raise ValueError(f"{name}: ordinary Live stereo is not blocked")
        removed_stereo_controls = {
            "obj-input-meter", "obj-input-mute-1", "obj-input-mute-2",
            "obj-input-mute-1-gain", "obj-input-mute-2-gain",
        }
        if removed_stereo_controls.intersection(boxes):
            raise ValueError(f"{name}: legacy stereo input controls remain")
        input_state = boxes[f"obj-param-{MULTICHANNEL_INPUT_COUNT_IDS[name]}"][
            "saved_attribute_attributes"
        ]["valueof"]
        parameter_controls = [
            boxes[f"obj-param-{parameter_id}"]
            for parameter_id in fixed_parameter_ids
        ]
        if (input_state.get("parameter_mmin") != 1
                or input_state.get("parameter_mmax") != 32
                or input_state.get("parameter_initial")
                != [MULTICHANNEL_INPUT_DEFAULTS[name]]
                or any(parameter.get("maxclass") != "live.numbox"
                       or parameter.get("presentation") == 1
                       for parameter in parameter_controls)):
            raise ValueError(
                f"{name}: fixed CLAP parameters are not compact Live controls"
            )
        if any(object_id.startswith("obj-probe-") for object_id in boxes):
            raise ValueError(f"{name}: temporary automation probe remains")
    if name in TRACK_INPUT_ENCODERS:
        input_channels = TRACK_INPUT_ENCODERS[name]
        meter = boxes["obj-input-meter"]
        if (meter.get("maxclass") != "live.gain~"
                or meter.get("channels") != input_channels
                or meter.get("ignoreclick") != 0
                or meter.get("parameter_enable") != 1
                or meter.get("numinlets") != input_channels):
            raise ValueError(f"{name}: wrong Live input gain topology")
        required_input_lines = {
            (("obj-plugin", channel), ("obj-plugout", channel))
            for channel in (0, 1)
        }
        required_input_lines.update({
            (("obj-plugin", channel), ("obj-input-meter", channel))
            for channel in range(input_channels)
        })
        for channel in range(input_channels):
            numbered = channel + 1
            required_input_lines.update({
                (("obj-input-meter", channel),
                 (f"obj-input-mute-{numbered}-gain", 0)),
                ((f"obj-input-mute-{numbered}", 0),
                 (f"obj-input-mute-{numbered}-invert", 0)),
                ((f"obj-input-mute-{numbered}-invert", 0),
                 (f"obj-input-mute-{numbered}-gain", 1)),
                ((f"obj-input-mute-{numbered}-gain", 0),
                 ("obj-clap", channel)),
            })
        if not required_input_lines.issubset(line_pairs):
            raise ValueError(f"{name}: mono/stereo input path is incomplete")
        if input_channels == 1 and any(
            object_id.startswith("obj-input-mute-2") for object_id in boxes
        ):
            raise ValueError(f"{name}: mono encoder exposes a dead second mute")
        if any(("obj-plugin", channel) == source and destination[0] == "obj-clap"
               for source, destination in line_pairs for channel in (0, 1)):
            raise ValueError(f"{name}: input bypasses gain/mute")
    if name in (
        "s3g 3OA Source",
        *MULTICHANNEL_ENCODERS,
        *TRACK_INPUT_ENCODERS,
        *INSTRUMENT_ENCODERS,
        "s3g 3OA Insert",
        *EFFECT_DEVICES,
    ):
        chain = boxes["obj-chain"]
        if (chain.get("maxclass") != "live.text"
                or chain.get("text") != "MAIN"
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
    latency_lines = {
        (("obj-route-status", 0), ("obj-latency-message", 0)),
        (("obj-latency-message", 0), ("obj-thispatcher", 0)),
    }
    if (boxes["obj-latency-message"].get("text") != "prepend latency"
            or not latency_lines.issubset(line_pairs)):
        raise ValueError(f"{name}: latency compensation lost its internal wiring")
    e4l_objects = [
        entry.get("text", "") for entry in boxes.values()
        if entry.get("text", "").startswith("e4l.")
    ]
    if e4l_objects:
        raise ValueError(f"{name}: still instantiates E4L objects: {e4l_objects}")
    if name in EFFECT_DEVICES:
        required_insert_lines = {
            (("obj-plugin", 0), ("obj-plugout", 0)),
            (("obj-plugin", 1), ("obj-plugout", 1)),
            (("obj-device", 0), ("obj-bus-insert", 0)),
            (("obj-device", 0), ("obj-bus-send", 0)),
            (("obj-chain", 0), ("obj-bus-send", 1)),
        }
        required_insert_lines.update(
            (("obj-plugin", channel + 2), ("obj-clap", channel))
            for channel in range(16)
        )
        required_insert_lines.update(
            (("obj-clap", channel), ("obj-plugout", channel + 2))
            for channel in range(16)
        )
        if (boxes["obj-bus-insert"].get("text") != "s3g.bus.insert"
                or boxes["obj-bus-send"].get("text") != "s3g.bus.send master"
                or not required_insert_lines.issubset(line_pairs)):
            raise ValueError(f"{name}: incomplete 16-channel 3OA insert routing")
    if name in STEREO_MAIN_DEVICES:
        validate_recorder(name, patcher, boxes, line_pairs)
        gain = boxes["obj-ambi-input-gain"]
        if (gain.get("maxclass") != "live.gain~"
                or gain.get("channels") != 16
                or gain.get("parameter_enable") != 1
                or gain.get("ignoreclick") != 0
                or gain.get("shownumber") != 1
                or gain.get("presentation_rect") != [16.0, 66.0, 168.0, 68.0]
                or "obj-ambi-input-gain" not in patcher["parameters"]):
            raise ValueError(f"{name}: missing saved 16-channel input gain")
        required_stereo_lines = {
            (("obj-device", 0), ("obj-bus-receive", 0)),
        }
        required_stereo_lines.update(
            (("obj-plugin", channel + 2),
             ("obj-ambi-input-gain", channel)) for channel in range(16)
        )
        required_stereo_lines.update(
            (("obj-ambi-input-gain", channel), ("obj-clap", channel))
            for channel in range(16)
        )
        required_stereo_lines.update(
            (("obj-clap", channel), ("obj-plugout", channel))
            for channel in range(2)
        )
        if (boxes["obj-bus-receive"].get("text") != "s3g.bus.receive master"
                or not required_stereo_lines.issubset(line_pairs)
                or any(destination[0] == "obj-plugout" and
                       source[0] != "obj-clap" for source, destination in line_pairs)
                or any(object_id in boxes for object_id in
                       ("obj-hardware-button", "obj-mono-matrix"))):
            raise ValueError(f"{name}: stereo decoding does not go directly to Live")
    if name in MAIN_DEVICES:
        validate_recorder(name, patcher, boxes, line_pairs)
        gain = boxes["obj-ambi-input-gain"]
        gain_state = gain["saved_attribute_attributes"]["valueof"]
        if (gain.get("maxclass") != "live.gain~"
                or gain.get("channels") != 16
                or gain.get("lastchannelcount") != 0
                or gain.get("numinlets") != 16
                or gain.get("numoutlets") != 19
                or gain.get("parameter_enable") != 1
                or gain.get("ignoreclick") != 0
                or gain.get("presentation_rect") != [16.0, 66.0, 168.0, 68.0]
                or gain.get("shownumber") != 1
                or gain_state.get("parameter_initial") != [0]
                or gain_state.get("parameter_longname")
                != "Ambisonic Input Gain"
                or "obj-ambi-input-gain" not in patcher["parameters"]):
            raise ValueError(f"{name}: missing linked 16-channel input gain")
        expected_layout = {
            "obj-input-panel": [12.0, 4.0, 180.0, 158.0],
            "obj-output-panel": [200.0, 4.0, 488.0, 158.0],
        }
        if any(boxes[object_id].get("presentation_rect") != rect
               for object_id, rect in expected_layout.items()):
            raise ValueError(f"{name}: gain and output matrix are not separated")
        if "obj-ambi-pack" in boxes or "obj-ambi-unpack" in boxes:
            raise ValueError(f"{name}: stale MC gain bridge remains")
        if "obj-input-value" in boxes or "obj-input-label" in boxes:
            raise ValueError(f"{name}: redundant gain readout remains")
        if (boxes["obj-rec-file-button"].get("presentation_rect")
                != [16.0, 140.0, 48.0, 20.0]
                or boxes["obj-rec-toggle"].get("presentation_rect")
                != [70.0, 140.0, 48.0, 20.0]
                or boxes["obj-rec-time"].get("presentation_rect")
                != [124.0, 140.0, 60.0, 20.0]):
            raise ValueError(f"{name}: gain and recorder are not balanced in the left column")
        validate_action_button(name, "HARDWARE", boxes["obj-hardware-button"])
        hardware = boxes["obj-hardware-routing"]["patcher"]
        hardware_boxes = {
            entry["box"]["id"]: entry["box"]
            for entry in hardware["boxes"]
        }
        hardware_lines = {
            (tuple(entry["patchline"]["source"]),
             tuple(entry["patchline"]["destination"]))
            for entry in hardware["lines"]
        }
        selectors = [
            hardware_boxes[f"obj-output-selector-{pair_index}"]
            for pair_index in range(1, 17)
        ]
        if any(
            selector.get("name") != "s3g.live.routing.channel_selector.maxpat"
            or selector.get("args") != [pair_index]
            or selector.get("presentation_rect", [0, 0, 0, 0])[2:] != [100.0, 20.0]
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
        if (len(selector_positions) != 16
                or len({x for x, _ in selector_positions}) != 4
                or len({y for _, y in selector_positions}) != 4):
            raise ValueError(
                f"{name}: output selectors are not four columns of four pairs"
            )
        for pair_index, selector in enumerate(selectors, 1):
            column, row = divmod(pair_index - 1, 4)
            if selector["presentation_rect"][:2] != [
                    44.0 + column * 136.0, 10.0 + row * 32.0]:
                raise ValueError(f"{name}: output pair {pair_index} is out of order")
            if (("hw-inlet", 0), (f"obj-output-selector-{pair_index}", 0)) not in hardware_lines:
                raise ValueError(f"{name}: hardware pair {pair_index} lacks its DeviceIO")
        matrix = boxes["obj-mono-matrix"]
        if (matrix.get("text") != "matrix~ 32 32 1. @ramp 5."
                or matrix.get("numinlets") != 32
                or matrix.get("numoutlets") != 33):
            raise ValueError(f"{name}: missing 32-channel mono output matrix")
        grid = boxes["obj-mono-grid"]
        if (grid.get("maxclass") != "matrixctrl"
                or grid.get("columns") != 32 or grid.get("rows") != 8
                or grid.get("parameter_enable") != 0
                or grid.get("presentation_rect") != [240.0, 28.0, 448.0, 112.0]
                or grid.get("horizontalmargin") != 0
                or grid.get("verticalmargin") != 0
                or grid.get("horizontalspacing") != 0
                or grid.get("verticalspacing") != 0
                or boxes["obj-mono-page-menu"].get("presentation_rect")
                != [204.0, 142.0, 108.0, 20.0]):
            raise ValueError(f"{name}: paged matrix editor is not legible")
        if (grid["presentation_rect"][2] / grid["columns"]
                != grid["presentation_rect"][3] / grid["rows"]):
            raise ValueError(f"{name}: matrix grid cells are not square")
        for group in range(8):
            if boxes[f"obj-mono-output-heading-{group + 1}"].get(
                    "presentation_rect") != [
                        240.0 + group * 56.0, 8.0, 56.0, 18.0]:
                raise ValueError(f"{name}: output group {group + 1} is misaligned")
        if (boxes["obj-mono-page-first"].get("text") != "0"
                or boxes["obj-mono-page-one"].get("text") != "+ 1"
                or boxes["obj-mono-current-page"].get("text") != "i 1"
                or boxes["obj-mono-redraw"].get("text") != "t b b b"
                or boxes["obj-mono-redraw-body"].get("text") != "t b b"
                or boxes["obj-mono-click-gate"].get("text") != "gate 1 1"):
            raise ValueError(f"{name}: matrix page/redraw initialization changed")
        for source, destination in (
                (("obj-mono-page-menu", 0), ("obj-mono-page-one", 0)),
                (("obj-mono-page-init", 0), ("obj-mono-page-first", 0)),
                (("obj-mono-page-first", 0), ("obj-mono-page-menu", 0)),
                (("obj-mono-page-one", 0), ("obj-mono-page-order", 0)),
                (("obj-mono-page-order", 2), ("obj-mono-click-channel", 1)),
                (("obj-mono-page-order", 1), ("obj-mono-current-page", 1)),
                (("obj-mono-page-order", 0), ("obj-mono-redraw", 0)),
                (("obj-mono-redraw", 2), ("obj-mono-click-close", 0)),
                (("obj-mono-redraw", 1), ("obj-mono-redraw-body", 0)),
                (("obj-mono-redraw-body", 1), ("obj-mono-clear", 0)),
                (("obj-mono-clear", 0), ("obj-mono-grid", 0)),
                (("obj-mono-redraw-body", 0), ("obj-mono-current-page", 0)),
                (("obj-mono-current-page", 0), ("obj-mono-select-page", 0)),
                (("obj-mono-redraw", 0), ("obj-mono-click-open", 0)),
                (("obj-mono-click-close", 0), ("obj-mono-click-gate", 0)),
                (("obj-mono-click-open", 0), ("obj-mono-click-gate", 0)),
                (("obj-mono-grid", 0), ("obj-mono-click-gate", 1)),
                (("obj-mono-click-gate", 0), ("obj-mono-click-unpack", 0)),
                (("obj-mono-click-unpack", 2), ("obj-mono-click-value", 1)),
                (("obj-mono-click-unpack", 1), ("obj-mono-click-channel", 0)),
                (("obj-mono-click-unpack", 0), ("obj-mono-click-value", 0)),
                (("obj-mono-click-order", 1), ("obj-mono-click-pack", 1)),
                (("obj-mono-click-order", 0), ("obj-mono-click-channel-store", 0)),
                (("obj-mono-click-pack", 0), ("obj-mono-click-route", 0)),
        ):
            if (source, destination) not in line_pairs:
                raise ValueError(f"{name}: paged matrix state/click ordering is incomplete")
        if (boxes["obj-mono-click-value"].get("text")
                != "expr ($i2 != 0) * ($i1 + 1)"
                or boxes["obj-mono-click-channel"].get("text")
                != "expr $i1 + (($i2 - 1) * 8) + 1"
                or boxes["obj-mono-click-route"].get("text")
                != "route " + " ".join(str(channel) for channel in range(1, 33))):
            raise ValueError(f"{name}: matrix click does not address one of 32 saved routes")
        for page in range(1, 5):
            page_trigger = f"obj-mono-page-{page}-rows"
            if (("obj-mono-select-page", page - 1), (page_trigger, 0)) not in line_pairs:
                raise ValueError(f"{name}: page {page} does not redraw its eight channels")
        for row in range(1, 9):
            label = f"obj-mono-row-label-{row}"
            if (boxes[label].get("presentation_rect")
                    != [204.0, 28.0 + (row - 1) * 14.0, 30.0, 14.0]
                    or boxes[f"{label}-number"].get("text")
                    != f"expr (($i1 - 1) * 8) + {row}"
                    or boxes[f"{label}-format"].get("text")
                    != "sprintf symout %02ld"
                    or (("obj-mono-page-one", 0), (f"{label}-number", 0))
                    not in line_pairs
                    or ((f"{label}-set", 0), (label, 0)) not in line_pairs):
                raise ValueError(f"{name}: grid input row {row} has a stale page label")
        for channel in range(1, 33):
            object_id = f"obj-mono-output-{channel}"
            carrier = boxes[object_id]
            state = carrier["saved_attribute_attributes"]["valueof"]
            if (carrier.get("parameter_enable") != 1
                    or state.get("parameter_initial") != [channel]
                    or state.get("parameter_mmin") != 0
                    or state.get("parameter_mmax") != 32
                    or object_id not in patcher["parameters"]):
                raise ValueError(f"{name}: mono channel {channel} is not stored")
            if f"{object_id}-menu" in boxes:
                raise ValueError(f"{name}: redundant mono menu remains")
            for source, destination in (
                    (("obj-mono-outputvalue", 0), (object_id, 0)),
                    ((object_id, 0), (f"{object_id}-store-input", 0)),
                    ((f"{object_id}-store-input", 1), (f"{object_id}-store", 1)),
                    ((f"{object_id}-store-input", 0), ("obj-mono-redraw", 0)),
                    (("obj-mono-click-route", channel - 1), (object_id, 0)),
                    ((f"{object_id}-store", 0), (f"{object_id}-display-valid", 0)),
                    ((f"{object_id}-display-valid", 0), (f"{object_id}-display-column", 0)),
                    ((f"{object_id}-display-column", 0), (f"{object_id}-display-set", 0)),
                    ((f"{object_id}-display-set", 0), ("obj-mono-grid", 0)),
                    ((f"obj-mono-page-{(channel - 1) // 8 + 1}-rows", (channel - 1) % 8),
                     (f"{object_id}-store", 0)),
                    ((object_id, 0), (f"{object_id}-trigger", 0)),
                    ((f"{object_id}-trigger", 1), (f"{object_id}-old", 0)),
                    ((f"{object_id}-old", 0), (f"{object_id}-disconnect", 0)),
                    ((f"{object_id}-disconnect", 0), ("obj-mono-matrix", 0)),
                    ((f"{object_id}-trigger", 0), (f"{object_id}-valid", 0)),
                    ((f"{object_id}-valid", 0), (f"{object_id}-zero-based", 0)),
                    ((f"{object_id}-zero-based", 0), (f"{object_id}-new", 0)),
                    ((f"{object_id}-new", 1), (f"{object_id}-old", 1)),
                    ((f"{object_id}-new", 0), (f"{object_id}-connect", 0)),
                    ((f"{object_id}-connect", 0), ("obj-mono-matrix", 0)),
            ):
                if (source, destination) not in line_pairs:
                    raise ValueError(f"{name}: mono channel {channel} mapping is incomplete")
            if (boxes[f"{object_id}-old"].get("text") != f"i {channel - 1}"
                    or boxes[f"{object_id}-trigger"].get("text") != "t i b"
                    or boxes[f"{object_id}-valid"].get("text") != "split 1 32"
                    or boxes[f"{object_id}-zero-based"].get("text") != "- 1"
                    or boxes[f"{object_id}-new"].get("text") != "t i i"
                    or boxes[f"{object_id}-disconnect"].get("text") != f"{channel - 1} $1 0."
                    or boxes[f"{object_id}-connect"].get("text") != f"{channel - 1} $1 1."):
                raise ValueError(f"{name}: mono channel {channel} misaddresses the matrix")
            if boxes[f"{object_id}-display-set"].get("text") != (
                    f"set $1 {(channel - 1) % 8} 1"):
                raise ValueError(f"{name}: mono channel {channel} displays in the wrong grid row")
        required_output_lines = {
            (("obj-plugin", 0), ("obj-plugout", 0)),
            (("obj-plugin", 1), ("obj-plugout", 1)),
            (("obj-once", 0), ("obj-output-init", 0)),
            (("obj-device", 0), ("obj-hardware-routing", 0)),
            (("obj-hardware-button", 0), ("obj-hardware-open", 0)),
            (("obj-hardware-open", 0), ("obj-hardware-pcontrol", 0)),
            (("obj-hardware-pcontrol", 0), ("obj-hardware-routing", 0)),
            (("obj-mono-init", 0), ("obj-mono-init-defer", 0)),
            (("obj-mono-init-defer", 0), ("obj-mono-outputvalue", 0)),
        }
        required_output_lines.update(
            (("obj-plugin", channel + 2), ("obj-ambi-input-gain", channel))
            for channel in range(16)
        )
        required_output_lines.update(
            (("obj-ambi-input-gain", channel), ("obj-clap", channel))
            for channel in range(16)
        )
        required_output_lines.update(
            (("obj-clap", channel), ("obj-mono-matrix", channel))
            for channel in range(32)
        )
        required_output_lines.update(
            (("obj-mono-matrix", channel), ("obj-plugout", channel + 2))
            for channel in range(32)
        )
        if not required_output_lines.issubset(line_pairs):
            raise ValueError(f"{name}: incomplete direct hardware-output routing")
        forbidden_gain_bypass = {
            (("obj-plugin", channel + 2), ("obj-clap", channel))
            for channel in range(16)
        }
        if forbidden_gain_bypass.intersection(line_pairs):
            raise ValueError(f"{name}: decoder input bypasses Ambisonic gain")
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
            (("obj-param-enable", 0), ("obj-param-gate", 0)),
            (("obj-param-gate", 0), ("obj-clap", 0)),
        }
        if not fixed_lines.issubset(line_pairs):
            raise ValueError(f"{name}: fixed parameter synchronization is incomplete")
        stale_paraminfo_objects = {
            "obj-param-getparams", "obj-paraminfo-skip-index",
            "obj-paraminfo-route",
        }
        if stale_paraminfo_objects.intersection(boxes):
            raise ValueError(
                f"{name}: CLAP paraminfo can overwrite Live-owned parameters"
            )
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
                    "non-outputting editor feedback"
                )
            if ("parameter_defer" in state
                    or state.get("parameter_linknames") != 0
                    or state.get("parameter_annotation_name")
                    != state.get("parameter_longname")
                    or state.get("parameter_speedlim") != 3.0):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} does not use "
                    "stable independent scripting and Live names"
                )
            order = fixed_parameter_ids.index(parameter_id) + 1
            if patcher["parameters"].get(parameter_object_id) != [
                    state["parameter_longname"],
                    state["parameter_shortname"], order]:
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} has an invalid "
                    "top-level parameter order"
                )
            if boxes[f"obj-param-message-{parameter_id}"].get("text") != (
                    f"automateparamid {parameter_id} $1"):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} dirties opaque "
                    "state during Live automation"
                )
            parameter_lines = {
                ((parameter_object_id, 0),
                 (f"obj-param-message-{parameter_id}", 0)),
                ((f"obj-param-message-{parameter_id}", 0),
                 ("obj-param-gate", 1)),
                (("obj-param-resync-delay", 0),
                 (parameter_object_id, 0)),
                (("obj-paramchanged-route", fixed_parameter_ids.index(parameter_id)),
                 (f"obj-param-reflect-{parameter_id}", 0)),
                ((f"obj-param-reflect-{parameter_id}", 0),
                 (parameter_object_id, 0)),
            }
            if not parameter_lines.issubset(line_pairs):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} has incomplete wiring"
                )
            if f"obj-paraminfo-value-{parameter_id}" in boxes:
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} still reflects "
                    "load-time paraminfo into Live"
                )
            forbidden_parameter_lines = {
                ((parameter_object_id, 0),
                 ("obj-state-change-bang", 0)),
            }
            if forbidden_parameter_lines.intersection(line_pairs):
                raise ValueError(
                    f"{name}: CLAP parameter {parameter_id} still uses the "
                    "message-only automation/state-capture path"
                )
        for topology_index, (parameter_id, value) in enumerate(fixed_topology, 1):
            topology_id = f"obj-param-topology-{topology_index}"
            if (boxes[topology_id]["text"] != f"paramid {parameter_id} {value}"
                    or ((topology_id, 0), ("obj-clap", 0)) not in line_pairs):
                raise ValueError(f"{name}: fixed topology is not enforced")


def validate_multichannel_bus_send(
    name: str, patcher: dict[str, object],
    boxes: dict[str, dict[str, object]],
    line_pairs: set[tuple[tuple[str, int], tuple[str, int]]],
    *,
    slot_count: int = MULTICHANNEL_SLOT_COUNT,
    bus_prefix: str = "s3g-multichannel",
) -> None:
    """Check the flexible stereo/auxiliary sender and saved channel map."""
    live_channels = slot_count + 2
    new_bus = slot_count == 36
    if (boxes["obj-plugin"].get("numoutlets") != live_channels
            or boxes["obj-route-matrix"].get("text") !=
            f"matrix~ {live_channels} {slot_count} 1. @ramp 5."
            or boxes["obj-route-matrix"].get("numinlets") != live_channels
            or boxes["obj-route-matrix"].get("numoutlets") != slot_count + 1
            or boxes["obj-bus-send"].get("text") !=
            f"s3g.bus.send {bus_prefix}-1"
            or boxes["obj-bus-mode"].get("text") != "0"):
        raise ValueError(f"{name}: incorrect bus sender topology")
    expected_parameters = {
        "obj-source-mode": (1, 2, 1 if new_bus else 2),
        "obj-channel-count": (1, slot_count, 2 if new_bus else slot_count),
        "obj-source-first": (1, slot_count, 1),
        "obj-destination-first": (1, slot_count, 1),
    }
    for object_id, (minimum, maximum, initial) in expected_parameters.items():
        validate_routing_menu(name, boxes, line_pairs, object_id)
        state = boxes[object_id]["saved_attribute_attributes"]["valueof"]
        if (state.get("parameter_mmin") != minimum
                or state.get("parameter_mmax") != maximum
                or state.get("parameter_initial") != [initial]
                or object_id not in patcher["parameters"]):
            raise ValueError(f"{name}: {object_id} is not recalled by Live")
    source_items = [item for item in boxes["obj-source-mode-menu"]["items"]
                    if item != ","]
    if source_items != ["STEREO 2", f"CHAIN {slot_count}"]:
        raise ValueError(f"{name}: source modes do not distinguish Live stereo")
    last = boxes["obj-source-last-display"]
    last_items = [item for item in last.get("items", []) if item != ","]
    if (boxes["obj-source-last-label"].get("text") != "TO"
            or boxes["obj-destination-first-label"].get("text") != "SLOT"
            or boxes["obj-destination-first-menu"].get("presentation_rect") !=
            [588.0, 10.0, 48.0, 20.0]
            or last.get("maxclass") != "umenu"
            or last.get("presentation_rect") != [486.0, 10.0, 48.0, 20.0]
            or last.get("ignoreclick") != 1
            or last.get("parameter_enable") != 0
            or last.get("arrow") != 0
            or last_items != [f"{channel:02d}"
                              for channel in range(1, slot_count + 1)]
            or "obj-source-last-display" in patcher["parameters"]
            or boxes["obj-source-last-values"].get("text") !=
            f"pak 1 {2 if slot_count == 36 else slot_count}"
            or boxes["obj-source-last-calculate"].get("text") !=
            f"expr ($i1 + $i2 - 2) % {slot_count}"
            or boxes["obj-source-last-set"].get("text") != "prepend set"):
        raise ValueError(f"{name}: TO is not the derived source-range endpoint")
    for start, width, expected_last in ((1, 8, 8),
                                        (slot_count - 2, 8, 5),
                                        (1, slot_count, slot_count),
                                        (slot_count, slot_count,
                                         slot_count - 1)):
        if (start + width - 2) % slot_count + 1 != expected_last:
            raise ValueError(f"{name}: wrapped TO calculation is incorrect")
    if (boxes["obj-route-values"].get("text") !=
            ("pak 1 2 1 1" if slot_count == 36 else
             f"pak 2 {slot_count} 1 1")
            or boxes["obj-route-order"].get("text") != "t b l"
            or boxes["obj-route-rebuild"].get("text") != "t b b"
            or boxes["obj-route-iterate"].get("text") != f"uzi {slot_count}"
            or boxes["obj-route-iterate"].get("outlettype") !=
            ["bang", "bang", "int"]
            or boxes["obj-route-index"].get("text") != "t i i"
            or boxes["obj-route-clear"].get("text") != "clear"
            or boxes["obj-route-source"].get("text") !=
            "expr (($i1 <= $i3) && (($i2 == 2) || "
            "(($i2 == 1) && ($i1 <= 2)))) * "
            "((($i2 == 1) * ($i1 - 1)) + "
            f"(($i2 == 2) * ((($i4 + $i1 - 2) % {slot_count}) + 2)) + 1) - 1"
            or boxes["obj-route-destination"].get("text") !=
            f"expr ($i1 + $i2 - 2) % {slot_count}"
            or boxes["obj-route-cell"].get("text") != "pack i i 1."):
        raise ValueError(f"{name}: saved channel choices do not rebuild the matrix")
    gain = boxes["obj-bus-gain"]
    gain_state = gain["saved_attribute_attributes"]["valueof"]
    if (gain.get("maxclass") != "live.gain~"
            or gain.get("channels") != slot_count
            or gain.get("numinlets") != slot_count
            or gain.get("numoutlets") != slot_count + 3
            or gain.get("ignoreclick") != 0
            or gain.get("presentation_rect") !=
            [12.0, 60.0, 360.0 if slot_count == 36 else 168.0, 70.0]
            or gain_state.get("parameter_initial") != [0]
            or gain_state.get("parameter_longname") != "Multichannel Bus Gain"
            or "obj-bus-gain" not in patcher["parameters"]):
        raise ValueError(f"{name}: {slot_count}-channel bus gain is unavailable")
    dry = boxes["obj-dry-mode"]
    dry_state = dry["saved_attribute_attributes"]["valueof"]
    if (dry.get("text") != "DRY KEEP"
            or dry.get("texton") != "BUS ONLY"
            or dry.get("presentation_rect") !=
            [405.0 if slot_count == 36 else 195.0, 60.0, 84.0, 20.0]
            or dry_state.get("parameter_initial") != [0]
            or "obj-dry-mode" not in patcher["parameters"]):
        raise ValueError(f"{name}: Live stereo dry switch is not saved")
    required_lines = {
        (("obj-source-mode", 0), ("obj-route-values", 0)),
        (("obj-channel-count", 0), ("obj-route-values", 1)),
        (("obj-source-first", 0), ("obj-route-values", 2)),
        (("obj-destination-first", 0), ("obj-route-values", 3)),
        (("obj-source-first", 0), ("obj-source-last-values", 0)),
        (("obj-channel-count", 0), ("obj-source-last-values", 1)),
        (("obj-source-last-values", 0), ("obj-source-last-calculate", 0)),
        (("obj-source-last-calculate", 0), ("obj-source-last-set", 0)),
        (("obj-source-last-set", 0), ("obj-source-last-display", 0)),
        (("obj-route-values", 0), ("obj-route-order", 0)),
        (("obj-route-order", 1), ("obj-route-unpack", 0)),
        (("obj-route-order", 0), ("obj-route-rebuild", 0)),
        (("obj-route-rebuild", 1), ("obj-route-clear", 0)),
        (("obj-route-clear", 0), ("obj-route-matrix", 0)),
        (("obj-route-rebuild", 0), ("obj-route-iterate", 0)),
        (("obj-route-iterate", 2), ("obj-route-index", 0)),
        (("obj-route-index", 1), ("obj-route-destination", 0)),
        (("obj-route-index", 0), ("obj-route-source", 0)),
        (("obj-route-source", 0), ("obj-route-source-valid", 0)),
        (("obj-route-source-valid", 0), ("obj-route-cell", 0)),
        (("obj-route-destination", 0), ("obj-route-cell", 1)),
        (("obj-route-cell", 0), ("obj-route-matrix", 0)),
        (("obj-bus-symbol", 0), ("obj-bus-send", 2)),
        (("obj-device", 0), ("obj-bus-send", 0)),
        (("obj-bus-mode", 0), ("obj-bus-send", 1)),
        (("obj-init", 0), ("obj-bus-mode", 0)),
        (("obj-plugin", 0), ("obj-dry-left", 0)),
        (("obj-plugin", 1), ("obj-dry-right", 0)),
        (("obj-dry-left", 0), ("obj-plugout", 0)),
        (("obj-dry-right", 0), ("obj-plugout", 1)),
        (("obj-dry-mode", 0), ("obj-dry-invert", 0)),
        (("obj-dry-invert", 0), ("obj-dry-left", 1)),
        (("obj-dry-invert", 0), ("obj-dry-right", 1)),
    }
    if slot_count == 36:
        required_lines -= {
            (("obj-channel-count", 0), ("obj-route-values", 1)),
            (("obj-source-first", 0), ("obj-route-values", 2)),
            (("obj-source-first", 0), ("obj-source-last-values", 0)),
            (("obj-channel-count", 0), ("obj-source-last-values", 1)),
            (("obj-device", 0), ("obj-bus-send", 0)),
        }
        required_lines |= {
            (("obj-device", 0), ("obj-device-startup-trigger", 0)),
            (("obj-device-startup-trigger", 2),
             ("obj-bus-number-replay-ready", 0)),
            (("obj-device-startup-trigger", 1), ("obj-bus-insert", 0)),
            (("obj-device-startup-trigger", 0), ("obj-bus-send", 0)),
            (("obj-channel-count", 0), ("obj-width-fanout-trigger", 0)),
            (("obj-width-fanout-trigger", 2), ("obj-source-last-values", 1)),
            (("obj-width-fanout-trigger", 1),
             ("obj-channel-count-value-to-menu", 0)),
            (("obj-width-fanout-trigger", 0), ("obj-route-values", 1)),
            (("obj-source-first", 0), ("obj-from-fanout-trigger", 0)),
            (("obj-from-fanout-trigger", 2), ("obj-source-last-values", 0)),
            (("obj-from-fanout-trigger", 1),
             ("obj-source-first-value-to-menu", 0)),
            (("obj-from-fanout-trigger", 0), ("obj-route-values", 2)),
        }
    required_lines.update(
        (("obj-route-unpack", index), (destination, inlet))
        for index, destination, inlet in (
            (0, "obj-route-source", 1),
            (1, "obj-route-source", 2),
            (2, "obj-route-source", 3),
            (3, "obj-route-destination", 1),
        )
    )
    for channel in range(live_channels):
        required_lines.add(
            (("obj-plugin", channel), ("obj-route-matrix", channel)))
    for channel in range(slot_count):
        required_lines.update({
            (("obj-route-matrix", channel), ("obj-bus-gain", channel)),
            (("obj-bus-gain", channel), ("obj-plugout", channel + 2)),
        })
    for output_index, object_id, parameter_id in (
        (5, "obj-bus-output", "obj-bus-number"),
        (4, "obj-source-output", "obj-source-mode"),
        (3, "obj-width-output", "obj-channel-count"),
        (2, "obj-source-first-output", "obj-source-first"),
        (1, "obj-destination-first-output", "obj-destination-first"),
        (0, "obj-dry-output", "obj-dry-mode"),
    ):
        required_lines.update({
            (("obj-init-trigger", output_index), (object_id, 0)),
            ((object_id, 0), (parameter_id, 0)),
        })
    if required_lines - line_pairs:
        raise ValueError(f"{name}: multichannel path or recall is disconnected")
    if any((("obj-plugin", channel), ("obj-plugout", channel)) in line_pairs
           for channel in range(2, live_channels)):
        raise ValueError(f"{name}: bus output bypasses the channel map")
    if any(source[0] == "obj-source-last-display" for source, _ in line_pairs):
        raise ValueError(f"{name}: calculated TO must not control audio routing")


def validate_routing_device(name: str) -> None:
    source_path = SOURCE_DIR / f"{name}.maxpat"
    device_path = DEVICE_DIR / f"{name}.amxd"
    source = json.loads(source_path.read_text(encoding="utf-8"))
    device = read_amxd(device_path)
    if source != device:
        raise ValueError(f"{name}: editable source and packaged AMXD differ")

    patcher = source["patcher"]
    slot_count = 36 if name in ("s3g Bus Send 36",
                                "s3g Bus Receive 36") else 32
    live_channels = slot_count + 2
    bus_prefix = "s3g-bus36" if slot_count == 36 else "s3g-multichannel"
    if patcher["project"]["amxdtype"] != 1633771873:
        raise ValueError(f"{name}: not marked as a Max audio device")
    if patcher.get("minimum_live_version") != "12.0":
        raise ValueError(f"{name}: multichannel routing requires Live 12")
    expected_width = DEVICE_WIDTHS[name]
    if patcher.get("devicewidth") != expected_width:
        raise ValueError(f"{name}: unexpected device width")
    if patcher.get("openrect") != [0.0, 0.0, expected_width, COMPACT_HEIGHT]:
        raise ValueError(f"{name}: unexpected presentation bounds")
    if patcher.get("locked_bgcolor") != COLOR_BACKGROUND:
        raise ValueError(f"{name}: missing s3g presentation background")

    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    for required in (
        "obj-ui-background", "obj-bus-number", "obj-plugin",
        "obj-plugout", "obj-device", "obj-bus-symbol",
    ):
        if required not in boxes:
            raise ValueError(f"{name}: missing {required}")
    if {"obj-title", "obj-fixed-label", "obj-slot-help",
            "obj-receive-note", "obj-routing-heading"}.intersection(boxes):
        raise ValueError(f"{name}: documentation-only labels remain on the face")
    for current in boxes.values():
        rect = current.get("presentation_rect")
        if not rect:
            continue
        if (rect[0] < 0.0 or rect[1] < 0.0
                or rect[0] + rect[2] > expected_width
                or rect[1] + rect[3] > COMPACT_HEIGHT):
            raise ValueError(
                f"{name}: {current['id']} exceeds the presentation bounds"
            )
    validate_control_layout(name, boxes)
    if "obj-clap" in boxes or "obj-clap-state" in boxes:
        raise ValueError(f"{name}: transport device unexpectedly hosts CLAP")
    if boxes["obj-plugout"].get("numinlets") != live_channels:
        raise ValueError(f"{name}: transport lacks bus slots plus Live stereo")
    if boxes["obj-bus-symbol"].get("text") != f"sprintf {bus_prefix}-%ld":
        raise ValueError(f"{name}: bus is not in the private multichannel namespace")
    if "obj-bus-number" not in patcher["parameters"]:
        raise ValueError(f"{name}: bus selection is not stored by Live")
    bus_state = boxes["obj-bus-number"]["saved_attribute_attributes"]["valueof"]
    if (boxes["obj-bus-number"].get("maxclass") != "live.numbox"
            or boxes["obj-bus-number"].get("parameter_enable") != 1
            or bus_state.get("parameter_initial") != [1]
            or bus_state.get("parameter_mmin") != 1
            or bus_state.get("parameter_mmax") != 16):
        raise ValueError(f"{name}: bus selector is not a stored 1-16 parameter")

    line_pairs = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    validate_routing_menu(name, boxes, line_pairs, "obj-bus-number")
    validate_bus_menu_replay(
        name, boxes, line_pairs, "obj-bus-number",
        "obj-init-defer", "obj-bus-output",
    )
    e4l_objects = [
        current.get("text", "") for current in boxes.values()
        if current.get("text", "").startswith("e4l.")
    ]
    if e4l_objects:
        raise ValueError(f"{name}: still instantiates E4L objects: {e4l_objects}")

    if name == "s3g Send Stereo to 32ch Bus":
        if (boxes["obj-bus-label"].get("text") != "SND BUS"
                or boxes["obj-bus-label"].get("presentation_rect")
                != [12.0, 10.0, 52.0, 20.0]
                or boxes["obj-bus-number-menu"].get("presentation_rect")
                != [70.0, 10.0, 56.0, 20.0]
                or boxes["obj-pair-label"].get("presentation_rect")
                != [138.0, 10.0, 28.0, 20.0]
                or boxes["obj-pair-number-menu"].get("presentation_rect")
                != [170.0, 10.0, 80.0, 20.0]
                or boxes["obj-dry-mode"].get("presentation_rect")
                != [258.0, 10.0, 76.0, 20.0]):
            raise ValueError(f"{name}: send-bus row is clipped or ambiguous")
        if any(boxes[object_id]["presentation_rect"][1] != 10.0 for object_id in (
                "obj-bus-number-menu", "obj-pair-number-menu", "obj-dry-mode")):
            raise ValueError(f"{name}: Bus/Pair/Dry controls are not on one top row")
        validate_routing_menu(name, boxes, line_pairs, "obj-pair-number")
        required = {
            "obj-pair-number", "obj-send-gain", "obj-send-gain-2",
            "obj-gain-link", "obj-dry-mode",
            "obj-input-pan-1", "obj-input-pan-2",
            "obj-input-mute-1", "obj-input-mute-2",
            "obj-input-mute-1-invert", "obj-input-mute-2-invert",
            "obj-input-mute-1-gain", "obj-input-mute-2-gain",
            "obj-input-panner", "obj-gate-left", "obj-gate-right",
            "obj-bus-send",
        }
        if not required.issubset(boxes):
            raise ValueError(f"{name}: incomplete send controls")
        if boxes["obj-bus-send"].get("text") != (
                "s3g.bus.send s3g-multichannel-1"):
            raise ValueError(f"{name}: wrong bus sender")
        if (boxes["obj-gate-left"].get("numoutlets") != MULTICHANNEL_PAIR_COUNT
                or boxes["obj-gate-right"].get("numoutlets")
                != MULTICHANNEL_PAIR_COUNT):
            raise ValueError(f"{name}: stereo pair gates have the wrong width")
        send_parameters = {
            "obj-pair-number", "obj-send-gain", "obj-send-gain-2",
            "obj-gain-link", "obj-input-pan-1",
            "obj-input-pan-2", "obj-input-mute-1", "obj-input-mute-2",
            "obj-dry-mode",
        }
        if not send_parameters.issubset(patcher["parameters"]):
            raise ValueError(f"{name}: send controls are not stored by Live")
        for channel, object_id, x in (
                (1, "obj-send-gain", 12.0),
                (2, "obj-send-gain-2", 196.0)):
            gain = boxes[object_id]
            state = gain["saved_attribute_attributes"]["valueof"]
            if (gain.get("maxclass") != "live.gain~"
                    or gain.get("channels") != 1
                    or gain.get("numinlets") != 1
                    or gain.get("numoutlets") != 4
                    or gain.get("parameter_enable") != 1
                    or gain.get("presentation_rect") != [x, 80.0, 100.0, 48.0]
                    or state.get("parameter_initial") != [0]
                    or state.get("parameter_mmin") != -70.0
                    or state.get("parameter_mmax") != 6.0):
                raise ValueError(f"{name}: input {channel} lacks independent gain")
        if (boxes["obj-send-gain"]["varname"] != "multichannel_send_gain"
                or boxes["obj-send-gain"]["saved_attribute_attributes"]["valueof"].get(
                    "parameter_longname") != "Multichannel Send Gain"):
            raise ValueError(f"{name}: existing Send Gain parameter identity changed")
        link = boxes["obj-gain-link"]
        link_state = link["saved_attribute_attributes"]["valueof"]
        if (link.get("maxclass") != "live.text"
                or link.get("mode") != 1
                or link.get("parameter_enable") != 1
                or link.get("text") != "UNLINKED"
                or link.get("texton") != "LINKED"
                or link_state.get("parameter_initial") != [1]
                or link_state.get("parameter_enum") != ["Unlinked", "Linked"]
                or boxes["obj-gain-link-trigger"].get("text") != "t i i"
                or boxes["obj-gain-link-init-delay"].get("text") != "delay 50"
                or boxes["obj-gain-1-set"].get("text") != "prepend set"
                or boxes["obj-gain-2-set"].get("text") != "prepend set"):
            raise ValueError(f"{name}: gain link does not recall or mirror safely")
        pair_state = boxes["obj-pair-number"]["saved_attribute_attributes"]["valueof"]
        if (pair_state.get("parameter_mmin") != 1
                or pair_state.get("parameter_mmax") != MULTICHANNEL_PAIR_COUNT):
            raise ValueError(f"{name}: pair selector has the wrong range")
        for channel, initial in ((1, -50.0), (2, 50.0)):
            pan = boxes[f"obj-input-pan-{channel}"]
            pan_state = pan["saved_attribute_attributes"]["valueof"]
            mute = boxes[f"obj-input-mute-{channel}"]
            mute_state = mute["saved_attribute_attributes"]["valueof"]
            if (pan.get("maxclass") != "live.dial"
                    or pan.get("parameter_enable") != 1
                    or pan_state.get("parameter_initial") != [initial]
                    or pan_state.get("parameter_mmin") != -50.0
                    or pan_state.get("parameter_mmax") != 50.0
                    or mute.get("maxclass") != "live.text"
                    or mute.get("parameter_enable") != 1
                    or mute.get("text") != f"{channel} LIVE"
                    or mute.get("texton") != f"{channel} MUTE"
                    or mute_state.get("parameter_enum") != ["Live", "Mute"]):
                raise ValueError(
                    f"{name}: channel {channel} pan/mute is not a stored control"
                )
        if (boxes["obj-input-panner"].get("text") != "M4L.pan2~"
                or boxes["obj-input-panner"].get("numinlets") != 4
                or boxes["obj-input-panner"].get("numoutlets") != 2):
            raise ValueError(f"{name}: per-channel stereo panner is incomplete")
        dependencies = {
            entry.get("name") for entry in patcher.get("dependency_cache", [])
        }
        if "M4L.pan2~.maxpat" not in dependencies:
            raise ValueError(f"{name}: M4L pan dependency is not declared")
        required_lines = {
            (("obj-plugin", 0), ("obj-dry-left", 0)),
            (("obj-plugin", 1), ("obj-dry-right", 0)),
            (("obj-plugin", 0), ("obj-send-gain", 0)),
            (("obj-plugin", 1), ("obj-send-gain-2", 0)),
            (("obj-send-gain", 0), ("obj-input-mute-1-gain", 0)),
            (("obj-send-gain-2", 0), ("obj-input-mute-2-gain", 0)),
            (("obj-send-gain", 1), ("obj-gain-link-1-to-2", 1)),
            (("obj-send-gain-2", 1), ("obj-gain-link-2-to-1", 1)),
            (("obj-gain-link-1-to-2", 0), ("obj-gain-2-set", 0)),
            (("obj-gain-link-2-to-1", 0), ("obj-gain-1-set", 0)),
            (("obj-gain-1-set", 0), ("obj-send-gain", 0)),
            (("obj-gain-2-set", 0), ("obj-send-gain-2", 0)),
            (("obj-gain-link", 0), ("obj-gain-link-trigger", 0)),
            (("obj-gain-link-trigger", 1), ("obj-gain-link-1-to-2", 0)),
            (("obj-gain-link-trigger", 1), ("obj-gain-link-2-to-1", 0)),
            (("obj-gain-link-trigger", 0), ("obj-gain-link-on", 0)),
            (("obj-gain-link-on", 0), ("obj-gain-1-output", 0)),
            (("obj-gain-1-output", 0), ("obj-send-gain", 0)),
            (("obj-init-defer", 0), ("obj-gain-link-init-delay", 0)),
            (("obj-gain-link-init-delay", 0), ("obj-gain-link-output", 0)),
            (("obj-gain-link-output", 0), ("obj-gain-link", 0)),
            (("obj-input-mute-1", 0), ("obj-input-mute-1-invert", 0)),
            (("obj-input-mute-2", 0), ("obj-input-mute-2-invert", 0)),
            (("obj-input-mute-1-invert", 0),
             ("obj-input-mute-1-gain", 1)),
            (("obj-input-mute-2-invert", 0),
             ("obj-input-mute-2-gain", 1)),
            (("obj-input-mute-1-gain", 0), ("obj-input-panner", 0)),
            (("obj-input-pan-1", 0), ("obj-input-panner", 1)),
            (("obj-input-mute-2-gain", 0), ("obj-input-panner", 2)),
            (("obj-input-pan-2", 0), ("obj-input-panner", 3)),
            (("obj-input-panner", 0), ("obj-gate-left", 1)),
            (("obj-input-panner", 1), ("obj-gate-right", 1)),
            (("obj-init-defer", 0), ("obj-channel-init-trigger", 0)),
            (("obj-channel-init-trigger", 3), ("obj-pan-1-output", 0)),
            (("obj-pan-1-output", 0), ("obj-input-pan-1", 0)),
            (("obj-channel-init-trigger", 2), ("obj-mute-1-output", 0)),
            (("obj-mute-1-output", 0), ("obj-input-mute-1", 0)),
            (("obj-channel-init-trigger", 1), ("obj-pan-2-output", 0)),
            (("obj-pan-2-output", 0), ("obj-input-pan-2", 0)),
            (("obj-channel-init-trigger", 0), ("obj-mute-2-output", 0)),
            (("obj-mute-2-output", 0), ("obj-input-mute-2", 0)),
            (("obj-pair-number", 0), ("obj-gate-left", 0)),
            (("obj-pair-number", 0), ("obj-gate-right", 0)),
            (("obj-bus-symbol", 0), ("obj-bus-send", 2)),
            (("obj-device", 0), ("obj-bus-send", 0)),
            (("obj-bus-output", 0), ("obj-bus-number", 0)),
            (("obj-pair-output", 0), ("obj-pair-number", 0)),
            (("obj-dry-output", 0), ("obj-dry-mode", 0)),
        }
        for pair_index in range(MULTICHANNEL_PAIR_COUNT):
            required_lines.update({
                (("obj-gate-left", pair_index),
                 ("obj-plugout", 2 + pair_index * 2)),
                (("obj-gate-right", pair_index),
                 ("obj-plugout", 3 + pair_index * 2)),
            })
        if not required_lines.issubset(line_pairs):
            raise ValueError(f"{name}: incomplete stereo-to-slot routing")
        forbidden_panner_bypass = {
            (("obj-send-gain", 0), ("obj-gate-left", 1)),
            (("obj-send-gain-2", 0), ("obj-gate-right", 1)),
        }
        if forbidden_panner_bypass.intersection(line_pairs):
            raise ValueError(f"{name}: send audio bypasses channel pan/mute")
    elif name in ("s3g Send Multichannel to 32ch Bus", "s3g Bus Send 36"):
        validate_multichannel_bus_send(
            name, patcher, boxes, line_pairs,
            slot_count=slot_count, bus_prefix=bus_prefix,
        )
    else:
        if boxes["obj-bus-receive"].get("text") != (
                f"s3g.bus.receive {bus_prefix}-1"):
            raise ValueError(f"{name}: wrong bus receiver")
        if boxes["obj-chain-send"].get("text") != (
                f"s3g.bus.send {bus_prefix}-chain"):
            raise ValueError(f"{name}: missing next-device auxiliary routing")
        if boxes["obj-chain-mode"].get("text") != "1":
            raise ValueError(f"{name}: next-device routing is not in insert mode")
        if boxes["obj-plugin"].get("numoutlets") != live_channels:
            raise ValueError(f"{name}: receiver input is not {live_channels}-channel")
        required_lines = {
            (("obj-bus-symbol", 0), ("obj-bus-receive", 1)),
            (("obj-chain-mode", 0), ("obj-chain-send", 1)),
            (("obj-bus-output", 0), ("obj-bus-number", 0)),
        }
        if slot_count == 36:
            required_lines.update({
                (("obj-identity-to-buses", 1), ("obj-bus-receive", 0)),
                (("obj-identity-to-buses", 0), ("obj-chain-start-trigger", 0)),
                (("obj-chain-start-trigger", 1), ("obj-chain-send", 0)),
                (("obj-chain-start-trigger", 0), ("obj-chain-mode", 0)),
            })
        else:
            required_lines.update({
                (("obj-device", 0), ("obj-bus-receive", 0)),
                (("obj-device", 0), ("obj-chain-send", 0)),
            })
        required_lines.update(
            (("obj-plugin", slot + 2), ("obj-plugout", slot + 2))
            for slot in range(slot_count)
        )
        if not required_lines.issubset(line_pairs):
            raise ValueError(f"{name}: incomplete {slot_count}-slot passthrough")
        forbidden_stereo = {
            (("obj-plugin", channel), ("obj-plugout", channel))
            for channel in (0, 1)
        }
        if forbidden_stereo.intersection(line_pairs):
            raise ValueError(f"{name}: ordinary Live stereo is not blocked")
        if slot_count == 36:
            validate_routing_menu(name, boxes, line_pairs,
                                  "obj-monitor-pair")
            monitor = boxes["obj-monitor-pair"]
            state = monitor["saved_attribute_attributes"]["valueof"]
            choices = [
                item for item in boxes["obj-monitor-pair-menu"]["items"]
                if item != ","
            ]
            if (state.get("parameter_initial") != [0]
                    or state.get("parameter_mmin") != 0
                    or state.get("parameter_mmax") != 18
                    or choices != ["OFF"] + [
                        f"{pair * 2 - 1:02d}/{pair * 2:02d}"
                        for pair in range(1, 19)
                    ]
                    or patcher["parameters"].get("obj-monitor-pair") !=
                    ["Bus Monitor Pair", "Monitor", 0]
                    or boxes["obj-monitor-left"].get("text") !=
                    "selector~ 18 @ramptime 5."
                    or boxes["obj-monitor-right"].get("text") !=
                    "selector~ 18 @ramptime 5."):
                raise ValueError(f"{name}: safe stereo pair monitor is missing")
            monitor_lines = {
                (("obj-monitor-pair", 0), ("obj-monitor-left", 0)),
                (("obj-monitor-pair", 0), ("obj-monitor-right", 0)),
                (("obj-init-defer", 0), ("obj-monitor-output", 0)),
                (("obj-monitor-output", 0), ("obj-monitor-pair", 0)),
                (("obj-monitor-left", 0), ("obj-plugout", 0)),
                (("obj-monitor-right", 0), ("obj-plugout", 1)),
            }
            for pair in range(18):
                monitor_lines.update({
                    (("obj-plugin", 2 + pair * 2),
                     ("obj-monitor-left", pair + 1)),
                    (("obj-plugin", 3 + pair * 2),
                     ("obj-monitor-right", pair + 1)),
                })
            if monitor_lines - line_pairs:
                raise ValueError(f"{name}: monitor pair path is incomplete")


def validate_drum_device(name: str) -> None:
    source = json.loads((SOURCE_DIR / f"{name}.maxpat").read_text(
        encoding="utf-8"))
    if source != read_amxd(DEVICE_DIR / f"{name}.amxd"):
        raise ValueError(f"{name}: source and packaged device differ")
    patcher = source["patcher"]
    width = DEVICE_WIDTHS[name]
    if (patcher.get("devicewidth") != width
            or patcher.get("openrect") != [0.0, 0.0, width, COMPACT_HEIGHT]
            or patcher.get("locked_bgcolor") != COLOR_BACKGROUND):
        raise ValueError(f"{name}: malformed compact presentation")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    if len(boxes) != len(patcher["boxes"]):
        raise ValueError(f"{name}: duplicate Max object IDs")
    validate_control_layout(name, boxes)
    line_pairs = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    if name.startswith("s3g Send Stereo to"):
        if (patcher["project"]["amxdtype"] != 1633771873
                or "obj-clap" in boxes
                or boxes["obj-plugout"].get("numinlets") != 18
                or boxes["obj-bus-send"].get("text") !=
                "s3g.bus.send s3g-drum16-1"
                or boxes["obj-bus-symbol"].get("text") !=
                "sprintf s3g-drum16-%ld"
                or boxes["obj-gate-left"].get("numoutlets") != 8
                or boxes["obj-gate-right"].get("numoutlets") != 8):
            raise ValueError(f"{name}: Drum send is not an eight-pair bus")
        validate_routing_menu(name, boxes, line_pairs, "obj-bus-number")
        validate_routing_menu(name, boxes, line_pairs, "obj-pair-number")
        validate_bus_menu_replay(name, boxes, line_pairs, "obj-bus-number",
                                 "obj-init-defer", "obj-bus-output")
        pair_state = boxes["obj-pair-number"]["saved_attribute_attributes"]["valueof"]
        if pair_state.get("parameter_mmax") != 8:
            raise ValueError(f"{name}: Drum pair menu is not 1–8")
        for pair in range(8):
            for side, gate in enumerate(("obj-gate-left", "obj-gate-right")):
                if ((gate, pair), ("obj-plugout", 2 + pair * 2 + side)) not in line_pairs:
                    raise ValueError(f"{name}: pair {pair + 1} is disconnected")
        return

    kind = name.removeprefix("s3g Drum ")
    is_mixer = kind == "Mixer 16"
    is_instrument = kind in DRUM_INSTRUMENT_IDS
    expected_ids = ((1, 2, 3, 9) if is_mixer else
                    DRUM_INSTRUMENT_IDS[kind] if is_instrument else
                    DRUM_EFFECT_IDS[kind])
    slug = kind.lower().replace(" ", "-")
    plugin_id = ("org.s3g.s3g-dsp.drum-mixer-16" if is_mixer else
                 f"org.s3g.s3g-dsp.drum-{slug}")
    plugin_name = name if is_mixer else f"{name} 2"
    if (patcher["project"]["amxdtype"] !=
            (1835887981 if is_instrument else 1633771873)
            or boxes["obj-default-open"].get("text") !=
            f'openifempty "{plugin_name}" {plugin_id}'
            or boxes["obj-clap"].get("text") !=
            ("s3g.clap~ 16 16" if is_mixer else
             "s3g.clap~ 0 2" if is_instrument else "s3g.clap~ 2 2")
            or boxes["obj-clap-state"].get("saved_object_attributes", {}).get(
                "parameter_enable") != 1):
        raise ValueError(f"{name}: wrong CLAP identity, topology, or state carrier")
    if ("obj-midi-in" in boxes) != is_instrument:
        raise ValueError(f"{name}: MIDI input does not match instrument type")
    if is_instrument and {
        (("obj-midi-in", 0), ("obj-midi-parse", 0)),
        (("obj-midi-parse", 7), ("obj-clap", 0)),
    } - line_pairs:
        raise ValueError(f"{name}: MIDI events are not forwarded to CLAP")
    if is_instrument:
        trigger_id = 29 if kind == "Concert Bass" else 27
        validate_action_button(name, "TRIGGER", boxes["obj-trigger-button"])
        if (boxes["obj-trigger-button"].get("presentation_rect") !=
                [84.0, 10.0, 68.0, 20.0]
                or boxes["obj-trigger-order"].get("text") != "t b b"
                or boxes["obj-trigger-hit"].get("text") !=
                f"automateparamid {trigger_id} 1"
                or boxes["obj-trigger-reset"].get("text") !=
                f"automateparamid {trigger_id} 0"):
            raise ValueError(f"{name}: primary trigger button is malformed")
        trigger_lines = {
            (("obj-trigger-button", 0), ("obj-trigger-order", 0)),
            (("obj-trigger-order", 1), ("obj-trigger-hit", 0)),
            (("obj-trigger-hit", 0), ("obj-clap", 0)),
            (("obj-trigger-order", 0), ("obj-trigger-reset", 0)),
            (("obj-trigger-reset", 0), ("obj-clap", 0)),
        }
        if trigger_lines - line_pairs:
            raise ValueError(f"{name}: trigger pulse is not wired to CLAP")
    for parameter_id in expected_ids:
        control_id = f"obj-param-{parameter_id}"
        if (control_id not in patcher["parameters"]
                or boxes[control_id].get("parameter_enable") != 1
                or boxes[f"obj-param-message-{parameter_id}"].get("text") !=
                f"automateparamid {parameter_id} $1"):
            raise ValueError(f"{name}: parameter {parameter_id} is not automatable")
    if is_mixer:
        if (boxes["obj-bus-receive"].get("text") !=
                "s3g.bus.receive s3g-drum16-1"
                or boxes["obj-input-bus-symbol"].get("text") !=
                "sprintf s3g-drum16-%ld"
                or boxes["obj-plugout"].get("numinlets") != 18):
            raise ValueError(f"{name}: dedicated Drum receive is incomplete")
        validate_routing_menu(name, boxes, line_pairs, "obj-input-bus-number")
        validate_bus_menu_replay(name, boxes, line_pairs,
                                 "obj-input-bus-number",
                                 "obj-input-bus-init-defer",
                                 "obj-input-bus-output")
        expected_lines = {
            (("obj-device", 0), ("obj-bus-receive", 0)),
            (("obj-input-bus-symbol", 0), ("obj-bus-receive", 1)),
            (("obj-clap", 0), ("obj-plugout", 0)),
            (("obj-clap", 1), ("obj-plugout", 1)),
        }
        expected_lines.update(
            (("obj-plugin", channel + 2), ("obj-clap", channel))
            for channel in range(16)
        )
        expected_lines.update(
            (("obj-clap", channel), ("obj-plugout", channel + 2))
            for channel in range(16)
        )
        if expected_lines - line_pairs:
            raise ValueError(f"{name}: Drum bus-to-CLAP mapping is incomplete")
        if any((("obj-plugin", channel), ("obj-clap", channel)) in line_pairs
               for channel in (0, 1)):
            raise ValueError(f"{name}: Live stereo leaks into the Drum mixer")
    else:
        for channel in range(2):
            if (("obj-clap", channel), ("obj-plugout", channel)) not in line_pairs:
                raise ValueError(f"{name}: stereo output {channel + 1} is missing")
            if (not is_instrument and
                    (("obj-plugin", channel), ("obj-clap", channel))
                    not in line_pairs):
                raise ValueError(f"{name}: stereo input {channel + 1} is missing")


def validate_sample_instrument(name: str) -> None:
    source = json.loads((SOURCE_DIR / f"{name}.maxpat").read_text(
        encoding="utf-8"))
    if source != read_amxd(DEVICE_DIR / f"{name}.amxd"):
        raise ValueError(f"{name}: source and packaged device differ")
    patcher = source["patcher"]
    width = DEVICE_WIDTHS[name]
    if (patcher["project"]["amxdtype"] != 1835887981
            or patcher.get("devicewidth") != width
            or patcher.get("openrect") != [0.0, 0.0, width, COMPACT_HEIGHT]):
        raise ValueError(f"{name}: not a compact Max Instrument")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    if len(boxes) != len(patcher["boxes"]):
        raise ValueError(f"{name}: duplicate Max object IDs")
    validate_control_layout(name, boxes)
    validate_action_button(name, "EDITOR", boxes["obj-gui-button"])
    kind = name.removeprefix("s3g Sample ").removesuffix(" 2")
    if (boxes["obj-clap"].get("text") != "s3g.clap~ 0 2"
            or boxes["obj-default-open"].get("text") !=
            f'openifempty "{name}" org.s3g.s3g-dsp.sample-{kind.lower()}'
            or boxes["obj-clap-state"].get("saved_object_attributes", {}).get(
                "parameter_enable") != 1
            or "obj-plugin" in boxes or "obj-bus-send" in boxes
            or "obj-bus-receive" in boxes):
        raise ValueError(f"{name}: wrong stereo Sample topology or identity")
    line_pairs = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    required_lines = {
        (("obj-play-button", 0), ("obj-play-message", 0)),
        (("obj-play-message", 0), ("obj-clap", 0)),
        (("obj-kill-button", 0), ("obj-kill-message", 0)),
        (("obj-kill-message", 0), ("obj-clap", 0)),
        (("obj-midi-in", 0), ("obj-midi-parse", 0)),
        (("obj-midi-parse", 7), ("obj-clap", 0)),
        (("obj-clap", 0), ("obj-plugout", 0)),
        (("obj-clap", 1), ("obj-plugout", 1)),
    }
    if required_lines - line_pairs:
        raise ValueError(f"{name}: Sample controls, MIDI, or stereo output are disconnected")
    for label, object_id, x in (("PLAY", "obj-play-button", 84.0),
                                ("KILL", "obj-kill-button", 156.0)):
        validate_action_button(name, label, boxes[object_id])
        if boxes[object_id].get("presentation_rect") != [x, 10.0, 64.0, 20.0]:
            raise ValueError(f"{name}: {label} is not in the Sample toolbar")
    play_note = 43 if kind == "Doubles" else 60
    kill_command = ("midievent 144 37 100" if kind == "Doubles" else
                    "killvoices" if kind == "Player" else
                    "midievent 176 123 0")
    if (boxes["obj-play-message"].get("text") !=
            f"midievent 144 {play_note} 100"
            or boxes["obj-kill-message"].get("text") != kill_command):
        raise ValueError(f"{name}: Sample Play/Kill commands are wrong")
    for parameter_id in SAMPLE_INSTRUMENT_IDS[kind]:
        control_id = f"obj-param-{parameter_id}"
        if (control_id not in patcher["parameters"]
                or boxes[control_id].get("parameter_enable") != 1
                or boxes[f"obj-param-message-{parameter_id}"].get("text") !=
                f"automateparamid {parameter_id} $1"):
            raise ValueError(f"{name}: parameter {parameter_id} is not automatable")


def validate_sample_circulator() -> None:
    name = SAMPLE_CIRCULATOR
    source = json.loads((SOURCE_DIR / f"{name}.maxpat").read_text(
        encoding="utf-8"))
    if source != read_amxd(DEVICE_DIR / f"{name}.amxd"):
        raise ValueError(f"{name}: source and packaged device differ")
    patcher = source["patcher"]
    if (patcher["project"]["amxdtype"] != 1633771873
            or patcher.get("devicewidth") != DEVICE_WIDTHS[name]
            or patcher.get("openrect") !=
            [0.0, 0.0, DEVICE_WIDTHS[name], COMPACT_HEIGHT]):
        raise ValueError(f"{name}: not a compact Max Audio Effect")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    if len(boxes) != len(patcher["boxes"]):
        raise ValueError(f"{name}: duplicate Max object IDs")
    validate_control_layout(name, boxes)
    validate_action_button(name, "EDITOR", boxes["obj-gui-button"])
    if (boxes["obj-clap"].get("text") != "s3g.clap~ 2 2"
            or boxes["obj-default-open"].get("text") !=
            'openifempty "s3g Sample Circulator 2" org.s3g.s3g-dsp.crcltr'
            or boxes["obj-clap-state"].get("saved_object_attributes", {}).get(
                "parameter_enable") != 1):
        raise ValueError(f"{name}: wrong Circulator identity or topology")
    line_pairs = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    required_lines = {
        (("obj-play-button", 0), ("obj-play-message", 0)),
        (("obj-play-message", 0), ("obj-clap", 0)),
        (("obj-kill-button", 0), ("obj-kill-message", 0)),
        (("obj-kill-message", 0), ("obj-clap", 0)),
        (("obj-midi-in", 0), ("obj-midi-parse", 0)),
        (("obj-midi-parse", 7), ("obj-clap", 0)),
    }
    for channel in range(2):
        required_lines.add((("obj-plugin", channel), ("obj-clap", channel)))
        required_lines.add((("obj-clap", channel), ("obj-plugout", channel)))
    if required_lines - line_pairs:
        raise ValueError(f"{name}: capture input or stereo output is disconnected")
    for label, object_id, x in (("PLAY", "obj-play-button", 84.0),
                                ("KILL", "obj-kill-button", 156.0)):
        validate_action_button(name, label, boxes[object_id])
        if boxes[object_id].get("presentation_rect") != [x, 10.0, 64.0, 20.0]:
            raise ValueError(f"{name}: {label} is not in the Sample toolbar")
    if (boxes["obj-play-message"].get("text") != "paramid 22 1"
            or boxes["obj-kill-message"].get("text") != "paramid 22 0"):
        raise ValueError(f"{name}: Circulator Play/Kill commands are wrong")
    for parameter_id in (4, 5, 7):
        control_id = f"obj-param-{parameter_id}"
        if (control_id not in patcher["parameters"]
                or boxes[control_id].get("parameter_enable") != 1
                or boxes[f"obj-param-message-{parameter_id}"].get("text") !=
                f"automateparamid {parameter_id} $1"):
            raise ValueError(f"{name}: parameter {parameter_id} is not automatable")


def validate_panner_main(name: str) -> None:
    source = json.loads((SOURCE_DIR / f"{name}.maxpat").read_text(
        encoding="utf-8"))
    if source != read_amxd(DEVICE_DIR / f"{name}.amxd"):
        raise ValueError(f"{name}: source and packaged device differ")
    patcher = source["patcher"]
    kind = name.removeprefix("s3g Panner ").removesuffix(" Main")
    if (patcher["project"]["amxdtype"] != 1633771873
            or patcher.get("minimum_live_version") != "12.0"
            or patcher.get("devicewidth") != DEVICE_WIDTHS[name]
            or patcher.get("openrect") !=
            [0.0, 0.0, DEVICE_WIDTHS[name], MAIN_OUT_HEIGHT]):
        raise ValueError(f"{name}: invalid Main hardware endpoint")
    boxes = {entry["box"]["id"]: entry["box"]
             for entry in patcher["boxes"]}
    if len(boxes) != len(patcher["boxes"]):
        raise ValueError(f"{name}: duplicate Max object IDs")
    validate_control_layout(name, boxes)
    validate_action_button(name, "EDITOR", boxes["obj-gui-button"])
    validate_action_button(name, "HARDWARE", boxes["obj-hardware-button"])
    if (boxes["obj-default-open"].get("text") !=
            f'openifempty "s3g Panner {kind} 64" {PANNER_MAIN_IDS[kind]}'
            or boxes["obj-clap"].get("text") != "s3g.clap~ 32 32"
            or boxes["obj-plugin"].get("numoutlets") != 34
            or boxes["obj-plugout"].get("numinlets") != 34
            or boxes["obj-bus-receive"].get("text") !=
            "s3g.bus.receive s3g-multichannel-1"
            or boxes["obj-input-bus-symbol"].get("text") !=
            "sprintf s3g-multichannel-%ld"):
        raise ValueError(f"{name}: wrong Panner CLAP or private bus topology")
    gain = boxes["obj-panner-input-gain"]
    if (gain.get("maxclass") != "live.gain~"
            or gain.get("channels") != 32
            or gain.get("numinlets") != 32
            or gain.get("numoutlets") != 35
            or gain.get("parameter_enable") != 1
            or gain.get("ignoreclick") != 0
            or gain.get("shownumber") != 1
            or gain.get("presentation_rect") != [16.0, 66.0, 168.0, 68.0]
            or patcher["parameters"].get("obj-panner-input-gain") !=
            ["Panner Input Gain", "Input Gain", 0]):
        raise ValueError(f"{name}: 32-lane input gain is missing or unsaved")
    if (boxes["obj-mono-matrix"].get("text") !=
            "matrix~ 32 32 1. @ramp 5."
            or boxes["obj-mono-grid"].get("presentation_rect") !=
            [240.0, 28.0, 448.0, 112.0]
            or boxes["obj-mono-grid"].get("columns") != 32
            or boxes["obj-mono-grid"].get("rows") != 8
            or boxes["obj-hardware-routing"].get("text") !=
            "p Hardware Output Pairs"):
        raise ValueError(f"{name}: mono matrix or hardware routing is malformed")
    lines = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    validate_routing_menu(name, boxes, lines, "obj-input-bus-number")
    validate_bus_menu_replay(name, boxes, lines, "obj-input-bus-number",
                             "obj-input-bus-init-defer", "obj-input-bus-output")
    required = {
        (("obj-device", 0), ("obj-device-split", 0)),
        (("obj-device-split", 0), ("obj-bus-receive", 0)),
        (("obj-device-split", 1), ("obj-once", 0)),
        (("obj-once", 0), ("obj-output-init", 0)),
        (("obj-input-bus-number", 0), ("obj-input-bus-symbol", 0)),
        (("obj-input-bus-symbol", 0), ("obj-bus-receive", 1)),
        (("obj-hardware-button", 0), ("obj-hardware-open", 0)),
        (("obj-hardware-open", 0), ("obj-hardware-pcontrol", 0)),
        (("obj-hardware-pcontrol", 0), ("obj-hardware-routing", 0)),
        (("obj-device", 0), ("obj-hardware-routing", 0)),
    }
    for channel in range(32):
        required.update({
            (("obj-plugin", channel + 2),
             ("obj-panner-input-gain", channel)),
            (("obj-panner-input-gain", channel), ("obj-clap", channel)),
            (("obj-clap", channel), ("obj-mono-matrix", channel)),
            (("obj-mono-matrix", channel), ("obj-plugout", channel + 2)),
        })
        parameter = f"obj-mono-output-{channel + 1}"
        state = boxes[parameter]["saved_attribute_attributes"]["valueof"]
        if (state.get("parameter_initial") != [channel + 1]
                or state.get("parameter_mmin") != 0
                or state.get("parameter_mmax") != 32
                or patcher["parameters"].get(parameter) !=
                [f"Panner Channel {channel + 1} Output",
                 f"Out {channel + 1}", 0]):
            raise ValueError(f"{name}: speaker {channel + 1} mapping is not saved")
    if required - lines:
        raise ValueError(f"{name}: bus-to-CLAP-to-hardware channel path is broken")
    if any((('obj-plugin', channel), ('obj-plugout', channel)) in lines
           for channel in (0, 1)):
        raise ValueError(f"{name}: Live stereo leaks around the Panner")
    if (any(object_id.startswith("obj-rec-") for object_id in boxes)
            or "obj-bus-send" in boxes
            or "obj-ambi-input-gain" in boxes
            or any(current.get("text") == "s3g.bus.receive master"
                   for current in boxes.values())):
        raise ValueError(f"{name}: Panner incorrectly depends on the 3OA bus")
    for parameter_id in (3, 6, 7, 10):
        control = f"obj-param-{parameter_id}"
        if (control not in patcher["parameters"]
                or boxes[control].get("parameter_enable") != 1
                or boxes[f"obj-param-message-{parameter_id}"].get("text") !=
                f"automateparamid {parameter_id} $1"):
            raise ValueError(f"{name}: CLAP parameter {parameter_id} is not automatable")


def validate_output_autogain(name: str) -> None:
    source = json.loads((SOURCE_DIR / f"{name}.maxpat").read_text(
        encoding="utf-8"))
    if source != read_amxd(DEVICE_DIR / f"{name}.amxd"):
        raise ValueError(f"{name}: source and packaged device differ")
    patcher = source["patcher"]
    quad = name.endswith("Quad Main")
    width = DEVICE_WIDTHS[name]
    if (patcher["project"]["amxdtype"] != 1633771873
            or patcher.get("minimum_live_version") != "12.0"
            or patcher.get("devicewidth") != width
            or patcher.get("openrect") !=
            [0.0, 0.0, width, MAIN_OUT_HEIGHT if quad else COMPACT_HEIGHT]):
        raise ValueError(f"{name}: wrong Live endpoint or face bounds")
    boxes = {entry["box"]["id"]: entry["box"] for entry in patcher["boxes"]}
    if len(boxes) != len(patcher["boxes"]):
        raise ValueError(f"{name}: duplicate Max object IDs")
    validate_control_layout(name, boxes)
    validate_action_button(name, "EDITOR", boxes["obj-gui-button"])
    plugin_name = ("s3g Output Autogain Quad 4" if quad else
                   "s3g Output Autogain Stereo 2")
    plugin_id = ("org.s3g.s3g-dsp.mc-to-quad-autogain" if quad else
                 "org.s3g.s3g-dsp.mc-to-stereo-autogain")
    if (boxes["obj-default-open"].get("text") !=
            f'openifempty "{plugin_name}" {plugin_id}'
            or boxes["obj-clap"].get("text") !=
            ("s3g.clap~ 32 4" if quad else "s3g.clap~ 32 2")
            or boxes["obj-plugin"].get("numoutlets") != 34
            or boxes["obj-plugout"].get("numinlets") != (34 if quad else 2)
            or boxes["obj-bus-receive"].get("text") !=
            "s3g.bus.receive s3g-multichannel-1"
            or boxes["obj-input-bus-symbol"].get("text") !=
            "sprintf s3g-multichannel-%ld"
            or boxes["obj-clap-state"].get("saved_object_attributes", {}).get(
                "parameter_enable") != 1):
        raise ValueError(f"{name}: CLAP identity, state, or bus topology is wrong")
    gain = boxes["obj-autogain-input-gain"]
    if (gain.get("maxclass") != "live.gain~"
            or gain.get("channels") != 32
            or gain.get("numinlets") != 32
            or gain.get("numoutlets") != 35
            or gain.get("ignoreclick") != 0
            or gain.get("presentation_rect") != [16.0, 66.0, 168.0, 68.0]
            or patcher["parameters"].get("obj-autogain-input-gain") !=
            ["Output AutoGain Input Gain", "Input Gain", 0]):
        raise ValueError(f"{name}: linked 32-channel input gain is missing")
    lines = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in patcher["lines"]
    }
    validate_routing_menu(name, boxes, lines, "obj-input-bus-number")
    validate_bus_menu_replay(name, boxes, lines, "obj-input-bus-number",
                             "obj-input-bus-init-defer", "obj-input-bus-output")
    required = {
        (("obj-input-bus-number", 0), ("obj-input-bus-symbol", 0)),
        (("obj-input-bus-symbol", 0), ("obj-bus-receive", 1)),
        (("obj-input-bus-output", 0), ("obj-input-bus-number", 0)),
    }
    for channel in range(32):
        required.update({
            (("obj-plugin", channel + 2),
             ("obj-autogain-input-gain", channel)),
            (("obj-autogain-input-gain", channel), ("obj-clap", channel)),
        })
    if quad:
        validate_action_button(name, "HARDWARE", boxes["obj-hardware-button"])
        if boxes["obj-hardware-routing"].get("text") != "p Hardware Output Pairs":
            raise ValueError(f"{name}: hardware output-pair window is missing")
        selectors = {
            entry["box"]["id"] for entry in
            boxes["obj-hardware-routing"]["patcher"]["boxes"]
        }
        if any(f"obj-output-selector-{pair}" not in selectors
               for pair in range(1, 17)):
            raise ValueError(f"{name}: fewer than sixteen hardware pairs")
        required.update({
            (("obj-device", 0), ("obj-device-split", 0)),
            (("obj-device-split", 0), ("obj-bus-receive", 0)),
            (("obj-device-split", 1), ("obj-once", 0)),
            (("obj-once", 0), ("obj-output-init", 0)),
            (("obj-device", 0), ("obj-hardware-routing", 0)),
            (("obj-hardware-button", 0), ("obj-hardware-open", 0)),
            (("obj-hardware-open", 0), ("obj-hardware-pcontrol", 0)),
            (("obj-hardware-pcontrol", 0), ("obj-hardware-routing", 0)),
            (("obj-quad-output-init", 0), ("obj-quad-output-init-defer", 0)),
            (("obj-quad-output-init-defer", 0),
             ("obj-quad-output-outputvalue", 0)),
        })
        for channel, label in enumerate(("L", "R", "RB", "LB"), 1):
            control = f"obj-quad-output-{channel}"
            gate = f"obj-quad-output-gate-{channel}"
            validate_routing_menu(name, boxes, lines, control)
            state = boxes[control]["saved_attribute_attributes"]["valueof"]
            choices = [item for item in boxes[f"{control}-menu"]["items"]
                       if item != ","]
            if (boxes[f"obj-quad-output-label-{channel}"].get("text") != label
                    or state.get("parameter_initial") != [channel]
                    or state.get("parameter_mmin") != 0
                    or state.get("parameter_mmax") != 32
                    or patcher["parameters"].get(control) !=
                    [f"Quad {label} Output Slot", f"{label} Out", 0]
                    or choices != ["OFF"] + [f"{slot:02d}" for slot in range(1, 33)]
                    or boxes[gate].get("text") != "gate~ 32 1 @ramptime 5."
                    or boxes[gate].get("numoutlets") != 32):
                raise ValueError(f"{name}: {label} mono output assignment is wrong")
            required.update({
                (("obj-clap", channel - 1), (gate, 1)),
                ((control, 0), (gate, 0)),
                (("obj-quad-output-outputvalue", 0), (control, 0)),
            })
            required.update(((gate, slot), ("obj-plugout", slot + 2))
                            for slot in range(32))
    else:
        required.add((("obj-device", 0), ("obj-bus-receive", 0)))
        required.update((("obj-clap", channel), ("obj-plugout", channel))
                        for channel in range(2))
        if any(object_id.startswith("obj-quad-output")
               or object_id.startswith("obj-hardware") for object_id in boxes):
            raise ValueError(f"{name}: stereo endpoint exposes hardware routing")
    if required - lines:
        raise ValueError(f"{name}: bus, CLAP, or output channel path is broken")
    if ("obj-bus-send" in boxes
            or any(current.get("text") == "s3g.bus.receive master"
                   for current in boxes.values())
            or any((("obj-plugin", channel), ("obj-plugout", channel)) in lines
                   for channel in range(2))):
        raise ValueError(f"{name}: ordinary stereo or 3OA bus leaks into the output")
    for parameter_id in range(1, 10):
        control = f"obj-param-{parameter_id}"
        if (control not in patcher["parameters"]
                or boxes[control].get("parameter_enable") != 1
                or boxes[f"obj-param-message-{parameter_id}"].get("text") !=
                f"automateparamid {parameter_id} $1"):
            raise ValueError(f"{name}: CLAP parameter {parameter_id} is not automatable")
    if any(object_id.startswith("obj-param-topology") for object_id in boxes):
        raise ValueError(f"{name}: saved Input Channels is being forced")


def main() -> int:
    for name, values in EXPECTED.items():
        validate(name, *values)
    for name in DRUM_DEVICES:
        validate_drum_device(name)
    for name in SAMPLE_INSTRUMENTS:
        validate_sample_instrument(name)
    validate_sample_circulator()
    for name in PANNER_MAIN_DEVICES:
        validate_panner_main(name)
    for name in OUTPUT_AUTOGAIN_DEVICES:
        validate_output_autogain(name)
    for directory, suffix in ((SOURCE_DIR, ".maxpat"), (DEVICE_DIR, ".amxd")):
        old_names = list(directory.glob(f"s3g CLAP 3OA *{suffix}"))
        old_names.extend(
            directory / f"{name}{suffix}"
            for name in ("s3g 3OA Main Out", "s3g 3OA Speaker Main Out",
                         "s3g Multichannel Send")
            if (directory / f"{name}{suffix}").exists()
        )
        if old_names:
            raise ValueError(f"legacy device names remain in {directory}: {old_names}")
    for name in ROUTING_DEVICES:
        validate_routing_device(name)
    installer = (ROOT / "scripts/install-live-devices.sh").read_text(
        encoding="utf-8"
    )
    missing_installer_devices = [
        name for name in (*ROUTING_DEVICES, *CURRENT_AMBI_DEVICES, *DRUM_DEVICES,
                          *SAMPLE_INSTRUMENTS, SAMPLE_CIRCULATOR,
                          *PANNER_MAIN_DEVICES, *OUTPUT_AUTOGAIN_DEVICES)
        if f'"{name}.amxd"' not in installer
    ]
    if missing_installer_devices:
        raise ValueError(
            "Live installer omits generated devices: "
            + ", ".join(missing_installer_devices)
        )
    if ("s3g CLAP 3OA" in installer or '"s3g 3OA ' in installer
            or "legacy_devices" in installer
            or '"s3g 3OA Main Out.amxd"' in installer
            or '"s3g 3OA Speaker Main Out.amxd"' in installer):
        raise ValueError("legacy name migration remains in the Live installer")
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
    receiver_lines = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in receiver["patcher"]["lines"]
    }
    receiver_boxes = {
        entry["box"]["id"]: entry["box"]
        for entry in receiver["patcher"]["boxes"]
    }
    receiver_box_list = list(receiver_boxes.values())
    for index, first in enumerate(receiver_box_list):
        x, y, width, height = first["patching_rect"]
        for second in receiver_box_list[index + 1:]:
            sx, sy, sw, sh = second["patching_rect"]
            if (min(x + width, sx + sw) > max(x, sx)
                    and min(y + height, sy + sh) > max(y, sy)):
                raise ValueError(
                    f"s3g receiver patching overlap: {first['id']} / {second['id']}"
                )
    if (receiver_boxes["obj-track-ready-trigger"]["text"] != "t b l"
            or (("obj-1", 0), ("obj-track-ready-trigger", 0))
            not in receiver_lines
            or (("obj-track-ready-trigger", 1), ("obj-33", 0))
            not in receiver_lines
            or (("obj-track-ready-trigger", 0), ("obj-13", 0))
            not in receiver_lines):
        raise ValueError("s3g receiver cannot confirm an ACK was dispatched")

    # Live retains auxiliary sender routing until it is explicitly cleared.
    # Changing a receiver's bus must clear only its old bus before the new
    # name is announced; same-name replays must still announce for startup.
    previous_bus_lines = {
        (("obj-2", 0), ("obj-bus-input-trigger", 0)),
        (("obj-bus-input-trigger", 1), ("obj-bus-change", 0)),
        (("obj-bus-input-trigger", 0), ("obj-3", 0)),
        (("obj-bus-change", 0), ("obj-prev-trigger", 0)),
        (("obj-prev-trigger", 1), ("obj-prev-name", 0)),
        (("obj-prev-trigger", 0), ("obj-prev-name", 1)),
        (("obj-prev-name", 0), ("obj-prev-clear", 0)),
        (("obj-prev-clear", 0), ("obj-prev-send", 0)),
    }
    if (not previous_bus_lines.issubset(receiver_lines)
            or (("obj-2", 0), ("obj-3", 0)) in receiver_lines
            or receiver_boxes["obj-bus-input-trigger"]["text"] != "t s s"
            or receiver_boxes["obj-bus-change"]["text"] != "zl.change"
            or receiver_boxes["obj-prev-trigger"]["text"] != "t s b"
            or receiver_boxes["obj-prev-name"]["text"] != "zl.reg"
            or receiver_boxes["obj-prev-clear"]["text"] != "sprintf %s clear"
            or receiver_boxes["obj-prev-send"]["text"] != "s s3g.bus.ack"):
        raise ValueError("s3g receiver cannot disconnect its previous bus")

    sender_text = (ROUTING_ROOT / "bus/s3g.bus.send.maxpat").read_text(
        encoding="utf-8"
    )
    if "s s3g.bus.syn" not in sender_text or "r s3g.bus.ack" not in sender_text:
        raise ValueError("s3g sender lost its private bus handshake")
    if "Sends Only" in sender_text or "output_routing_type" in sender_text:
        raise ValueError("s3g sender still changes normal Live track output routing")
    sender_patch = json.loads(sender_text)["patcher"]
    sender_boxes = {
        entry["box"]["id"]: entry["box"]
        for entry in sender_patch["boxes"]
    }
    sender_lines = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in sender_patch["lines"]
    }
    aux_ready_lines = {
        (("obj-6", 1), ("obj-aux-ready-trigger", 0)),
        (("obj-aux-ready-trigger", 1), ("obj-38", 1)),
        (("obj-aux-ready-trigger", 0), ("obj-32", 1)),
    }
    if (sender_boxes["obj-aux-ready-trigger"]["text"] != "t b l"
            or not aux_ready_lines.issubset(sender_lines)
            or (("obj-6", 1), ("obj-38", 1)) in sender_lines):
        raise ValueError("s3g sender can route before audio_outputs is ready")
    if (sender_boxes["obj-10"]["text"] != "route reset clear"
            or sender_boxes["obj-clear-trigger"]["text"] != "t b b"
            or (("obj-10", 1), ("obj-clear-trigger", 0)) not in sender_lines
            or (("obj-clear-trigger", 1), ("obj-17", 0)) not in sender_lines
            or (("obj-clear-trigger", 0), ("obj-76", 0)) not in sender_lines
            or (("obj-10", 1), ("obj-76", 0)) in sender_lines
            or (("obj-76", 0), ("obj-77", 0)) not in sender_lines):
        raise ValueError("s3g sender cannot reconnect after a bus clear")

    device_track = json.loads(
        (ROUTING_ROOT / "live/s3g.live.device_track.maxpat").read_text(
            encoding="utf-8")
    )["patcher"]
    device_track_boxes = {
        entry["box"]["id"]: entry["box"] for entry in device_track["boxes"]
    }
    device_track_lines = {
        (tuple(entry["patchline"]["source"]),
         tuple(entry["patchline"]["destination"]))
        for entry in device_track["lines"]
    }
    if (device_track_boxes["obj-s3g-stop-at-song"].get("text") != "route Song"
            or (("obj-29", 1), ("obj-s3g-stop-at-song", 0))
            not in device_track_lines
            or (("obj-s3g-stop-at-song", 1), ("obj-42", 0))
            not in device_track_lines
            or (("obj-29", 1), ("obj-42", 0)) in device_track_lines):
        raise ValueError("device-track lookup still traverses above Song")

    selector = json.loads(
        (ROUTING_ROOT / "live/s3g.live.routing.channel_selector.maxpat")
        .read_text(encoding="utf-8")
    )
    selector_boxes = {
        entry["box"]["id"]: entry["box"]
        for entry in selector["patcher"]["boxes"]
    }
    menu = selector_boxes["obj-20"]
    if (menu.get("presentation_rect") != [0.0, 0.0, 100.0, 20.0]
            or menu.get("fontname") != "Arial"
            or menu.get("fontsize") != 11.0):
        raise ValueError("hardware routing menu is clipped or undersized")
    if selector_boxes["obj-11"].get("presentation_rect") != [0.0, 0.0, 100.0, 20.0]:
        raise ValueError("output routing menu background has unexpected bounds")
    print(f"validated {len(EXPECTED) + len(ROUTING_DEVICES) + len(DRUM_DEVICES) + len(SAMPLE_INSTRUMENTS) + 1 + len(PANNER_MAIN_DEVICES) + len(OUTPUT_AUTOGAIN_DEVICES)} generated M4L devices and native s3g routing layer")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (KeyError, TypeError, ValueError, json.JSONDecodeError) as error:
        print(error, file=sys.stderr)
        raise SystemExit(1)
