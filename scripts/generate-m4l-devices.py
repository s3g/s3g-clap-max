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

DEVICE_WIDTH = 425.0
COMPACT_DEVICE_HEIGHT = 169.0
MAIN_OUT_DEVICE_HEIGHT = 169.0
UI_FONT = "Menlo"

COLOR_BACKGROUND = [0.05098, 0.05098, 0.05098, 1.0]
COLOR_STRIP = [0.09412, 0.09412, 0.09412, 1.0]
COLOR_CELL = [0.15294, 0.15294, 0.15294, 1.0]
COLOR_GRID = [0.4, 0.4, 0.4, 1.0]
COLOR_DIM = [0.62745, 0.62745, 0.62745, 1.0]
COLOR_TEXT = [0.82745, 0.82745, 0.82745, 1.0]
COLOR_ACCENT = [0.77255, 0.77255, 0.77255, 1.0]
COLOR_LABEL = [0.71765, 0.71765, 0.71765, 1.0]
COLOR_VALUE = [0.63922, 0.63922, 0.63922, 1.0]
COLOR_BUTTON = [0.28235, 0.28235, 0.28235, 1.0]

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
    FixedParameter(3, "Active Paths", "Paths", 1, 16, 1, "int"),
    FixedParameter(4, "Selected Path", "Path", 1, 16, 1, "int"),
    FixedParameter(5, "Selected Source", "Source", 1, 64, 1, "int"),
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
                "Receives the 16-channel Ambisonics bus and acknowledges the "
                "destination without rejecting it based on Live device order."
            )


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
        if destination_name == "s3g.live.routing.channel_selector.maxpat":
            for entry in document["patcher"]["boxes"]:
                current = entry["box"]
                if current.get("id") == "obj-20":
                    current["patching_rect"] = [0.0, -2.0, 64.0, 20.0]
                    current["presentation_rect"] = [0.0, -2.0, 64.0, 20.0]
                    current["bgcolor"] = [0.0, 0.0, 0.0, 0.0]
                    current["textcolor"] = COLOR_VALUE
                    current["elementcolor"] = COLOR_DIM
                    current["fontname"] = UI_FONT
                    current["fontsize"] = 8.0
                elif current.get("id") == "obj-11":
                    current["patching_rect"] = [0.0, 0.0, 64.0, 16.0]
                    current["presentation_rect"] = [0.0, 0.0, 64.0, 16.0]
                    current["bgcolor"] = COLOR_CELL
                    current["bordercolor"] = COLOR_GRID
                    current["rounded"] = 0
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


def clap_state_parameter() -> dict[str, object]:
    # A parameter-enabled pattr is the Live Blob carrier. State is transferred
    # explicitly with getstate/setstate because Live does not ask a bound MSP
    # external for getvalueof reliably while serializing an AMXD instance.
    return new_object(
        "obj-clap-state",
        "pattr clap_state @autorestore 1 @thru 2",
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


def fixed_parameter_box(parameter: FixedParameter, order: int) -> dict[str, object]:
    object_id = f"obj-param-{parameter.clap_id}"
    attributes: dict[str, object] = {
        "parameter_longname": parameter.name,
        "parameter_shortname": parameter.short_name,
        "parameter_initial_enable": 1,
        "parameter_initial": [parameter.default],
        "parameter_invisible": 0,
        "parameter_mmin": parameter.minimum,
        "parameter_mmax": parameter.maximum,
        "parameter_modmode": 0,
        "parameter_order": order,
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

    Hidden live.numbox objects are native Live parameters, so automation and
    Set restore leave their outlets and reach CLAP directly. Plugin/editor
    values return through `set $1`, which updates Live without feedback. A
    delayed getparams pass synchronizes them after topology is applied.
    """
    ids = " ".join(str(parameter.clap_id) for parameter in parameters)
    boxes = [
        new_object("obj-param-gate", "gate 1 0", 650.0, 650.0, 65.0, 2, 1),
        box("obj-param-enable", "message", [650.0, 615.0, 30.0, 22.0], text="1"),
        new_object("obj-param-loaded-trigger", "t b b b", 650.0, 400.0,
                   55.0, 1, 3, ["bang", "bang", "bang"]),
        new_object("obj-param-resync-delay", "delay 50", 720.0, 470.0,
                   62.0, 1, 1, ["bang"]),
        box("obj-param-getparams", "message", [720.0, 505.0, 70.0, 22.0],
            text="getparams"),
        new_object("obj-paramchanged-route", f"route {ids}", 805.0, 435.0,
                   290.0, 1, len(parameters) + 1),
        new_object("obj-paraminfo-skip-index", "zl.slice 1", 650.0, 540.0,
                   62.0, 2, 2, ["list", "list"]),
        new_object("obj-paraminfo-route", f"route {ids}", 805.0, 540.0,
                   290.0, 1, len(parameters) + 1),
    ]
    lines = [
        line("obj-route-status", 2, "obj-param-loaded-trigger", 0),
        # trigger runs right-to-left: topology, gate enable, then resync.
        line("obj-param-loaded-trigger", 1, "obj-param-enable", 0),
        line("obj-param-enable", 0, "obj-param-gate", 0),
        line("obj-param-loaded-trigger", 0, "obj-param-resync-delay", 0),
        line("obj-param-resync-delay", 0, "obj-param-getparams", 0),
        line("obj-param-getparams", 0, "obj-clap", 0),
        line("obj-param-gate", 0, "obj-clap", 0),
        line("obj-route-status", 3, "obj-paramchanged-route", 0),
        line("obj-route-status", 4, "obj-paraminfo-skip-index", 0),
        line("obj-paraminfo-skip-index", 1, "obj-paraminfo-route", 0),
    ]

    for index, parameter in enumerate(parameters, 1):
        parameter_id = parameter.clap_id
        parameter_object_id = f"obj-param-{parameter_id}"
        message_id = f"obj-param-message-{parameter_id}"
        value_id = f"obj-paraminfo-value-{parameter_id}"
        reflect_id = f"obj-param-reflect-{parameter_id}"
        boxes.extend([
            fixed_parameter_box(parameter, index),
            box(message_id, "message", [1120.0, 95.0 + index * 30.0,
                                        105.0, 22.0],
                text=f"paramid {parameter_id} $1"),
            new_object(value_id, "zl.nth 1", 1120.0, 540.0 + index * 25.0,
                       55.0, 2, 2, ["", "list"]),
            box(reflect_id, "message", [1190.0, 540.0 + index * 25.0,
                                         55.0, 22.0], text="set $1"),
        ])
        lines.extend([
            line(parameter_object_id, 0, message_id, 0),
            line(message_id, 0, "obj-param-gate", 1),
            line(parameter_object_id, 0, "obj-state-change-bang", 0),
            line("obj-paramchanged-route", index - 1, reflect_id, 0),
            line("obj-paraminfo-route", index - 1, value_id, 0),
            line(value_id, 0, reflect_id, 0),
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
        presentation_rect=[362.0, 7.0, 54.0, 17.0],
        text="NEXT OFF",
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
        textcolor=COLOR_BACKGROUND,
        textoffcolor=COLOR_DIM,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=8.0,
        rounded=0.0,
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
            [x, y, 30.0, 16.0],
            text=f"{first_channel:02d}/{first_channel + 1:02d}",
            presentation_rect=[x, y, 30.0, 16.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_DIM,
        ),
        box(
            f"obj-output-selector-{pair_index}",
            "bpatcher",
            [x + 30.0, y, 64.0, 16.0],
            presentation_rect=[x + 30.0, y, 64.0, 16.0],
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


def routing_summary_panel(values: list[tuple[str, str, float, float]]) -> list[dict[str, object]]:
    boxes = [
        ui_panel("obj-routing-panel", [8.0, 36.0, 409.0, 54.0],
                 COLOR_BACKGROUND, border=1),
        ui_panel("obj-routing-strip", [9.0, 37.0, 407.0, 19.0], COLOR_STRIP),
        ui_panel("obj-routing-accent", [8.0, 36.0, 409.0, 2.0], COLOR_ACCENT),
        box(
            "obj-routing-heading",
            "comment",
            [16.0, 39.0, 150.0, 16.0],
            text="SIGNAL ROUTING",
            presentation_rect=[16.0, 39.0, 150.0, 16.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_LABEL,
        ),
    ]
    for index, (label, value, x, width) in enumerate(values, 1):
        boxes.extend([
            box(
                f"obj-routing-label-{index}",
                "comment",
                [x, 64.0, 34.0, 16.0],
                text=label,
                presentation_rect=[x, 64.0, 34.0, 16.0],
                fontname=UI_FONT,
                fontsize=8.0,
                textcolor=COLOR_DIM,
            ),
            box(
                f"obj-routing-value-{index}",
                "comment",
                [x + 34.0, 64.0, width - 34.0, 16.0],
                text=value,
                presentation_rect=[x + 34.0, 64.0, width - 34.0, 16.0],
                fontname=UI_FONT,
                fontsize=8.0,
                textcolor=COLOR_VALUE,
            ),
        ])
    return boxes


def input_mute_button(
    channel: int,
    x: float,
    parameter_prefix: str = "Source",
) -> dict[str, object]:
    parameter_name_prefix = "" if parameter_prefix == "Source" else f"{parameter_prefix} "
    return box(
        f"obj-input-mute-{channel}",
        "live.text",
        [470.0, 340.0 + channel * 30.0, 70.0, 22.0],
        presentation_rect=[x, 121.0, 57.0, 32.0],
        text=f"{channel} LIVE",
        texton=f"{channel} MUTE",
        automation="Live",
        automationon="Mute",
        numinlets=1,
        numoutlets=2,
        outlettype=["", ""],
        parameter_enable=1,
        annotation=(
            f"Mute {parameter_prefix} input channel {channel} before the CLAP encoder. "
            "The ordinary stereo passthrough remains audible."
        ),
        annotation_name=f"{parameter_prefix} input {channel} mute",
        mode=1,
        activebgcolor=COLOR_CELL,
        activebgoncolor=COLOR_ACCENT,
        activetextcolor=COLOR_DIM,
        activetextoncolor=COLOR_BACKGROUND,
        bgcolor=COLOR_CELL,
        bgoncolor=COLOR_ACCENT,
        textcolor=COLOR_BACKGROUND,
        textoffcolor=COLOR_DIM,
        bordercolor=COLOR_GRID,
        focusbordercolor=COLOR_ACCENT,
        fontname=UI_FONT,
        fontsize=8.0,
        rounded=0.0,
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


def source_input_monitor_ui(parameter_prefix: str = "Source") -> list[dict[str, object]]:
    return [
        ui_panel("obj-input-panel", [8.0, 98.0, 409.0, 63.0],
                 COLOR_BACKGROUND, border=1),
        ui_panel("obj-input-strip", [9.0, 99.0, 407.0, 19.0], COLOR_STRIP),
        ui_panel("obj-input-accent", [8.0, 98.0, 409.0, 2.0], COLOR_ACCENT),
        box(
            "obj-input-heading",
            "comment",
            [16.0, 101.0, 230.0, 16.0],
            text="STEREO INPUT · GAIN PRE-MUTE",
            presentation_rect=[16.0, 101.0, 230.0, 16.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_LABEL,
        ),
        box(
            "obj-input-meter",
            "live.gain~",
            [125.0, 220.0, 250.0, 42.0],
            presentation_rect=[16.0, 121.0, 268.0, 32.0],
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
        input_mute_button(1, 292.0, parameter_prefix),
        input_mute_button(2, 354.0, parameter_prefix),
    ]


def common_ui(
    title: str,
    with_route: bool,
    presentation_height: float,
    locked_label: str | None = None,
) -> list[dict[str, object]]:
    boxes = [
        ui_panel("obj-ui-background", [0.0, 0.0, DEVICE_WIDTH, presentation_height],
                 COLOR_BACKGROUND),
        ui_panel("obj-title-strip", [0.0, 0.0, DEVICE_WIDTH, 30.0], COLOR_STRIP),
        ui_panel("obj-title-accent", [0.0, 0.0, DEVICE_WIDTH, 2.0], COLOR_ACCENT),
        box(
            "obj-title",
            "comment",
            [20.0, 20.0, 300.0, 24.0],
            text=title,
            presentation_rect=[10.0, 6.0, 152.0, 18.0],
            fontname=UI_FONT,
            fontsize=10.5,
            textcolor=COLOR_TEXT,
        ),
    ]
    if locked_label is None:
        boxes.append(box(
            "obj-load-button",
            "textbutton",
            [20.0, 80.0, 65.0, 24.0],
            presentation_rect=[166.0, 7.0, 62.0, 17.0],
            text="LOAD CLAP",
            texton="LOAD CLAP",
            fontname=UI_FONT,
            fontsize=8.0,
            fontface=0,
            bgcolor=COLOR_BUTTON,
            textcolor=COLOR_LABEL,
            rounded=0.0,
        ))
    else:
        boxes.append(box(
            "obj-fixed-label",
            "textbutton",
            [20.0, 80.0, 65.0, 24.0],
            presentation_rect=[166.0, 7.0, 62.0, 17.0],
            text=locked_label,
            texton=locked_label,
            ignoreclick=1,
            fontname=UI_FONT,
            fontsize=8.0,
            fontface=0,
            bgcolor=COLOR_CELL,
            textcolor=COLOR_DIM,
            rounded=0.0,
        ))
    boxes.extend([
        box(
            "obj-gui-button",
            "textbutton",
            [95.0, 80.0, 65.0, 24.0],
            presentation_rect=[233.0, 7.0, 56.0, 17.0],
            text="EDITOR",
            texton="EDITOR",
            fontname=UI_FONT,
            fontsize=8.0,
            fontface=0,
            bgcolor=COLOR_BUTTON,
            textcolor=COLOR_LABEL,
            rounded=0.0,
        ),
        box(
            "obj-latency-label",
            "comment",
            [170.0, 80.0, 90.0, 22.0],
            text="LAT",
            presentation_rect=[298.0, 7.0, 20.0, 17.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_DIM,
        ),
        box(
            "obj-latency-number",
            "number",
            [265.0, 80.0, 60.0, 22.0],
            presentation_rect=[319.0, 7.0, 38.0, 17.0],
            minimum=0,
            fontname=UI_FONT,
            fontsize=8.0,
            bgcolor=COLOR_CELL,
            textcolor=COLOR_VALUE,
            border=1,
            triangle=0,
            ignoreclick=1,
        ),
    ])
    if locked_label is None:
        boxes.append(box(
            "obj-open", "message", [20.0, 118.0, 42.0, 22.0], text="open"
        ))
    boxes.append(box(
        "obj-editor", "message", [95.0, 118.0, 54.0, 22.0], text="editor 1"
    ))
    if with_route:
        boxes.append(route_toggle())
    else:
        boxes.append(
            box(
                "obj-output-count",
                "comment",
                [365.0, 7.0, 48.0, 17.0],
                text="32CH",
                presentation_rect=[365.0, 7.0, 48.0, 17.0],
                fontname=UI_FONT,
                fontsize=8.0,
                textcolor=COLOR_DIM,
                textjustification=2,
            )
        )
    return boxes


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
        line("obj-route-status", 0, "obj-latency-number", 0),
        line("obj-latency-message", 0, "obj-thispatcher", 0),
        line("obj-route-status", 1, "obj-print", 0),
        line("obj-loadbang", 0, "obj-delayed-load", 0),
        line("obj-delayed-load", 0, "obj-default-open", 0),
        line("obj-default-open", 0, "obj-clap", 0),
        line("obj-clap-state", 0, "obj-state-valid", 0),
        line("obj-state-valid", 0, "obj-state-restore", 0),
        line("obj-state-restore", 0, "obj-clap", 0),
        line("obj-route-status", state_outlet, "obj-clap-state", 0),
        line("obj-route-status", 2, "obj-state-change-bang", 0),
        line("obj-route-status", 3, "obj-state-change-bang", 0),
        line("obj-route-status", statechanged_outlet,
             "obj-state-change-bang", 0),
        line("obj-state-change-bang", 0, "obj-state-capture-delay", 0),
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


def patcher(title: str, description: str, boxes: list[dict[str, object]],
            lines: list[dict[str, object]], with_route: bool,
            presentation_height: float = COMPACT_DEVICE_HEIGHT) -> dict[str, object]:
    parameters: dict[str, object] = {
        "obj-clap-state": ["CLAP State", "CLAP State", 0],
        "parameterbanks": {},
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
            "openrect": [0.0, 0.0, DEVICE_WIDTH, presentation_height],
            "openinpresentation": 1,
            "devicewidth": DEVICE_WIDTH,
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
                "amxdtype": 1633771873,
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
    for parameter in parameters:
        registry[f"obj-param-{parameter.clap_id}"] = [
            parameter.name,
            parameter.short_name,
            0,
        ]


def source_device() -> dict[str, object]:
    boxes = common_ui(
        "s3g CLAP 3OA SOURCE",
        True,
        COMPACT_DEVICE_HEIGHT,
    )
    boxes.extend(routing_summary_panel([
        ("INPUT", "STEREO 1–2", 16.0, 112.0),
        ("3OA", "ACN/SN3D 3–18", 136.0, 137.0),
        ("BUS", "MAIN", 282.0, 92.0),
    ]))
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
        "s3g CLAP 3OA Source",
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


def path_encoder_device() -> dict[str, object]:
    boxes = common_ui(
        "s3g CLAP 3OA PATH",
        True,
        COMPACT_DEVICE_HEIGHT,
        locked_label="PATH 18P",
    )
    boxes.extend(routing_summary_panel([
        ("INPUT", "STEREO 1–2", 16.0, 112.0),
        ("3OA", "ACN/SN3D 3–18", 136.0, 137.0),
        ("BUS", "MAIN", 282.0, 92.0),
    ]))
    boxes.extend(source_input_monitor_ui("Path"))
    boxes.extend([
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
        new_object("obj-plugout", "plugout~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 365.0, 320.0, 18, 18, ["signal"] * 18),
        new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0,
                   125.0, 1, 1),
        new_object("obj-bus-send", "s3g.bus.send master", 470.0, 230.0,
                   125.0, 3, 0),
    ])
    runtime_boxes, runtime_lines = common_runtime(
        16,
        "s3g Ambi Encoder Path 64",
        allow_plugin_picker=False,
        fixed_parameters=True,
        default_plugin_id="org.s3g.s3g-dsp.ambi-path-encoder-64",
    )
    parameter_boxes, parameter_lines = fixed_parameter_runtime(
        PATH_PARAMETERS,
        ((1, 2), (2, 3)),
    )
    boxes.extend(runtime_boxes)
    boxes.extend(parameter_boxes)
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
    lines.extend(parameter_lines)
    document = patcher(
        "s3g CLAP 3OA Path Encoder",
        (
            "Fixed stereo Path 64 encoder wrapper: forces two inputs and "
            "third-order ACN/SN3D output, exposes stable CLAP parameters to "
            "Live, and publishes to the private s3g master bus."
        ),
        boxes,
        lines,
        True,
    )
    document["patcher"]["parameters"].update({
        "obj-input-meter": ["Path Input Gain", "Input Gain", 0],
        "obj-input-mute-1": ["Path Input 1 Mute", "In 1 Mute", 0],
        "obj-input-mute-2": ["Path Input 2 Mute", "In 2 Mute", 0],
    })
    register_fixed_parameters(document, PATH_PARAMETERS)
    return document


def insert_device() -> dict[str, object]:
    boxes = common_ui(
        "s3g CLAP 3OA INSERT",
        True,
        COMPACT_DEVICE_HEIGHT,
    )
    boxes.extend(routing_summary_panel([
        ("1–2", "PASS", 16.0, 88.0),
        ("3OA", "PROCESS 3–18", 116.0, 140.0),
        ("BUS", "MAIN", 282.0, 92.0),
    ]))
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
        "s3g CLAP 3OA Insert",
        "Hosts an s3g CLAP processor in the 16-channel ACN/SN3D portion of the private s3g device chain.",
        boxes,
        lines,
        True,
    )


def master_device() -> dict[str, object]:
    boxes = common_ui(
        "s3g CLAP 3OA MAIN OUT",
        False,
        MAIN_OUT_DEVICE_HEIGHT,
    )
    boxes.extend(
        [
            ui_panel("obj-output-panel", [8.0, 36.0, 409.0, 125.0],
                     COLOR_BACKGROUND, border=1),
            ui_panel("obj-output-strip", [9.0, 37.0, 407.0, 19.0], COLOR_STRIP),
            ui_panel("obj-output-accent", [8.0, 36.0, 409.0, 2.0], COLOR_ACCENT),
            new_object("obj-plugin", "plugin~ " + " ".join(str(i) for i in range(1, 19)),
                       40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
            clap_box("s3g.clap~ 16 32", 125.0, 300.0, 16, 32),
            new_object("obj-plugout", "plugout~ " + " ".join(str(i) for i in range(1, 35)),
                       40.0, 365.0, 560.0, 34, 34, ["signal"] * 34),
            new_object("obj-device", "s3g.live.thisdevice", 470.0, 180.0, 125.0, 1, 1),
            new_object("obj-device-split", "t l l", 470.0, 215.0, 35.0, 1, 2),
            new_object("obj-once", "s3g.live.once", 560.0, 260.0, 90.0, 1, 1),
            output_initializer_box(),
            new_object("obj-bus-receive", "s3g.bus.receive master", 470.0, 230.0, 140.0, 1, 1),
            box(
                "obj-output-heading",
                "comment",
                [16.0, 39.0, 220.0, 16.0],
                text="HARDWARE OUTPUT PAIRS",
                presentation_rect=[16.0, 39.0, 220.0, 16.0],
                fontname=UI_FONT,
                fontsize=8.0,
                textcolor=COLOR_LABEL,
            ),
            box(
                "obj-output-format",
                "comment",
                [286.0, 39.0, 121.0, 16.0],
                text="DECODER 1–32",
                presentation_rect=[286.0, 39.0, 121.0, 16.0],
                fontname=UI_FONT,
                fontsize=8.0,
                textcolor=COLOR_DIM,
                textjustification=2,
            ),
        ]
    )
    for pair_index in range(1, 17):
        column = (pair_index - 1) % 4
        row = (pair_index - 1) // 4
        boxes.extend(output_pair_selector(
            pair_index,
            14.0 + column * 101.0,
            61.0 + row * 23.0,
        ))
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
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(32))
    lines.extend(line("obj-device", 0, f"obj-output-selector-{pair_index}", 0)
                 for pair_index in range(1, 17))
    lines.extend(runtime_lines)
    return patcher(
        "s3g CLAP 3OA Main Out",
        "Receives the 16-channel master bus, hosts an s3g CLAP decoder, and routes up to 32 decoded channels directly to selectable Live hardware-output pairs.",
        boxes,
        lines,
        False,
        MAIN_OUT_DEVICE_HEIGHT,
    )


def speaker_main_out_device() -> dict[str, object]:
    boxes = common_ui(
        "s3g CLAP 3OA SPKR OUT",
        False,
        MAIN_OUT_DEVICE_HEIGHT,
        locked_label="SPKR 12P",
    )
    boxes.extend([
        ui_panel("obj-output-panel", [8.0, 36.0, 409.0, 125.0],
                 COLOR_BACKGROUND, border=1),
        ui_panel("obj-output-strip", [9.0, 37.0, 407.0, 19.0], COLOR_STRIP),
        ui_panel("obj-output-accent", [8.0, 36.0, 409.0, 2.0], COLOR_ACCENT),
        new_object("obj-plugin", "plugin~ " + " ".join(
            str(i) for i in range(1, 19)
        ), 40.0, 180.0, 320.0, 18, 18, ["signal"] * 18),
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
        box(
            "obj-output-heading",
            "comment",
            [16.0, 39.0, 220.0, 16.0],
            text="SPEAKER OUTPUT PAIRS",
            presentation_rect=[16.0, 39.0, 220.0, 16.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_LABEL,
        ),
        box(
            "obj-output-format",
            "comment",
            [286.0, 39.0, 121.0, 16.0],
            text="SPEAKER 1–32",
            presentation_rect=[286.0, 39.0, 121.0, 16.0],
            fontname=UI_FONT,
            fontsize=8.0,
            textcolor=COLOR_DIM,
            textjustification=2,
        ),
    ])
    for pair_index in range(1, 17):
        column = (pair_index - 1) % 4
        row = (pair_index - 1) // 4
        boxes.extend(output_pair_selector(
            pair_index,
            14.0 + column * 101.0,
            61.0 + row * 23.0,
        ))
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
    ]
    lines.extend(line("obj-plugin", channel + 2, "obj-clap", channel)
                 for channel in range(16))
    lines.extend(line("obj-clap", channel, "obj-plugout", channel + 2)
                 for channel in range(32))
    lines.extend(line("obj-device", 0, f"obj-output-selector-{pair_index}", 0)
                 for pair_index in range(1, 17))
    lines.extend(runtime_lines)
    lines.extend(parameter_lines)
    document = patcher(
        "s3g CLAP 3OA Speaker Main Out",
        (
            "Receives and sums the private 16-channel s3g master bus, hosts "
            "the fixed third-order Speaker 64 decoder with stable Live "
            "parameters, and routes decoded channels 1–32 to hardware pairs."
        ),
        boxes,
        lines,
        False,
        MAIN_OUT_DEVICE_HEIGHT,
    )
    register_fixed_parameters(document, SPEAKER_PARAMETERS)
    return document


def write_device(name: str, document: dict[str, object]) -> None:
    SOURCE_DIR.mkdir(parents=True, exist_ok=True)
    DEVICE_DIR.mkdir(parents=True, exist_ok=True)
    text = json.dumps(document, indent=2, ensure_ascii=False) + "\n"
    (SOURCE_DIR / f"{name}.maxpat").write_text(text, encoding="utf-8")
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
    (DEVICE_DIR / f"{name}.amxd").write_bytes(header + payload)


def main() -> None:
    generate_s3g_routing()
    write_device("s3g CLAP 3OA Source", source_device())
    write_device("s3g CLAP 3OA Path Encoder", path_encoder_device())
    write_device("s3g CLAP 3OA Insert", insert_device())
    write_device("s3g CLAP 3OA Main Out", master_device())
    write_device("s3g CLAP 3OA Speaker Main Out", speaker_main_out_device())


if __name__ == "__main__":
    main()
