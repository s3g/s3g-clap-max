#!/usr/bin/env python3
"""Generate the editable Max patchers and packaged AMXD device files."""

from __future__ import annotations

import json
import struct
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE_DIR = ROOT / "source" / "m4l"
DEVICE_DIR = ROOT / "package" / "devices"
ENVELOP_ROUTING_DIR = ROOT / "vendor" / "envelop-for-live" / "patchers"
S3G_ROUTING_DIR = ROOT / "package" / "patchers" / "s3g-routing"

COMPACT_DEVICE_HEIGHT = 169.0
MAIN_OUT_DEVICE_HEIGHT = 169.0
DEVICE_EDGE_PADDING = 12.0
MULTICHANNEL_SLOT_COUNT = 32
MULTICHANNEL_PAIR_COUNT = MULTICHANNEL_SLOT_COUNT // 2
FIFTH_ORDER_SLOT_COUNT = 36
FIFTH_ORDER_LIVE_CHANNELS = FIFTH_ORDER_SLOT_COUNT + 2
DRUM_SLOT_COUNT = 16
DRUM_PAIR_COUNT = DRUM_SLOT_COUNT // 2
DRUM_BUS_PREFIX = "s3g-drum16"
# Live reserves device channels 1-2 for its ordinary stereo chain. They are
# transport scaffolding, not part of the public 32-channel bus or a CLAP's
# input count. Bus slots 1-32 therefore occupy Live device channels 3-34.
MULTICHANNEL_LIVE_CHANNELS = MULTICHANNEL_SLOT_COUNT + 2
# Follow the native M4L examples: proportional sans-serif, compact controls,
# and a common alignment grid, retaining the subdued s3g grayscale palette.
UI_FONT = "Arial"
UI_FONT_SIZE = 11.0
CONTROL_HEIGHT = 20.0
OUTPUT_MENU_WIDTH = 100.0
DRUM_SAMPLE_MINIMUM_WIDTH = 240.0
COLOR_BACKGROUND = [0.05098, 0.05098, 0.05098, 1.0]
COLOR_CELL = [0.15294, 0.15294, 0.15294, 1.0]
COLOR_GRID = [0.28, 0.28, 0.28, 1.0]
COLOR_DIM = [0.60, 0.60, 0.60, 1.0]
COLOR_TEXT = [0.72, 0.72, 0.72, 1.0]
COLOR_ACCENT = [0.65, 0.65, 0.65, 1.0]
COLOR_VALUE = [0.60, 0.60, 0.60, 1.0]
COLOR_BUTTON = [0.20, 0.20, 0.20, 1.0]
COLOR_BUTTON_TEXT = [0.74, 0.74, 0.74, 1.0]

# Shared toolbar: identical positions in generic and fixed wrappers.
EDITOR_RECT = [12.0, 10.0, 64.0, CONTROL_HEIGHT]
LOAD_RECT = [84.0, 10.0, 84.0, CONTROL_HEIGHT]

ROUTING_NAMES = {
    "e4l.bus.send": "s3g.bus.send",
    "e4l.bus.insert": "s3g.bus.insert",
    "e4l.bus.receive": "s3g.bus.receive",
    "e4l.bus.chain_index": "s3g.bus.chain_index",
    "e4l.bus.clear_device_outputs": "s3g.bus.clear_device_outputs",
    "e4l.live.thisdevice": "s3g.live.thisdevice",
    "e4l.live.routing.channel_selector": "s3g.live.routing.channel_selector",
    "e4l.live.routing": "s3g.live.routing",
    "e4l.live.object": "s3g.live.object",
    "e4l.live.device_track": "s3g.live.device_track",
    "e4l.live.once": "s3g.live.once",
    "e4l.live.count_aux_inputs": "s3g.live.count_aux_inputs",
    "e4l.dict.list": "s3g.dict.list",
}

# Public filenames follow the s3g-dsp family order: s3g 3OA Encoder <kind>.


@dataclass(frozen=True)
class FixedParameter:
    clap_id: int
    name: str
    short_name: str
    minimum: float
    maximum: float
    default: float
    kind: str = "float"
    enum: tuple[str, ...] = ()


PATH_PARAMETERS = (
    FixedParameter(1, "Input Count", "Inputs", 1, 32, 32, "int"),
    FixedParameter(3, "Active Paths", "Paths", 1, 16, 1, "int"),
    FixedParameter(4, "Selected Path", "Path", 1, 16, 1, "int"),
    FixedParameter(5, "Selected Source", "Source", 1, 32, 1, "int"),
    FixedParameter(6, "Assign", "Assign", 0, 2, 1, "enum",
                   ("One", "Round Robin", "Source")),
    FixedParameter(7, "Playback", "Play", 0, 2, 1, "enum",
                   ("Off", "Run", "Scrub")),
    FixedParameter(8, "Loop Mode", "Loop", 0, 2, 1, "enum",
                   ("One", "Loop", "Palindrome")),
    FixedParameter(9, "Interpolation", "Interp", 0, 2, 1, "enum",
                   ("Linear", "Catmull", "Hold")),
    FixedParameter(10, "Rate", "Rate", 0.001, 4, 0.08),
    FixedParameter(17, "Sync", "Sync", 0, 1, 0, "enum", ("Free", "Sync")),
    FixedParameter(18, "Division", "Division", 0.25, 64, 4),
    FixedParameter(11, "Phase", "Phase", 0, 1, 0),
    FixedParameter(12, "Phase Spread", "Spread", 0, 1, 0),
    FixedParameter(13, "Smooth", "Smooth", 0, 0.995, 0.12),
    FixedParameter(14, "Ease", "Ease", 0, 1, 0),
    FixedParameter(15, "Distance Scale", "Distance", 0.05, 8, 1),
    FixedParameter(19, "Doppler", "Doppler", 0, 1, 0),
    FixedParameter(20, "Air", "Air", 0, 1, 0),
    FixedParameter(16, "Output", "Output", -60, 12, -12),
)

# IDs and ranges are from the six CLAP descriptors in s3g-dsp. Only the
# controls useful on a compact Live face are mirrored; the editor and opaque
# CLAP state retain all other settings. Input Count is a saved Live parameter,
# never an unconditional load-time override of a user's smaller selection.
POINT_PARAMETERS = (
    FixedParameter(29, "Input Count", "Inputs", 1, 32, 16, "int"),
    FixedParameter(6, "Motion", "Motion", 0, 5, 0, "int"),
    FixedParameter(7, "Amount", "Amount", 0, 1, 0),
    FixedParameter(8, "Rate", "Rate", 0.005, 0.5, 0.035),
    FixedParameter(14, "Output", "Output", -60, 12, -6),
    FixedParameter(1000, "P01 Azimuth", "P1 Az", -180, 180, 0),
    FixedParameter(1001, "P01 Elevation", "P1 El", -90, 90, 0),
    FixedParameter(1002, "P01 Distance", "P1 Dist", 0.15, 2, 1),
)

CLOUD_PARAMETERS = (
    FixedParameter(1, "Input Count", "Inputs", 1, 32, 32, "int"),
    FixedParameter(2, "Clouds", "Clouds", 1, 4, 1, "int"),
    FixedParameter(3, "Cloud", "Cloud", 1, 4, 1, "int"),
    FixedParameter(5, "Azimuth", "Azimuth", -180, 180, 0),
    FixedParameter(6, "Elevation", "Elevation", -90, 90, 0),
    FixedParameter(7, "Distance", "Distance", 0.05, 8, 1),
    FixedParameter(9, "Spread", "Spread", 0, 1, 0.45),
    FixedParameter(17, "Output", "Output", -60, 12, -12),
)

TERRAIN_PARAMETERS = (
    FixedParameter(20, "Input Count", "Inputs", 1, 32, 16, "int"),
    FixedParameter(30, "Selected Source", "Source", 1, 32, 1, "int"),
    FixedParameter(2, "Azimuth", "Azimuth", -180, 180, 0),
    FixedParameter(3, "Elevation", "Elevation", -90, 90, 0),
    FixedParameter(4, "Distance", "Distance", 0.15, 3, 1),
    FixedParameter(5, "Rate", "Rate", 0.000001, 2, 0.035),
    FixedParameter(17, "Output", "Output", -60, 12, -9),
)

CARTOGRAPHY_PARAMETERS = (
    FixedParameter(1, "Site Count", "Sites", 1, 24, 12, "int"),
    FixedParameter(4, "Layout", "Layout", 0, 4, 0, "int"),
    FixedParameter(5, "Stereo Map", "Stereo", 0, 2, 0, "int"),
    FixedParameter(7, "Map Scale", "Scale", 10, 2000, 240),
    FixedParameter(29, "Output", "Output", -60, 12, -6),
)

RAY_PARAMETERS = (
    FixedParameter(2, "Source X", "Src X", 0, 1, 0.5),
    FixedParameter(3, "Source Y", "Src Y", 0, 1, 0.25),
    FixedParameter(4, "Source Z", "Src Z", 0, 1, 0.5),
    FixedParameter(5, "Direct", "Direct", 0, 1.5, 1),
    FixedParameter(6, "Early", "Early", 0, 1.5, 0.72),
    FixedParameter(7, "Late", "Late", 0, 1.5, 0.42),
    FixedParameter(13, "Output gain", "Output", -60, 12, -6),
)

RAY_BILOCATION_PARAMETERS = (
    FixedParameter(2, "Source X", "Src X", 0, 1, 0.5),
    FixedParameter(3, "Source Y", "Src Y", 0, 1, 0.25),
    FixedParameter(4, "Source Z", "Src Z", 0, 1, 0.5),
    FixedParameter(8, "Place", "Place", 0, 1, 0.5),
    FixedParameter(9, "Permeability", "Perm", 0, 1, 0.65),
    FixedParameter(10, "Memory", "Memory", 0, 12, 2),
    FixedParameter(26, "Output gain", "Output", -60, 12, -9),
)

# The remaining fixed encoders are instruments/generators. These compact
# Live parameter selections use the stable IDs and ranges in the individual
# s3g-dsp CLAP descriptors; the editor and state Blob retain every control.
MODAL_PARAMETERS = (
    FixedParameter(2, "Modal profile", "Body", 0, 24, 10, "int"),
    FixedParameter(63, "Modal lift", "Lift", 0, 1, 0.65),
    FixedParameter(30, "Output gain", "Output", -60, 12, -11),
)
MEDIUM_PARAMETERS = (
    FixedParameter(2, "Propagation Speed", "Speed", 20, 2000, 343),
    FixedParameter(3, "Decay", "Decay", 0.05, 60, 2.5),
    FixedParameter(11, "Output Gain", "Output", -60, 12, -12),
)
MEMBRANE_KICK_PARAMETERS = (
    FixedParameter(3, "Fundamental", "Tune", 25, 90, 43),
    FixedParameter(6, "Decay", "Decay", 0.08, 6, 1.45),
    FixedParameter(19, "Output Gain", "Output", -60, 6, -8),
)
ACID_PARAMETERS = (
    FixedParameter(2, "Tempo", "Tempo", 30, 300, 126),
    FixedParameter(9, "Cutoff", "Cutoff", 30, 12000, 310),
    FixedParameter(26, "Output", "Output", -36, 6, -10),
)

# (display name, CLAP name, stable CLAP ID, output-order parameter, MIDI,
#  compact automation parameters, additional fixed 3OA topology)
INSTRUMENT_ENCODERS = (
    ("Membrane Kick", "s3g Ambi Encoder Membrane Kick 16",
     "org.s3g.s3g-dsp.ambi-encoder-membrane-kick-16", 1, True,
     MEMBRANE_KICK_PARAMETERS, ()),
    ("Acid", "s3g Ambi Encoder Acid 16",
     "org.s3g.s3g-dsp.ambi-encoder-acid-16", 1, True,
     ACID_PARAMETERS, ((33, 0),)),
    ("Horizon", "s3g Ambi Encoder Horizon 64",
     "org.s3g.s3g-dsp.ambi-horizon-encoder-64", 2, False,
     (FixedParameter(5, "Activity", "Activity", 0, 1, 0.48),
      FixedParameter(7, "Pace", "Pace", 0, 1, 0.42),
      FixedParameter(24, "Output", "Output", -60, 12, -6)), ()),
    ("VOT", "s3g Ambi Encoder VOT 64",
     "org.s3g.s3g-dsp.ambi-vot-encoder-64", 1, True,
     (FixedParameter(2, "Voice Count", "Voices", 1, 64, 8, "int"),
      FixedParameter(7, "Vector X", "Vector X", 0, 1, 0.20),
      FixedParameter(17, "Output", "Output", -60, 12, -18)), ()),
    ("Vox", "s3g Ambi Encoder Vox 64",
     "org.s3g.s3g-dsp.ambi-vox-encoder-64", 1, True,
     (FixedParameter(2, "Voice Count", "Voices", 1, 16, 8, "int"),
      FixedParameter(34, "Pitch Spread", "Spread", 0, 2, 1),
      FixedParameter(17, "Output", "Output", -60, 12, -6)), ()),
    ("Wave Terrain", "s3g Ambi Encoder Wave Terrain 64",
     "org.s3g.s3g-dsp.ambi-wave-terrain-encoder-64", 1, True,
     (FixedParameter(2, "Voice Count", "Voices", 1, 64, 12, "int"),
      FixedParameter(9, "Terrain Depth", "Depth", 0, 1, 0.82),
      FixedParameter(40, "Output", "Output", -60, 12, -22)), ()),
    ("Stochastic", "s3g Ambi Encoder Stochastic 64",
     "org.s3g.s3g-dsp.ambi-stochastic-encoder-64", 1, True,
     (FixedParameter(2, "Voice Count", "Voices", 1, 64, 12, "int"),
      FixedParameter(4, "Selection", "Selection", 0, 5, 5, "int"),
      FixedParameter(37, "Output", "Output", -60, 6, -6)), ()),
    ("Neural Ecology", "s3g Ambi Encoder Neural Ecology 64",
     "org.s3g.s3g-dsp.ambi-neural-ecology-64", 2, True,
     (FixedParameter(4, "Activity Bias", "Activity", 0, 1, 0.52),
      FixedParameter(5, "Sigmoid Drive", "Drive", 0.25, 5, 1.95),
      FixedParameter(33, "Output Gain", "Output", -60, 6, -18)), ()),
    ("Pulsar", "s3g Ambi Encoder Pulsar 64",
     "org.s3g.s3g-dsp.ambi-pulsar-encoder-64", 2, False,
     (FixedParameter(3, "Emission Rate", "Rate", 0.05, 2000, 18),
      FixedParameter(5, "Emission Mod Depth", "Mod", 0, 0.95, 0.12),
      FixedParameter(48, "Output Gain", "Output", -60, 6, -12)), ()),
    ("Wind", "s3g Ambi Encoder Wind 64",
     "org.s3g.s3g-dsp.ambi-wind-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 16, "int"),
      FixedParameter(4, "Wind", "Wind", 0, 1, 0.55),
      FixedParameter(32, "Output", "Output", -60, 12, -6)), ()),
    ("Water", "s3g Ambi Encoder Water 64",
     "org.s3g.s3g-dsp.ambi-water-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 28, "int"),
      FixedParameter(4, "Water", "Water", 0, 1, 0.58),
      FixedParameter(34, "Output", "Output", -60, 12, -6)), ()),
    ("Pyrosphere", "s3g Ambi Encoder Pyrosphere 64",
     "org.s3g.s3g-dsp.ambi-pyrosphere-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 16, "int"),
      FixedParameter(4, "Heat", "Heat", 0, 1, 0.55),
      FixedParameter(32, "Output", "Output", -60, 12, -6)), ()),
    ("Cryosphere", "s3g Ambi Encoder Cryosphere 64",
     "org.s3g.s3g-dsp.ambi-cryosphere-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 28, "int"),
      FixedParameter(4, "Ice Growth", "Ice", 0, 1, 0.58),
      FixedParameter(34, "Output", "Output", -60, 12, -6)), ()),
    ("Insect", "s3g Ambi Encoder Insect 64",
     "org.s3g.s3g-dsp.ambi-insect-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 28, "int"),
      FixedParameter(5, "Activity", "Activity", 0, 1, 0.62),
      FixedParameter(32, "Output", "Output", -60, 12, -6)), ()),
    ("Wrangler", "s3g Ambi Encoder Wrangler 64",
     "org.s3g.s3g-dsp.ambi-wrangler-encoder-64", 2, False,
     (FixedParameter(3, "Voice Count", "Voices", 1, 64, 16, "int"),
      FixedParameter(4, "Rate A", "Rate A", 0, 1, 0.28),
      FixedParameter(32, "Output", "Output", -60, 12, -6)), ()),
)

SPEAKER_PARAMETERS = (
    FixedParameter(1, "Layout", "Layout", 0, 13, 7, "enum", (
        "Custom", "Quad", "Cube 8", "Cube 17", "Dome 24", "Dome 25",
        "Quad+OH", "Sphere 24", "Dodeca 12", "Icosahedron 20",
        "Octo Ring", "Cube 41", "LPAC 41", "SRST 25",
    )),
    FixedParameter(2, "Mode", "Mode", 0, 3, 1, "enum",
                   ("Basic", "EPAD", "MMD", "AllRAD")),
    FixedParameter(4, "Active Speakers", "Speakers", 2, 64, 24, "int"),
    FixedParameter(5, "Selected Speaker", "Speaker", 1, 64, 1, "int"),
    FixedParameter(6, "Speaker Azimuth", "Azimuth", -180, 180, 0),
    FixedParameter(7, "Speaker Elevation", "Elevation", -90, 90, 0),
    FixedParameter(8, "Speaker Distance", "Distance", 0.15, 2, 1),
    FixedParameter(9, "Speaker Gain", "Gain", 0, 2, 1),
    FixedParameter(12, "Width", "Width", 0, 1.5, 1),
    FixedParameter(14, "Output", "Output", -60, 12, 0),
    FixedParameter(15, "Weighting", "Weighting", 0, 2, 1, "enum",
                   ("None", "MaxRE", "InPhase")),
    FixedParameter(16, "Custom Field", "Field", 0, 1, 0, "enum",
                   ("Sphere", "Hemisphere")),
)

# Fixed 3OA effects retain the full CLAP editor/Blob. These Live parameters
# are the compact, stable subset most useful for Arrangement automation.
EFFECT_SPECS = (
    ("DJ Filter", "s3g Ambi Effect DJ Filter 64",
     "org.s3g.s3g-dsp.ambi-effect-dj-filter-64", 1,
     (FixedParameter(4, "DJ filter", "Filter", 0, 1, 0.5),
      FixedParameter(8, "Mix", "Mix", 0, 1, 1),
      FixedParameter(9, "Output gain", "Output", -60, 12, 0))),
    ("Delay", "s3g Ambi Effect Delay 64",
     "org.s3g.s3g-dsp.ambi-effect-delay-64", 1,
     (FixedParameter(4, "Delay time", "Time", 5, 2000, 320),
      FixedParameter(5, "Feedback", "Feedback", 0, 0.88, 0.32),
      FixedParameter(11, "Mix", "Mix", 0, 1, 0.35),
      FixedParameter(12, "Output gain", "Output", -60, 12, 0))),
    ("Pitch", "s3g Ambi Effect Pitch 64",
     "org.s3g.s3g-dsp.ambi-effect-pitch-64", 1,
     (FixedParameter(4, "Pitch", "Pitch", -24, 24, 0),
      FixedParameter(11, "Mix", "Mix", 0, 1, 0.35),
      FixedParameter(12, "Output gain", "Output", -60, 12, 0))),
    ("Gain", "s3g Ambi Effect Gain 64",
     "org.s3g.s3g-dsp.ambi-effect-gain-64", 1,
     (FixedParameter(4, "Gain", "Gain", -60, 18, 0),
      FixedParameter(11, "Mix", "Mix", 0, 1, 1),
      FixedParameter(12, "Output gain", "Output", -60, 12, 0))),
    ("Resonance Print", "s3g Ambi Effect Resonance Print 64",
     "org.s3g.s3g-dsp.ambi-effect-resonance-print-64", 1,
     (FixedParameter(12, "Decay", "Decay", 0.08, 8, 1.8),
      FixedParameter(19, "Mix", "Mix", 0, 1, 0.55),
      FixedParameter(20, "Output gain", "Output", -60, 12, 0))),
    ("Partial Trace", "s3g Ambi Effect Partial Trace 64",
     "org.s3g.s3g-dsp.ambi-effect-partial-trace-64", 1,
     (FixedParameter(8, "Partial count", "Partials", 1, 16, 10, "int"),
      FixedParameter(19, "Mix", "Mix", 0, 1, 0.55),
      FixedParameter(20, "Output gain", "Output", -60, 12, 0))),
    ("Response Trace", "s3g Ambi Effect Response Trace 64",
     "org.s3g.s3g-dsp.ambi-effect-response-trace-64", 1,
     (FixedParameter(7, "Capture duration", "Duration", 0.05, 1.5, 0.5),
      FixedParameter(19, "Mix", "Mix", 0, 1, 0.5),
      FixedParameter(20, "Output gain", "Output", -60, 12, 0))),
    ("Displacement", "s3g Ambi Effect Displacement 64",
     "org.s3g.s3g-dsp.ambi-effect-displacement-64", 15,
     (FixedParameter(4, "Rate", "Rate", 0.001, 2, 0.05),
      FixedParameter(17, "Mix", "Mix", 0, 1, 1),
      FixedParameter(13, "Output", "Output", -60, 12, 0))),
)

HEAD_PARAMETERS = (
    FixedParameter(7, "Yaw", "Yaw", -180, 180, 0),
    FixedParameter(11, "Room", "Room", 0, 100, 0),
    FixedParameter(18, "Output gain", "Output", -24, 12, 0),
)
STEREO_PARAMETERS = (
    FixedParameter(4, "Stereo width", "Width", 0, 200, 110),
    FixedParameter(6, "Listening rotation", "Rotation", -180, 180, 0),
    FixedParameter(13, "Output gain", "Output", -24, 24, 0),
)
MULTICHANNEL_DECODER_SPECS = (
    ("Object", "s3g Ambi Decoder Object 64",
     "org.s3g.s3g-dsp.ambi-object-decoder-64", 3,
     (FixedParameter(1, "Layout", "Layout", 0, 13, 13, "int"),
      FixedParameter(6, "Object Blend", "Blend", 0, 1, 0.35),
      FixedParameter(10, "Output", "Output", -60, 12, 0))),
    ("Adaptive", "s3g Ambi Decoder Adaptive 64",
     "org.s3g.s3g-dsp.ambi-adaptive-decoder-64", 3,
     (FixedParameter(1, "Layout", "Layout", 0, 13, 13, "int"),
      FixedParameter(5, "Focus", "Focus", 0, 1, 0.75),
      FixedParameter(10, "Output", "Output", -60, 12, 0))),
    ("Sub", "s3g Ambi Decoder Sub 8",
     "org.s3g.s3g-dsp.ambisonic-sub-decoder", 1,
     (FixedParameter(2, "Subs", "Subs", 1, 8, 1, "int"),
      FixedParameter(3, "Cutoff", "Cutoff", 20, 240, 90),
      FixedParameter(5, "Output", "Output", -60, 18, 0))),
)

# These direct panners share the same stable base parameter IDs. Their CLAP
# ports are 64-in/64-out; this Live endpoint deliberately exposes only the
# first 32 source and speaker lanes supported by the current private bus and
# hardware matrix. Per-source settings and the physical layout stay in the
# plug-in editor and opaque CLAP state.
PANNER_PARAMETERS = (
    FixedParameter(3, "Focus", "Focus", 0.25, 4, 1),
    FixedParameter(6, "Global Azimuth", "Azimuth", -180, 180, 0),
    FixedParameter(7, "Global Elevation", "Elevation", -90, 90, 0),
    FixedParameter(10, "Output", "Output", -60, 12, -6),
)
PANNER_SPECS = (
    ("Layout", "org.s3g.s3g-dsp.layout-panner"),
    ("DBAP", "org.s3g.s3g-dsp.dbap-panner"),
    ("LBAP", "org.s3g.s3g-dsp.lbap-panner"),
    ("VBAP", "org.s3g.s3g-dsp.vbap-panner"),
)

# Both Output AutoGain CLAPs take 128 channels and share these stable IDs.
# Live's private source bus supplies only the first 32 channels; retain the
# CLAP's 2–128 Input Channels range so saved editor state is never coerced.
OUTPUT_AUTOGAIN_PARAMETERS = (
    FixedParameter(1, "Input Channels", "Inputs", 2, 128, 8, "int"),
    FixedParameter(2, "Width", "Width", 0, 200, 100),
    FixedParameter(3, "Rotation", "Rotation", -180, 180, 0),
    FixedParameter(4, "Autogain", "Autogain", 0, 2, 1, "enum",
                   ("Off", "Power/sqrt(N)", "Energy sum")),
    FixedParameter(5, "Output Gain", "Output", -24, 24, 0),
    FixedParameter(6, "Layout", "Layout", 0, 7, 0, "enum",
                   ("Ring projection", "Linear left-right", "Odd/even stereo",
                    "Center-out", "Pair-preserving", "Sphere projection",
                    "Hemisphere projection", "Cube projection")),
    FixedParameter(7, "Layout Weight", "Weight", 0, 100, 100),
    FixedParameter(8, "3D Attenuation", "3D Atten", 0, 100, 45),
    FixedParameter(9, "3D Distance", "3D Dist", 0, 200, 100),
)


def rewrite_routing_value(value: object) -> object:
    if isinstance(value, dict):
        return {
            key: rewrite_routing_value(item)
            for key, item in value.items()
            if key not in ("bootpath", "patcherrelativepath")
        }
    if isinstance(value, list):
        return [rewrite_routing_value(item) for item in value]
    if not isinstance(value, str):
        return value

    for old, new in ROUTING_NAMES.items():
        value = value.replace(old, new)
    # Private bus handshakes must not collide with Envelop for Live devices in
    # the same Set. This also catches global symbols such as bus.syn/bus.ack.
    value = value.replace("e4l.", "s3g.")
    value = value.replace("E4L bus", "s3g bus")
    value = value.replace("other E4L devices", "other s3g devices")
    value = value.replace("the E4L chain", "the s3g chain")
    value = value.replace("E4L", "Envelop")
    return value


def add_envelop_credit(document: dict[str, object]) -> None:
    patch = document["patcher"]
    boxes = patch["boxes"]
    bottom = max(
        (
            entry["box"].get("patching_rect", [0.0, 0.0, 0.0, 0.0])[1]
            + entry["box"].get("patching_rect", [0.0, 0.0, 0.0, 0.0])[3]
            for entry in boxes
        ),
        default=0.0,
    )
    boxes.append({
        "box": {
            "id": "obj-s3g-envelop-credit",
            "maxclass": "comment",
            "text": (
                "Derived from Envelop for Live routing abstractions by "
                "Envelop; modified and namespaced by s3g under LGPL-2.1. "
                "See the bundled LICENSE.txt."
            ),
            "patching_rect": [22.0, bottom + 24.0, 760.0, 22.0],
            "fontsize": 9.0,
            "numinlets": 1,
            "numoutlets": 0,
        }
    })


def bypass_receiver_placement_check(document: dict[str, object]) -> None:
    patch = document["patcher"]
    boxes = patch["boxes"]
    guard_id = next(
        entry["box"]["id"]
        for entry in boxes
        if entry["box"].get("text") == "p CheckFirstTrackDevice"
    )
    guard_inputs = [
        entry["patchline"]["source"]
        for entry in patch["lines"]
        if entry["patchline"]["destination"][0] == guard_id
    ]
    guard_outputs = [
        entry["patchline"]["destination"]
        for entry in patch["lines"]
        if entry["patchline"]["source"] == [guard_id, 0]
    ]
    if len(guard_inputs) != 1 or len(guard_outputs) != 1:
        raise ValueError("unexpected s3g.bus.receive placement-check topology")

    patch["boxes"] = [
        entry for entry in boxes if entry["box"]["id"] != guard_id
    ]
    patch["lines"] = [
        entry for entry in patch["lines"]
        if entry["patchline"]["source"][0] != guard_id
        and entry["patchline"]["destination"][0] != guard_id
    ]
    patch["lines"].append({
        "patchline": {
            "source": guard_inputs[0],
            "destination": guard_outputs[0],
        }
    })
    for entry in patch["boxes"]:
        current = entry["box"]
        if current.get("id") == "obj-58":
            current["text"] = (
                "Receives a named multichannel bus and acknowledges the "
                "destination without rejecting it based on Live device order."
            )


def report_receiver_track_ready(document: dict[str, object]) -> None:
    """Confirm an ACK was dispatched so a receiver can end startup retries."""
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    if (boxes["obj-33"]["text"] != "s s3g.bus.ack"
            or boxes["obj-13"]["maxclass"] != "outlet"
            or line("obj-1", 0, "obj-33", 0) not in patch["lines"]):
        raise ValueError("unexpected s3g.bus.receive track-ready topology")
    patch["boxes"].append(new_object(
        "obj-track-ready-trigger", "t b l", 26.0, 678.0,
        52.0, 1, 2, ["bang", "list"],
    ))
    boxes["obj-33"]["patching_rect"][1] = 720.0
    patch["lines"].remove(line("obj-1", 0, "obj-33", 0))
    patch["lines"].extend([
        line("obj-1", 0, "obj-track-ready-trigger", 0),
        line("obj-track-ready-trigger", 1, "obj-33", 0),
        line("obj-track-ready-trigger", 0, "obj-13", 0),
    ])


def disconnect_previous_receiver_bus(document: dict[str, object]) -> None:
    """Release stale Live output assignments before announcing a new bus.

    A same-name replay must still reach the normal ACK branch: the startup
    identity retry uses it to discover senders after Live restores a Set.
    Only the side branch that clears the *previous* bus filters duplicates.
    """
    patch = document["patcher"]
    old_edge = line("obj-2", 0, "obj-3", 0)
    if old_edge not in patch["lines"]:
        raise ValueError("unexpected s3g.bus.receive bus-name topology")
    patch["lines"].remove(old_edge)
    patch["boxes"].extend([
        new_object("obj-bus-input-trigger", "t s s", 244.0, 165.0,
                   40.0, 1, 2, ["symbol", "symbol"]),
        new_object("obj-bus-change", "zl.change", 405.0, 204.0,
                   70.0, 2, 2, ["list", "int"]),
        new_object("obj-prev-trigger", "t s b", 405.0, 246.0,
                   36.0, 1, 2, ["symbol", "bang"]),
        new_object("obj-prev-name", "zl.reg", 510.0, 286.0,
                   40.0, 2, 1, ["anything"]),
        new_object("obj-prev-clear", "sprintf %s clear", 510.0, 324.0,
                   115.0, 1, 1, ["list"]),
        new_object("obj-prev-send", "s s3g.bus.ack", 510.0, 362.0,
                   92.0, 1, 0),
    ])
    patch["lines"].extend([
        line("obj-2", 0, "obj-bus-input-trigger", 0),
        line("obj-bus-input-trigger", 1, "obj-bus-change", 0),
        line("obj-bus-input-trigger", 0, "obj-3", 0),
        line("obj-bus-change", 0, "obj-prev-trigger", 0),
        line("obj-prev-trigger", 1, "obj-prev-name", 0),
        line("obj-prev-trigger", 0, "obj-prev-name", 1),
        line("obj-prev-name", 0, "obj-prev-clear", 0),
        line("obj-prev-clear", 0, "obj-prev-send", 0),
    ])


def make_sender_noninvasive(document: dict[str, object]) -> None:
    """Never change a source track's normal Live output routing.

    The upstream Envelop abstraction initializes a sender track to Sends Only.
    That policy is surprising in a reusable transport layer and prevents a
    device-local dry-through control from doing what it says.  Bus discovery
    and auxiliary-output routing do not depend on this branch.
    """
    patch = document["patcher"]
    removed = {"obj-9", "obj-19", "obj-37", "obj-40"}
    patch["boxes"] = [
        entry for entry in patch["boxes"]
        if entry["box"]["id"] not in removed
    ]
    patch["lines"] = [
        entry for entry in patch["lines"]
        if entry["patchline"]["source"][0] not in removed
        and entry["patchline"]["destination"][0] not in removed
    ]
    for entry in patch["boxes"]:
        current = entry["box"]
        if current.get("id") == "obj-58":
            current["text"] = (
                "Routes this device's auxiliary audio outputs to a named s3g "
                "bus. Normal Live track output routing is never changed."
            )


def replay_sender_after_aux_discovery(document: dict[str, object]) -> None:
    """Route once the asynchronous Live audio_outputs query has returned.

    Mode can be selected before a restored device's auxiliary-output list is
    available. Store that list first, then bang the already-open safety gate
    to run the currently selected bus/insert branch.
    """
    patch = document["patcher"]
    old_edge = line("obj-6", 1, "obj-38", 1)
    if old_edge not in patch["lines"]:
        raise ValueError("unexpected s3g.bus.send auxiliary-output topology")
    patch["boxes"].append(new_object(
        "obj-aux-ready-trigger", "t b l", 380.0, 590.0,
        50.0, 1, 2, ["bang", "list"],
    ))
    patch["lines"].remove(old_edge)
    patch["lines"].extend([
        line("obj-6", 1, "obj-aux-ready-trigger", 0),
        line("obj-aux-ready-trigger", 1, "obj-38", 1),
        line("obj-aux-ready-trigger", 0, "obj-32", 1),
    ])


def reset_sender_target_on_clear(document: dict[str, object]) -> None:
    """A cleared output must not retain its previous receiver identity.

    Otherwise the next ACK from that same receiver is mistaken for an
    unchanged route and the sender stays silent after a bus round trip.
    """
    patch = document["patcher"]
    old_edge = line("obj-10", 1, "obj-76", 0)
    if old_edge not in patch["lines"]:
        raise ValueError("unexpected s3g.bus.send clear topology")
    patch["lines"].remove(old_edge)
    patch["boxes"].append(new_object(
        "obj-clear-trigger", "t b b", 411.0, 266.0,
        42.0, 1, 2, ["bang", "bang"],
    ))
    patch["lines"].extend([
        line("obj-10", 1, "obj-clear-trigger", 0),
        line("obj-clear-trigger", 1, "obj-17", 0),
        line("obj-clear-trigger", 0, "obj-76", 0),
    ])


def stop_device_track_at_song(document: dict[str, object]) -> None:
    """Do not ask Live's root Song object for a canonical parent."""
    patch = document["patcher"]
    parent_edge = line("obj-29", 1, "obj-42", 0)
    if parent_edge not in patch["lines"]:
        raise ValueError("unexpected s3g.live.device_track parent traversal")
    patch["lines"].remove(parent_edge)
    patch["boxes"].append(new_object(
        "obj-s3g-stop-at-song", "route Song", 95.0, 265.0,
        78.0, 1, 2,
    ))
    patch["lines"].extend([
        line("obj-29", 1, "obj-s3g-stop-at-song", 0),
        line("obj-s3g-stop-at-song", 1, "obj-42", 0),
    ])


def generate_s3g_routing() -> None:
    relative_files = [
        Path("bus/e4l.bus.send.maxpat"),
        Path("bus/e4l.bus.insert.maxpat"),
        Path("bus/e4l.bus.receive.maxpat"),
        Path("bus/e4l.bus.chain_index.maxpat"),
        Path("bus/e4l.bus.clear_device_outputs.maxpat"),
        Path("live/e4l.live.thisdevice.maxpat"),
        Path("live/e4l.live.routing.channel_selector.maxpat"),
        Path("live/e4l.live.routing.maxpat"),
        Path("live/e4l.live.object.maxpat"),
        Path("live/e4l.live.device_track.maxpat"),
        Path("live/e4l.live.once.maxpat"),
        Path("live/e4l.live.count_aux_inputs.maxpat"),
        Path("live/e4l.dict.list.maxpat"),
    ]
    for relative in relative_files:
        source = ENVELOP_ROUTING_DIR / relative
        document = rewrite_routing_value(
            json.loads(source.read_text(encoding="utf-8"))
        )
        destination_name = relative.name
        for old, new in ROUTING_NAMES.items():
            destination_name = destination_name.replace(old, new)
        destination = S3G_ROUTING_DIR / relative.parent / destination_name
        destination.parent.mkdir(parents=True, exist_ok=True)
        if destination_name == "s3g.bus.receive.maxpat":
            bypass_receiver_placement_check(document)
            report_receiver_track_ready(document)
            disconnect_previous_receiver_bus(document)
        if destination_name == "s3g.bus.send.maxpat":
            make_sender_noninvasive(document)
            replay_sender_after_aux_discovery(document)
            reset_sender_target_on_clear(document)
        if destination_name == "s3g.live.device_track.maxpat":
            stop_device_track_at_song(document)
        if destination_name == "s3g.live.routing.channel_selector.maxpat":
            # Keep the proven dynamic clear/append/setsymbol routing protocol.
            # live.menu is not a drop-in replacement for this umenu API.
            for entry in document["patcher"]["boxes"]:
                current = entry["box"]
                if current.get("id") == "obj-20":
                    current["patching_rect"] = [0.0, 0.0, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT]
                    current["presentation_rect"] = [0.0, 0.0, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT]
                    current["bgcolor"] = [0.0, 0.0, 0.0, 0.0]
                    current["textcolor"] = COLOR_BUTTON_TEXT
                    current["elementcolor"] = COLOR_ACCENT
                    current["fontname"] = UI_FONT
                    current["fontsize"] = UI_FONT_SIZE
                    current["annotation"] = "Assign this Live output pair to a hardware output pair."
                elif current.get("id") == "obj-11":
                    current["patching_rect"] = [0.0, 0.0, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT]
                    current["presentation_rect"] = [0.0, 0.0, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT]
                    current["bgcolor"] = COLOR_BUTTON
                    current["bordercolor"] = COLOR_GRID
                    current["rounded"] = 2
                    current["border"] = 1
        add_envelop_credit(document)
        destination.write_text(
            json.dumps(document, indent=2, ensure_ascii=False) + "\n",
            encoding="utf-8",
        )

    for subsystem in ("bus", "live"):
        source = ENVELOP_ROUTING_DIR / subsystem / "LICENSE.txt"
        destination = S3G_ROUTING_DIR / subsystem / "LICENSE.txt"
        destination.write_text(source.read_text(encoding="utf-8"), encoding="utf-8")


def box(
    object_id: str,
    maxclass: str,
    rect: list[float],
    *,
    text: str | None = None,
    presentation_rect: list[float] | None = None,
    **attributes: object,
) -> dict[str, object]:
    value: dict[str, object] = {
        "id": object_id,
        "maxclass": maxclass,
        "patching_rect": rect,
    }
    if text is not None:
        value["text"] = text
    if presentation_rect is not None:
        value["presentation"] = 1
        value["presentation_rect"] = presentation_rect
    default_io = {
        "comment": (1, 0, []),
        "message": (2, 1, [""]),
        "textbutton": (1, 3, ["", "", "int"]),
        "number": (1, 2, ["", "bang"]),
        "live.toggle": (1, 1, [""]),
    }.get(maxclass)
    if default_io:
        value["numinlets"], value["numoutlets"], value["outlettype"] = default_io
    value.update(attributes)
    return {"box": value}


def line(source: str, outlet: int, destination: str, inlet: int) -> dict[str, object]:
    return {
        "patchline": {
            "source": [source, outlet],
            "destination": [destination, inlet],
        }
    }


def action_button(
    object_id: str,
    rect: list[float],
    presentation_rect: list[float],
    label: str,
    *,
    annotation: str | None = None,
) -> dict[str, object]:
    """Native Live momentary buttons, without adding saved/automatable state."""
    return box(
        object_id,
        "live.text",
        rect,
        presentation_rect=presentation_rect,
        text=label,
        texton=label,
        active=1,
        mode=0,
        appearance=0,
        numinlets=1,
        numoutlets=2,
        outlettype=["", ""],
        parameter_enable=0,
        fontname=UI_FONT,
        fontsize=UI_FONT_SIZE,
        activebgcolor=COLOR_BUTTON,
        activebgoncolor=COLOR_ACCENT,
        activetextcolor=COLOR_BUTTON_TEXT,
        activetextoncolor=COLOR_BACKGROUND,
        bgcolor=COLOR_CELL,
        bgoncolor=COLOR_CELL,
        textcolor=COLOR_DIM,
        textoffcolor=COLOR_DIM,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        rounded=2.0,
        annotation=annotation or (
            "Open this CLAP plugin's editor."
            if label == "EDITOR" else "Choose the CLAP plugin for this generic wrapper."
        ),
        annotation_name=label,
    )


def new_object(
    object_id: str,
    text: str,
    x: float,
    y: float,
    width: float,
    inlets: int,
    outlets: int,
    outlettype: list[str] | None = None,
    **attributes: object,
) -> dict[str, object]:
    return box(
        object_id,
        "newobj",
        [x, y, width, 22.0],
        text=text,
        numinlets=inlets,
        numoutlets=outlets,
        outlettype=outlettype or ([""] * outlets),
        **attributes,
    )


def clap_box(
    text: str,
    x: float,
    y: float,
    inputs: int,
    outputs: int,
) -> dict[str, object]:
    return new_object(
        "obj-clap",
        text,
        x,
        y,
        310.0,
        inputs,
        outputs + 1,
        (["signal"] * outputs) + ["list"],
        varname="clap",
    )


def midi_input_bridge() -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Forward Live's raw MIDI as the CLAP host's three-byte midievent.

    midiparse's eighth (rightmost) outlet is the formatted midievent stream.
    Its note-on, note-off and CC messages therefore retain the MIDI channel.
    """
    return ([
        new_object("obj-midi-in", "midiin", 40.0, 205.0, 50.0,
                   1, 1, ["int"]),
        new_object("obj-midi-parse", "midiparse", 40.0, 240.0, 75.0,
                   1, 8, ["", "", "", "int", "int", "", "int", ""]),
    ], [
        line("obj-midi-in", 0, "obj-midi-parse", 0),
        line("obj-midi-parse", 7, "obj-clap", 0),
    ])


def clap_state_parameter() -> dict[str, object]:
    # A parameter-enabled pattr is the Live Blob carrier. State is transferred
    # explicitly with getstate/setstate because Live does not ask a bound MSP
    # external for getvalueof reliably while serializing an AMXD instance.
    return new_object(
        "obj-clap-state",
        "pattr clap_state @autorestore 1 @thru 0",
        525.0,
        670.0,
        260.0,
        1,
        3,
        ["", "", ""],
        saved_object_attributes={
            "parameter_enable": 1,
            "parameter_mappable": 0,
        },
        saved_attribute_attributes={
            "valueof": {
                "parameter_longname": "CLAP State",
                "parameter_shortname": "CLAP State",
                "parameter_invisible": 1,
                # Max for Live parameter types are 0 Float, 1 Int, 2 Enum,
                # 3 Blob. Type 4 is a file-drop parameter and serializes an
                # arbitrary CLAP state list as MxDEmptyFileDrop.
                "parameter_type": 3,
            }
        },
        varname="clap_state",
    )


def fixed_parameter_box(
    parameter: FixedParameter,
    order: int,
) -> dict[str, object]:
    object_id = f"obj-param-{parameter.clap_id}"
    attributes: dict[str, object] = {
        "parameter_annotation_name": parameter.name,
        "parameter_longname": parameter.name,
        "parameter_shortname": parameter.short_name,
        "parameter_initial_enable": 1,
        "parameter_initial": [parameter.default],
        "parameter_invisible": 0,
        "parameter_mmin": parameter.minimum,
        "parameter_mmax": parameter.maximum,
        "parameter_modmode": 0,
        "parameter_order": order,
        # The stable scripting name is clap_param_<CLAP ID>, intentionally
        # distinct from the user-facing Live name. Linking those names while
        # supplying different values creates contradictory parameter identity
        # metadata. Max-saved devices leave Link to Scripting Name off in this
        # case; E4L only enables it where varname and long name are identical.
        "parameter_linknames": 0,
        "parameter_speedlim": 3.0,
        "parameter_unitstyle": 0,
    }
    if parameter.kind == "enum":
        attributes["parameter_type"] = 2
        attributes["parameter_enum"] = list(parameter.enum)
    elif parameter.kind == "int":
        attributes["parameter_type"] = 1
        attributes["parameter_steps"] = int(
            round(parameter.maximum - parameter.minimum)
        ) + 1
    else:
        attributes["parameter_type"] = 0

    return box(
        object_id,
        "live.numbox",
        [805.0, 95.0 + order * 30.0, 90.0, 22.0],
        numinlets=1,
        numoutlets=2,
        outlettype=["", "float"],
        parameter_enable=1,
        saved_attribute_attributes={"valueof": attributes},
        varname=f"clap_param_{parameter.clap_id}",
    )


def fixed_parameter_runtime(
    parameters: tuple[FixedParameter, ...],
    topology: tuple[tuple[int, float], ...],
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Expose one known CLAP's stable IDs as Live parameters.

    Native live.* objects are Live parameters and connect directly to the
    processor, following Envelop for Live's working automation pattern. A
    fixed wrapper can expose those same objects in Presentation without a
    second display-only mirror.
    They use s3g.clap~'s automation-specific message so Live-owned changes do
    not dirty the opaque CLAP state and override the active envelope.
    Plugin/editor values return through a silent ``set`` message so they can
    update the control without re-emitting from its outlet and taking control
    away from an active Arrangement envelope. On load, Live is authoritative
    for the exposed parameters: after topology is applied and Live has restored
    the saved controls, a delayed bang pushes each current Live value into the
    processor. CLAP ``paraminfo`` must not feed the controls during this phase;
    doing so overwrites Live's restored values with the plug-in defaults.
    """
    ids = " ".join(str(parameter.clap_id) for parameter in parameters)
    boxes = [
        new_object("obj-param-gate", "gate 1 0", 650.0, 650.0, 65.0, 2, 1),
        box("obj-param-enable", "message", [650.0, 615.0, 30.0, 22.0], text="1"),
        new_object("obj-param-loaded-trigger", "t b b b", 650.0, 400.0,
                   55.0, 1, 3, ["bang", "bang", "bang"]),
        new_object("obj-param-resync-delay", "delay 50", 720.0, 470.0,
                   62.0, 1, 1, ["bang"]),
        new_object("obj-paramchanged-route", f"route {ids}", 805.0, 435.0,
                   290.0, 1, len(parameters) + 1),
    ]
    lines = [
        line("obj-route-status", 2, "obj-param-loaded-trigger", 0),
        # trigger runs right-to-left: topology, gate enable, then resync.
        line("obj-param-loaded-trigger", 1, "obj-param-enable", 0),
        line("obj-param-enable", 0, "obj-param-gate", 0),
        line("obj-param-loaded-trigger", 0, "obj-param-resync-delay", 0),
        line("obj-param-gate", 0, "obj-clap", 0),
        line("obj-route-status", 3, "obj-paramchanged-route", 0),
    ]

    for index, parameter in enumerate(parameters, 1):
        parameter_id = parameter.clap_id
        parameter_object_id = f"obj-param-{parameter_id}"
        message_id = f"obj-param-message-{parameter_id}"
        reflect_id = f"obj-param-reflect-{parameter_id}"
        boxes.extend([
            fixed_parameter_box(parameter, index),
            box(message_id, "message", [1120.0, 95.0 + index * 30.0,
                                        105.0, 22.0],
                text=f"automateparamid {parameter_id} $1"),
            # Processor/editor feedback must be display-only. A normal number
            # into a live.* object is stored and emitted again, which creates
            # a feedback loop and can override active Arrangement automation.
            # ``set`` changes the displayed value without producing output.
            box(reflect_id, "message", [1190.0, 540.0 + index * 25.0,
                                         65.0, 22.0], text="set $1"),
        ])
        lines.extend([
            line(parameter_object_id, 0, message_id, 0),
            line(message_id, 0, "obj-param-gate", 1),
            line("obj-param-resync-delay", 0, parameter_object_id, 0),
            line("obj-paramchanged-route", index - 1, reflect_id, 0),
            line(reflect_id, 0, parameter_object_id, 0),
        ])

    for index, (parameter_id, value) in enumerate(topology, 1):
        topology_id = f"obj-param-topology-{index}"
        boxes.append(box(
            topology_id,
            "message",
            [720.0, 400.0 + index * 30.0, 105.0, 22.0],
            text=f"paramid {parameter_id} {value:g}",
        ))
        lines.extend([
            line("obj-param-loaded-trigger", 2, topology_id, 0),
            line(topology_id, 0, "obj-clap", 0),
        ])

    return boxes, lines


def route_toggle() -> dict[str, object]:
    return box(
        "obj-chain",
        "live.text",
        [470.0, 95.0, 62.0, 22.0],
        presentation_rect=[180.0, 10.0, 76.0, CONTROL_HEIGHT],
        text="MAIN",
        texton="NEXT ON",
        automation="Off",
        automationon="On",
        numinlets=1,
        numoutlets=2,
        outlettype=["", ""],
        parameter_enable=1,
        annotation=(
            "Route the 3OA stream to the next s3g device on this track "
            "instead of the named main bus."
        ),
        annotation_name="Route to next s3g device",
        mode=1,
        activebgcolor=COLOR_CELL,
        activebgoncolor=COLOR_ACCENT,
        activetextcolor=COLOR_DIM,
        activetextoncolor=COLOR_BACKGROUND,
        bgcolor=COLOR_CELL,
        bgoncolor=COLOR_ACCENT,
        textcolor=COLOR_DIM,
        textoffcolor=COLOR_DIM,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=UI_FONT_SIZE,
        rounded=2.0,
        saved_attribute_attributes={
            "valueof": {
                "parameter_longname": "Route to Chain",
                "parameter_shortname": "Chain",
                "parameter_initial_enable": 1,
                "parameter_initial": [0],
                "parameter_enum": ["Off", "On"],
                "parameter_mmax": 1,
                "parameter_modmode": 0,
                "parameter_type": 2,
            }
        },
        varname="route_to_chain",
    )


def output_pair_selector(pair_index: int, x: float, y: float) -> list[dict[str, object]]:
    first_channel = (pair_index - 1) * 2 + 1
    return [
        box(
            f"obj-output-label-{pair_index}",
            "comment",
            [x, y, 32.0, CONTROL_HEIGHT],
            text=f"{first_channel:02d}/{first_channel + 1:02d}",
            presentation_rect=[x, y, 32.0, CONTROL_HEIGHT],
            fontname=UI_FONT,
            fontsize=UI_FONT_SIZE,
            textcolor=COLOR_DIM,
        ),
        box(
            f"obj-output-selector-{pair_index}",
            "bpatcher",
            [x + 32.0, y, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT],
            presentation_rect=[x + 32.0, y, OUTPUT_MENU_WIDTH, CONTROL_HEIGHT],
            name="s3g.live.routing.channel_selector.maxpat",
            args=[pair_index],
            numinlets=1,
            numoutlets=0,
            bgmode=0,
            border=0,
            clickthrough=0,
            enablehscroll=0,
            enablevscroll=0,
            lockeddragscroll=0,
            lockedsize=0,
            offset=[0.0, 0.0],
            viewvisibility=1,
        ),
    ]


def hardware_output_popup() -> dict[str, object]:
    """Keep Live's stereo DeviceIO routes accessible outside the compact face."""
    inner_boxes = [box("hw-inlet", "inlet", [10.0, 10.0, 30.0, 30.0],
                       index=1, numinlets=0, numoutlets=1, outlettype=[""])]
    inner_lines = []
    for pair_index in range(1, 17):
        column, row = divmod(pair_index - 1, 4)
        inner_boxes.extend(output_pair_selector(
            pair_index, 12.0 + column * 136.0, 10.0 + row * 32.0,
        ))
        inner_lines.append(line("hw-inlet", 0,
                                f"obj-output-selector-{pair_index}", 0))
    return box(
        "obj-hardware-routing", "newobj", [470.0, 310.0, 158.0, 22.0],
        text="p Hardware Output Pairs", numinlets=1, numoutlets=0,
        patcher={
            "fileversion": 1,
            "appversion": {"major": 9, "minor": 1, "revision": 4,
                           "architecture": "x64", "modernui": 1},
            "rect": [180.0, 120.0, 560.0, 152.0],
            "openinpresentation": 1,
            "default_fontsize": 11.0,
            "default_fontface": 0,
            "default_fontname": UI_FONT,
            "locked_bgcolor": COLOR_BACKGROUND,
            "boxes": inner_boxes,
            "lines": inner_lines,
        },
    )


def mono_output_controls(
    channel_kind: str = "Decoder",
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Keep 32 Live routing parameters; edit eight at a time in matrixctrl."""
    grid_annotation = (
        "Rows are decoder input channels on the selected page; "
        "columns are mono output slots 01–32. Click a lit cell again to disconnect."
        if channel_kind == "Decoder" else
        "Rows are panner speaker outputs on the selected page; "
        "columns are mono hardware slots 01–32. Click a lit cell again to disconnect."
    )
    page_annotation = (
        "Choose which eight decoded input channels the grid edits."
        if channel_kind == "Decoder" else
        "Choose which eight panner speaker outputs the grid edits."
    )
    boxes = [
        new_object("obj-mono-matrix", "matrix~ 32 32 1. @ramp 5.",
                   125.0, 340.0, 200.0, 32, 33,
                   (["signal"] * 32) + ["list"]),
        new_object("obj-mono-init", "loadbang", 920.0, 120.0, 62.0, 0, 1,
                   ["bang"]),
        new_object("obj-mono-init-defer", "deferlow", 920.0, 150.0,
                   62.0, 1, 1),
        box("obj-mono-outputvalue", "message", [920.0, 180.0, 80.0, 22.0],
            text="outputvalue"),
        box(
            "obj-mono-grid", "matrixctrl", [910.0, 230.0, 448.0, 112.0],
            presentation_rect=[240.0, 28.0, 448.0, 112.0],
            numinlets=1, numoutlets=2, outlettype=["list", "list"],
            columns=32, rows=8, range=2, parameter_enable=0,
            horizontalmargin=0, verticalmargin=0,
            horizontalspacing=0, verticalspacing=0,
            bgcolor=COLOR_CELL, elementcolor=COLOR_BUTTON,
            color=COLOR_ACCENT, annotation=grid_annotation,
        ),
        box(
            "obj-mono-page-menu", "umenu", [910.0, 360.0, 108.0, 20.0],
            presentation_rect=[204.0, 142.0, 108.0, 20.0],
            numinlets=1, numoutlets=3, outlettype=["int", "", ""],
            parameter_enable=0, items=[
                "IN 01–08", ",", "IN 09–16", ",",
                "IN 17–24", ",", "IN 25–32",
            ],
            menumode=0, arrow=1, allowdrag=0, applycolors=1,
            bgfillcolor=COLOR_BUTTON, textcolor=COLOR_BUTTON_TEXT,
            elementcolor=COLOR_ACCENT, fontname=UI_FONT, fontsize=UI_FONT_SIZE,
            annotation=page_annotation,
        ),
        new_object("obj-mono-page-init", "loadbang", 910.0, 390.0, 64.0, 0, 1),
        box("obj-mono-page-first", "message", [990.0, 390.0, 36.0, 22.0], text="0"),
        new_object("obj-mono-page-one", "+ 1", 1040.0, 390.0, 40.0, 2, 1),
        new_object("obj-mono-page-order", "t b i i", 1090.0, 390.0, 58.0, 1, 3),
        new_object("obj-mono-current-page", "i 1", 1160.0, 390.0, 40.0, 2, 1),
        new_object("obj-mono-redraw", "t b b b", 910.0, 430.0, 58.0, 1, 3),
        box("obj-mono-click-close", "message", [980.0, 430.0, 30.0, 22.0], text="0"),
        box("obj-mono-click-open", "message", [1020.0, 430.0, 30.0, 22.0], text="1"),
        new_object("obj-mono-redraw-body", "t b b", 1060.0, 430.0, 46.0, 1, 2),
        box("obj-mono-clear", "message", [1120.0, 430.0, 50.0, 22.0], text="clear"),
        new_object("obj-mono-select-page", "sel 1 2 3 4", 1190.0, 430.0, 105.0, 1, 5),
        new_object("obj-mono-click-gate", "gate 1 1", 910.0, 480.0, 65.0, 2, 1),
        new_object("obj-mono-click-unpack", "unpack i i i", 990.0, 480.0, 100.0, 1, 3),
        new_object("obj-mono-click-channel", "expr $i1 + (($i2 - 1) * 8) + 1",
                   1110.0, 480.0, 220.0, 2, 1),
        new_object("obj-mono-click-channel-store", "i 1", 1340.0, 480.0, 40.0, 2, 1),
        new_object("obj-mono-click-value", "expr ($i2 != 0) * ($i1 + 1)",
                   1110.0, 510.0, 210.0, 2, 1),
        new_object("obj-mono-click-order", "t b i", 1340.0, 510.0, 46.0, 1, 2),
        new_object("obj-mono-click-pack", "pack i i", 1400.0, 510.0, 70.0, 2, 1),
        new_object("obj-mono-click-route", "route " + " ".join(
            str(channel) for channel in range(1, 33)),
            1480.0, 510.0, 430.0, 1, 33),
    ]
    lines = [
        line("obj-mono-init", 0, "obj-mono-init-defer", 0),
        line("obj-mono-init-defer", 0, "obj-mono-outputvalue", 0),
        line("obj-mono-page-init", 0, "obj-mono-page-first", 0),
        line("obj-mono-page-first", 0, "obj-mono-page-menu", 0),
        line("obj-mono-page-menu", 0, "obj-mono-page-one", 0),
        line("obj-mono-page-one", 0, "obj-mono-page-order", 0),
        line("obj-mono-page-order", 2, "obj-mono-click-channel", 1),
        line("obj-mono-page-order", 1, "obj-mono-current-page", 1),
        line("obj-mono-page-order", 0, "obj-mono-redraw", 0),
        line("obj-mono-redraw", 2, "obj-mono-click-close", 0),
        line("obj-mono-click-close", 0, "obj-mono-click-gate", 0),
        line("obj-mono-redraw", 1, "obj-mono-redraw-body", 0),
        line("obj-mono-redraw-body", 1, "obj-mono-clear", 0),
        line("obj-mono-clear", 0, "obj-mono-grid", 0),
        line("obj-mono-redraw-body", 0, "obj-mono-current-page", 0),
        line("obj-mono-current-page", 0, "obj-mono-select-page", 0),
        line("obj-mono-redraw", 0, "obj-mono-click-open", 0),
        line("obj-mono-click-open", 0, "obj-mono-click-gate", 0),
        line("obj-mono-grid", 0, "obj-mono-click-gate", 1),
        line("obj-mono-click-gate", 0, "obj-mono-click-unpack", 0),
        line("obj-mono-click-unpack", 2, "obj-mono-click-value", 1),
        line("obj-mono-click-unpack", 1, "obj-mono-click-channel", 0),
        line("obj-mono-click-channel", 0, "obj-mono-click-channel-store", 1),
        line("obj-mono-click-unpack", 0, "obj-mono-click-value", 0),
        line("obj-mono-click-value", 0, "obj-mono-click-order", 0),
        line("obj-mono-click-order", 1, "obj-mono-click-pack", 1),
        line("obj-mono-click-order", 0, "obj-mono-click-channel-store", 0),
        line("obj-mono-click-channel-store", 0, "obj-mono-click-pack", 0),
        line("obj-mono-click-pack", 0, "obj-mono-click-route", 0),
    ]
    for group in range(8):
        boxes.append(box(
            f"obj-mono-output-heading-{group + 1}", "comment",
            [240.0 + group * 56.0, 8.0, 56.0, 18.0],
            text=f"{group * 4 + 1:02d}–{group * 4 + 4:02d}",
            presentation_rect=[240.0 + group * 56.0, 8.0, 56.0, 18.0],
            fontname=UI_FONT, fontsize=9.0, textcolor=COLOR_DIM,
        ))
    for row in range(8):
        label = f"obj-mono-row-label-{row + 1}"
        boxes.extend([
            box(label, "comment", [204.0, 28.0 + row * 14.0, 30.0, 14.0],
                text=f"{row + 1:02d}",
                presentation_rect=[204.0, 28.0 + row * 14.0, 30.0, 14.0],
                fontname=UI_FONT, fontsize=9.0, textcolor=COLOR_DIM),
            new_object(f"{label}-number", f"expr (($i1 - 1) * 8) + {row + 1}",
                       1200.0, 550.0 + row * 26.0, 190.0, 1, 1),
            new_object(f"{label}-format", "sprintf symout %02ld",
                       1400.0, 550.0 + row * 26.0, 100.0, 1, 1),
            new_object(f"{label}-set", "prepend set",
                       1510.0, 550.0 + row * 26.0, 84.0, 1, 1),
        ])
        lines.extend([
            line("obj-mono-page-one", 0, f"{label}-number", 0),
            line(f"{label}-number", 0, f"{label}-format", 0),
            line(f"{label}-format", 0, f"{label}-set", 0),
            line(f"{label}-set", 0, label, 0),
        ])
    for page in range(4):
        page_trigger = f"obj-mono-page-{page + 1}-rows"
        boxes.append(new_object(page_trigger, "t " + " ".join(["b"] * 8),
                                1200.0, 770.0 + page * 35.0, 140.0, 1, 8))
        lines.append(line("obj-mono-select-page", page, page_trigger, 0))
        for row in range(8):
            channel = page * 8 + row + 1
            lines.append(line(page_trigger, row, f"obj-mono-output-{channel}-store", 0))
    for channel in range(1, 33):
        param = f"obj-mono-output-{channel}"
        boxes.extend([
            routing_number_box(param, f"{channel_kind} Channel {channel} Output",
                               f"Out {channel}", 0, 32, channel,
                               1050.0, 60.0, 30.0 * channel),
            new_object(f"{param}-store-input", "t b i",
                       1790.0, 30.0 * channel, 46.0, 1, 2),
            new_object(f"{param}-store", f"i {channel}",
                       1840.0, 30.0 * channel, 46.0, 2, 1),
            new_object(f"{param}-display-valid", "split 1 32",
                       1900.0, 30.0 * channel, 72.0, 1, 2),
            new_object(f"{param}-display-column", "- 1",
                       1980.0, 30.0 * channel, 38.0, 2, 1),
            box(f"{param}-display-set", "message",
                [2030.0, 30.0 * channel, 100.0, 22.0],
                text=f"set $1 {(channel - 1) % 8} 1"),
        ])
        boxes.extend([
            new_object(f"{param}-trigger", "t i b",
                       1280.0, 30.0 * channel, 34.0, 1, 2),
            new_object(f"{param}-old", f"i {channel - 1}",
                       1330.0, 30.0 * channel, 34.0, 2, 1),
            box(f"{param}-disconnect", "message",
                [1380.0, 30.0 * channel, 84.0, 22.0],
                text=f"{channel - 1} $1 0."),
            new_object(f"{param}-valid", "split 1 32",
                       1480.0, 30.0 * channel, 72.0, 1, 2),
            new_object(f"{param}-zero-based", "- 1",
                       1570.0, 30.0 * channel, 38.0, 2, 1),
            new_object(f"{param}-new", "t i i",
                       1630.0, 30.0 * channel, 34.0, 1, 2),
            box(f"{param}-connect", "message",
                [1680.0, 30.0 * channel, 84.0, 22.0],
                text=f"{channel - 1} $1 1."),
        ])
        lines.extend([
            line("obj-mono-outputvalue", 0, param, 0),
            line(param, 0, f"{param}-store-input", 0),
            line(f"{param}-store-input", 1, f"{param}-store", 1),
            line(f"{param}-store-input", 0, "obj-mono-redraw", 0),
            line(f"{param}-store", 0, f"{param}-display-valid", 0),
            line(f"{param}-display-valid", 0, f"{param}-display-column", 0),
            line(f"{param}-display-column", 0, f"{param}-display-set", 0),
            line(f"{param}-display-set", 0, "obj-mono-grid", 0),
            line("obj-mono-click-route", channel - 1, param, 0),
            line(param, 0, f"{param}-trigger", 0),
            line(f"{param}-trigger", 1, f"{param}-old", 0),
            line(f"{param}-old", 0, f"{param}-disconnect", 0),
            line(f"{param}-disconnect", 0, "obj-mono-matrix", 0),
            line(f"{param}-trigger", 0, f"{param}-valid", 0),
            line(f"{param}-valid", 0, f"{param}-zero-based", 0),
            line(f"{param}-zero-based", 0, f"{param}-new", 0),
            line(f"{param}-new", 1, f"{param}-old", 1),
            line(f"{param}-new", 0, f"{param}-connect", 0),
            line(f"{param}-connect", 0, "obj-mono-matrix", 0),
        ])
    return boxes, lines


def output_initializer_box() -> dict[str, object]:
    inner_boxes = [
        box("init-inlet", "inlet", [22.0, 20.0, 30.0, 30.0], index=1,
            numinlets=0, numoutlets=1, outlettype=[""]),
        new_object("init-outputs", "s3g.live.object get audio_outputs",
                   22.0, 70.0, 190.0, 2, 2),
        new_object("init-skip-main", "zl.slice 2", 22.0, 110.0, 60.0, 2, 2),
        new_object("init-iterate", "zl.iter 2", 105.0, 150.0, 55.0, 2, 2),
        new_object("init-type", 's3g.live.routing routing_type "Ext. Out"',
                   105.0, 190.0, 225.0, 2, 1),
        new_object("init-channel", 's3g.live.routing routing_channel "No Output"',
                   105.0, 230.0, 250.0, 2, 1),
    ]
    inner_lines = [
        line("init-inlet", 0, "init-outputs", 0),
        line("init-outputs", 0, "init-skip-main", 0),
        line("init-skip-main", 1, "init-iterate", 0),
        line("init-iterate", 0, "init-type", 0),
        line("init-type", 0, "init-channel", 0),
    ]
    return box(
        "obj-output-init",
        "newobj",
        [470.0, 310.0, 145.0, 22.0],
        text="p Initialize Output Pairs",
        numinlets=1,
        numoutlets=0,
        outlettype=[],
        patcher={
            "fileversion": 1,
            "appversion": {
                "major": 9,
                "minor": 1,
                "revision": 4,
                "architecture": "x64",
                "modernui": 1,
            },
            "rect": [180.0, 120.0, 390.0, 290.0],
            "openinpresentation": 0,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "boxes": inner_boxes,
            "lines": inner_lines,
        },
    )


def ui_panel(
    object_id: str,
    rect: list[float],
    color: list[float],
    *,
    border: int = 0,
    bordercolor: list[float] | None = None,
) -> dict[str, object]:
    return box(
        object_id,
        "panel",
        rect,
        presentation_rect=rect,
        numinlets=1,
        numoutlets=0,
        outlettype=[],
        background=1,
        ignoreclick=1,
        bgcolor=color,
        border=border,
        bordercolor=bordercolor or COLOR_GRID,
        rounded=0,
    )




def input_mute_button(
    channel: int,
    x: float,
    parameter_prefix: str = "Source",
    width: float = 64.0,
    y: float = 136.0,
) -> dict[str, object]:
    parameter_name_prefix = "" if parameter_prefix == "Source" else f"{parameter_prefix} "
    if parameter_prefix == "Source":
        annotation = (
            f"Mute Source input channel {channel} before the CLAP encoder. "
            "The ordinary stereo passthrough remains audible."
        )
    else:
        annotation = (
            f"Mute {parameter_prefix} input channel {channel} before it is "
            "panned into the selected multichannel bus pair."
        )
    return box(
        f"obj-input-mute-{channel}",
        "live.text",
        [470.0, 340.0 + channel * 30.0, 70.0, 22.0],
        presentation_rect=[x, y, width, CONTROL_HEIGHT],
        text=f"{channel} LIVE",
        texton=f"{channel} MUTE",
        automation="Live",
        automationon="Mute",
        numinlets=1,
        numoutlets=2,
        outlettype=["", ""],
        parameter_enable=1,
        annotation=annotation,
        annotation_name=f"{parameter_prefix} input {channel} mute",
        mode=1,
        activebgcolor=COLOR_CELL,
        activebgoncolor=COLOR_ACCENT,
        activetextcolor=COLOR_DIM,
        activetextoncolor=COLOR_BACKGROUND,
        bgcolor=COLOR_CELL,
        bgoncolor=COLOR_ACCENT,
        textcolor=COLOR_DIM,
        textoffcolor=COLOR_DIM,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=UI_FONT_SIZE,
        rounded=2.0,
        saved_attribute_attributes={
            "valueof": {
                "parameter_longname": f"{parameter_name_prefix}Input {channel} Mute",
                "parameter_shortname": f"In {channel} Mute",
                "parameter_initial_enable": 1,
                "parameter_initial": [0],
                "parameter_enum": ["Live", "Mute"],
                "parameter_mmax": 1,
                "parameter_modmode": 0,
                "parameter_type": 2,
            }
        },
        varname=f"input_{channel}_mute",
    )


def send_pan_control(channel: int, x: float, initial: float) -> dict[str, object]:
    """Pan one stereo input channel across the currently selected bus pair."""
    return box(
        f"obj-input-pan-{channel}",
        "live.dial",
        [590.0, 340.0 + channel * 45.0, 42.0, 36.0],
        presentation_rect=[x, 80.0, 40.0, 48.0],
        numinlets=1,
        numoutlets=2,
        outlettype=["", "float"],
        parameter_enable=1,
        annotation=(
            f"Pan Send input channel {channel} across the selected destination pair."
        ),
        annotation_name=f"Send input {channel} pan",
        activedialcolor=COLOR_ACCENT,
        activefgdialcolor=COLOR_TEXT,
        activeneedlecolor=COLOR_TEXT,
        bgcolor=COLOR_CELL,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        textcolor=COLOR_BUTTON_TEXT,
        triangle=1,
        tricolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=UI_FONT_SIZE,
        saved_attribute_attributes={
            "valueof": {
                "parameter_annotation_name": f"Send Input {channel} Pan",
                "parameter_longname": f"Send Input {channel} Pan",
                "parameter_shortname": f"Pan {channel}",
                "parameter_initial_enable": 1,
                "parameter_initial": [initial],
                "parameter_invisible": 0,
                "parameter_mmin": -50.0,
                "parameter_mmax": 50.0,
                "parameter_modmode": 0,
                "parameter_speedlim": 3.0,
                "parameter_type": 0,
                "parameter_unitstyle": 0,
            }
        },
        varname=f"input_{channel}_pan",
    )


def source_input_monitor_ui(parameter_prefix: str = "Source") -> list[dict[str, object]]:
    return [
        box(
            "obj-input-meter",
            "live.gain~",
            [125.0, 220.0, 250.0, 42.0],
            presentation_rect=[12.0, 80.0, 224.0, 72.0],
            fontname=UI_FONT,
            fontsize=UI_FONT_SIZE,
            channels=2,
            display_range=[-70.0, 6.0],
            ignoreclick=0,
            lastchannelcount=0,
            numinlets=2,
            numoutlets=5,
            orientation=1,
            outlettype=["signal", "signal", "", "float", "list"],
            parameter_enable=1,
            coldcolor=COLOR_VALUE,
            warmcolor=COLOR_ACCENT,
            hotcolor=COLOR_TEXT,
            overloadcolor=COLOR_TEXT,
            slidercolor=COLOR_GRID,
            textcolor=COLOR_DIM,
            tribordercolor=COLOR_TEXT,
            tricolor=COLOR_ACCENT,
            trioncolor=COLOR_ACCENT,
            saved_attribute_attributes={
                "valueof": {
                    "parameter_longname": f"{parameter_prefix} Input Gain",
                    "parameter_shortname": "Input Gain",
                    "parameter_initial_enable": 1,
                    "parameter_initial": [0],
                    "parameter_invisible": 1,
                    "parameter_mmax": 6.0,
                    "parameter_mmin": -70.0,
                    "parameter_modmode": 0,
                    "parameter_type": 0,
                    "parameter_unitstyle": 4,
                }
            },
            showname=0,
            shownumber=0,
            varname="source_input_gain",
        ),
        input_mute_button(1, 248.0, parameter_prefix, y=88.0),
        input_mute_button(2, 248.0, parameter_prefix, y=120.0),
    ]


def multichannel_encoder_input_ui() -> list[dict[str, object]]:
    return [
        box(
            "obj-input-bus-label",
            "comment",
            [84.0, 10.0, 52.0, CONTROL_HEIGHT],
            text="RCV BUS",
            presentation_rect=[84.0, 10.0, 52.0, CONTROL_HEIGHT],
            fontname=UI_FONT,
            fontsize=UI_FONT_SIZE,
            textcolor=COLOR_DIM,
        ),
        *routing_menu_controls(
            "obj-input-bus-number",
            "Multichannel Input Bus",
            "Input Bus",
            1,
            16,
            1,
            142.0,
            width=48.0,
        ),
    ]


def ambisonic_input_gain() -> dict[str, object]:
    """One linked Live gain control for a 16-channel Ambisonic bed."""
    return box(
        "obj-ambi-input-gain",
        "live.gain~",
        [125.0, 245.0, 400.0, 60.0],
        presentation_rect=[16.0, 66.0, 168.0, 68.0],
        fontname=UI_FONT,
        fontsize=UI_FONT_SIZE,
        channels=16,
        display_range=[-70.0, 6.0],
        ignoreclick=0,
        lastchannelcount=0,
        numinlets=16,
        numoutlets=19,
        outlettype=(["signal"] * 16) + ["", "float", "list"],
        parameter_enable=1,
        relative=1,
        coldcolor=COLOR_VALUE,
        warmcolor=COLOR_ACCENT,
        hotcolor=COLOR_TEXT,
        overloadcolor=COLOR_TEXT,
        slidercolor=COLOR_GRID,
        textcolor=COLOR_DIM,
        tribordercolor=COLOR_TEXT,
        tricolor=COLOR_ACCENT,
        trioncolor=COLOR_ACCENT,
        saved_attribute_attributes={
            "valueof": {
                "parameter_longname": "Ambisonic Input Gain",
                "parameter_shortname": "3OA Gain",
                "parameter_initial_enable": 1,
                "parameter_initial": [0],
                "parameter_invisible": 0,
                "parameter_mmax": 6.0,
                "parameter_mmin": -70.0,
                "parameter_modmode": 0,
                "parameter_type": 0,
                "parameter_unitstyle": 4,
            }
        },
        showname=0,
        shownumber=1,
        varname="ambisonic_input_gain",
    )


def panner_input_gain() -> dict[str, object]:
    """One linked, automatable gain for the 32 ordinary source lanes."""
    gain = ambisonic_input_gain()
    control = gain["box"]
    control["id"] = "obj-panner-input-gain"
    control["channels"] = MULTICHANNEL_SLOT_COUNT
    control["numinlets"] = MULTICHANNEL_SLOT_COUNT
    control["numoutlets"] = MULTICHANNEL_SLOT_COUNT + 3
    control["outlettype"] = (
        ["signal"] * MULTICHANNEL_SLOT_COUNT + ["", "float", "list"]
    )
    control["varname"] = "panner_input_gain"
    value = control["saved_attribute_attributes"]["valueof"]
    value["parameter_longname"] = "Panner Input Gain"
    value["parameter_shortname"] = "Input Gain"
    return gain


def autogain_input_gain() -> dict[str, object]:
    """A linked 32-lane input trim before an Output AutoGain CLAP."""
    gain = panner_input_gain()
    control = gain["box"]
    control["id"] = "obj-autogain-input-gain"
    control["varname"] = "autogain_input_gain"
    value = control["saved_attribute_attributes"]["valueof"]
    value["parameter_longname"] = "Output AutoGain Input Gain"
    value["parameter_shortname"] = "Input Gain"
    return gain


def common_ui(
    with_route: bool,
    presentation_height: float,
    *,
    allow_plugin_picker: bool = True,
) -> list[dict[str, object]]:
    """Only interactive controls; Live already displays the device title."""
    boxes = [
        # Width is fitted to the completed face by fit_presentation_width().
        ui_panel("obj-ui-background", [0.0, 0.0, 0.0, presentation_height],
                 COLOR_BACKGROUND),
        action_button(
            "obj-gui-button", [95.0, 80.0, 65.0, 24.0], EDITOR_RECT, "EDITOR",
        ),
        box(
            "obj-editor", "message", [95.0, 118.0, 54.0, 22.0], text="editor 1"
        ),
    ]
    if allow_plugin_picker:
        boxes.extend([
            action_button(
                "obj-load-button", [20.0, 80.0, 65.0, 24.0], LOAD_RECT, "LOAD CLAP",
            ),
            box("obj-open", "message", [20.0, 118.0, 42.0, 22.0], text="open"),
        ])
    if with_route:
        boxes.append(route_toggle())
    return boxes


def main_out_ui(*, allow_plugin_picker: bool = True) -> list[dict[str, object]]:
    """Linked gain/recorder on the left, paged mono routing grid on the right."""
    boxes = common_ui(False, MAIN_OUT_DEVICE_HEIGHT,
                      allow_plugin_picker=allow_plugin_picker)
    # Keep Editor at the shared top-left position; the output matrix begins
    # on that same row. The generic decoder's picker stays in the left column.
    for entry in boxes:
        if entry["box"]["id"] == "obj-load-button":
            entry["box"]["presentation_rect"] = [12.0, 38.0, 112.0, CONTROL_HEIGHT]
    boxes.extend([
        action_button("obj-hardware-button", [640.0, 120.0, 100.0, 20.0],
                      [84.0, 10.0, 100.0, CONTROL_HEIGHT], "HARDWARE"),
        box("obj-hardware-open", "message", [640.0, 150.0, 45.0, 22.0],
            text="open"),
        new_object("obj-hardware-pcontrol", "pcontrol", 690.0, 150.0,
                   66.0, 1, 1),
        ui_panel("obj-input-panel", [12.0, 4.0, 180.0, 158.0], COLOR_BACKGROUND),
        ui_panel("obj-section-divider", [196.0, 4.0, 1.0, 158.0], COLOR_GRID),
        ui_panel("obj-output-panel", [200.0, 4.0, 488.0, 158.0], COLOR_BACKGROUND),
    ])
    return boxes


def ambisonic_recorder() -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Manual post-gain/pre-decoder 16-channel ACN/SN3D WAV capture.

    E4L Master Bus uses sfrecord~ 16 behind a B-format converter. We keep
    the native s3g ACN/SN3D order unchanged, with independent Max controls.
    No path or recording state is a Live parameter; every take needs FILE.
    """
    file_button = action_button(
            "obj-rec-file-button", [1110.0, 180.0, 64.0, CONTROL_HEIGHT],
        [16.0, 140.0, 48.0, CONTROL_HEIGHT], "FILE",
        annotation=(
            "Create the 16-channel float32 WAV for a new take. "
            "The selected file is created/replaced; choose a new name each time."
        ),
    )
    toggle = action_button(
        "obj-rec-toggle", [1190.0, 180.0, 64.0, CONTROL_HEIGHT],
        [70.0, 140.0, 48.0, CONTROL_HEIGHT], "REC",
        annotation="Record the post-gain 16-channel ACN/SN3D bed before decoding. Select FILE first.",
    )
    toggle["box"].update(active=0, mode=1, texton="STOP")
    boxes = [
        file_button, toggle,
        box(
            "obj-rec-time", "comment", [1270.0, 180.0, 80.0, CONTROL_HEIGHT],
            text="00:00", presentation_rect=[124.0, 140.0, 60.0, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
            ignoreclick=1, annotation="Elapsed recording time (minutes:seconds).",
        ),
        new_object("obj-rec-writer", "sfrecord~ 16", 1110.0, 500.0,
                   280.0, 16, 1, ["signal"]),
        new_object("obj-rec-file-request", "t b b", 1110.0, 220.0,
                   45.0, 1, 2, ["bang", "bang"]),
        new_object("obj-rec-dialog", "savedialog WAVE", 1110.0, 260.0,
                   105.0, 1, 3, ["", "", "bang"]),
        new_object("obj-rec-file-selected", "t b s b", 1110.0, 300.0,
                   55.0, 1, 3, ["bang", "", "bang"]),
        box("obj-rec-format", "message", [1270.0, 300.0, 130.0, 22.0],
            text="samptype float32"),
        new_object("obj-rec-wave-format", "append wave", 1180.0, 340.0,
                   85.0, 2, 1),
        new_object("obj-rec-open", "prepend open", 1180.0, 380.0,
                   85.0, 1, 1),
        box("obj-rec-ready", "message", [1110.0, 340.0, 30.0, 22.0], text="1"),
        new_object("obj-rec-ready-active", "prepend active", 1110.0, 380.0,
                   95.0, 1, 1),
        new_object("obj-rec-choice", "sel 1 0", 1410.0, 220.0,
                   55.0, 1, 3, ["bang", "bang", ""]),
        new_object("obj-rec-start-gate", "gate 1 0", 1410.0, 260.0,
                   55.0, 2, 1),
        new_object("obj-rec-start-trigger", "t b b", 1410.0, 300.0,
                   45.0, 1, 2, ["bang", "bang"]),
        box("obj-rec-file-block", "message", [1490.0, 300.0, 60.0, 22.0],
            text="active 0"),
        box("obj-rec-start", "message", [1410.0, 340.0, 30.0, 22.0], text="1"),
        new_object("obj-rec-start-order", "t b i i", 1410.0, 380.0,
                   55.0, 1, 3, ["bang", "int", "int"]),
        box("obj-rec-stop", "message", [1580.0, 340.0, 30.0, 22.0], text="0"),
        new_object("obj-rec-reset", "t i i i i i", 1580.0, 380.0,
                   80.0, 1, 5, ["int"] * 5),
        new_object("obj-rec-ui-set", "prepend set", 1580.0, 420.0,
                   78.0, 1, 1),
        new_object("obj-rec-file-active", "prepend active", 1670.0, 460.0,
                   95.0, 1, 1),
        new_object("obj-rec-file-invert", "!- 1", 1670.0, 420.0,
                   38.0, 1, 1),
        new_object("obj-rec-init", "loadbang", 1760.0, 220.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-rec-init-order", "t b b b", 1760.0, 260.0,
                   58.0, 1, 3, ["bang"] * 3),
        box("obj-rec-default-name", "message", [1760.0, 300.0, 140.0, 22.0],
            text="name s3g-3oa.wav"),
        box("obj-rec-time-reset", "message", [1760.0, 340.0, 75.0, 22.0],
            text="set 00:00"),
        new_object("obj-rec-clock", "snapshot~ 250", 1110.0, 550.0,
                   95.0, 2, 1, ["float"]),
        new_object("obj-rec-progress", "change 0.", 1220.0, 590.0,
                   65.0, 1, 3, ["", "int", "int"]),
        new_object("obj-rec-watch-gate", "gate 1 0", 1410.0, 550.0,
                   55.0, 2, 1),
        new_object("obj-rec-watch-reset", "t b b", 1410.0, 590.0,
                   45.0, 1, 2, ["bang", "bang"]),
        box("obj-rec-watch-stop", "message", [1490.0, 590.0, 40.0, 22.0],
            text="stop"),
        new_object("obj-rec-watch-timeout", "delay 2000", 1410.0, 630.0,
                   75.0, 2, 1, ["bang"]),
        box("obj-rec-watch-error", "message", [1510.0, 670.0, 390.0, 22.0],
            text="Recording halted (no time progress). Check audio engine/disk."),
        new_object("obj-rec-print", "print s3g-3oa-recorder", 1510.0, 710.0,
                   155.0, 1, 0, []),
        new_object("obj-rec-seconds", "/ 1000.", 1110.0, 590.0,
                   58.0, 2, 1, ["float"]),
        new_object("obj-rec-whole-seconds", "i", 1110.0, 630.0,
                   30.0, 2, 1, ["int"]),
        new_object("obj-rec-time-change", "change", 1110.0, 670.0,
                   55.0, 1, 3, ["", "int", "int"]),
        new_object("obj-rec-time-split", "t i i", 1110.0, 710.0,
                   40.0, 1, 2, ["int", "int"]),
        new_object("obj-rec-time-minutes", "/ 60", 1110.0, 750.0,
                   40.0, 2, 1, ["int"]),
        new_object("obj-rec-time-seconds", "% 60", 1170.0, 750.0,
                   40.0, 2, 1, ["int"]),
        new_object("obj-rec-time-pack", "pack i i", 1110.0, 790.0,
                   65.0, 2, 1, ["list"]),
        new_object("obj-rec-time-format", "sprintf %02ld:%02ld", 1110.0, 830.0,
                   130.0, 2, 1),
        new_object("obj-rec-time-set", "prepend set", 1110.0, 870.0,
                   78.0, 1, 1),
        box(
            "obj-rec-credit", "comment", [1110.0, 930.0, 800.0, 36.0],
            text=(
                "Recorder reference: Envelop for Live E4L Master Bus by Envelop "
                "(LGPL-2.1). Independent s3g controls; native ACN/SN3D capture "
                "without E4L's B-format conversion. "
                "https://github.com/EnvelopSound/EnvelopForLive"
            ),
            fontsize=9.0,
        ),
    ]
    connections = [
        ("file-button", 0, "file-request", 0),
        ("file-request", 1, "stop", 0),
        ("file-request", 0, "dialog", 0),
        ("dialog", 0, "file-selected", 0),
        ("dialog", 2, "stop", 0),
        # Trigger runs right-to-left: sample format, file open, enable REC.
        ("file-selected", 2, "format", 0),
        ("format", 0, "writer", 0),
        ("file-selected", 1, "wave-format", 0),
        ("wave-format", 0, "open", 0),
        ("open", 0, "writer", 0),
        ("file-selected", 0, "ready", 0),
        ("ready", 0, "start-gate", 0),
        ("ready", 0, "ready-active", 0),
        ("ready", 0, "time-reset", 0),
        ("ready-active", 0, "toggle", 0),
        ("toggle", 0, "choice", 0),
        ("choice", 0, "start-gate", 1),
        ("choice", 1, "stop", 0),
        ("start-gate", 0, "start-trigger", 0),
        ("start-trigger", 1, "file-block", 0),
        ("file-block", 0, "file-button", 0),
        ("start-trigger", 0, "start", 0),
        ("start", 0, "start-order", 0),
        ("start-order", 2, "writer", 0),
        ("start-order", 1, "watch-gate", 0),
        ("start-order", 0, "watch-reset", 0),
        # Reset never sends a normal value back into the REC toggle.
        ("stop", 0, "reset", 0),
        ("reset", 4, "ui-set", 0),
        ("ui-set", 0, "toggle", 0),
        ("reset", 4, "watch-stop", 0),
        ("reset", 3, "start-gate", 0),
        ("reset", 3, "ready-active", 0),
        ("reset", 2, "watch-gate", 0),
        ("reset", 1, "writer", 0),
        ("reset", 0, "file-invert", 0),
        ("file-invert", 0, "file-active", 0),
        ("file-active", 0, "file-button", 0),
        ("init", 0, "init-order", 0),
        ("init-order", 2, "stop", 0),
        ("init-order", 1, "default-name", 0),
        ("default-name", 0, "dialog", 0),
        ("init-order", 0, "time-reset", 0),
        ("time-reset", 0, "time", 0),
        ("writer", 0, "clock", 0),
        ("clock", 0, "progress", 0),
        ("progress", 0, "watch-gate", 1),
        ("watch-gate", 0, "watch-reset", 0),
        ("watch-reset", 1, "watch-stop", 0),
        ("watch-stop", 0, "watch-timeout", 0),
        ("watch-reset", 0, "watch-timeout", 0),
        ("watch-timeout", 0, "stop", 0),
        ("watch-timeout", 0, "watch-error", 0),
        ("watch-error", 0, "print", 0),
        ("clock", 0, "seconds", 0),
        ("seconds", 0, "whole-seconds", 0),
        ("whole-seconds", 0, "time-change", 0),
        ("time-change", 0, "time-split", 0),
        ("time-split", 1, "time-seconds", 0),
        ("time-seconds", 0, "time-pack", 1),
        ("time-split", 0, "time-minutes", 0),
        ("time-minutes", 0, "time-pack", 0),
        ("time-pack", 0, "time-format", 0),
        ("time-format", 0, "time-set", 0),
        ("time-set", 0, "time", 0),
    ]
    lines = [line(f"obj-rec-{source}", outlet, f"obj-rec-{destination}", inlet)
             for source, outlet, destination, inlet in connections]
    lines.extend(line("obj-ambi-input-gain", channel, "obj-rec-writer", channel)
                 for channel in range(16))
    return boxes, lines


def common_runtime(
    status_outlet: int,
    default_plugin: str,
    enforce_stereo_input_count: bool = False,
    *,
    allow_plugin_picker: bool = True,
    fixed_parameters: bool = False,
    default_plugin_id: str | None = None,
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    if fixed_parameters:
        status_routes = (
            "route latency error loaded paramchanged paraminfo state statechanged"
        )
        status_route_outlets = 8
        state_outlet = 5
        statechanged_outlet = 6
    else:
        status_routes = "route latency error loaded paramchanged state statechanged"
        status_route_outlets = 7
        state_outlet = 4
        statechanged_outlet = 5
    default_target = f'"{default_plugin}"'
    if default_plugin_id:
        default_target += f" {default_plugin_id}"
    boxes = [
        new_object("obj-plugsync", "plugsync~", 40.0, 520.0, 70.0, 2, 9,
                   ["int", "int", "int", "float", "list", "float", "float", "int", "int"]),
        new_object("obj-timesig", "unpack i i", 250.0, 555.0, 75.0, 1, 2),
        new_object("obj-transport-pack", "pak i f f f i i i", 40.0, 600.0, 180.0, 7, 1),
        new_object("obj-transport", "prepend transportsync", 40.0, 635.0, 145.0, 1, 1),
        new_object("obj-route-status", status_routes, 390.0, 400.0,
                   280.0 if fixed_parameters else (
                       165.0 if enforce_stereo_input_count else 120.0
                   ),
                   1, status_route_outlets),
        new_object("obj-latency-message", "prepend latency", 390.0, 435.0, 100.0, 1, 1),
        new_object("obj-thispatcher", "thispatcher", 390.0, 470.0, 72.0, 1, 2),
        new_object("obj-print", "print s3g-clap-m4l", 525.0, 435.0, 115.0, 1, 0),
        new_object("obj-loadbang", "loadbang", 525.0, 520.0, 65.0, 1, 1, ["bang"]),
        new_object("obj-delayed-load", "delay 100", 525.0, 555.0, 65.0, 1, 1,
                   ["bang"]),
        box(
            "obj-default-open",
            "message",
            [525.0, 590.0, 220.0, 22.0],
            text=f"openifempty {default_target}",
        ),
    ]
    if allow_plugin_picker:
        boxes.append(new_object(
            "obj-load-trigger", "t b", 20.0, 118.0, 30.0, 1, 1, ["bang"]
        ))
    boxes.extend([
        new_object("obj-editor-trigger", "t b", 95.0, 118.0, 30.0,
                   1, 1, ["bang"]),
        clap_state_parameter(),
        new_object("obj-state-valid", "routepass s3g.clap.state.1",
                   525.0, 690.0, 170.0, 1, 2),
        new_object("obj-state-restore", "prepend setstate", 525.0, 705.0,
                   105.0, 1, 1),
        new_object("obj-state-restore-init", "t b b b", 525.0, 740.0,
                   55.0, 1, 3, ["bang", "bang", "bang"]),
        box("obj-state-capture-enable", "message",
            [590.0, 740.0, 30.0, 22.0], text="1"),
        new_object("obj-state-capture-gate", "gate 1 0", 650.0, 775.0,
                   65.0, 2, 1),
        new_object("obj-state-capture-delay", "delay 100", 650.0, 705.0,
                   65.0, 1, 1, ["bang"]),
        box("obj-state-get", "message", [730.0, 705.0, 58.0, 22.0],
            text="getstate"),
        new_object("obj-state-change-bang", "t b", 650.0, 740.0,
                   30.0, 1, 1, ["bang"]),
    ])
    lines = [
        line("obj-plugsync", 0, "obj-transport-pack", 0),
        line("obj-plugsync", 6, "obj-transport-pack", 1),
        line("obj-plugsync", 7, "obj-transport-pack", 2),
        line("obj-plugsync", 5, "obj-transport-pack", 3),
        line("obj-plugsync", 4, "obj-timesig", 0),
        line("obj-timesig", 0, "obj-transport-pack", 4),
        line("obj-timesig", 1, "obj-transport-pack", 5),
        line("obj-plugsync", 8, "obj-transport-pack", 6),
        line("obj-transport-pack", 0, "obj-transport", 0),
        line("obj-transport", 0, "obj-clap", 0),
        line("obj-clap", status_outlet, "obj-route-status", 0),
        line("obj-route-status", 0, "obj-latency-message", 0),
        line("obj-latency-message", 0, "obj-thispatcher", 0),
        line("obj-route-status", 1, "obj-print", 0),
        line("obj-loadbang", 0, "obj-delayed-load", 0),
        line("obj-delayed-load", 0, "obj-default-open", 0),
        line("obj-default-open", 0, "obj-clap", 0),
        line("obj-clap-state", 0, "obj-state-valid", 0),
        line("obj-state-valid", 0, "obj-state-restore", 0),
        line("obj-state-restore", 0, "obj-clap", 0),
        line("obj-device", 0, "obj-state-restore-init", 0),
        # Trigger runs right-to-left: request the restored Blob once, enable
        # capture only after that synchronous restore path returns, then take
        # a fresh snapshot. Captures never echo because pattr uses @thru 0.
        line("obj-state-restore-init", 2, "obj-clap-state", 0),
        line("obj-state-restore-init", 1, "obj-state-capture-enable", 0),
        line("obj-state-capture-enable", 0, "obj-state-capture-gate", 0),
        line("obj-state-restore-init", 0, "obj-state-change-bang", 0),
        line("obj-route-status", state_outlet, "obj-clap-state", 0),
        line("obj-route-status", 2, "obj-state-change-bang", 0),
        line("obj-route-status", 3, "obj-state-change-bang", 0),
        line("obj-route-status", statechanged_outlet,
             "obj-state-change-bang", 0),
        line("obj-state-change-bang", 0, "obj-state-capture-gate", 1),
        line("obj-state-capture-gate", 0, "obj-state-capture-delay", 0),
        line("obj-state-capture-delay", 0, "obj-state-get", 0),
        line("obj-state-get", 0, "obj-clap", 0),
    ]
    if allow_plugin_picker:
        lines.extend([
            line("obj-load-button", 0, "obj-load-trigger", 0),
            line("obj-load-trigger", 0, "obj-open", 0),
            line("obj-open", 0, "obj-clap", 0),
        ])
    lines.extend([
        line("obj-gui-button", 0, "obj-editor-trigger", 0),
        line("obj-editor-trigger", 0, "obj-editor", 0),
        line("obj-editor", 0, "obj-clap", 0),
    ])
    if enforce_stereo_input_count:
        boxes.extend([
            box(
                "obj-source-getparams",
                "message",
                [570.0, 400.0, 68.0, 22.0],
                text="getparams",
            ),
            new_object("obj-source-route-paraminfo", "route paraminfo",
                       570.0, 435.0, 94.0, 1, 2),
            new_object("obj-source-split-paraminfo", "t l l",
                       570.0, 470.0, 42.0, 1, 2, ["list", "list"]),
            new_object("obj-source-param-id", "zl.nth 2",
                       650.0, 505.0, 55.0, 2, 2, ["", "list"]),
            new_object("obj-source-input-count-name", "zl.nth 8",
                       570.0, 505.0, 55.0, 2, 2, ["", "list"]),
            new_object("obj-source-is-input-count", 'sel "Input Count"',
                       570.0, 540.0, 108.0, 2, 2, ["bang", ""]),
            new_object("obj-source-input-count-id", "i",
                       650.0, 540.0, 30.0, 2, 1, ["int"]),
            box(
                "obj-source-set-input-count",
                "message",
                [650.0, 575.0, 92.0, 22.0],
                text="paramid $1 2",
            ),
        ])
        lines.extend([
            line("obj-route-status", 2, "obj-source-getparams", 0),
            line("obj-source-getparams", 0, "obj-clap", 0),
            line("obj-clap", status_outlet, "obj-source-route-paraminfo", 0),
            line("obj-source-route-paraminfo", 0,
                 "obj-source-split-paraminfo", 0),
            # trigger outputs right-to-left, so the CLAP ID is stored before
            # the name branch tests for the exact Input Count parameter.
            line("obj-source-split-paraminfo", 1, "obj-source-param-id", 0),
            line("obj-source-param-id", 0, "obj-source-input-count-id", 1),
            line("obj-source-split-paraminfo", 0,
                 "obj-source-input-count-name", 0),
            line("obj-source-input-count-name", 0,
                 "obj-source-is-input-count", 0),
            line("obj-source-is-input-count", 0,
                 "obj-source-input-count-id", 0),
            line("obj-source-input-count-id", 0,
                 "obj-source-set-input-count", 0),
            line("obj-source-set-input-count", 0, "obj-clap", 0),
        ])
    return boxes, lines


def fit_presentation_width(
    boxes: list[dict[str, object]], minimum_width: float = 0.0,
) -> float:
    """Fit every face to its visible contents plus a consistent right margin.

    The background starts at width zero so it cannot determine its own size.
    Keep control dimensions readable; shrink unused space, not menus/buttons.
    """
    right_edge = max(
        entry["box"]["presentation_rect"][0]
        + entry["box"]["presentation_rect"][2]
        for entry in boxes
        if entry["box"].get("presentation") == 1
        and entry["box"]["id"] != "obj-ui-background"
    )
    width = max(right_edge + DEVICE_EDGE_PADDING, minimum_width)
    background = next(
        entry["box"] for entry in boxes
        if entry["box"]["id"] == "obj-ui-background"
    )
    background["presentation_rect"][2] = width
    background["patching_rect"][2] = width
    return width


def patcher(title: str, description: str, boxes: list[dict[str, object]],
            lines: list[dict[str, object]], with_route: bool,
            presentation_height: float = COMPACT_DEVICE_HEIGHT,
            *, instrument: bool = False,
            minimum_width: float = 0.0) -> dict[str, object]:
    presentation_width = fit_presentation_width(boxes, minimum_width)
    parameters: dict[str, object] = {
        "obj-clap-state": ["CLAP State", "CLAP State", 0],
        "parameterbanks": {},
        "inherited_shortname": 1,
    }
    if with_route:
        parameters["obj-chain"] = ["Route to Chain", "Chain", 0]
    return {
        "patcher": {
            "fileversion": 1,
            "appversion": {
                "major": 9,
                "minor": 0,
                "revision": 0,
                "architecture": "x64",
                "modernui": 1,
            },
            "rect": [120.0, 90.0, 760.0, 720.0],
            "openrect": [0.0, 0.0, presentation_width, presentation_height],
            "openinpresentation": 1,
            "devicewidth": presentation_width,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "editing_bgcolor": COLOR_BACKGROUND,
            "locked_bgcolor": COLOR_BACKGROUND,
            "gridonopen": 1,
            "gridsize": [15.0, 15.0],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 2,
            "toolbarvisible": 1,
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "description": description,
            "digest": description,
            "tags": "s3g CLAP Ambisonics 3OA",
            "latency": 0,
            "minimum_live_version": "12.0",
            "minimum_max_version": "8.5",
            "boxes": boxes,
            "lines": lines,
            "parameters": parameters,
            "dependency_cache": [
                {"name": "s3g.clap~.mxo", "type": "iLaX"},
                {"name": "s3g.live.thisdevice.maxpat", "type": "JSON"},
                {"name": "s3g.bus.send.maxpat", "type": "JSON"},
                {"name": "s3g.bus.insert.maxpat", "type": "JSON"},
                {"name": "s3g.bus.receive.maxpat", "type": "JSON"},
                {"name": "s3g.live.once.maxpat", "type": "JSON"},
                {"name": "s3g.live.routing.channel_selector.maxpat", "type": "JSON"},
            ],
            "autosave": 0,
            "project": {
                "version": 1,
                "autoorganize": 1,
                "hideprojectwindow": 1,
                "showdependencies": 1,
                "autolocalize": 0,
                "contents": {"patchers": {}},
                "layout": {},
                "searchpath": {},
                "detailsvisible": 0,
                "amxdtype": 1835887981 if instrument else 1633771873,
                "readonly": 0,
                "devpathtype": 0,
                "devpath": ".",
                "sortmode": 0,
            },
        }
    }


def register_fixed_parameters(
    document: dict[str, object],
    parameters: tuple[FixedParameter, ...],
) -> None:
    registry = document["patcher"]["parameters"]
    for order, parameter in enumerate(parameters, 1):
        registry[f"obj-param-{parameter.clap_id}"] = [
            parameter.name,
            parameter.short_name,
            order,
        ]


def routing_number_box(
    object_id: str,
    long_name: str,
    short_name: str,
    minimum: int,
    maximum: int,
    initial: int,
    x: float,
    width: float = 48.0,
    y: float = 61.0,
) -> dict[str, object]:
    return box(
        object_id,
        "live.numbox",
        [470.0, 95.0, width, 22.0],
        hidden=1,
        numinlets=1,
        numoutlets=2,
        outlettype=["", "float"],
        parameter_enable=1,
        activebgcolor=COLOR_CELL,
        activetextcolor=COLOR_TEXT,
        bgcolor=COLOR_CELL,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        textcolor=COLOR_VALUE,
        triangle=1,
        tricolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=9.0,
        saved_attribute_attributes={
            "valueof": {
                "parameter_longname": long_name,
                "parameter_shortname": short_name,
                "parameter_initial_enable": 1,
                "parameter_initial": [initial],
                "parameter_invisible": 0,
                "parameter_mmin": minimum,
                "parameter_mmax": maximum,
                "parameter_steps": maximum - minimum + 1,
                "parameter_modmode": 0,
                "parameter_type": 1,
                "parameter_unitstyle": 0,
            }
        },
        varname=object_id.removeprefix("obj-").replace("-", "_"),
    )


def routing_menu_controls(
    object_id: str,
    long_name: str,
    short_name: str,
    minimum: int,
    maximum: int,
    initial: int,
    x: float,
    width: float = 56.0,
    y: float = 10.0,
    *,
    labels: list[str] | None = None,
) -> list[dict[str, object]]:
    """Display a menu while retaining the existing one-based Live parameter.

    umenu indexes start at zero. Keep the saved integer carrier, including its
    scripting name/range, and translate only at the presentation boundary.
    Silent set feedback updates the menu on restore/automation without writing
    another value into Live.
    """
    labels = labels or [f"{value:02d}" for value in range(minimum, maximum + 1)]
    if len(labels) != maximum - minimum + 1:
        raise ValueError(f"{object_id}: menu labels do not match the saved range")
    items: list[str] = []
    for label in labels:
        if items:
            items.append(",")
        items.append(label)
    return [
        routing_number_box(object_id, long_name, short_name,
                           minimum, maximum, initial, x, width, y),
        box(
            f"{object_id}-menu", "umenu", [x, y, width, CONTROL_HEIGHT],
            presentation_rect=[x, y, width, CONTROL_HEIGHT],
            numinlets=1, numoutlets=3, outlettype=["int", "", ""],
            parameter_enable=0, items=items, menumode=0, arrow=1,
            allowdrag=0, applycolors=1,
            bgfillcolor=COLOR_BUTTON, textcolor=COLOR_BUTTON_TEXT,
            elementcolor=COLOR_ACCENT, fontname=UI_FONT, fontsize=UI_FONT_SIZE,
            annotation=f"Choose {long_name.lower()} from the menu.",
            annotation_name=long_name,
        ),
        new_object(f"{object_id}-menu-to-value", f"+ {minimum}",
                   1050.0, y + 30.0, 38.0, 2, 1, ["int"]),
        new_object(f"{object_id}-value-to-menu", f"- {minimum}",
                   1100.0, y + 30.0, 38.0, 2, 1, ["int"]),
        new_object(f"{object_id}-menu-set", "prepend set",
                   1150.0, y + 30.0, 78.0, 1, 1),
    ]


def routing_menu_lines(
    object_id: str, *, guarded_write: bool = False,
) -> list[dict[str, object]]:
    lines = [
        line(f"{object_id}-menu", 0, f"{object_id}-menu-to-value", 0),
        line(object_id, 0, f"{object_id}-value-to-menu", 0),
        line(f"{object_id}-value-to-menu", 0, f"{object_id}-menu-set", 0),
        line(f"{object_id}-menu-set", 0, f"{object_id}-menu", 0),
    ]
    if guarded_write:
        lines.extend([
            line(f"{object_id}-menu-to-value", 0,
                 f"{object_id}-menu-write-gate", 1),
            line(f"{object_id}-menu-write-gate", 0, object_id, 0),
        ])
    else:
        lines.append(line(f"{object_id}-menu-to-value", 0, object_id, 0))
    return lines


def bus_menu_replay_controls(
    object_id: str, init_defer: str, outputvalue_message: str,
    x: float, y: float,
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    """Re-announce a recalled bus after Live's device identity is available.

    A menu bang is intentional: manually reselecting the bus repairs a stale
    s3g bus handshake. Read the stored Live value first, then bang that menu,
    never a hard-coded default. Close the menu-to-parameter gate during this
    replay so initialization cannot take over a Live automation envelope.
    The original deferred outputvalue remains an early best-effort pass.
    """
    prefix = f"{object_id}-replay"
    gate = f"{object_id}-menu-write-gate"
    boxes = [
        new_object(gate, "gate 1 1", x, y + 90.0, 65.0, 2, 1),
        new_object(f"{prefix}-ready", "t b", x, y, 34.0, 1, 1),
        new_object(f"{prefix}-delay", "delay 100", x + 48.0, y, 75.0, 1, 1),
        new_object(f"{prefix}-order", "t b b b b", x + 140.0, y,
                   74.0, 1, 4),
        box(f"{prefix}-close", "message", [x + 230.0, y, 30.0, 22.0],
            text="0"),
        box(f"{prefix}-open", "message", [x + 270.0, y, 30.0, 22.0],
            text="1"),
    ]
    lines = [
        line(init_defer, 0, f"{prefix}-delay", 0),
        line("obj-device", 0, f"{prefix}-ready", 0),
        line(f"{prefix}-ready", 0, f"{prefix}-delay", 0),
        line(f"{prefix}-delay", 0, f"{prefix}-order", 0),
        # trigger runs right-to-left: close, read stored value, bang menu, open.
        line(f"{prefix}-order", 3, f"{prefix}-close", 0),
        line(f"{prefix}-close", 0, gate, 0),
        line(f"{prefix}-order", 2, outputvalue_message, 0),
        line(f"{prefix}-order", 1, f"{object_id}-menu", 0),
        line(f"{prefix}-order", 0, f"{prefix}-open", 0),
        line(f"{prefix}-open", 0, gate, 0),
    ]
    return boxes, lines


def multichannel_device_ui() -> list[dict[str, object]]:
    return [
        ui_panel(
            "obj-ui-background",
            [0.0, 0.0, 0.0, COMPACT_DEVICE_HEIGHT],
            COLOR_BACKGROUND,
        ),
    ]


def routing_device_patcher(
    title: str,
    description: str,
    boxes: list[dict[str, object]],
    lines: list[dict[str, object]],
    parameters: dict[str, list[object]],
) -> dict[str, object]:
    presentation_width = fit_presentation_width(boxes)
    return {
        "patcher": {
            "fileversion": 1,
            "appversion": {
                "major": 9,
                "minor": 0,
                "revision": 0,
                "architecture": "x64",
                "modernui": 1,
            },
            "rect": [120.0, 90.0, 940.0, 720.0],
            "openrect": [0.0, 0.0, presentation_width, COMPACT_DEVICE_HEIGHT],
            "openinpresentation": 1,
            "devicewidth": presentation_width,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "editing_bgcolor": COLOR_BACKGROUND,
            "locked_bgcolor": COLOR_BACKGROUND,
            "gridonopen": 1,
            "gridsize": [15.0, 15.0],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 2,
            "toolbarvisible": 1,
            "description": description,
            "digest": description,
            "tags": "s3g multichannel bus routing",
            "latency": 0,
            "minimum_live_version": "12.0",
            "minimum_max_version": "8.5",
            "boxes": boxes,
            "lines": lines,
            "parameters": {**parameters, "parameterbanks": {}},
            "dependency_cache": (
                ([{"name": "M4L.pan2~.maxpat", "type": "JSON"}]
                 if title.startswith("s3g Send Stereo to ") else [])
                + [
                    {"name": "s3g.live.thisdevice.maxpat", "type": "JSON"},
                    {"name": "s3g.bus.send.maxpat", "type": "JSON"},
                    {"name": "s3g.bus.receive.maxpat", "type": "JSON"},
                ]
            ),
            "autosave": 0,
            "project": {
                "version": 1,
                "autoorganize": 1,
                "hideprojectwindow": 1,
                "showdependencies": 1,
                "autolocalize": 0,
                "contents": {"patchers": {}},
                "layout": {},
                "searchpath": {},
                "detailsvisible": 0,
                "amxdtype": 1633771873,
                "readonly": 0,
                "devpathtype": 0,
                "devpath": ".",
                "sortmode": 0,
            },
        }
    }


def send_channel_gain(channel: int, x: float) -> dict[str, object]:
    """A separately metered mono gain for one Live stereo input channel."""
    first = channel == 1
    return box(
        "obj-send-gain" if first else "obj-send-gain-2",
        "live.gain~", [125.0 + (channel - 1) * 120.0, 220.0, 105.0, 48.0],
        presentation_rect=[x, 80.0, 100.0, 48.0],
        fontname=UI_FONT, fontsize=UI_FONT_SIZE,
        channels=1, display_range=[-70.0, 6.0], ignoreclick=0,
        lastchannelcount=0, numinlets=1, numoutlets=4,
        orientation=1, outlettype=["signal", "", "float", "list"],
        parameter_enable=1,
        coldcolor=COLOR_VALUE, warmcolor=COLOR_ACCENT,
        hotcolor=COLOR_TEXT, overloadcolor=COLOR_TEXT,
        slidercolor=COLOR_GRID, textcolor=COLOR_DIM,
        tribordercolor=COLOR_TEXT, tricolor=COLOR_ACCENT,
        trioncolor=COLOR_ACCENT,
        saved_attribute_attributes={"valueof": {
            # The first gain keeps its original Live parameter identity so
            # existing Sets recall the same value on input 1.
            "parameter_longname": (
                "Multichannel Send Gain" if first else "Send Input 2 Gain"
            ),
            "parameter_shortname": "Send Gain" if first else "Gain 2",
            "parameter_initial_enable": 1,
            "parameter_initial": [0],
            "parameter_invisible": 0,
            "parameter_mmax": 6.0,
            "parameter_mmin": -70.0,
            "parameter_modmode": 0,
            "parameter_type": 0,
            "parameter_unitstyle": 4,
        }},
        showname=0, shownumber=0,
        varname="multichannel_send_gain" if first else "send_input_2_gain",
    )


def multichannel_send_device(
    *, slot_count: int = MULTICHANNEL_SLOT_COUNT,
    bus_prefix: str = "s3g-multichannel",
    title: str = "s3g Send Stereo to 32ch Bus",
) -> dict[str, object]:
    if slot_count <= 0 or slot_count % 2:
        raise ValueError("send bus must have an even, positive slot count")
    pair_count = slot_count // 2
    live_channels = slot_count + 2
    boxes = multichannel_device_ui()
    boxes.extend([
        box(
            "obj-bus-label", "comment", [12.0, 10.0, 52.0, CONTROL_HEIGHT],
            text="SND BUS", presentation_rect=[12.0, 10.0, 52.0, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
        ),
        *routing_menu_controls("obj-bus-number", "Multichannel Bus", "Bus",
                           1, 16, 1, 70.0),
        box(
            "obj-pair-label", "comment", [138.0, 10.0, 28.0, CONTROL_HEIGHT],
            text="PAIR", presentation_rect=[138.0, 10.0, 28.0, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
        ),
        *routing_menu_controls(
            "obj-pair-number", "Destination Pair", "Pair",
            1, pair_count, 1, 170.0, width=80.0,
            labels=[f"{pair * 2 - 1:02d}/{pair * 2:02d}"
                    for pair in range(1, pair_count + 1)],
        ),
        box("obj-gain-1-label", "comment", [12.0, 44.0, 60.0, 20.0],
            text="LEVEL 1", presentation_rect=[12.0, 44.0, 60.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        box("obj-gain-2-label", "comment", [196.0, 44.0, 60.0, 20.0],
            text="LEVEL 2", presentation_rect=[196.0, 44.0, 60.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        send_channel_gain(1, 12.0),
        send_channel_gain(2, 196.0),
        box(
            "obj-gain-link", "live.text", [750.0, 220.0, 80.0, 22.0],
            presentation_rect=[116.0, 44.0, 68.0, CONTROL_HEIGHT],
            text="UNLINKED", texton="LINKED",
            automation="Unlinked", automationon="Linked",
            numinlets=1, numoutlets=2, outlettype=["", ""],
            parameter_enable=1, mode=1,
            activebgcolor=COLOR_CELL, activebgoncolor=COLOR_ACCENT,
            activetextcolor=COLOR_BUTTON_TEXT,
            activetextoncolor=COLOR_BACKGROUND,
            bgcolor=COLOR_CELL, bgoncolor=COLOR_ACCENT,
            textcolor=COLOR_BUTTON_TEXT, textoffcolor=COLOR_BUTTON_TEXT,
            bordercolor=COLOR_GRID, focusbordercolor=COLOR_ACCENT,
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, rounded=2.0,
            saved_attribute_attributes={"valueof": {
                "parameter_longname": "Send Gain Link",
                "parameter_shortname": "Link",
                "parameter_initial_enable": 1,
                "parameter_initial": [1],
                "parameter_enum": ["Unlinked", "Linked"],
                "parameter_mmax": 1,
                "parameter_modmode": 0,
                "parameter_type": 2,
            }},
            varname="send_gain_link",
        ),
        send_pan_control(1, 124.0, -50.0),
        input_mute_button(1, 12.0, "Send", 56.0),
        send_pan_control(2, 308.0, 50.0),
        input_mute_button(2, 196.0, "Send", 56.0),
        box(
            "obj-dry-mode", "live.text", [470.0, 155.0, 85.0, 22.0],
            presentation_rect=[258.0, 10.0, 76.0, CONTROL_HEIGHT],
            text="DRY KEEP", texton="BUS ONLY",
            automation="Keep", automationon="Bus Only",
            numinlets=1, numoutlets=2, outlettype=["", ""],
            parameter_enable=1, mode=1,
            activebgcolor=COLOR_CELL,
            activebgoncolor=COLOR_ACCENT,
            activetextcolor=COLOR_DIM,
            activetextoncolor=COLOR_BACKGROUND,
            bgcolor=COLOR_CELL,
            bgoncolor=COLOR_ACCENT,
            textcolor=COLOR_DIM,
            textoffcolor=COLOR_DIM,
            bordercolor=COLOR_GRID,
            focusbordercolor=COLOR_ACCENT,
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, rounded=2.0,
            saved_attribute_attributes={
                "valueof": {
                    "parameter_longname": "Dry Output",
                    "parameter_shortname": "Dry",
                    "parameter_initial_enable": 1,
                    "parameter_initial": [0],
                    "parameter_enum": ["Keep", "Bus Only"],
                    "parameter_mmax": 1,
                    "parameter_modmode": 0,
                    "parameter_type": 2,
                }
            },
            varname="dry_output",
        ),
        new_object("obj-plugin", "plugin~", 40.0, 220.0, 55.0, 2, 2,
                   ["signal", "signal"]),
        new_object("obj-dry-invert", "!- 1", 470.0, 190.0, 38.0, 1, 1),
        new_object("obj-dry-left", "*~ 1.", 40.0, 300.0, 42.0, 2, 1,
                   ["signal"]),
        new_object("obj-dry-right", "*~ 1.", 95.0, 300.0, 42.0, 2, 1,
                   ["signal"]),
        new_object("obj-input-mute-1-invert", "!- 1", 640.0, 300.0,
                   38.0, 1, 1),
        new_object("obj-input-mute-2-invert", "!- 1", 640.0, 340.0,
                   38.0, 1, 1),
        new_object("obj-input-mute-1-gain", "*~ 1.", 390.0, 300.0,
                   42.0, 2, 1, ["signal"]),
        new_object("obj-input-mute-2-gain", "*~ 1.", 445.0, 300.0,
                   42.0, 2, 1, ["signal"]),
        new_object("obj-input-panner", "M4L.pan2~", 510.0, 300.0,
                   82.0, 4, 2, ["signal", "signal"]),
        new_object("obj-gate-left", f"gate~ {pair_count} 1 @ramptime 5.",
                   165.0, 300.0, 170.0, 2, pair_count,
                   ["signal"] * pair_count),
        new_object("obj-gate-right", f"gate~ {pair_count} 1 @ramptime 5.",
                   165.0, 340.0, 170.0, 2, pair_count,
                   ["signal"] * pair_count),
        new_object(
            "obj-plugout",
            "plugout~ " + " ".join(
                str(i) for i in range(1, live_channels + 1)
            ),
            40.0, 430.0, 610.0,
            live_channels,
            live_channels,
            ["signal"] * live_channels,
        ),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 220.0,
                   125.0, 1, 1),
        new_object("obj-bus-send", f"s3g.bus.send {bus_prefix}-1",
                   470.0, 300.0, 215.0, 3, 0),
        new_object("obj-bus-symbol", f"sprintf {bus_prefix}-%ld",
                   470.0, 260.0, 180.0, 1, 1),
        box("obj-bus-mode", "message", [700.0, 300.0, 30.0, 22.0], text="0"),
        new_object("obj-init", "loadbang", 470.0, 390.0, 65.0, 1, 1,
                   ["bang"]),
        new_object("obj-init-defer", "deferlow", 470.0, 425.0, 58.0, 1, 1),
        new_object("obj-init-trigger", "t b b b b", 470.0, 460.0,
                   68.0, 1, 4, ["bang"] * 4),
        new_object("obj-channel-init-trigger", "t b b b b", 820.0, 460.0,
                   68.0, 1, 4, ["bang"] * 4),
        box("obj-bus-output", "message", [550.0, 495.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-pair-output", "message", [640.0, 495.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-dry-output", "message", [730.0, 495.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-pan-1-output", "message", [820.0, 495.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-mute-1-output", "message", [820.0, 525.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-pan-2-output", "message", [910.0, 495.0, 78.0, 22.0],
            text="outputvalue"),
        box("obj-mute-2-output", "message", [910.0, 525.0, 78.0, 22.0],
            text="outputvalue"),
        new_object("obj-gain-link-trigger", "t i i", 750.0, 265.0,
                   40.0, 1, 2),
        new_object("obj-gain-link-on", "sel 1", 750.0, 305.0,
                   42.0, 1, 2),
        new_object("obj-gain-link-1-to-2", "gate 1 0", 820.0, 305.0,
                   62.0, 2, 1),
        new_object("obj-gain-link-2-to-1", "gate 1 0", 900.0, 305.0,
                   62.0, 2, 1),
        new_object("obj-gain-1-set", "prepend set", 900.0, 345.0,
                   78.0, 1, 1),
        new_object("obj-gain-2-set", "prepend set", 820.0, 345.0,
                   78.0, 1, 1),
        box("obj-gain-1-output", "message", [750.0, 345.0, 80.0, 22.0],
            text="outputvalue"),
        new_object("obj-gain-link-init-delay", "delay 50", 1000.0, 465.0,
                   62.0, 1, 1),
        box("obj-gain-link-output", "message", [1000.0, 495.0, 80.0, 22.0],
            text="outputvalue"),
    ])
    lines = [
        line("obj-plugin", 0, "obj-dry-left", 0),
        line("obj-plugin", 1, "obj-dry-right", 0),
        line("obj-dry-left", 0, "obj-plugout", 0),
        line("obj-dry-right", 0, "obj-plugout", 1),
        line("obj-plugin", 0, "obj-send-gain", 0),
        line("obj-plugin", 1, "obj-send-gain-2", 0),
        line("obj-send-gain", 0, "obj-input-mute-1-gain", 0),
        line("obj-send-gain-2", 0, "obj-input-mute-2-gain", 0),
        line("obj-send-gain", 1, "obj-gain-link-1-to-2", 1),
        line("obj-send-gain-2", 1, "obj-gain-link-2-to-1", 1),
        line("obj-gain-link-1-to-2", 0, "obj-gain-2-set", 0),
        line("obj-gain-link-2-to-1", 0, "obj-gain-1-set", 0),
        line("obj-gain-1-set", 0, "obj-send-gain", 0),
        line("obj-gain-2-set", 0, "obj-send-gain-2", 0),
        line("obj-gain-link", 0, "obj-gain-link-trigger", 0),
        line("obj-gain-link-trigger", 1, "obj-gain-link-1-to-2", 0),
        line("obj-gain-link-trigger", 1, "obj-gain-link-2-to-1", 0),
        line("obj-gain-link-trigger", 0, "obj-gain-link-on", 0),
        line("obj-gain-link-on", 0, "obj-gain-1-output", 0),
        line("obj-gain-1-output", 0, "obj-send-gain", 0),
        line("obj-init-defer", 0, "obj-gain-link-init-delay", 0),
        line("obj-gain-link-init-delay", 0, "obj-gain-link-output", 0),
        line("obj-gain-link-output", 0, "obj-gain-link", 0),
        line("obj-input-mute-1", 0, "obj-input-mute-1-invert", 0),
        line("obj-input-mute-2", 0, "obj-input-mute-2-invert", 0),
        line("obj-input-mute-1-invert", 0, "obj-input-mute-1-gain", 1),
        line("obj-input-mute-2-invert", 0, "obj-input-mute-2-gain", 1),
        line("obj-input-mute-1-gain", 0, "obj-input-panner", 0),
        line("obj-input-pan-1", 0, "obj-input-panner", 1),
        line("obj-input-mute-2-gain", 0, "obj-input-panner", 2),
        line("obj-input-pan-2", 0, "obj-input-panner", 3),
        line("obj-input-panner", 0, "obj-gate-left", 1),
        line("obj-input-panner", 1, "obj-gate-right", 1),
        line("obj-pair-number", 0, "obj-gate-left", 0),
        line("obj-pair-number", 0, "obj-gate-right", 0),
        line("obj-dry-mode", 0, "obj-dry-invert", 0),
        line("obj-dry-invert", 0, "obj-dry-left", 1),
        line("obj-dry-invert", 0, "obj-dry-right", 1),
        line("obj-bus-number", 0, "obj-bus-symbol", 0),
        line("obj-bus-symbol", 0, "obj-bus-send", 2),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-bus-mode", 0, "obj-bus-send", 1),
        line("obj-init", 0, "obj-init-defer", 0),
        line("obj-init-defer", 0, "obj-init-trigger", 0),
        line("obj-init-defer", 0, "obj-channel-init-trigger", 0),
        line("obj-init-trigger", 3, "obj-bus-output", 0),
        line("obj-bus-output", 0, "obj-bus-number", 0),
        line("obj-init-trigger", 2, "obj-pair-output", 0),
        line("obj-pair-output", 0, "obj-pair-number", 0),
        line("obj-init-trigger", 1, "obj-dry-output", 0),
        line("obj-dry-output", 0, "obj-dry-mode", 0),
        line("obj-channel-init-trigger", 3, "obj-pan-1-output", 0),
        line("obj-pan-1-output", 0, "obj-input-pan-1", 0),
        line("obj-channel-init-trigger", 2, "obj-mute-1-output", 0),
        line("obj-mute-1-output", 0, "obj-input-mute-1", 0),
        line("obj-channel-init-trigger", 1, "obj-pan-2-output", 0),
        line("obj-pan-2-output", 0, "obj-input-pan-2", 0),
        line("obj-channel-init-trigger", 0, "obj-mute-2-output", 0),
        line("obj-mute-2-output", 0, "obj-input-mute-2", 0),
        line("obj-init-trigger", 0, "obj-bus-mode", 0),
    ]
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-bus-number", "obj-init-defer", "obj-bus-output",
        1120.0, 450.0,
    )
    boxes.extend(replay_boxes)
    lines.extend(replay_lines)
    lines.extend(routing_menu_lines("obj-bus-number", guarded_write=True))
    lines.extend(routing_menu_lines("obj-pair-number"))
    for pair_index in range(pair_count):
        lines.extend([
            line("obj-gate-left", pair_index, "obj-plugout",
                 2 + pair_index * 2),
            line("obj-gate-right", pair_index, "obj-plugout",
                 3 + pair_index * 2),
        ])
    return routing_device_patcher(
        title,
        (
            "Routes a stereo Live track into one selectable pair of a private "
            f"{slot_count}-channel s3g bus without imposing an Ambisonics format or "
            "changing the track's normal output routing."
        ),
        boxes,
        lines,
        {
            "obj-bus-number": ["Multichannel Bus", "Bus", 0],
            "obj-pair-number": ["Destination Pair", "Pair", 0],
            "obj-send-gain": ["Multichannel Send Gain", "Send Gain", 0],
            "obj-send-gain-2": ["Send Input 2 Gain", "Gain 2", 0],
            "obj-gain-link": ["Send Gain Link", "Link", 0],
            "obj-input-pan-1": ["Send Input 1 Pan", "Pan 1", 0],
            "obj-input-mute-1": ["Send Input 1 Mute", "In 1 Mute", 0],
            "obj-input-pan-2": ["Send Input 2 Pan", "Pan 2", 0],
            "obj-input-mute-2": ["Send Input 2 Mute", "In 2 Mute", 0],
            "obj-dry-mode": ["Dry Output", "Dry", 0],
        },
    )


def multichannel_bus_gain(
    slot_count: int = MULTICHANNEL_SLOT_COUNT,
) -> dict[str, object]:
    """A single linked level and meter for every bus output lane."""
    gain = panner_input_gain()
    control = gain["box"]
    control["id"] = "obj-bus-gain"
    control["channels"] = slot_count
    control["numinlets"] = slot_count
    control["numoutlets"] = slot_count + 3
    control["outlettype"] = ["signal"] * slot_count + ["", "float", "list"]
    # At 36 channels the meters consume the old 168-pixel width and crowd out
    # the draggable gain triangle. Leave a dedicated fader area on the right.
    width = 360.0 if slot_count == FIFTH_ORDER_SLOT_COUNT else 168.0
    control["patching_rect"] = [125.0, 345.0, width, 70.0]
    control["presentation_rect"] = [12.0, 60.0, width, 70.0]
    control["varname"] = "multichannel_bus_gain"
    value = control["saved_attribute_attributes"]["valueof"]
    value["parameter_longname"] = "Multichannel Bus Gain"
    value["parameter_shortname"] = "Bus Gain"
    return gain


def multichannel_to_bus_send_device(
    *,
    slot_count: int = MULTICHANNEL_SLOT_COUNT,
    bus_prefix: str = "s3g-multichannel",
    title: str = "s3g Send Multichannel to 32ch Bus",
) -> dict[str, object]:
    """Place stereo or auxiliary input lanes onto a numbered generic bus."""
    if slot_count <= 0 or slot_count + 2 > 64:
        raise ValueError("bus must leave two Live stereo channels within 64")
    live_channels = slot_count + 2
    boxes = multichannel_device_ui()
    for object_id, caption, x, width in (
        ("obj-bus-label", "SND BUS", 12.0, 52.0),
        ("obj-source-label", "INPUT", 130.0, 38.0),
        ("obj-width-label", "CH", 274.0, 23.0),
        ("obj-source-first-label", "FROM", 362.0, 36.0),
        ("obj-source-last-label", "TO", 462.0, 20.0),
        ("obj-destination-first-label", "SLOT", 546.0, 36.0),
    ):
        boxes.append(box(
            object_id, "comment", [x, 10.0, width, CONTROL_HEIGHT],
            text=caption, presentation_rect=[x, 10.0, width, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
        ))
    boxes.extend([
        *routing_menu_controls(
            "obj-bus-number", "Multichannel Bus", "Bus",
            1, 16, 1, 70.0, width=48.0,
        ),
        *routing_menu_controls(
            "obj-source-mode", "Source Input", "Input",
            1, 2, 1 if slot_count == FIFTH_ORDER_SLOT_COUNT else 2,
            172.0, width=90.0,
            labels=["STEREO 2", f"CHAIN {slot_count}"],
        ),
        *routing_menu_controls(
            "obj-channel-count", "Send Channels", "Channels",
            1, slot_count,
            2 if slot_count == FIFTH_ORDER_SLOT_COUNT else slot_count,
            302.0, width=48.0,
        ),
        *routing_menu_controls(
            "obj-source-first", "First Source Channel", "From",
            1, slot_count, 1, 402.0, width=48.0,
        ),
        *routing_menu_controls(
            "obj-destination-first", "First Bus Slot", "Slot",
            1, slot_count, 1, 588.0, width=48.0,
        ),
        box(
            "obj-source-last-display", "umenu",
            [486.0, 10.0, 48.0, CONTROL_HEIGHT],
            presentation_rect=[486.0, 10.0, 48.0, CONTROL_HEIGHT],
            numinlets=1, numoutlets=3, outlettype=["int", "", ""],
            parameter_enable=0, ignoreclick=1,
            items=[part for channel in range(1, slot_count + 1)
                   for part in (([","] if channel > 1 else [])
                                + [f"{channel:02d}"])],
            menumode=0, arrow=0, allowdrag=0, applycolors=1,
            bgfillcolor=COLOR_BUTTON, textcolor=COLOR_BUTTON_TEXT,
            elementcolor=COLOR_ACCENT, fontname=UI_FONT,
            fontsize=UI_FONT_SIZE,
            annotation=f"Calculated last source channel; wraps after {slot_count}.",
            annotation_name="Last Source Channel",
        ),
        new_object("obj-source-last-values",
                   f"pak 1 {2 if slot_count == FIFTH_ORDER_SLOT_COUNT else slot_count}",
                   1260.0, 260.0,
                   65.0, 2, 1),
        new_object("obj-source-last-calculate",
                   f"expr ($i1 + $i2 - 2) % {slot_count}",
                   1340.0, 260.0, 225.0, 2, 1),
        new_object("obj-source-last-set", "prepend set",
                   1575.0, 260.0, 90.0, 1, 1),
        multichannel_bus_gain(slot_count),
        box(
            "obj-dry-mode", "live.text", [470.0, 155.0, 85.0, 22.0],
            presentation_rect=[405.0 if slot_count == FIFTH_ORDER_SLOT_COUNT
                               else 195.0, 60.0, 84.0, CONTROL_HEIGHT],
            text="DRY KEEP", texton="BUS ONLY",
            automation="Keep", automationon="Bus Only",
            numinlets=1, numoutlets=2, outlettype=["", ""],
            parameter_enable=1, mode=1,
            activebgcolor=COLOR_CELL, activebgoncolor=COLOR_ACCENT,
            activetextcolor=COLOR_DIM,
            activetextoncolor=COLOR_BACKGROUND,
            bgcolor=COLOR_CELL, bgoncolor=COLOR_ACCENT,
            textcolor=COLOR_DIM, textoffcolor=COLOR_DIM,
            bordercolor=COLOR_GRID, focusbordercolor=COLOR_ACCENT,
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, rounded=2.0,
            saved_attribute_attributes={"valueof": {
                "parameter_longname": "Dry Output",
                "parameter_shortname": "Dry",
                "parameter_initial_enable": 1,
                "parameter_initial": [0],
                "parameter_enum": ["Keep", "Bus Only"],
                "parameter_mmax": 1,
                "parameter_modmode": 0,
                "parameter_type": 2,
            }},
            varname="dry_output",
        ),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, live_channels + 1)
        ), 40.0, 220.0, 610.0, live_channels,
                   live_channels, ["signal"] * live_channels),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, live_channels + 1)
        ), 40.0, 430.0, 610.0, live_channels,
                   live_channels, ["signal"] * live_channels),
        new_object("obj-route-matrix",
                   f"matrix~ {live_channels} {slot_count} 1. @ramp 5.",
                   125.0, 300.0, 220.0, live_channels, slot_count + 1,
                   ["signal"] * slot_count + ["list"]),
        # Live restores the four saved controls independently. Seed pak with
        # their valid defaults so an early rebuild cannot address matrix~
        # outlet -1 while the destination SLOT is still uninitialized.
        new_object("obj-route-values",
                   f"pak {1 if slot_count == FIFTH_ORDER_SLOT_COUNT else 2} "
                   f"{2 if slot_count == FIFTH_ORDER_SLOT_COUNT else slot_count} 1 1",
                   720.0, 300.0,
                   110.0, 4, 1),
        new_object("obj-route-order", "t b l", 840.0, 300.0,
                   50.0, 1, 2),
        new_object("obj-route-unpack", "unpack i i i i", 900.0, 300.0,
                   130.0, 1, 4),
        new_object("obj-route-rebuild", "t b b", 840.0, 340.0,
                   50.0, 1, 2),
        box("obj-route-clear", "message", [900.0, 340.0, 46.0, 22.0],
            text="clear"),
        new_object("obj-route-iterate", f"uzi {slot_count}", 840.0, 380.0,
                   65.0, 2, 3, ["bang", "bang", "int"]),
        new_object("obj-route-index", "t i i", 920.0, 380.0,
                   42.0, 1, 2),
        # Max expr has no if() function. A zero/one validity mask selects
        # stereo inputs 1-2 or auxiliary inputs 3-(slot_count+2); invalid
        # source rows emit -1 and are dropped by obj-route-source-valid.
        new_object("obj-route-source",
                   "expr (($i1 <= $i3) && (($i2 == 2) || "
                   "(($i2 == 1) && ($i1 <= 2)))) * "
                   "((($i2 == 1) * ($i1 - 1)) + "
                   f"(($i2 == 2) * ((($i4 + $i1 - 2) % {slot_count}) + 2)) + 1) - 1",
                   980.0, 380.0, 400.0, 4, 1),
        new_object("obj-route-destination",
                   f"expr ($i1 + $i2 - 2) % {slot_count}",
                   980.0, 420.0, 225.0, 2, 1),
        new_object("obj-route-source-valid",
                   f"split 0 {live_channels - 1}", 1400.0, 380.0,
                   72.0, 1, 2),
        new_object("obj-route-cell", "pack i i 1.", 1490.0, 380.0,
                   90.0, 3, 1),
        new_object("obj-dry-invert", "!- 1", 470.0, 190.0,
                   38.0, 1, 1),
        new_object("obj-dry-left", "*~ 1.", 40.0, 380.0,
                   42.0, 2, 1, ["signal"]),
        new_object("obj-dry-right", "*~ 1.", 95.0, 380.0,
                   42.0, 2, 1, ["signal"]),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 220.0,
                   125.0, 1, 1),
        new_object("obj-bus-send", f"s3g.bus.send {bus_prefix}-1",
                   470.0, 300.0, 215.0, 3, 0),
        new_object("obj-bus-symbol", f"sprintf {bus_prefix}-%ld",
                   470.0, 260.0, 180.0, 1, 1),
        box("obj-bus-mode", "message", [700.0, 300.0, 30.0, 22.0], text="0"),
        new_object("obj-init", "loadbang", 470.0, 390.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-init-defer", "deferlow", 470.0, 425.0,
                   58.0, 1, 1),
        new_object("obj-init-trigger", "t b b b b b b", 470.0, 460.0,
                   110.0, 1, 6, ["bang"] * 6),
        *(
            box(object_id, "message", [590.0 + index * 95.0, 495.0,
                                       78.0, 22.0], text="outputvalue")
            for index, object_id in enumerate((
                "obj-bus-output", "obj-source-output", "obj-width-output",
                "obj-source-first-output", "obj-destination-first-output",
                "obj-dry-output",
            ))
        ),
    ])
    lines = [
        line("obj-plugin", 0, "obj-dry-left", 0),
        line("obj-plugin", 1, "obj-dry-right", 0),
        line("obj-dry-mode", 0, "obj-dry-invert", 0),
        line("obj-dry-invert", 0, "obj-dry-left", 1),
        line("obj-dry-invert", 0, "obj-dry-right", 1),
        line("obj-dry-left", 0, "obj-plugout", 0),
        line("obj-dry-right", 0, "obj-plugout", 1),
        line("obj-source-mode", 0, "obj-route-values", 0),
        line("obj-channel-count", 0, "obj-route-values", 1),
        line("obj-source-first", 0, "obj-route-values", 2),
        line("obj-destination-first", 0, "obj-route-values", 3),
        line("obj-source-first", 0, "obj-source-last-values", 0),
        line("obj-channel-count", 0, "obj-source-last-values", 1),
        line("obj-source-last-values", 0, "obj-source-last-calculate", 0),
        line("obj-source-last-calculate", 0, "obj-source-last-set", 0),
        line("obj-source-last-set", 0, "obj-source-last-display", 0),
        line("obj-route-values", 0, "obj-route-order", 0),
        line("obj-route-order", 1, "obj-route-unpack", 0),
        line("obj-route-order", 0, "obj-route-rebuild", 0),
        line("obj-route-unpack", 0, "obj-route-source", 1),
        line("obj-route-unpack", 1, "obj-route-source", 2),
        line("obj-route-unpack", 2, "obj-route-source", 3),
        line("obj-route-unpack", 3, "obj-route-destination", 1),
        line("obj-route-rebuild", 1, "obj-route-clear", 0),
        line("obj-route-clear", 0, "obj-route-matrix", 0),
        line("obj-route-rebuild", 0, "obj-route-iterate", 0),
        line("obj-route-iterate", 2, "obj-route-index", 0),
        line("obj-route-index", 1, "obj-route-destination", 0),
        line("obj-route-index", 0, "obj-route-source", 0),
        line("obj-route-destination", 0, "obj-route-cell", 1),
        line("obj-route-source", 0, "obj-route-source-valid", 0),
        line("obj-route-source-valid", 0, "obj-route-cell", 0),
        line("obj-route-cell", 0, "obj-route-matrix", 0),
        line("obj-bus-number", 0, "obj-bus-symbol", 0),
        line("obj-bus-symbol", 0, "obj-bus-send", 2),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-bus-mode", 0, "obj-bus-send", 1),
        line("obj-init", 0, "obj-bus-mode", 0),
        line("obj-init", 0, "obj-init-defer", 0),
        line("obj-init-defer", 0, "obj-init-trigger", 0),
    ]
    for output_index, object_id, parameter_id in (
        (5, "obj-bus-output", "obj-bus-number"),
        (4, "obj-source-output", "obj-source-mode"),
        (3, "obj-width-output", "obj-channel-count"),
        (2, "obj-source-first-output", "obj-source-first"),
        (1, "obj-destination-first-output", "obj-destination-first"),
        (0, "obj-dry-output", "obj-dry-mode"),
    ):
        lines.extend([
            line("obj-init-trigger", output_index, object_id, 0),
            line(object_id, 0, parameter_id, 0),
        ])
    for channel in range(live_channels):
        lines.append(line("obj-plugin", channel, "obj-route-matrix", channel))
    for channel in range(slot_count):
        lines.append(line("obj-route-matrix", channel, "obj-bus-gain", channel))
        lines.append(line("obj-bus-gain", channel, "obj-plugout", channel + 2))
    if slot_count == FIFTH_ORDER_SLOT_COUNT:
        # A preceding Ambi wrapper's fixed NEXT/insert route needs this
        # endpoint to announce itself as a same-track insert destination.
        boxes.append(new_object("obj-bus-insert", "s3g.bus.insert",
                                740.0, 300.0, 95.0, 1, 0))
        lines.append(line("obj-device", 0, "obj-bus-insert", 0))
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-bus-number", "obj-init-defer", "obj-bus-output",
        1120.0, 450.0,
    )
    boxes.extend(replay_boxes)
    lines.extend(replay_lines)
    lines.extend(routing_menu_lines("obj-bus-number", guarded_write=True))
    for object_id in (
        "obj-source-mode", "obj-channel-count", "obj-source-first",
        "obj-destination-first",
    ):
        lines.extend(routing_menu_lines(object_id))
    if slot_count == FIFTH_ORDER_SLOT_COUNT:
        # Keep the 36-channel insert announcement and bus handshake ordered
        # independently of where their boxes are placed in the debug view.
        boxes.append(new_object(
            "obj-device-startup-trigger", "t l l l", 800.0, 1310.0,
            60.0, 1, 3, ["list", "list", "list"],
        ))
        boxes.extend([
            new_object("obj-width-fanout-trigger", "t i i i", 1400.0,
                       280.0, 58.0, 1, 3, ["int"] * 3),
            new_object("obj-from-fanout-trigger", "t i i i", 1400.0,
                       370.0, 58.0, 1, 3, ["int"] * 3),
        ])
        controlled = {
            ("obj-device", 0): {
                "obj-bus-number-replay-ready", "obj-bus-insert", "obj-bus-send",
            },
            ("obj-channel-count", 0): {
                "obj-source-last-values", "obj-channel-count-value-to-menu",
                "obj-route-values",
            },
            ("obj-source-first", 0): {
                "obj-source-last-values", "obj-source-first-value-to-menu",
                "obj-route-values",
            },
        }
        lines = [
            entry for entry in lines
            if entry["patchline"]["destination"][0] not in controlled.get(
                tuple(entry["patchline"]["source"]), set(),
            )
        ]
        lines.extend([
            line("obj-device", 0, "obj-device-startup-trigger", 0),
            line("obj-device-startup-trigger", 2, "obj-bus-number-replay-ready", 0),
            line("obj-device-startup-trigger", 1, "obj-bus-insert", 0),
            line("obj-device-startup-trigger", 0, "obj-bus-send", 0),
            line("obj-channel-count", 0, "obj-width-fanout-trigger", 0),
            line("obj-width-fanout-trigger", 2, "obj-source-last-values", 1),
            line("obj-width-fanout-trigger", 1, "obj-channel-count-value-to-menu", 0),
            line("obj-width-fanout-trigger", 0, "obj-route-values", 1),
            line("obj-source-first", 0, "obj-from-fanout-trigger", 0),
            line("obj-from-fanout-trigger", 2, "obj-source-last-values", 0),
            line("obj-from-fanout-trigger", 1, "obj-source-first-value-to-menu", 0),
            line("obj-from-fanout-trigger", 0, "obj-route-values", 2),
        ])
    return routing_device_patcher(
        title,
        f"Maps Live stereo or up to {slot_count} auxiliary chain channels onto "
        f"the private {slot_count}-channel bus. TO displays FROM plus CH minus "
        f"one with {slot_count}-channel wrap; SLOT selects the first destination bus slot. "
        "STEREO supplies at most two channels. Stereo dry output "
        "can be kept or muted independently of the bus send.",
        boxes, lines,
        {
            "obj-bus-number": ["Multichannel Bus", "Bus", 0],
            "obj-source-mode": ["Source Input", "Input", 0],
            "obj-channel-count": ["Send Channels", "Channels", 0],
            "obj-source-first": ["First Source Channel", "From", 0],
            "obj-destination-first": ["First Bus Slot", "Slot", 0],
            "obj-bus-gain": ["Multichannel Bus Gain", "Bus Gain", 0],
            "obj-dry-mode": ["Dry Output", "Dry", 0],
        },
    )


def multichannel_receive_device(
    *,
    slot_count: int = MULTICHANNEL_SLOT_COUNT,
    bus_prefix: str = "s3g-multichannel",
    title: str = "s3g Multichannel Receive",
) -> dict[str, object]:
    if slot_count <= 0 or slot_count + 2 > 64:
        raise ValueError("bus must leave two Live stereo channels within 64")
    live_channels = slot_count + 2
    boxes = multichannel_device_ui()
    boxes.extend([
        box(
            "obj-bus-label", "comment", [12.0, 10.0, 28.0, CONTROL_HEIGHT],
            text="BUS", presentation_rect=[12.0, 10.0, 28.0, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
        ),
        *routing_menu_controls("obj-bus-number", "Multichannel Bus", "Bus",
                           1, 16, 1, 44.0),
        new_object(
            "obj-plugin",
            "plugin~ " + " ".join(
                str(i) for i in range(1, live_channels + 1)
            ),
            40.0, 220.0, 610.0,
            live_channels, live_channels, ["signal"] * live_channels,
        ),
        new_object(
            "obj-plugout",
            "plugout~ " + " ".join(
                str(i) for i in range(1, live_channels + 1)
            ),
            40.0, 300.0, 610.0,
            live_channels, live_channels, ["signal"] * live_channels,
        ),
        new_object("obj-device", "s3g.live.thisdevice", 700.0, 220.0,
                   125.0, 1, 1),
        new_object("obj-bus-receive", f"s3g.bus.receive {bus_prefix}-1",
                   700.0, 300.0, 225.0, 2, 1),
        new_object("obj-chain-send", f"s3g.bus.send {bus_prefix}-chain",
                   700.0, 340.0, 245.0, 3, 0),
        box("obj-chain-mode", "message", [700.0, 375.0, 30.0, 22.0],
            text="1"),
        new_object("obj-bus-symbol", f"sprintf {bus_prefix}-%ld",
                   700.0, 260.0, 180.0, 1, 1),
        new_object("obj-init", "loadbang", 700.0, 390.0, 65.0, 1, 1,
                   ["bang"]),
        new_object("obj-init-defer", "deferlow", 700.0, 425.0, 58.0, 1, 1),
        new_object("obj-init-trigger", "t b b", 700.0, 460.0,
                   42.0, 1, 2, ["bang", "bang"]),
        box("obj-bus-output", "message", [770.0, 425.0, 78.0, 22.0],
            text="outputvalue"),
    ])
    if slot_count == FIFTH_ORDER_SLOT_COUNT:
        pair_count = slot_count // 2
        boxes.extend([
            box("obj-monitor-label", "comment",
                [130.0, 10.0, 42.0, CONTROL_HEIGHT], text="MON",
                presentation_rect=[130.0, 10.0, 42.0, CONTROL_HEIGHT],
                fontname=UI_FONT, fontsize=UI_FONT_SIZE,
                textcolor=COLOR_DIM),
            *routing_menu_controls(
                "obj-monitor-pair", "Bus Monitor Pair", "Monitor",
                0, pair_count, 0, 175.0, width=80.0,
                labels=["OFF"] + [
                    f"{pair * 2 - 1:02d}/{pair * 2:02d}"
                    for pair in range(1, pair_count + 1)
                ],
            ),
            new_object("obj-monitor-left",
                       f"selector~ {pair_count} @ramptime 5.",
                       40.0, 340.0, 120.0, pair_count + 1, 1, ["signal"]),
            new_object("obj-monitor-right",
                       f"selector~ {pair_count} @ramptime 5.",
                       180.0, 340.0, 120.0, pair_count + 1, 1, ["signal"]),
            box("obj-monitor-output", "message",
                [850.0, 425.0, 78.0, 22.0], text="outputvalue"),
            # A restored Live Set can report this_device before its track is
            # traversable. Re-query the path until the receiver resolves a
            # track name; the receiver outlet stops the retry immediately.
            # live.path's notification outlet also catches an id 0 -> valid
            # transition without waiting for another timer tick.
            new_object("obj-identity-start", "t b b", 990.0, 330.0,
                       48.0, 1, 2, ["bang", "bang"]),
            new_object("obj-identity-retry", "delay 500", 990.0, 370.0,
                       78.0, 1, 1, ["bang"]),
            new_object("obj-identity-tick", "t b b", 990.0, 410.0,
                       48.0, 1, 2, ["bang", "bang"]),
            box("obj-identity-query", "message",
                [990.0, 450.0, 110.0, 22.0], text="goto this_device"),
            new_object("obj-identity-path", "live.path", 990.0, 490.0,
                       68.0, 1, 3, ["", "", ""]),
            new_object("obj-identity-defer", "deferlow", 990.0, 530.0,
                       68.0, 1, 1),
            new_object("obj-identity-route", "route id", 990.0, 570.0,
                       68.0, 1, 2),
            new_object("obj-identity-valid", "split 1 2147483647",
                       990.0, 610.0, 130.0, 1, 2, ["int", "int"]),
            new_object("obj-identity-attach", "prepend id", 990.0, 650.0,
                       82.0, 1, 1),
            new_object("obj-identity-to-buses", "t l l", 990.0, 690.0,
                       45.0, 1, 2, ["list", "list"]),
            # s3g.bus.send's insert branch needs its device ID before mode 1
            # retriggers its stored auxiliary-output routing. The loadbang
            # mode message alone can run too early during Set restoration.
            new_object("obj-chain-start-trigger", "t b l", 1110.0, 690.0,
                       50.0, 1, 2, ["bang", "list"]),
            box("obj-identity-stop", "message",
                [1120.0, 730.0, 42.0, 22.0], text="stop"),
        ])
    lines = [
        line("obj-device", 0, "obj-bus-receive", 0),
        line("obj-device", 0, "obj-chain-send", 0),
        line("obj-chain-mode", 0, "obj-chain-send", 1),
        line("obj-bus-number", 0, "obj-bus-symbol", 0),
        line("obj-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-init", 0, "obj-init-defer", 0),
        line("obj-init-defer", 0, "obj-init-trigger", 0),
        line("obj-init-trigger", 1, "obj-bus-output", 0),
        line("obj-init-trigger", 0, "obj-chain-mode", 0),
        line("obj-bus-output", 0, "obj-bus-number", 0),
    ]
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-bus-number", "obj-init-defer", "obj-bus-output",
        990.0, 450.0,
    )
    boxes.extend(replay_boxes)
    lines.extend(replay_lines)
    lines.extend(routing_menu_lines("obj-bus-number", guarded_write=True))
    if slot_count == FIFTH_ORDER_SLOT_COUNT:
        lines.extend([
            line("obj-monitor-pair", 0, "obj-monitor-left", 0),
            line("obj-monitor-pair", 0, "obj-monitor-right", 0),
            line("obj-init-defer", 0, "obj-monitor-output", 0),
            line("obj-monitor-output", 0, "obj-monitor-pair", 0),
            line("obj-monitor-left", 0, "obj-plugout", 0),
            line("obj-monitor-right", 0, "obj-plugout", 1),
        ])
        for pair in range(slot_count // 2):
            lines.extend([
                line("obj-plugin", 2 + pair * 2,
                     "obj-monitor-left", pair + 1),
                line("obj-plugin", 3 + pair * 2,
                     "obj-monitor-right", pair + 1),
        ])
        lines.extend(routing_menu_lines("obj-monitor-pair"))
        lines = [
            entry for entry in lines
            if not (
                tuple(entry["patchline"]["source"]) == ("obj-device", 0)
                and entry["patchline"]["destination"][0]
                in {"obj-bus-receive", "obj-chain-send"}
            )
        ]
        lines.extend([
            line("obj-device", 0, "obj-identity-start", 0),
            # trigger outlets fire right-to-left: arm the retry before the
            # first path lookup, and likewise on each retry tick.
            line("obj-identity-start", 1, "obj-identity-retry", 0),
            line("obj-identity-start", 0, "obj-identity-query", 0),
            line("obj-identity-retry", 0, "obj-identity-tick", 0),
            line("obj-identity-tick", 1, "obj-identity-retry", 0),
            line("obj-identity-tick", 0, "obj-identity-query", 0),
            line("obj-identity-query", 0, "obj-identity-path", 0),
            line("obj-identity-path", 1, "obj-identity-defer", 0),
            line("obj-identity-defer", 0, "obj-identity-route", 0),
            line("obj-identity-route", 0, "obj-identity-valid", 0),
            line("obj-identity-valid", 0, "obj-identity-attach", 0),
            line("obj-identity-attach", 0, "obj-identity-to-buses", 0),
            line("obj-identity-to-buses", 1, "obj-bus-receive", 0),
            line("obj-identity-to-buses", 0, "obj-chain-start-trigger", 0),
            line("obj-chain-start-trigger", 1, "obj-chain-send", 0),
            line("obj-chain-start-trigger", 0, "obj-chain-mode", 0),
            line("obj-bus-receive", 0, "obj-identity-stop", 0),
            line("obj-identity-stop", 0, "obj-identity-retry", 0),
        ])
    lines.extend(
        line("obj-plugin", slot + 2, "obj-plugout", slot + 2)
        for slot in range(slot_count)
    )
    return routing_device_patcher(
        title,
        (
            "Receives and sums a private 32-channel s3g bus, blocks Live's "
            "ordinary stereo lane, then exposes only the bus slots to the "
            "next multichannel device without assigning a signal format."
            if slot_count == MULTICHANNEL_SLOT_COUNT else
            "Receives and sums a private 36-channel s3g bus, blocks Live's "
            "ordinary stereo input, and exposes the bus slots to the next "
            "multichannel device without assigning a signal format. A "
            "selected pair can be monitored on Live stereo output; the "
            "monitor defaults to OFF."
        ),
        boxes,
        lines,
        {
            "obj-bus-number": ["Multichannel Bus", "Bus", 0],
            **({"obj-monitor-pair": ["Bus Monitor Pair", "Monitor", 0]}
               if slot_count == FIFTH_ORDER_SLOT_COUNT else {}),
        },
    )


def source_device() -> dict[str, object]:
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT)
    boxes.extend(source_input_monitor_ui())
    boxes.extend(
        [
            new_object("obj-plugin", "plugin~", 40.0, 180.0, 55.0, 2, 2,
                       ["signal", "signal"]),
            new_object("obj-input-mute-1-invert", "!- 1", 410.0, 370.0,
                       38.0, 1, 1),
            new_object("obj-input-mute-2-invert", "!- 1", 410.0, 410.0,
                       38.0, 1, 1),
            new_object("obj-input-mute-1-gain", "*~ 1.", 125.0, 270.0,
                       42.0, 2, 1, ["signal"]),
            new_object("obj-input-mute-2-gain", "*~ 1.", 185.0, 270.0,
                       42.0, 2, 1, ["signal"]),
            clap_box("s3g.clap~ 2 16", 125.0, 300.0, 2, 16),
            new_object("obj-plugout", "plugout~ " + " ".join(str(i) for i in range(1, 19)),
                       40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
            new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0, 125.0, 1, 1),
            new_object("obj-bus-send", "s3g.bus.send master", 470.0, 230.0, 125.0, 3, 0),
        ]
    )
    runtime_boxes, runtime_lines = common_runtime(
        16, "s3g Ambi Encoder Medium 16", enforce_stereo_input_count=True
    )
    boxes.extend(runtime_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-plugin", 0, "obj-input-meter", 0),
        line("obj-plugin", 1, "obj-input-meter", 1),
        line("obj-input-meter", 0, "obj-input-mute-1-gain", 0),
        line("obj-input-meter", 1, "obj-input-mute-2-gain", 0),
        line("obj-input-mute-1", 0, "obj-input-mute-1-invert", 0),
        line("obj-input-mute-2", 0, "obj-input-mute-2-invert", 0),
        line("obj-input-mute-1-invert", 0, "obj-input-mute-1-gain", 1),
        line("obj-input-mute-2-invert", 0, "obj-input-mute-2-gain", 1),
        line("obj-input-mute-1-gain", 0, "obj-clap", 0),
        line("obj-input-mute-2-gain", 0, "obj-clap", 1),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    document = patcher(
        "s3g 3OA Source",
        "Hosts a stereo-to-3OA s3g CLAP encoder in the private s3g 18-channel chain/bus layout.",
        boxes,
        lines,
        True,
    )
    document["patcher"]["parameters"].update({
        "obj-input-meter": ["Source Input Gain", "Input Gain", 0],
        "obj-input-mute-1": ["Input 1 Mute", "In 1 Mute", 0],
        "obj-input-mute-2": ["Input 2 Mute", "In 2 Mute", 0],
    })
    return document


def path_encoder_device(
    name: str = "s3g 3OA Encoder Path",
    plugin_name: str = "s3g Ambi Encoder Path 64",
    plugin_id: str = "org.s3g.s3g-dsp.ambi-path-encoder-64",
    parameters: tuple[FixedParameter, ...] = PATH_PARAMETERS,
    order_id: int = 2,
) -> dict[str, object]:
    # Contract for every fixed encoder wrapper whose CLAP exposes at least 32
    # physical inputs: the wrapper directly receives a selected private bus,
    # Live's stereo lane is ignored, bus slots 1-32 map one-to-one to CLAP
    # inputs 1-32, and only the encoded HOA output is published. The validator
    # enforces this mapping for every >2-input host.
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT, allow_plugin_picker=False)
    # The receive direction is explicit on the face; give its label and menu
    # room without changing the shared Source/Insert toolbar geometry.
    next(entry["box"] for entry in boxes if entry["box"]["id"] == "obj-chain")[
        "presentation_rect"
    ] = [198.0, 10.0, 76.0, CONTROL_HEIGHT]
    boxes.extend(multichannel_encoder_input_ui())
    boxes.extend([
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 180.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
            MULTICHANNEL_LIVE_CHANNELS,
            ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        clap_box(
            f"s3g.clap~ {MULTICHANNEL_SLOT_COUNT} 16",
            125.0, 300.0, MULTICHANNEL_SLOT_COUNT, 16,
        ),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-receive",
                   "s3g.bus.receive s3g-multichannel-1",
                   470.0, 215.0, 225.0, 2, 1),
        new_object("obj-input-bus-symbol", "sprintf s3g-multichannel-%ld",
                   470.0, 250.0, 180.0, 1, 1),
        new_object("obj-input-bus-init", "loadbang", 680.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-input-bus-init-defer", "deferlow", 680.0, 250.0,
                   58.0, 1, 1),
        box("obj-input-bus-output", "message",
            [680.0, 285.0, 78.0, 22.0], text="outputvalue"),
        new_object("obj-bus-send", "s3g.bus.send master", 470.0, 260.0,
                   125.0, 3, 0),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        16,
        plugin_name,
        allow_plugin_picker=False,
        fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters,
        ((order_id, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-device", 0, "obj-bus-receive", 0),
        line("obj-input-bus-number", 0, "obj-input-bus-symbol", 0),
        line("obj-input-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-input-bus-init", 0, "obj-input-bus-init-defer", 0),
        line("obj-input-bus-init-defer", 0, "obj-input-bus-output", 0),
        line("obj-input-bus-output", 0, "obj-input-bus-number", 0),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-clap", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-input-bus-number", "obj-input-bus-init-defer",
        "obj-input-bus-output", 780.0, 335.0,
    )
    boxes.extend(replay_boxes)
    lines.extend(replay_lines)
    lines.extend(routing_menu_lines("obj-input-bus-number", guarded_write=True))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    description = (
        "Fixed Path 64 encoder wrapper: directly receives one selected "
        if name == "s3g 3OA Encoder Path" else
        f"Fixed {plugin_name} wrapper: directly receives one selected "
    ) + (
        "private 32-channel bus, maps its slots to 32 CLAP inputs, blocks "
        "Live stereo, fixes third-order ACN/SN3D output, exposes stable "
        "parameters, and publishes to master."
    )
    document = patcher(
        name,
        description,
        boxes,
        lines,
        True,
    )
    document["patcher"]["parameters"]["obj-input-bus-number"] = [
        "Multichannel Input Bus", "Input Bus", 0,
    ]
    register_fixed_parameters(document, parameters)
    return document


def track_input_encoder_device(
    name: str,
    plugin_name: str,
    plugin_id: str,
    input_channels: int,
    parameters: tuple[FixedParameter, ...],
    *,
    midi_input: bool = False,
    topology: tuple[tuple[int, float], ...] | None = None,
) -> dict[str, object]:
    """Fixed third-order encoder fed by Live's ordinary mono/stereo lane."""
    assert input_channels in (1, 2)
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT, allow_plugin_picker=False)
    # The familiar Source input gain and mute stay on the wrapper face. For a
    # mono CLAP, only Live channel 1 is processed; channel 2 stays in the dry
    # stereo chain and cannot accidentally be mixed into the mono input.
    input_ui = source_input_monitor_ui(plugin_name)
    if input_channels == 1:
        input_ui = [entry for entry in input_ui
                    if entry["box"]["id"] != "obj-input-mute-2"]
        meter = next(entry["box"] for entry in input_ui
                     if entry["box"]["id"] == "obj-input-meter")
        meter.update(channels=1, numinlets=1, numoutlets=4,
                     outlettype=["signal", "", "float", "list"])
    boxes.extend(input_ui)
    boxes.extend([
        new_object("obj-plugin", "plugin~", 40.0, 180.0, 55.0,
                   2, 2, ["signal", "signal"]),
        new_object("obj-input-mute-1-invert", "!- 1", 410.0, 370.0,
                   38.0, 1, 1),
        new_object("obj-input-mute-1-gain", "*~ 1.", 125.0, 270.0,
                   42.0, 2, 1, ["signal"]),
        clap_box(f"s3g.clap~ {input_channels} 16", 125.0, 300.0,
                 input_channels, 16),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-send", "s3g.bus.send master", 470.0, 230.0,
                   125.0, 3, 0),
    ])
    if input_channels == 2:
        boxes.extend([
            new_object("obj-input-mute-2-invert", "!- 1", 410.0, 410.0,
                       38.0, 1, 1),
            new_object("obj-input-mute-2-gain", "*~ 1.", 185.0, 270.0,
                       42.0, 2, 1, ["signal"]),
        ])
    runtime_boxes, runtime_lines = common_runtime(
        16, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters,
        topology if topology is not None else
        ((3 if input_channels == 2 else 1, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-plugin", 0, "obj-input-meter", 0),
        line("obj-input-meter", 0, "obj-input-mute-1-gain", 0),
        line("obj-input-mute-1", 0, "obj-input-mute-1-invert", 0),
        line("obj-input-mute-1-invert", 0, "obj-input-mute-1-gain", 1),
        line("obj-input-mute-1-gain", 0, "obj-clap", 0),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    if input_channels == 2:
        lines.extend([
            line("obj-plugin", 1, "obj-input-meter", 1),
            line("obj-input-meter", 1, "obj-input-mute-2-gain", 0),
            line("obj-input-mute-2", 0, "obj-input-mute-2-invert", 0),
            line("obj-input-mute-2-invert", 0, "obj-input-mute-2-gain", 1),
            line("obj-input-mute-2-gain", 0, "obj-clap", 1),
        ])
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    if midi_input:
        midi_boxes, midi_lines = midi_input_bridge()
        boxes.extend(midi_boxes)
        lines.extend(midi_lines)
    document = patcher(
        name,
        f"Fixed {plugin_name} wrapper: Live {input_channels}-channel input "
        + ("and routed MIDI feed a third-order ACN/SN3D encoder and "
           "publish to the private " if midi_input else
           "feeds a third-order ACN/SN3D encoder and publishes to the private ")
        + "3OA main bus or the next s3g device.",
        boxes, lines, True,
    )
    document["patcher"]["parameters"].update({
        "obj-input-meter": [f"{plugin_name} Input Gain", "Input Gain", 0],
        "obj-input-mute-1": ["Input 1 Mute", "In 1 Mute", 0],
    })
    if input_channels == 2:
        document["patcher"]["parameters"]["obj-input-mute-2"] = [
            "Input 2 Mute", "In 2 Mute", 0,
        ]
    register_fixed_parameters(document, parameters)
    return document


def instrument_encoder_device(
    name: str,
    plugin_name: str,
    plugin_id: str,
    parameters: tuple[FixedParameter, ...],
    order_id: int,
    midi_input: bool,
    topology: tuple[tuple[int, float], ...] = (),
) -> dict[str, object]:
    """Zero-audio-input 3OA generator, placed on a Live MIDI track."""
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT, allow_plugin_picker=False)
    boxes.extend([
        clap_box("s3g.clap~ 0 16", 125.0, 300.0, 0, 16),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-send", "s3g.bus.send master", 470.0, 230.0,
                   125.0, 3, 0),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        16, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters, ((order_id, 3), *topology),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    if midi_input:
        midi_boxes, midi_lines = midi_input_bridge()
        boxes.extend(midi_boxes)
        lines.extend(midi_lines)
    document = patcher(
        name,
        f"Fixed {plugin_name} Max Instrument: "
        + ("track MIDI controls the generator; " if midi_input else
           "autonomous generator (no CLAP MIDI note port); ")
        + "third-order ACN/SN3D channels publish to the private 3OA "
        "main bus or the next s3g device.",
        boxes, lines, True, instrument=True,
    )
    register_fixed_parameters(document, parameters)
    return document


def drum_instrument_device(
    name: str, plugin_name: str, plugin_id: str,
    parameters: tuple[FixedParameter, ...], trigger_id: int,
) -> dict[str, object]:
    """MIDI-controlled, zero-audio-input Drum CLAP with ordinary Live stereo."""
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    boxes.extend([
        action_button(
            "obj-trigger-button", [185.0, 80.0, 68.0, 24.0],
            [84.0, 10.0, 68.0, CONTROL_HEIGHT], "TRIGGER",
            annotation="Play the primary Drum hit without a MIDI note.",
        ),
        # Max trigger outlets fire right-to-left. Queue 1 before 0, just as
        # the Drum CLAP editors do; the host preserves both events in order.
        new_object("obj-trigger-order", "t b b", 185.0, 118.0,
                   46.0, 1, 2, ["bang", "bang"]),
        box("obj-trigger-hit", "message", [240.0, 118.0, 150.0, 22.0],
            text=f"automateparamid {trigger_id} 1"),
        box("obj-trigger-reset", "message", [240.0, 150.0, 150.0, 22.0],
            text=f"automateparamid {trigger_id} 0"),
        clap_box("s3g.clap~ 0 2", 125.0, 300.0, 0, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   110.0, 2, 2, ["signal"] * 2),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(parameters, ())
    midi_boxes, midi_lines = midi_input_bridge()
    boxes.extend((*runtime_boxes, *parameter_boxes, *midi_boxes))
    lines = [
        line("obj-trigger-button", 0, "obj-trigger-order", 0),
        line("obj-trigger-order", 1, "obj-trigger-hit", 0),
        line("obj-trigger-hit", 0, "obj-clap", 0),
        line("obj-trigger-order", 0, "obj-trigger-reset", 0),
        line("obj-trigger-reset", 0, "obj-clap", 0),
        line("obj-clap", 0, "obj-plugout", 0),
        line("obj-clap", 1, "obj-plugout", 1),
        *runtime_lines, *parameter_lines, *midi_lines,
    ]
    document = patcher(
        name, f"Fixed {plugin_name} MIDI instrument with stereo Live output, "
        "saved CLAP state, and selected Live-automatable parameters.",
        boxes, lines, False, instrument=True,
        minimum_width=DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    register_fixed_parameters(document, parameters)
    return document


def drum_effect_device(
    name: str, plugin_name: str, plugin_id: str,
    parameters: tuple[FixedParameter, ...],
) -> dict[str, object]:
    """A stereo Drum insert on Live's ordinary two-channel audio chain."""
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    boxes.extend([
        new_object("obj-plugin", "plugin~ 1 2", 40.0, 180.0,
                   110.0, 2, 2, ["signal"] * 2),
        clap_box("s3g.clap~ 2 2", 125.0, 300.0, 2, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   110.0, 2, 2, ["signal"] * 2),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(parameters, ())
    boxes.extend((*runtime_boxes, *parameter_boxes))
    lines = [
        *(line("obj-plugin", channel, "obj-clap", channel)
          for channel in range(2)),
        *(line("obj-clap", channel, "obj-plugout", channel)
          for channel in range(2)),
        *runtime_lines, *parameter_lines,
    ]
    document = patcher(
        name, f"Fixed {plugin_name} stereo Live insert with saved CLAP state "
        "and selected Live-automatable parameters.",
        boxes, lines, False, minimum_width=DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    register_fixed_parameters(document, parameters)
    return document


def sample_instrument_device(
    name: str, plugin_id: str, parameters: tuple[FixedParameter, ...],
) -> dict[str, object]:
    """A fixed zero-input Sample instrument with MIDI and Live stereo out."""
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    # Doubles has dedicated transport-command notes; the other Sample
    # instruments use a normal middle-C note to audition their loaded source.
    play_note = 43 if name == "s3g Sample Doubles 2" else 60
    if name == "s3g Sample Doubles 2":
        kill_command = "midievent 144 37 100"  # native Stop command
    elif name == "s3g Sample Player 2":
        kill_command = "killvoices"  # Player has no MIDI panic command
    else:
        # Wavesets, Motion, and the Lanes/Grains/Cutups variants implement
        # MIDI CC 123 as the same Stop All action as their editors.
        kill_command = "midievent 176 123 0"
    boxes.extend([
        action_button(
            "obj-play-button", [185.0, 80.0, 64.0, 24.0],
            [84.0, 10.0, 64.0, CONTROL_HEIGHT], "PLAY",
            annotation=("Resume the Sample Doubles transport."
                        if play_note == 43 else
                        "Play MIDI note 60 on channel 1 to audition the sample."),
        ),
        action_button(
            "obj-kill-button", [258.0, 80.0, 64.0, 24.0],
            [156.0, 10.0, 64.0, CONTROL_HEIGHT], "KILL",
            annotation="Stop all Sample voices without unloading the source.",
        ),
        box("obj-play-message", "message", [185.0, 118.0, 154.0, 22.0],
            text=f"midievent 144 {play_note} 100"),
        box("obj-kill-message", "message", [348.0, 118.0, 80.0, 22.0],
            text=kill_command),
        clap_box("s3g.clap~ 0 2", 125.0, 300.0, 0, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   110.0, 2, 2, ["signal"] * 2),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(parameters, ())
    midi_boxes, midi_lines = midi_input_bridge()
    boxes.extend((*runtime_boxes, *parameter_boxes, *midi_boxes))
    lines = [
        line("obj-play-button", 0, "obj-play-message", 0),
        line("obj-play-message", 0, "obj-clap", 0),
        line("obj-kill-button", 0, "obj-kill-message", 0),
        line("obj-kill-message", 0, "obj-clap", 0),
        line("obj-clap", 0, "obj-plugout", 0),
        line("obj-clap", 1, "obj-plugout", 1),
        *runtime_lines, *parameter_lines, *midi_lines,
    ]
    document = patcher(
        name, f"Fixed {name} Max Instrument: Live MIDI in, stereo audio "
        "out, saved CLAP editor state, and selected Live automation.",
        boxes, lines, False, instrument=True,
        minimum_width=DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    register_fixed_parameters(document, parameters)
    return document


def sample_circulator_device() -> dict[str, object]:
    """Stereo-input Circulator wrapper for file playback and live capture."""
    name = "s3g Sample Circulator 2"
    parameters = (
        FixedParameter(4, "Position / Rate", "Position", 0, 1, .5),
        FixedParameter(5, "Blend", "Blend", 0, 1, .5),
        FixedParameter(7, "Output Gain", "Output", 0, 1, 1),
    )
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    boxes.extend([
        action_button(
            "obj-play-button", [185.0, 80.0, 64.0, 24.0],
            [84.0, 10.0, 64.0, CONTROL_HEIGHT], "PLAY",
            annotation="Start both loop readers without changing their audio.",
        ),
        action_button(
            "obj-kill-button", [258.0, 80.0, 64.0, 24.0],
            [156.0, 10.0, 64.0, CONTROL_HEIGHT], "KILL",
            annotation="Pause both loop readers without clearing either loop.",
        ),
        box("obj-play-message", "message", [185.0, 118.0, 110.0, 22.0],
            text="paramid 22 1"),
        box("obj-kill-message", "message", [305.0, 118.0, 110.0, 22.0],
            text="paramid 22 0"),
        new_object("obj-plugin", "plugin~ 1 2", 40.0, 180.0,
                   110.0, 2, 2, ["signal"] * 2),
        clap_box("s3g.clap~ 2 2", 125.0, 300.0, 2, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   110.0, 2, 2, ["signal"] * 2),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id="org.s3g.s3g-dsp.crcltr",
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(parameters, ())
    midi_boxes, midi_lines = midi_input_bridge()
    boxes.extend((*runtime_boxes, *parameter_boxes, *midi_boxes))
    lines = [
        line("obj-play-button", 0, "obj-play-message", 0),
        line("obj-play-message", 0, "obj-clap", 0),
        line("obj-kill-button", 0, "obj-kill-message", 0),
        line("obj-kill-message", 0, "obj-clap", 0),
        *(line("obj-plugin", channel, "obj-clap", channel)
          for channel in range(2)),
        *(line("obj-clap", channel, "obj-plugout", channel)
          for channel in range(2)),
        *runtime_lines, *parameter_lines, *midi_lines,
    ]
    document = patcher(
        name, "Stereo-input Sample Circulator Max Audio Effect. Live audio "
        "feeds capture, stereo playback returns to Live, and the editor "
        "controls loading and transport.",
        boxes, lines, False, minimum_width=DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    register_fixed_parameters(document, parameters)
    return document


def drum_mixer_device() -> dict[str, object]:
    """Receive eight stereo Drum pairs; expose sum and direct aux outputs."""
    name = "s3g Drum Mixer 16"
    plugin_name = "s3g Drum Mixer 16"
    plugin_id = "org.s3g.s3g-dsp.drum-mixer-16"
    parameters = (
        FixedParameter(1, "Output Mode", "Mode", 0, 1, 0, "enum",
                       ("Sum", "Direct")),
        FixedParameter(2, "Master Level", "Master", -60, 12, -6),
        FixedParameter(3, "Bus Enabled", "Bus", 0, 1, 0, "enum",
                       ("Off", "On")),
        FixedParameter(9, "Bus Return", "Return", -60, 12, -9),
    )
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    boxes.extend([
        box("obj-input-bus-label", "comment", [84.0, 10.0, 52.0, 20.0],
            text="RCV BUS", presentation_rect=[84.0, 10.0, 52.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        *routing_menu_controls("obj-input-bus-number", "Drum Input Bus",
                               "Input Bus", 1, 16, 1, 142.0),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, DRUM_SLOT_COUNT + 3)
        ), 40.0, 180.0, 370.0, DRUM_SLOT_COUNT + 2,
                   DRUM_SLOT_COUNT + 2, ["signal"] * (DRUM_SLOT_COUNT + 2)),
        clap_box("s3g.clap~ 16 16", 125.0, 300.0, 16, 16),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, DRUM_SLOT_COUNT + 3)
        ), 40.0, 365.0, 370.0, DRUM_SLOT_COUNT + 2,
                   DRUM_SLOT_COUNT + 2, ["signal"] * (DRUM_SLOT_COUNT + 2)),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-receive", f"s3g.bus.receive {DRUM_BUS_PREFIX}-1",
                   470.0, 215.0, 215.0, 2, 1),
        new_object("obj-input-bus-symbol", f"sprintf {DRUM_BUS_PREFIX}-%ld",
                   470.0, 250.0, 180.0, 1, 1),
        new_object("obj-input-bus-init", "loadbang", 680.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-input-bus-init-defer", "deferlow", 680.0, 250.0,
                   58.0, 1, 1),
        box("obj-input-bus-output", "message", [680.0, 285.0, 78.0, 22.0],
            text="outputvalue"),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        16, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(parameters, ())
    boxes.extend((*runtime_boxes, *parameter_boxes))
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-input-bus-number", "obj-input-bus-init-defer",
        "obj-input-bus-output", 780.0, 335.0,
    )
    boxes.extend(replay_boxes)
    lines = [
        line("obj-device", 0, "obj-bus-receive", 0),
        line("obj-input-bus-number", 0, "obj-input-bus-symbol", 0),
        line("obj-input-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-input-bus-init", 0, "obj-input-bus-init-defer", 0),
        line("obj-input-bus-init-defer", 0, "obj-input-bus-output", 0),
        line("obj-input-bus-output", 0, "obj-input-bus-number", 0),
        *(line("obj-plugin", channel + 2, "obj-clap", channel)
          for channel in range(DRUM_SLOT_COUNT)),
        *(line("obj-clap", channel, "obj-plugout", channel + 2)
          for channel in range(DRUM_SLOT_COUNT)),
        line("obj-clap", 0, "obj-plugout", 0),
        line("obj-clap", 1, "obj-plugout", 1),
        *replay_lines,
        *routing_menu_lines("obj-input-bus-number", guarded_write=True),
        *runtime_lines, *parameter_lines,
    ]
    document = patcher(
        name, "Receives a private 16-channel Drum bus as eight stereo lanes. "
        "Sum output reaches Live stereo; direct-mode lanes also reach the "
        "16 auxiliary device-chain channels.",
        boxes, lines, False, minimum_width=DRUM_SAMPLE_MINIMUM_WIDTH,
    )
    document["patcher"]["parameters"]["obj-input-bus-number"] = [
        "Drum Input Bus", "Input Bus", 0,
    ]
    register_fixed_parameters(document, parameters)
    return document


def insert_device() -> dict[str, object]:
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT)
    boxes.extend(
        [
            new_object("obj-plugin", "plugin~ " + " ".join(str(i) for i in range(1, 19)),
                       40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
            clap_box("s3g.clap~ 16 16", 125.0, 300.0, 16, 16),
            new_object("obj-plugout", "plugout~ " + " ".join(str(i) for i in range(1, 19)),
                       40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
            new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0, 125.0, 1, 1),
            new_object("obj-bus-insert", "s3g.bus.insert", 470.0, 230.0, 95.0, 1, 0),
            new_object("obj-bus-send", "s3g.bus.send master", 470.0, 270.0, 125.0, 3, 0),
        ]
    )
    runtime_boxes, runtime_lines = common_runtime(
        16, "s3g Ambi Effect Gain 64"
    )
    boxes.extend(runtime_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-device", 0, "obj-bus-insert", 0),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    return patcher(
        "s3g 3OA Insert",
        "Hosts an s3g CLAP processor in the 16-channel ACN/SN3D portion of the private s3g device chain.",
        boxes,
        lines,
        True,
    )


def fixed_effect_insert_device(
    name: str, plugin_name: str, plugin_id: str, order_id: int,
    parameters: tuple[FixedParameter, ...],
) -> dict[str, object]:
    """Process the private 3OA device chain, never Live's stereo lane."""
    boxes = common_ui(True, COMPACT_DEVICE_HEIGHT, allow_plugin_picker=False)
    boxes.extend([
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
        clap_box("s3g.clap~ 16 16", 125.0, 300.0, 16, 16),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-insert", "s3g.bus.insert", 470.0, 230.0,
                   95.0, 1, 0),
        new_object("obj-bus-send", "s3g.bus.send master", 470.0, 270.0,
                   125.0, 3, 0),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        16, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters, ((order_id, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-device", 0, "obj-bus-insert", 0),
        line("obj-device", 0, "obj-bus-send", 0),
        line("obj-chain", 0, "obj-bus-send", 1),
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(16))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    document = patcher(
        name,
        f"Fixed {plugin_name} insert: processes only the 16-channel 3OA "
        "device chain, preserves Live stereo, and routes to MAIN or NEXT.",
        boxes, lines, True,
    )
    register_fixed_parameters(document, parameters)
    return document


def stereo_decoder_main_device(
    name: str, plugin_name: str, plugin_id: str,
    parameters: tuple[FixedParameter, ...],
) -> dict[str, object]:
    """Receive private 3OA, decode to the track's ordinary Live stereo out."""
    boxes = common_ui(False, MAIN_OUT_DEVICE_HEIGHT,
                      allow_plugin_picker=False)
    boxes.extend([
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
        ambisonic_input_gain(),
        clap_box("s3g.clap~ 16 2", 125.0, 300.0, 16, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   105.0, 2, 2, ["signal"] * 2),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-receive", "s3g.bus.receive master", 470.0,
                   230.0, 140.0, 1, 1),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters, ((1, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [line("obj-device", 0, "obj-bus-receive", 0)]
    lines.extend(line("obj-plugin", channel + 2,
                      "obj-ambi-input-gain", channel)
                 for channel in range(16))
    lines.extend(line("obj-ambi-input-gain", channel, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel)
                 for channel in range(2))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    recorder_boxes, recorder_lines = ambisonic_recorder()
    boxes.extend(recorder_boxes)
    lines.extend(recorder_lines)
    document = patcher(
        name,
        f"Fixed {plugin_name} decoder: receives the private 3OA master "
        "bus, records/meters its 16-channel input, and sends decoded stereo "
        "directly to the track's normal Live main output.",
        boxes, lines, False, MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-ambi-input-gain"] = [
        "Ambisonic Input Gain", "3OA Gain", 0,
    ]
    register_fixed_parameters(document, parameters)
    return document


def master_device() -> dict[str, object]:
    boxes = main_out_ui()
    boxes.extend(
        [
            new_object("obj-plugin", "plugin~ " + " ".join(str(i) for i in range(1, 19)),
                       40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
            ambisonic_input_gain(),
            clap_box("s3g.clap~ 16 32", 125.0, 300.0, 16, 32),
            new_object("obj-plugout", "plugout~ " + " ".join(str(i) for i in range(1, 35)),
                       40.0, 365.0, 560.0, 34, 34, ["signal"] * 34),
            new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0, 125.0, 1, 1),
            new_object("obj-device-split", "t l l", 470.0, 215.0, 35.0, 1, 2),
            new_object("obj-once", "s3g.live.once", 560.0, 260.0, 90.0, 1, 1),
            output_initializer_box(),
            new_object("obj-bus-receive", "s3g.bus.receive master", 470.0, 230.0, 140.0, 1, 1),
        ]
    )
    boxes.append(hardware_output_popup())
    mono_boxes, mono_lines = mono_output_controls()
    boxes.extend(mono_boxes)
    runtime_boxes, runtime_lines = common_runtime(
        32, "s3g Ambi Decoder Head 2"
    )
    boxes.extend(runtime_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-device", 0, "obj-device-split", 0),
        line("obj-device-split", 0, "obj-bus-receive", 0),
        line("obj-device-split", 1, "obj-once", 0),
        line("obj-once", 0, "obj-output-init", 0),
        line("obj-device", 0, "obj-hardware-routing", 0),
        line("obj-hardware-button", 0, "obj-hardware-open", 0),
        line("obj-hardware-open", 0, "obj-hardware-pcontrol", 0),
        line("obj-hardware-pcontrol", 0, "obj-hardware-routing", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-ambi-input-gain", channel)
                 for channel in range(16))
    lines.extend(line("obj-ambi-input-gain", channel, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-mono-matrix", channel)
                 for channel in range(32))
    lines.extend(line("obj-mono-matrix", channel, "obj-plugout", channel + 2)
                 for channel in range(32))
    lines.extend(mono_lines)
    lines.extend(runtime_lines)
    recorder_boxes, recorder_lines = ambisonic_recorder()
    boxes.extend(recorder_boxes)
    lines.extend(recorder_lines)
    document = patcher(
        "s3g 3OA Decoder Main",
        "Receives the 16-channel master bus through a linked Ambisonic input gain, hosts an s3g CLAP decoder, and individually maps 32 decoded mono channels to hardware output slots.",
        boxes,
        lines,
        False,
        MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-ambi-input-gain"] = [
        "Ambisonic Input Gain", "3OA Gain", 0,
    ]
    for channel in range(1, 33):
        document["patcher"]["parameters"][f"obj-mono-output-{channel}"] = [
            f"Decoder Channel {channel} Output", f"Out {channel}", 0,
        ]
    return document


def speaker_main_out_device() -> dict[str, object]:
    boxes = main_out_ui(allow_plugin_picker=False)
    boxes.extend([
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
        ambisonic_input_gain(),
        clap_box("s3g.clap~ 16 32", 125.0, 300.0, 16, 32),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 35)
        ), 40.0, 365.0, 560.0, 34, 34, ["signal"] * 34),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-device-split", "t l l", 470.0, 215.0,
                   35.0, 1, 2),
        new_object("obj-once", "s3g.live.once", 560.0, 260.0,
                   90.0, 1, 1),
        output_initializer_box(),
        new_object("obj-bus-receive", "s3g.bus.receive master", 470.0,
                   230.0, 140.0, 1, 1),
    ])
    boxes.append(hardware_output_popup())
    mono_boxes, mono_lines = mono_output_controls()
    boxes.extend(mono_boxes)
    runtime_boxes, runtime_lines = common_runtime(
        32,
        "s3g Ambi Decoder Speaker 64",
        allow_plugin_picker=False,
        fixed_parameters=True,
        default_plugin_id="org.s3g.s3g-dsp.ambi-speaker-decoder-64",
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        SPEAKER_PARAMETERS,
        ((3, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-device", 0, "obj-device-split", 0),
        line("obj-device-split", 0, "obj-bus-receive", 0),
        line("obj-device-split", 1, "obj-once", 0),
        line("obj-once", 0, "obj-output-init", 0),
        line("obj-device", 0, "obj-hardware-routing", 0),
        line("obj-hardware-button", 0, "obj-hardware-open", 0),
        line("obj-hardware-open", 0, "obj-hardware-pcontrol", 0),
        line("obj-hardware-pcontrol", 0, "obj-hardware-routing", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-ambi-input-gain", channel)
                 for channel in range(16))
    lines.extend(line("obj-ambi-input-gain", channel, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-mono-matrix", channel)
                 for channel in range(32))
    lines.extend(line("obj-mono-matrix", channel, "obj-plugout", channel + 2)
                 for channel in range(32))
    lines.extend(mono_lines)
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    recorder_boxes, recorder_lines = ambisonic_recorder()
    boxes.extend(recorder_boxes)
    lines.extend(recorder_lines)
    document = patcher(
        "s3g 3OA Decoder Speaker Main",
        (
            "Receives and sums the private 16-channel s3g master bus, hosts "
            "the fixed third-order Speaker 64 decoder with stable Live "
            "parameters, and maps decoded channels 1–32 to mono hardware slots."
        ),
        boxes,
        lines,
        False,
        MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-ambi-input-gain"] = [
        "Ambisonic Input Gain", "3OA Gain", 0,
    ]
    for channel in range(1, 33):
        document["patcher"]["parameters"][f"obj-mono-output-{channel}"] = [
            f"Decoder Channel {channel} Output", f"Out {channel}", 0,
        ]
    register_fixed_parameters(document, SPEAKER_PARAMETERS)
    return document


def multichannel_decoder_main_device(
    name: str, plugin_name: str, plugin_id: str, order_id: int,
    parameters: tuple[FixedParameter, ...],
) -> dict[str, object]:
    """Fixed decoder with the Speaker Main mono matrix/DeviceIO endpoint."""
    boxes = main_out_ui(allow_plugin_picker=False)
    boxes.extend([
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
        ambisonic_input_gain(),
        clap_box("s3g.clap~ 16 32", 125.0, 300.0, 16, 32),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 35)
        ), 40.0, 365.0, 560.0, 34, 34, ["signal"] * 34),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-device-split", "t l l", 470.0, 215.0,
                   35.0, 1, 2),
        new_object("obj-once", "s3g.live.once", 560.0, 260.0,
                   90.0, 1, 1),
        output_initializer_box(),
        new_object("obj-bus-receive", "s3g.bus.receive master", 470.0,
                   230.0, 140.0, 1, 1),
    ])
    boxes.append(hardware_output_popup())
    mono_boxes, mono_lines = mono_output_controls()
    boxes.extend(mono_boxes)
    runtime_boxes, runtime_lines = common_runtime(
        32, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        parameters, ((order_id, 3),),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    lines = [
        line("obj-plugin", 0, "obj-plugout", 0),
        line("obj-plugin", 1, "obj-plugout", 1),
        line("obj-device", 0, "obj-device-split", 0),
        line("obj-device-split", 0, "obj-bus-receive", 0),
        line("obj-device-split", 1, "obj-once", 0),
        line("obj-once", 0, "obj-output-init", 0),
        line("obj-device", 0, "obj-hardware-routing", 0),
        line("obj-hardware-button", 0, "obj-hardware-open", 0),
        line("obj-hardware-open", 0, "obj-hardware-pcontrol", 0),
        line("obj-hardware-pcontrol", 0, "obj-hardware-routing", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2,
                      "obj-ambi-input-gain", channel)
                 for channel in range(16))
    lines.extend(line("obj-ambi-input-gain", channel, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-mono-matrix", channel)
                 for channel in range(32))
    lines.extend(line("obj-mono-matrix", channel, "obj-plugout", channel + 2)
                 for channel in range(32))
    lines.extend(mono_lines)
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    recorder_boxes, recorder_lines = ambisonic_recorder()
    boxes.extend(recorder_boxes)
    lines.extend(recorder_lines)
    document = patcher(
        name,
        f"Fixed {plugin_name} decoder: receives the private 3OA master "
        "bus and maps up to 32 mono decoded outputs to Live hardware pairs. "
        + ("Only eight Sub outputs can be active; other slots are silent."
           if name == "s3g 3OA Decoder Sub Main" else
           "Outputs beyond the 32-slot Live matrix are not exposed."),
        boxes, lines, False, MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-ambi-input-gain"] = [
        "Ambisonic Input Gain", "3OA Gain", 0,
    ]
    for channel in range(1, 33):
        document["patcher"]["parameters"][f"obj-mono-output-{channel}"] = [
            f"Decoder Channel {channel} Output", f"Out {channel}", 0,
        ]
    register_fixed_parameters(document, parameters)
    return document


def panner_main_device(kind: str, plugin_id: str) -> dict[str, object]:
    """Receive 32 ordinary source lanes and route 32 speaker feeds to Live."""
    name = f"s3g Panner {kind} Main"
    plugin_name = f"s3g Panner {kind} 64"
    boxes = main_out_ui(allow_plugin_picker=False)
    boxes.extend([
        box("obj-input-bus-label", "comment", [16.0, 38.0, 56.0, 20.0],
            text="RCV BUS", presentation_rect=[16.0, 38.0, 56.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        *routing_menu_controls(
            "obj-input-bus-number", "Multichannel Input Bus", "Input Bus",
            1, 16, 1, 78.0, width=48.0, y=38.0,
        ),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 180.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
                   MULTICHANNEL_LIVE_CHANNELS,
                   ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        panner_input_gain(),
        clap_box("s3g.clap~ 32 32", 125.0, 300.0, 32, 32),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 365.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
                   MULTICHANNEL_LIVE_CHANNELS,
                   ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-device-split", "t l l", 470.0, 215.0,
                   35.0, 1, 2),
        new_object("obj-once", "s3g.live.once", 560.0, 260.0,
                   90.0, 1, 1),
        output_initializer_box(),
        new_object("obj-bus-receive", "s3g.bus.receive s3g-multichannel-1",
                   470.0, 230.0, 225.0, 2, 1),
        new_object("obj-input-bus-symbol", "sprintf s3g-multichannel-%ld",
                   470.0, 250.0, 180.0, 1, 1),
        new_object("obj-input-bus-init", "loadbang", 680.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-input-bus-init-defer", "deferlow", 680.0, 250.0,
                   58.0, 1, 1),
        box("obj-input-bus-output", "message", [680.0, 285.0, 78.0, 22.0],
            text="outputvalue"),
        hardware_output_popup(),
    ])
    mono_boxes, mono_lines = mono_output_controls("Panner")
    boxes.extend(mono_boxes)
    runtime_boxes, runtime_lines = common_runtime(
        32, plugin_name, allow_plugin_picker=False, fixed_parameters=True,
        default_plugin_id=plugin_id,
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        PANNER_PARAMETERS, (),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-input-bus-number", "obj-input-bus-init-defer",
        "obj-input-bus-output", 780.0, 335.0,
    )
    boxes.extend(replay_boxes)
    lines = [
        line("obj-device", 0, "obj-device-split", 0),
        line("obj-device-split", 0, "obj-bus-receive", 0),
        line("obj-device-split", 1, "obj-once", 0),
        line("obj-once", 0, "obj-output-init", 0),
        line("obj-input-bus-number", 0, "obj-input-bus-symbol", 0),
        line("obj-input-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-input-bus-init", 0, "obj-input-bus-init-defer", 0),
        line("obj-input-bus-init-defer", 0, "obj-input-bus-output", 0),
        line("obj-input-bus-output", 0, "obj-input-bus-number", 0),
        line("obj-device", 0, "obj-hardware-routing", 0),
        line("obj-hardware-button", 0, "obj-hardware-open", 0),
        line("obj-hardware-open", 0, "obj-hardware-pcontrol", 0),
        line("obj-hardware-pcontrol", 0, "obj-hardware-routing", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2,
                      "obj-panner-input-gain", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-panner-input-gain", channel, "obj-clap", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-clap", channel, "obj-mono-matrix", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-mono-matrix", channel, "obj-plugout", channel + 2)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(mono_lines)
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    lines.extend(replay_lines)
    lines.extend(routing_menu_lines("obj-input-bus-number", guarded_write=True))
    document = patcher(
        name,
        f"Fixed {plugin_name}: receives the generic 32-channel bus, "
        "processes source inputs 1–32, and maps speaker outputs 1–32 "
        "through the mono matrix to hardware pairs. CLAP lanes 33–64 "
        "are outside the current Max for Live routing endpoint.",
        boxes, lines, False, MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-input-bus-number"] = [
        "Multichannel Input Bus", "Input Bus", 0,
    ]
    document["patcher"]["parameters"]["obj-panner-input-gain"] = [
        "Panner Input Gain", "Input Gain", 0,
    ]
    for channel in range(1, MULTICHANNEL_SLOT_COUNT + 1):
        document["patcher"]["parameters"][f"obj-mono-output-{channel}"] = [
            f"Panner Channel {channel} Output", f"Out {channel}", 0,
        ]
    register_fixed_parameters(document, PANNER_PARAMETERS)
    return document


def output_autogain_stereo_device() -> dict[str, object]:
    """Fold the generic 32-channel bus into normal Live stereo output."""
    name = "s3g Output Autogain Stereo"
    boxes = common_ui(False, COMPACT_DEVICE_HEIGHT, allow_plugin_picker=False)
    boxes.extend([
        box("obj-input-bus-label", "comment", [16.0, 38.0, 56.0, 20.0],
            text="RCV BUS", presentation_rect=[16.0, 38.0, 56.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        *routing_menu_controls(
            "obj-input-bus-number", "Multichannel Input Bus", "Input Bus",
            1, 16, 1, 78.0, width=48.0, y=38.0,
        ),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 180.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
                   MULTICHANNEL_LIVE_CHANNELS,
                   ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        autogain_input_gain(),
        clap_box("s3g.clap~ 32 2", 125.0, 300.0, 32, 2),
        new_object("obj-plugout", "plugout~ 1 2", 40.0, 365.0,
                   105.0, 2, 2, ["signal", "signal"]),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-receive", "s3g.bus.receive s3g-multichannel-1",
                   470.0, 230.0, 225.0, 2, 1),
        new_object("obj-input-bus-symbol", "sprintf s3g-multichannel-%ld",
                   470.0, 250.0, 180.0, 1, 1),
        new_object("obj-input-bus-init", "loadbang", 680.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-input-bus-init-defer", "deferlow", 680.0, 250.0,
                   58.0, 1, 1),
        box("obj-input-bus-output", "message", [680.0, 285.0, 78.0, 22.0],
            text="outputvalue"),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        2, "s3g Output Autogain Stereo 2", allow_plugin_picker=False,
        fixed_parameters=True,
        default_plugin_id="org.s3g.s3g-dsp.mc-to-stereo-autogain",
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        OUTPUT_AUTOGAIN_PARAMETERS, (),
    )
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-input-bus-number", "obj-input-bus-init-defer",
        "obj-input-bus-output", 780.0, 335.0,
    )
    boxes.extend(runtime_boxes + parameter_boxes + replay_boxes)
    lines = [
        line("obj-device", 0, "obj-bus-receive", 0),
        line("obj-input-bus-number", 0, "obj-input-bus-symbol", 0),
        line("obj-input-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-input-bus-init", 0, "obj-input-bus-init-defer", 0),
        line("obj-input-bus-init-defer", 0, "obj-input-bus-output", 0),
        line("obj-input-bus-output", 0, "obj-input-bus-number", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2,
                      "obj-autogain-input-gain", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-autogain-input-gain", channel, "obj-clap", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel)
                 for channel in range(2))
    lines.extend(runtime_lines + parameter_lines + replay_lines)
    lines.extend(routing_menu_lines("obj-input-bus-number", guarded_write=True))
    document = patcher(
        name,
        "Receives 32 generic bus channels, folds them through fixed Output "
        "Autogain Stereo 2, and returns two channels to the normal Live track "
        "output. CLAP source channels 33–128 have no Live bus feed.",
        boxes, lines, False, COMPACT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-input-bus-number"] = [
        "Multichannel Input Bus", "Input Bus", 0,
    ]
    document["patcher"]["parameters"]["obj-autogain-input-gain"] = [
        "Output AutoGain Input Gain", "Input Gain", 0,
    ]
    register_fixed_parameters(document, OUTPUT_AUTOGAIN_PARAMETERS)
    return document


def output_autogain_quad_main_device() -> dict[str, object]:
    """Fold the generic bus to four independently routed hardware outputs."""
    name = "s3g Output Autogain Quad Main"
    boxes = main_out_ui(allow_plugin_picker=False)
    boxes.extend([
        box("obj-input-bus-label", "comment", [16.0, 38.0, 56.0, 20.0],
            text="RCV BUS", presentation_rect=[16.0, 38.0, 56.0, 20.0],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM),
        *routing_menu_controls(
            "obj-input-bus-number", "Multichannel Input Bus", "Input Bus",
            1, 16, 1, 78.0, width=48.0, y=38.0,
        ),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 180.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
                   MULTICHANNEL_LIVE_CHANNELS,
                   ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        autogain_input_gain(),
        clap_box("s3g.clap~ 32 4", 125.0, 300.0, 32, 4),
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, MULTICHANNEL_LIVE_CHANNELS + 1)
        ), 40.0, 365.0, 610.0, MULTICHANNEL_LIVE_CHANNELS,
                   MULTICHANNEL_LIVE_CHANNELS,
                   ["signal"] * MULTICHANNEL_LIVE_CHANNELS),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-device-split", "t l l", 470.0, 215.0,
                   35.0, 1, 2),
        new_object("obj-once", "s3g.live.once", 560.0, 260.0,
                   90.0, 1, 1),
        output_initializer_box(),
        new_object("obj-bus-receive", "s3g.bus.receive s3g-multichannel-1",
                   470.0, 230.0, 225.0, 2, 1),
        new_object("obj-input-bus-symbol", "sprintf s3g-multichannel-%ld",
                   470.0, 250.0, 180.0, 1, 1),
        new_object("obj-input-bus-init", "loadbang", 680.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-input-bus-init-defer", "deferlow", 680.0, 250.0,
                   58.0, 1, 1),
        box("obj-input-bus-output", "message", [680.0, 285.0, 78.0, 22.0],
            text="outputvalue"),
        hardware_output_popup(),
        new_object("obj-quad-output-init", "loadbang", 800.0, 215.0,
                   65.0, 1, 1, ["bang"]),
        new_object("obj-quad-output-init-defer", "deferlow", 800.0, 250.0,
                   58.0, 1, 1),
        box("obj-quad-output-outputvalue", "message",
            [800.0, 285.0, 78.0, 22.0], text="outputvalue"),
    ])
    for channel, label in enumerate(("L", "R", "RB", "LB"), 1):
        label_x = 212.0 + (channel - 1) * 118.0
        menu_x = 248.0 + (channel - 1) * 118.0
        boxes.append(box(
            f"obj-quad-output-label-{channel}", "comment",
            [label_x, 44.0, 30.0, CONTROL_HEIGHT], text=label,
            presentation_rect=[label_x, 44.0, 30.0, CONTROL_HEIGHT],
            fontname=UI_FONT, fontsize=UI_FONT_SIZE, textcolor=COLOR_DIM,
        ))
        boxes.extend(routing_menu_controls(
            f"obj-quad-output-{channel}", f"Quad {label} Output Slot",
            f"{label} Out", 0, 32, channel, menu_x, width=70.0, y=44.0,
            labels=["OFF"] + [f"{slot:02d}" for slot in range(1, 33)],
        ))
        boxes.append(new_object(
            f"obj-quad-output-gate-{channel}",
            "gate~ 32 1 @ramptime 5.", 125.0 + channel * 85.0,
            400.0, 175.0, 2, 32, ["signal"] * 32,
        ))
    runtime_boxes, runtime_lines = common_runtime(
        4, "s3g Output Autogain Quad 4", allow_plugin_picker=False,
        fixed_parameters=True,
        default_plugin_id="org.s3g.s3g-dsp.mc-to-quad-autogain",
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        OUTPUT_AUTOGAIN_PARAMETERS, (),
    )
    replay_boxes, replay_lines = bus_menu_replay_controls(
        "obj-input-bus-number", "obj-input-bus-init-defer",
        "obj-input-bus-output", 900.0, 335.0,
    )
    boxes.extend(runtime_boxes + parameter_boxes + replay_boxes)
    lines = [
        line("obj-device", 0, "obj-device-split", 0),
        line("obj-device-split", 0, "obj-bus-receive", 0),
        line("obj-device-split", 1, "obj-once", 0),
        line("obj-once", 0, "obj-output-init", 0),
        line("obj-device", 0, "obj-hardware-routing", 0),
        line("obj-hardware-button", 0, "obj-hardware-open", 0),
        line("obj-hardware-open", 0, "obj-hardware-pcontrol", 0),
        line("obj-hardware-pcontrol", 0, "obj-hardware-routing", 0),
        line("obj-input-bus-number", 0, "obj-input-bus-symbol", 0),
        line("obj-input-bus-symbol", 0, "obj-bus-receive", 1),
        line("obj-input-bus-init", 0, "obj-input-bus-init-defer", 0),
        line("obj-input-bus-init-defer", 0, "obj-input-bus-output", 0),
        line("obj-input-bus-output", 0, "obj-input-bus-number", 0),
        line("obj-quad-output-init", 0, "obj-quad-output-init-defer", 0),
        line("obj-device", 0, "obj-quad-output-init-defer", 0),
        line("obj-quad-output-init-defer", 0,
             "obj-quad-output-outputvalue", 0),
    ]
    lines.extend(line("obj-plugin", channel + 2,
                      "obj-autogain-input-gain", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(line("obj-autogain-input-gain", channel, "obj-clap", channel)
                 for channel in range(MULTICHANNEL_SLOT_COUNT))
    for channel in range(1, 5):
        control = f"obj-quad-output-{channel}"
        gate = f"obj-quad-output-gate-{channel}"
        lines.extend([
            line("obj-clap", channel - 1, gate, 1),
            line(control, 0, gate, 0),
            line("obj-quad-output-outputvalue", 0, control, 0),
        ])
        lines.extend(routing_menu_lines(control))
        lines.extend(line(gate, slot, "obj-plugout", slot + 2)
                     for slot in range(MULTICHANNEL_SLOT_COUNT))
    lines.extend(runtime_lines + parameter_lines + replay_lines)
    lines.extend(routing_menu_lines("obj-input-bus-number", guarded_write=True))
    document = patcher(
        name,
        "Receives 32 generic bus channels, folds through fixed Output Autogain "
        "Quad 4, and independently assigns L/R/RB/LB to 32 mono hardware "
        "slots. Only CLAP source channels 1–32 have Live bus feeds.",
        boxes, lines, False, MAIN_OUT_DEVICE_HEIGHT,
    )
    document["patcher"]["parameters"]["obj-input-bus-number"] = [
        "Multichannel Input Bus", "Input Bus", 0,
    ]
    document["patcher"]["parameters"]["obj-autogain-input-gain"] = [
        "Output AutoGain Input Gain", "Input Gain", 0,
    ]
    for channel, label in enumerate(("L", "R", "RB", "LB"), 1):
        document["patcher"]["parameters"][f"obj-quad-output-{channel}"] = [
            f"Quad {label} Output Slot", f"{label} Out", 0,
        ]
    register_fixed_parameters(document, OUTPUT_AUTOGAIN_PARAMETERS)
    return document


def arrange_speaker_main_debug_view(document: dict[str, object]) -> None:
    """Lay out Speaker Main and make control-message ordering explicit."""
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    placed: set[str] = set()

    # The old compact layout accidentally relied on Max's spatial message
    # order. Make startup, page redraw, and every mono-route update explicit
    # before any debug-view positions are moved.
    patch["boxes"].extend([
        new_object("obj-device-startup-trigger", "t l l l l",
                   1030.0, 220.0, 80.0, 1, 4, ["list"] * 4),
        new_object("obj-mono-page-fanout", "t i i i i i i i i i",
                   1080.0, 760.0, 118.0, 1, 9, ["int"] * 9),
    ])
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    startup_targets = (
        "obj-state-restore-init", "obj-hardware-routing",
        "obj-bus-insert", "obj-device-split",
    )
    page_targets = tuple(
        f"obj-mono-row-label-{row}-number" for row in range(8, 0, -1)
    ) + ("obj-mono-page-order",)
    original_startup = {
        entry["patchline"]["destination"][0] for entry in patch["lines"]
        if entry["patchline"]["source"] == ["obj-device", 0]
    }
    original_page = {
        entry["patchline"]["destination"][0] for entry in patch["lines"]
        if entry["patchline"]["source"] == ["obj-mono-page-one", 0]
    }
    if original_startup != set(startup_targets) or original_page != set(page_targets):
        raise ValueError("Speaker Main startup or page fanout changed upstream")
    patch["lines"] = [
        entry for entry in patch["lines"]
        if not (entry["patchline"]["source"] in
                (["obj-device", 0], ["obj-mono-page-one", 0]))
    ]
    patch["lines"].append(line("obj-device", 0, "obj-device-startup-trigger", 0))
    patch["lines"].extend(
        line("obj-device-startup-trigger", 3 - index, destination, 0)
        for index, destination in enumerate(startup_targets)
    )
    patch["lines"].append(line("obj-mono-page-one", 0, "obj-mono-page-fanout", 0))
    patch["lines"].extend(
        line("obj-mono-page-fanout", 8 - index, destination, 0)
        for index, destination in enumerate(page_targets)
    )
    for channel in range(1, 33):
        control = f"obj-mono-output-{channel}"
        store_input = f"{control}-store-input"
        trigger = f"{control}-trigger"
        store = f"{control}-store"
        boxes[store_input]["text"] = "t i b i"
        boxes[store_input]["numoutlets"] = 3
        boxes[store_input]["outlettype"] = ["int", "bang", "int"]
        changed = 0
        for entry in patch["lines"]:
            connection = entry["patchline"]
            if (connection["source"] == [store_input, 1]
                    and connection["destination"] == [store, 1]):
                connection["source"][1] = 2
                changed += 1
            elif (connection["source"] == [store_input, 0]
                  and connection["destination"] == ["obj-mono-redraw", 0]):
                connection["source"][1] = 1
                changed += 1
            elif (connection["source"] == [control, 0]
                  and connection["destination"] == [trigger, 0]):
                connection["source"] = [store_input, 0]
                changed += 1
        if changed != 3:
            raise ValueError(f"Speaker Main mono route {channel} changed upstream")

    def put(object_id: str, x: float, y: float) -> None:
        rect = boxes[object_id]["patching_rect"]
        boxes[object_id]["patching_rect"] = [x, y, rect[2], rect[3]]
        placed.add(object_id)

    def stack(ids: tuple[str, ...], x: float, y: float, step: float) -> None:
        for index, object_id in enumerate(ids):
            put(object_id, x, y + index * step)

    # Signal path on the left; the recorder taps the post-gain 36-lane bed.
    for object_id, y in (
        ("obj-plugin", 100.0), ("obj-ambi-input-gain", 250.0),
        ("obj-clap", 380.0), ("obj-mono-matrix", 520.0),
        ("obj-plugout", 680.0), ("obj-rec-writer", 820.0),
    ):
        put(object_id, 80.0, y)
    boxes["obj-ambi-input-gain"]["patching_rect"][2:] = [168.0, 120.0]

    # Live's face is 169 px high. Put the file/record controls beside the
    # Editor/Hardware buttons, the vertical gain directly below Editor, and
    # the square-cell 32x8 routing grid immediately to the gain's right.
    boxes["obj-ambi-input-gain"]["orientation"] = 0
    boxes["obj-ambi-input-gain"]["thickness"] = 2
    boxes["obj-ambi-input-gain"]["presentation_rect"] = [
        12.0, 38.0, 172.0, 120.0,
    ]
    boxes["obj-input-panel"]["presentation_rect"] = [
        12.0, 32.0, 176.0, 130.0,
    ]
    boxes["obj-section-divider"]["presentation_rect"] = [
        192.0, 32.0, 1.0, 130.0,
    ]
    boxes["obj-output-panel"]["presentation_rect"] = [
        196.0, 32.0, 492.0, 130.0,
    ]
    boxes["obj-rec-file-button"]["presentation_rect"] = [
        192.0, 10.0, 48.0, 20.0,
    ]
    boxes["obj-rec-toggle"]["presentation_rect"] = [
        248.0, 10.0, 48.0, 20.0,
    ]
    boxes["obj-rec-time"]["presentation_rect"] = [
        304.0, 10.0, 60.0, 20.0,
    ]
    boxes["obj-mono-page-menu"]["presentation_rect"] = [
        372.0, 10.0, 108.0, 20.0,
    ]
    boxes["obj-mono-grid"]["presentation_rect"] = [
        240.0, 50.0, 448.0, 112.0,
    ]
    for channel in range(1, 9):
        boxes[f"obj-mono-output-heading-{channel}"]["presentation_rect"] = [
            240.0 + (channel - 1) * 56.0, 32.0, 56.0, 18.0,
        ]
        boxes[f"obj-mono-row-label-{channel}"]["presentation_rect"] = [
            204.0, 50.0 + (channel - 1) * 14.0, 30.0, 14.0,
        ]
    boxes["obj-ui-background"]["presentation_rect"] = [
        0.0, 0.0, 700.0, 169.0,
    ]
    patch["devicewidth"] = 700.0
    patch["openrect"] = [0.0, 0.0, 700.0, 169.0]

    # This popup's own pair labels need contrast against its light window;
    # leave the sixteen embedded output menus and their colors untouched.
    hardware_popup = boxes["obj-hardware-routing"]["patcher"]
    popup_background = [0.82, 0.82, 0.82, 1.0]
    hardware_popup["bgcolor"] = popup_background
    hardware_popup["locked_bgcolor"] = popup_background
    for entry in hardware_popup["boxes"]:
        popup_box = entry["box"]
        if popup_box["id"].startswith("obj-output-label-"):
            popup_box["textcolor"] = [0.20, 0.20, 0.20, 1.0]

    # Controls that a human follows into the E4L-derived routing handoff.
    for object_id, x, y in (
        ("obj-hardware-button", 700.0, 100.0),
        ("obj-hardware-open", 820.0, 100.0),
        ("obj-hardware-pcontrol", 890.0, 100.0),
        ("obj-gui-button", 700.0, 160.0),
        ("obj-editor-trigger", 820.0, 160.0),
        ("obj-editor", 880.0, 160.0),
        ("obj-device", 700.0, 220.0),
        ("obj-device-startup-trigger", 1030.0, 220.0),
        ("obj-device-split", 700.0, 280.0),
        ("obj-once", 800.0, 280.0),
        ("obj-bus-insert", 700.0, 340.0),
        ("obj-hardware-routing", 700.0, 430.0),
        ("obj-output-init", 900.0, 430.0),
        ("obj-mono-init", 700.0, 510.0),
        ("obj-mono-init-defer", 800.0, 510.0),
        ("obj-mono-outputvalue", 900.0, 510.0),
        ("obj-mono-grid", 700.0, 600.0),
        ("obj-mono-page-menu", 700.0, 760.0),
        ("obj-mono-page-init", 850.0, 760.0),
        ("obj-mono-page-first", 950.0, 760.0),
        ("obj-mono-page-one", 1010.0, 760.0),
        ("obj-mono-page-fanout", 1080.0, 760.0),
        ("obj-mono-page-order", 1220.0, 760.0),
        ("obj-mono-current-page", 1300.0, 760.0),
        ("obj-mono-redraw", 700.0, 820.0),
        ("obj-mono-click-close", 780.0, 820.0),
        ("obj-mono-click-open", 830.0, 820.0),
        ("obj-mono-redraw-body", 890.0, 820.0),
        ("obj-mono-clear", 950.0, 820.0),
        ("obj-mono-select-page", 1010.0, 820.0),
        ("obj-mono-click-gate", 700.0, 900.0),
        ("obj-mono-click-unpack", 800.0, 900.0),
        ("obj-mono-click-channel", 920.0, 900.0),
        ("obj-mono-click-channel-store", 1160.0, 900.0),
        ("obj-mono-click-value", 920.0, 960.0),
        ("obj-mono-click-order", 1160.0, 960.0),
        ("obj-mono-click-pack", 1220.0, 960.0),
        ("obj-mono-click-route", 700.0, 1020.0),
    ):
        put(object_id, x, y)
    for page in range(1, 5):
        put(f"obj-mono-page-{page}-rows", 700.0, 1130.0 + page * 60.0)
    for row in range(1, 9):
        y = 1480.0 + (row - 1) * 55.0
        for suffix, x in (
            ("", 700.0), ("-number", 750.0),
            ("-format", 960.0), ("-set", 1080.0),
        ):
            put(f"obj-mono-row-label-{row}{suffix}", x, y)
        put(f"obj-mono-output-heading-{row}",
            700.0 + (row - 1) * 60.0, 1430.0)

    # Each mono route is a left-to-right row. Four page blocks correspond to
    # the device-face pages, so any one channel can be inspected in isolation.
    offsets = (
        ("", 0.0), ("-store-input", 90.0), ("-store", 160.0),
        ("-display-valid", 230.0), ("-display-column", 320.0),
        ("-display-set", 380.0), ("-trigger", 500.0),
        ("-old", 560.0), ("-disconnect", 620.0),
        ("-valid", 720.0), ("-zero-based", 810.0),
        ("-new", 870.0), ("-connect", 930.0),
    )
    for channel in range(1, 33):
        page, row = divmod(channel - 1, 8)
        x = 1350.0 + (page % 2) * 1250.0
        y = 1400.0 + (page // 2) * 700.0 + row * 60.0
        for suffix, offset in offsets:
            put(f"obj-mono-output-{channel}{suffix}", x + offset, y)

    # Automation, transport, CLAP state, and recorder stay outside the mono
    # routing pages so their patch cords can be traced separately.
    parameter_ids = (1, 2, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16)
    for row, parameter_id in enumerate(parameter_ids):
        y = 100.0 + row * 55.0
        put(f"obj-param-{parameter_id}", 1350.0, y)
        put(f"obj-param-message-{parameter_id}", 1470.0, y)
        put(f"obj-param-reflect-{parameter_id}", 1630.0, y)
    stack(("obj-plugsync", "obj-transport-pack", "obj-transport"),
          80.0, 950.0, 70.0)
    put("obj-timesig", 220.0, 950.0)
    stack(("obj-route-status", "obj-latency-message", "obj-thispatcher"),
          80.0, 1210.0, 70.0)
    put("obj-print", 250.0, 1280.0)
    stack(("obj-loadbang", "obj-delayed-load", "obj-default-open",
           "obj-clap-state", "obj-state-valid", "obj-state-restore",
           "obj-state-restore-init"), 80.0, 1450.0, 60.0)
    put("obj-state-capture-delay", 370.0, 1690.0)
    put("obj-state-get", 470.0, 1690.0)
    put("obj-state-change-bang", 370.0, 1750.0)
    put("obj-state-capture-enable", 370.0, 1810.0)
    put("obj-state-capture-gate", 370.0, 1870.0)
    stack(("obj-param-gate", "obj-param-loaded-trigger",
           "obj-paramchanged-route"), 80.0, 1990.0, 70.0)
    put("obj-param-enable", 180.0, 1990.0)
    put("obj-param-resync-delay", 180.0, 2060.0)

    recorder_groups = (
        (3700.0, (
            "obj-rec-file-button", "obj-rec-file-request", "obj-rec-dialog",
            "obj-rec-file-selected", "obj-rec-format", "obj-rec-wave-format",
            "obj-rec-open", "obj-rec-ready", "obj-rec-ready-active",
            "obj-rec-init", "obj-rec-init-order", "obj-rec-default-name",
            "obj-rec-time-reset",
        )),
        (4000.0, (
            "obj-rec-toggle", "obj-rec-choice", "obj-rec-start-gate",
            "obj-rec-start-trigger", "obj-rec-file-block", "obj-rec-start",
            "obj-rec-start-order", "obj-rec-stop", "obj-rec-reset",
            "obj-rec-ui-set", "obj-rec-file-active", "obj-rec-file-invert",
        )),
        (4300.0, (
            "obj-rec-time", "obj-rec-clock", "obj-rec-progress",
            "obj-rec-watch-gate", "obj-rec-watch-reset",
            "obj-rec-watch-stop", "obj-rec-watch-timeout",
            "obj-rec-watch-error", "obj-rec-print", "obj-rec-seconds",
            "obj-rec-whole-seconds", "obj-rec-time-change",
            "obj-rec-time-split", "obj-rec-time-minutes",
            "obj-rec-time-seconds", "obj-rec-time-pack",
            "obj-rec-time-format", "obj-rec-time-set",
        )),
    )
    for x, ids in recorder_groups:
        stack(ids, x, 100.0, 55.0)
    put("obj-rec-credit", 3700.0, 1250.0)

    # Presentation panels are moved out of the signal graph only in Max's
    # patching view. Their Ableton positions remain in the compact device face.
    stack(("obj-ui-background", "obj-input-panel", "obj-section-divider",
           "obj-output-panel"), 80.0, 3000.0, 210.0)
    patch["rect"] = [120.0, 90.0, 4900.0, 3900.0]
    missing = set(boxes) - placed
    if missing:
        raise ValueError(f"Speaker Main layout missed: {sorted(missing)}")


def arrange_ambi36_debug_view(name: str, document: dict[str, object]) -> None:
    """Lay out selected 36-channel paths for human signal-flow inspection.

    Speaker Main also fixes presentation and control-message sequencing;
    audio patch cords and saved Live/CLAP parameter identities stay intact.
    Each lane is explicit so new objects cannot silently overlap old ones.
    """
    if name == "s3g Ambi Decoder Speaker Main":
        arrange_speaker_main_debug_view(document)
        return
    if name not in {
        "s3g Ambi Encoder Stochastic", "s3g Bus Send 36",
        "s3g Bus Receive 36",
    }:
        return
    patch = document["patcher"]
    boxes = {entry["box"]["id"]: entry["box"] for entry in patch["boxes"]}
    placed: set[str] = set()

    def put(object_id: str, x: float, y: float) -> None:
        rect = boxes[object_id]["patching_rect"]
        boxes[object_id]["patching_rect"] = [x, y, rect[2], rect[3]]
        placed.add(object_id)

    def stack(ids: tuple[str, ...], x: float, y: float, step: float) -> None:
        for index, object_id in enumerate(ids):
            put(object_id, x, y + index * step)

    def menu_row(prefix: str, y: float, label: str | None = None) -> None:
        if label:
            put(label, 800.0, y - 25.0)
        for suffix, x in (
            ("-menu", 800.0), ("-menu-to-value", 930.0),
            ("", 1010.0), ("-value-to-menu", 1130.0),
            ("-menu-set", 1220.0),
        ):
            put(prefix + suffix, x, y)

    if name == "s3g Ambi Encoder Stochastic":
        put("obj-ui-background", 1800.0, 40.0)
        stack(("obj-midi-in", "obj-midi-parse", "obj-clap", "obj-plugout"),
              80.0, 80.0, 90.0)
        stack(("obj-route-status", "obj-latency-message", "obj-thispatcher"),
              80.0, 450.0, 60.0)
        put("obj-print", 250.0, 510.0)
        stack(("obj-plugsync", "obj-transport-pack", "obj-transport"),
              80.0, 700.0, 60.0)
        put("obj-timesig", 220.0, 700.0)
        for object_id, x in (
            ("obj-gui-button", 700.0), ("obj-editor-trigger", 800.0),
            ("obj-editor", 900.0),
        ):
            put(object_id, x, 80.0)
        stack(("obj-param-loaded-trigger", "obj-param-resync-delay",
               "obj-param-gate"), 650.0, 450.0, 60.0)
        put("obj-param-enable", 750.0, 570.0)
        put("obj-paramchanged-route", 800.0, 450.0)
        put("obj-status-trigger", 550.0, 450.0)
        stack(("obj-loadbang", "obj-delayed-load", "obj-default-open",
               "obj-clap-state", "obj-state-valid", "obj-state-restore",
               "obj-state-restore-init"), 750.0, 700.0, 60.0)
        put("obj-state-capture-delay", 1050.0, 940.0)
        put("obj-state-get", 1150.0, 940.0)
        put("obj-state-change-bang", 1050.0, 1000.0)
        put("obj-state-capture-enable", 1050.0, 1060.0)
        put("obj-state-capture-gate", 1050.0, 1120.0)
        stack(("obj-device", "obj-device-startup-trigger", "obj-bus-insert",
               "obj-next-trigger", "obj-next-send"),
              1300.0, 700.0, 60.0)
        put("obj-next-mode", 1400.0, 880.0)
        stack(("obj-next-retry-trigger", "obj-next-retry-delay",
               "obj-next-retry-store"), 1580.0, 820.0, 70.0)
        for row, parameter_id in enumerate((2, 4, 37)):
            y = 100.0 + row * 100.0
            put(f"obj-param-{parameter_id}", 1300.0, y)
            put(f"obj-param-message-{parameter_id}", 1420.0, y)
            put(f"obj-param-reflect-{parameter_id}", 1570.0, y)
        patch["rect"] = [120.0, 90.0, 2100.0, 1300.0]
    elif name == "s3g Bus Send 36":
        put("obj-ui-background", 1800.0, 40.0)
        stack(("obj-plugin", "obj-route-matrix", "obj-bus-gain",
               "obj-plugout"), 80.0, 100.0, 160.0)
        put("obj-dry-mode", 80.0, 190.0)
        put("obj-dry-invert", 200.0, 190.0)
        put("obj-dry-left", 80.0, 520.0)
        put("obj-dry-right", 180.0, 520.0)
        for prefix, y, label in (
            ("obj-bus-number", 100.0, "obj-bus-label"),
            ("obj-source-mode", 190.0, "obj-source-label"),
            ("obj-channel-count", 280.0, "obj-width-label"),
            ("obj-source-first", 370.0, "obj-source-first-label"),
            ("obj-destination-first", 460.0,
             "obj-destination-first-label"),
        ):
            menu_row(prefix, y, label)
        put("obj-width-fanout-trigger", 1400.0, 280.0)
        put("obj-from-fanout-trigger", 1400.0, 370.0)
        put("obj-source-last-label", 800.0, 525.0)
        for object_id, x in (
            ("obj-source-last-display", 800.0),
            ("obj-source-last-values", 940.0),
            ("obj-source-last-calculate", 1050.0),
            ("obj-source-last-set", 1320.0),
        ):
            put(object_id, x, 550.0)
        stack(("obj-route-values", "obj-route-order", "obj-route-unpack",
               "obj-route-rebuild", "obj-route-clear", "obj-route-iterate",
               "obj-route-index", "obj-route-source",
               "obj-route-destination"), 800.0, 680.0, 55.0)
        put("obj-route-source-valid", 1250.0, 1065.0)
        put("obj-route-cell", 1350.0, 1065.0)
        stack(("obj-device", "obj-device-startup-trigger",
               "obj-bus-insert", "obj-bus-symbol", "obj-bus-send"),
              800.0, 1250.0, 60.0)
        put("obj-bus-mode", 1060.0, 1490.0)
        stack(("obj-init", "obj-init-defer", "obj-init-trigger"),
              800.0, 1610.0, 60.0)
        stack(("obj-bus-output", "obj-source-output", "obj-width-output",
               "obj-source-first-output", "obj-destination-first-output",
               "obj-dry-output"), 1010.0, 1610.0, 55.0)
        stack(("obj-bus-number-replay-ready", "obj-bus-number-replay-delay",
               "obj-bus-number-replay-order", "obj-bus-number-replay-close",
               "obj-bus-number-replay-open",
               "obj-bus-number-menu-write-gate"),
              1400.0, 1610.0, 60.0)
        patch["rect"] = [120.0, 90.0, 2500.0, 2100.0]
    else:
        put("obj-ui-background", 1800.0, 40.0)
        put("obj-plugin", 80.0, 100.0)
        put("obj-monitor-left", 80.0, 260.0)
        put("obj-monitor-right", 250.0, 260.0)
        put("obj-plugout", 80.0, 430.0)
        menu_row("obj-bus-number", 100.0, "obj-bus-label")
        menu_row("obj-monitor-pair", 190.0, "obj-monitor-label")
        stack(("obj-device", "obj-identity-start", "obj-identity-retry",
               "obj-identity-tick", "obj-identity-query",
               "obj-identity-path", "obj-identity-defer",
               "obj-identity-route", "obj-identity-valid",
               "obj-identity-attach", "obj-identity-to-buses"),
              800.0, 330.0, 60.0)
        put("obj-bus-symbol", 1130.0, 870.0)
        put("obj-chain-start-trigger", 1130.0, 950.0)
        put("obj-bus-receive", 800.0, 1010.0)
        put("obj-chain-send", 1130.0, 1010.0)
        put("obj-chain-mode", 1230.0, 950.0)
        put("obj-identity-stop", 1400.0, 1070.0)
        stack(("obj-init", "obj-init-defer", "obj-init-trigger"),
              800.0, 1170.0, 60.0)
        put("obj-bus-output", 1020.0, 1290.0)
        put("obj-monitor-output", 1130.0, 1290.0)
        stack(("obj-bus-number-replay-ready", "obj-bus-number-replay-delay",
               "obj-bus-number-replay-order", "obj-bus-number-replay-close",
               "obj-bus-number-replay-open",
               "obj-bus-number-menu-write-gate"),
              1400.0, 1170.0, 60.0)
        patch["rect"] = [120.0, 90.0, 2300.0, 1700.0]

    missing = set(boxes) - placed
    if missing:
        raise ValueError(f"{name}: unplaced debug-view objects: {sorted(missing)}")


def write_device(name: str, document: dict[str, object]) -> None:
    arrange_ambi36_debug_view(name, document)
    SOURCE_DIR.mkdir(parents=True, exist_ok=True)
    DEVICE_DIR.mkdir(parents=True, exist_ok=True)
    text = json.dumps(document, indent=2, ensure_ascii=False) + "\n"
    source_path = SOURCE_DIR / f"{name}.maxpat"
    if not source_path.exists() or source_path.read_text(encoding="utf-8") != text:
        source_path.write_text(text, encoding="utf-8")
    payload = text.encode("utf-8") + b"\0"
    header = struct.pack(
        "<4sI4s4sII4sI",
        b"ampf",
        4,
        b"aaaa",
        b"meta",
        4,
        1,
        b"ptch",
        len(payload),
    )
    device_path = DEVICE_DIR / f"{name}.amxd"
    data = header + payload
    if not device_path.exists() or device_path.read_bytes() != data:
        device_path.write_bytes(data)


DRUM_INSTRUMENT_SPECS = (
    ("Kick", 1, "Tune", 20, 180, 48, 8, "Decay", .02, 8, .85, 26, -6),
    ("Snare", 1, "Tune", 70, 420, 180, 8, "Decay", .02, 3, .42, 26, -6),
    ("Floor Tom", 1, "Tune", 35, 180, 72, 8, "Decay", .04, 4, .70, 26, -6),
    ("Concert Bass", 1, "Tune", 24, 96, 44, 9, "Decay", .15, 8, 3.20, 28, -6),
    ("Toms", 1, "Low Tune", 40, 180, 82, 10, "Decay", .03, 3, .65, 26, -6),
    ("Hi-Hat", 1, "Tune", 320, 3200, 1180, 9, "Closed Decay", .03, 1, .18, 26, -8),
    ("Clap", 1, "Tone", 700, 10000, 3900, 10, "Tail Decay", .025, 2, .18, 26, -7.5),
    ("Cowbell", 1, "Tune", 180, 2400, 560, 7, "Decay", .025, 2, .24, 26, -8),
    ("Crash", 1, "Tune", 180, 2400, 720, 9, "Decay", .08, 8, 1.30, 26, -11),
    ("Break", 1, "Kick Tune", 28, 96, 52, 4, "Kick Decay", .05, 2, .42, 26, -8),
)

# Stable IDs, ranges and defaults from the seven stereo Sample CLAP
# descriptors. Multichannel siblings use different plugin IDs and are not
# part of this zero-input Live instrument family.
SAMPLE_INSTRUMENT_SPECS = (
    ("Player", (
        FixedParameter(13, "Gain", "Gain", -60, 12, -6),
        FixedParameter(6, "Tune", "Tune", -60, 60, 0),
        FixedParameter(14, "Pan", "Pan", -1, 1, 0),
    )),
    ("Doubles", (
        FixedParameter(1, "Speed", "Speed", -24, 12, -7),
        FixedParameter(9, "Crossfader", "Xfade", -1, 1, -1),
        FixedParameter(11, "Out", "Out", -60, 12, -6),
    )),
    ("Wavesets", (
        FixedParameter(1, "Out", "Out", -60, 12, -6),
        FixedParameter(11, "Tune", "Tune", -60, 60, 0),
        FixedParameter(17, "Group", "Group", 0, 5, 3, "int"),
    )),
    ("Motion", (
        FixedParameter(1, "Out", "Out", -60, 12, -6),
        FixedParameter(8, "Motion Rate", "Rate", .01, 80, 1),
        FixedParameter(19, "Tune", "Tune", -60, 60, 0),
    )),
    ("Lanes", (
        FixedParameter(1, "Out", "Out", -60, 12, -6),
        FixedParameter(4, "Rate", "Rate", .01, 80, 1),
        FixedParameter(20, "Tune", "Tune", -60, 60, 0),
    )),
    ("Grains", (
        FixedParameter(1, "Out", "Out", -60, 12, -6),
        FixedParameter(48, "Density", "Density", .1, 160, 24),
        FixedParameter(49, "Grain Size", "Size", 8, 4000, 90),
    )),
    ("Cutups", (
        FixedParameter(1, "Out", "Out", -60, 12, -6),
        FixedParameter(4, "Free Rate", "Rate", .1, 80, 8),
        FixedParameter(20, "Tune", "Tune", -60, 60, 0),
    )),
)


def main() -> None:
    generate_s3g_routing()
    write_device("s3g Send Stereo to 32ch Bus", multichannel_send_device())
    write_device("s3g Send Multichannel to 32ch Bus",
                 multichannel_to_bus_send_device())
    write_device("s3g Send Stereo to Drum 16ch Bus", multichannel_send_device(
        slot_count=DRUM_SLOT_COUNT, bus_prefix=DRUM_BUS_PREFIX,
        title="s3g Send Stereo to Drum 16ch Bus",
    ))
    write_device("s3g Multichannel Receive", multichannel_receive_device())
    write_device(
        "s3g Bus Send 36",
        multichannel_to_bus_send_device(
            slot_count=FIFTH_ORDER_SLOT_COUNT, bus_prefix="s3g-bus36",
            title="s3g Bus Send 36",
        ),
    )
    write_device(
        "s3g Bus Receive 36",
        multichannel_receive_device(
            slot_count=FIFTH_ORDER_SLOT_COUNT, bus_prefix="s3g-bus36",
            title="s3g Bus Receive 36",
        ),
    )
    write_device("s3g 3OA Source", source_device())
    write_device("s3g 3OA Encoder Path", path_encoder_device())
    for name, plugin_name, plugin_id, parameters, order_id in (
        ("s3g 3OA Encoder Point", "s3g Ambi Encoder Point 64",
         "org.s3g.s3g-dsp.ambi-point-encoder-64", POINT_PARAMETERS, 28),
        ("s3g 3OA Encoder Cloud", "s3g Ambi Encoder Cloud 64",
         "org.s3g.s3g-dsp.ambi-cloud-encoder-64", CLOUD_PARAMETERS, 4),
        ("s3g 3OA Encoder Surface Terrain",
         "s3g Ambi Encoder Surface Terrain 64",
         "org.s3g.s3g-dsp.ambi-terrain-navigator-64", TERRAIN_PARAMETERS, 1),
    ):
        write_device(name, path_encoder_device(
            name, plugin_name, plugin_id, parameters, order_id,
        ))
    for name, plugin_name, plugin_id, inputs, parameters in (
        ("s3g 3OA Encoder Cartography",
         "s3g Ambi Encoder Cartography 64",
         "org.s3g.s3g-dsp.ambi-cartography-encoder-64", 2,
         CARTOGRAPHY_PARAMETERS),
        ("s3g 3OA Encoder Ray", "s3g Ambi Encoder Ray 64",
         "org.s3g.s3g-dsp.ambi-ray-encoder", 1, RAY_PARAMETERS),
        ("s3g 3OA Encoder Ray Bilocation",
         "s3g Ambi Encoder Ray Bilocation 64",
         "org.s3g.s3g-dsp.ambi-ray-bilocation-encoder", 1,
         RAY_BILOCATION_PARAMETERS),
    ):
        write_device(name, track_input_encoder_device(
            name, plugin_name, plugin_id, inputs, parameters,
        ))
    for name, plugin_name, plugin_id, parameters, topology in (
        ("s3g 3OA Encoder Modal", "s3g Ambi Encoder Modal 16",
         "org.s3g.s3g-dsp.accelerometer-field-encoder-16",
         MODAL_PARAMETERS, ((28, 3), (29, 0))),
        ("s3g 3OA Encoder Medium", "s3g Ambi Encoder Medium 16",
         "org.s3g.s3g-dsp.ambi-encoder-medium-16",
         MEDIUM_PARAMETERS, ((1, 3),)),
    ):
        write_device(name, track_input_encoder_device(
            name, plugin_name, plugin_id, 1, parameters,
            midi_input=True, topology=topology,
        ))
    for (kind, plugin_name, plugin_id, order_id, midi_input,
         parameters, topology) in INSTRUMENT_ENCODERS:
        name = f"s3g 3OA Encoder {kind}"
        write_device(name, instrument_encoder_device(
            name, plugin_name, plugin_id, parameters, order_id,
            midi_input, topology,
        ))
    write_device("s3g 3OA Insert", insert_device())
    for kind, plugin_name, plugin_id, order_id, parameters in EFFECT_SPECS:
        name = f"s3g 3OA Effect {kind}"
        write_device(name, fixed_effect_insert_device(
            name, plugin_name, plugin_id, order_id, parameters,
        ))
    write_device("s3g 3OA Decoder Main", master_device())
    write_device("s3g 3OA Decoder Speaker Main", speaker_main_out_device())
    for kind, plugin_name, plugin_id, parameters in (
        ("Head", "s3g Ambi Decoder Head 2",
         "org.s3g.s3g-dsp.ambisonic-head-decoder", HEAD_PARAMETERS),
        ("Stereo", "s3g Ambi Decoder Stereo 2",
         "org.s3g.s3g-dsp.ambisonic-stereo-decoder", STEREO_PARAMETERS),
    ):
        name = f"s3g 3OA Decoder {kind} Main"
        write_device(name, stereo_decoder_main_device(
            name, plugin_name, plugin_id, parameters,
        ))
    for kind, plugin_name, plugin_id, order_id, parameters in (
            MULTICHANNEL_DECODER_SPECS):
        name = f"s3g 3OA Decoder {kind} Main"
        write_device(name, multichannel_decoder_main_device(
            name, plugin_name, plugin_id, order_id, parameters,
        ))
    for kind, plugin_id in PANNER_SPECS:
        name = f"s3g Panner {kind} Main"
        write_device(name, panner_main_device(kind, plugin_id))
    write_device("s3g Output Autogain Stereo", output_autogain_stereo_device())
    write_device("s3g Output Autogain Quad Main",
                 output_autogain_quad_main_device())
    for (kind, primary_id, primary_name, primary_min, primary_max,
         primary_default, decay_id, decay_name, decay_min, decay_max,
         decay_default, output_id, output_default) in DRUM_INSTRUMENT_SPECS:
        slug = kind.lower().replace(" ", "-")
        name = f"s3g Drum {kind}"
        write_device(name, drum_instrument_device(
            name, f"{name} 2", f"org.s3g.s3g-dsp.drum-{slug}", (
                FixedParameter(primary_id, primary_name, primary_name[:8],
                               primary_min, primary_max, primary_default),
                FixedParameter(decay_id, decay_name, decay_name[:8],
                               decay_min, decay_max, decay_default),
                FixedParameter(output_id, "Output Gain", "Output",
                               -36, 12, output_default),
            ), output_id + 1,
        ))
    for kind, parameter_specs in (
        ("Overload", (
            FixedParameter(3, "Overload", "Overload", 0, 1, .62),
            FixedParameter(11, "Mix", "Mix", 0, 1, .82),
            FixedParameter(12, "Output", "Output", -36, 12, -6),
        )),
        ("Echo", (
            FixedParameter(3, "Free Time", "Time", 20, 1800, 180),
            FixedParameter(4, "Feedback", "Feedback", 0, .92, .38),
            FixedParameter(12, "Mix", "Mix", 0, 1, .35),
            FixedParameter(13, "Output", "Output", -36, 12, -3),
        )),
    ):
        name = f"s3g Drum {kind}"
        write_device(name, drum_effect_device(
            name, f"{name} 2", f"org.s3g.s3g-dsp.drum-{kind.lower()}",
            parameter_specs,
        ))
    write_device("s3g Drum Mixer 16", drum_mixer_device())
    for kind, parameters in SAMPLE_INSTRUMENT_SPECS:
        name = f"s3g Sample {kind} 2"
        write_device(name, sample_instrument_device(
            name, f"org.s3g.s3g-dsp.sample-{kind.lower()}", parameters,
        ))
    write_device("s3g Sample Circulator 2", sample_circulator_device())


if __name__ == "__main__":
    main()
