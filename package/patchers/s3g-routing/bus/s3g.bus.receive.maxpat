{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 2,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      1291.0,
      268.0,
      1142.0,
      932.0
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "id": "obj-39",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            60.0,
            117.0,
            97.0,
            20.0
          ],
          "text": "id N <device id>"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            289.0,
            118.0,
            225.0,
            20.0
          ],
          "text": "Bus name to receive (e.g. master, aux-1)"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            255.0,
            571.0,
            72.0,
            22.0
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "",
            ""
          ],
          "patching_rect": [
            244.0,
            246.0,
            41.0,
            22.0
          ],
          "text": "t b s s"
        }
      },
      {
        "box": {
          "id": "obj-bus-input-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            244.0,
            165.0,
            40.0,
            22.0
          ],
          "text": "t s s",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "symbol",
            "symbol"
          ]
        }
      },
      {
        "box": {
          "id": "obj-bus-change",
          "maxclass": "newobj",
          "patching_rect": [
            405.0,
            204.0,
            70.0,
            22.0
          ],
          "text": "zl.change",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-prev-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            405.0,
            246.0,
            36.0,
            22.0
          ],
          "text": "t s b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "symbol",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-prev-name",
          "maxclass": "newobj",
          "patching_rect": [
            510.0,
            286.0,
            40.0,
            22.0
          ],
          "text": "zl.reg",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "anything"
          ]
        }
      },
      {
        "box": {
          "id": "obj-prev-clear",
          "maxclass": "newobj",
          "patching_rect": [
            510.0,
            324.0,
            115.0,
            22.0
          ],
          "text": "sprintf %s clear",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-prev-send",
          "maxclass": "newobj",
          "patching_rect": [
            510.0,
            362.0,
            92.0,
            22.0
          ],
          "text": "s s3g.bus.ack",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-2",
          "index": 0,
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            244.0,
            112.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-13",
          "index": 0,
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            151.0,
            200.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            26.0,
            646.0,
            56.0,
            22.0
          ],
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            26.0,
            720.0,
            81.0,
            22.0
          ],
          "text": "s s3g.bus.ack"
        }
      },
      {
        "box": {
          "id": "obj-track-ready-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            26.0,
            678.0,
            52.0,
            22.0
          ],
          "text": "t b l",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            45.5,
            532.0,
            137.0,
            22.0
          ],
          "text": "s3g.live.object get name"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            26.0,
            463.0,
            29.5,
            22.0
          ],
          "text": "t l l"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            45.5,
            502.0,
            119.0,
            22.0
          ],
          "text": "s3g.live.device_track"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            26.0,
            575.0,
            39.0,
            22.0
          ],
          "text": "join 2"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            116.0,
            352.0,
            24.0,
            22.0
          ],
          "text": "t b"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            26.0,
            431.0,
            40.0,
            22.0
          ],
          "text": "zl.reg"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            26.0,
            610.0,
            86.0,
            22.0
          ],
          "text": "prepend #1"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            ""
          ],
          "patching_rect": [
            26.0,
            246.0,
            30.0,
            22.0
          ],
          "text": "t 1 l"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            116.0,
            278.0,
            69.0,
            22.0
          ],
          "text": "route #1"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            116.0,
            246.0,
            79.0,
            22.0
          ],
          "text": "r s3g.bus.syn"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            116.0,
            319.0,
            54.0,
            22.0
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-8",
          "index": 0,
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            26.0,
            112.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-58",
          "linecount": 4,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            22.0,
            40.0,
            348.0,
            60.0
          ],
          "text": "Receives a named multichannel bus and acknowledges the destination without rejecting it based on Live device order."
        }
      },
      {
        "box": {
          "fontface": 1,
          "fontsize": 14.0,
          "id": "obj-56",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            22.0,
            16.0,
            111.0,
            22.0
          ],
          "text": "s3g.bus.receive"
        }
      },
      {
        "box": {
          "id": "obj-s3g-envelop-credit",
          "maxclass": "comment",
          "text": "Derived from Envelop for Live routing abstractions by Envelop; modified and namespaced by s3g under LGPL-2.1. See the bundled LICENSE.txt.",
          "patching_rect": [
            22.0,
            766.0,
            760.0,
            22.0
          ],
          "fontsize": 9.0,
          "numinlets": 1,
          "numoutlets": 0
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-22",
            0
          ],
          "source": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-20",
            0
          ],
          "source": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "source": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            1
          ],
          "source": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            0
          ],
          "midpoints": [
            35.5,
            314.0,
            125.5,
            314.0
          ],
          "source": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            0
          ],
          "source": [
            "obj-19",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-bus-input-trigger",
            0
          ],
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            0
          ],
          "source": [
            "obj-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-27",
            0
          ],
          "source": [
            "obj-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            0
          ],
          "source": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-20",
            0
          ],
          "source": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-28",
            0
          ],
          "source": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            0
          ],
          "source": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-24",
            0
          ],
          "source": [
            "obj-27",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            1
          ],
          "source": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-16",
            0
          ],
          "source": [
            "obj-3",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            1
          ],
          "source": [
            "obj-3",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            0
          ],
          "midpoints": [
            253.5,
            418.0,
            35.5,
            418.0
          ],
          "source": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            0
          ],
          "destination": [
            "obj-track-ready-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-track-ready-trigger",
            1
          ],
          "destination": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-track-ready-trigger",
            0
          ],
          "destination": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": ["obj-bus-input-trigger", 1],
          "destination": ["obj-bus-change", 0]
        }
      },
      {
        "patchline": {
          "source": ["obj-bus-input-trigger", 0],
          "destination": ["obj-3", 0]
        }
      },
      {
        "patchline": {
          "source": ["obj-bus-change", 0],
          "destination": ["obj-prev-trigger", 0]
        }
      },
      {
        "patchline": {
          "source": ["obj-prev-trigger", 1],
          "destination": ["obj-prev-name", 0]
        }
      },
      {
        "patchline": {
          "source": ["obj-prev-trigger", 0],
          "destination": ["obj-prev-name", 1]
        }
      },
      {
        "patchline": {
          "source": ["obj-prev-name", 0],
          "destination": ["obj-prev-clear", 0]
        }
      },
      {
        "patchline": {
          "source": ["obj-prev-clear", 0],
          "destination": ["obj-prev-send", 0]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "s3g.live.device_track.maxpat",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "s3g.live.object.maxpat",
        "type": "JSON",
        "implicit": 1
      }
    ],
    "autosave": 0,
    "styles": [
      {
        "name": "AudioStatus_Menu",
        "default": {
          "bgfillcolor": {
            "angle": 270.0,
            "autogradient": 0,
            "color": [
              0.294118,
              0.313726,
              0.337255,
              1
            ],
            "color1": [
              0.454902,
              0.462745,
              0.482353,
              0.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "color"
          }
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "Audiomix",
        "default": {
          "bgfillcolor": {
            "angle": 270.0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.376471,
              0.384314,
              0.4,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "gradient"
          }
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "Luca",
        "default": {
          "accentcolor": [
            0.32549,
            0.345098,
            0.372549,
            1.0
          ],
          "bgcolor": [
            0.904179,
            0.895477,
            0.842975,
            0.56
          ],
          "bgfillcolor": {
            "angle": 270.0,
            "autogradient": 0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.862745,
              0.870588,
              0.878431,
              1.0
            ],
            "color2": [
              0.65098,
              0.666667,
              0.662745,
              1.0
            ],
            "proportion": 0.39,
            "type": "gradient"
          },
          "color": [
            0.475135,
            0.293895,
            0.251069,
            1.0
          ],
          "elementcolor": [
            0.786675,
            0.801885,
            0.845022,
            1.0
          ],
          "fontname": [
            "Open Sans Semibold"
          ],
          "selectioncolor": [
            0.720698,
            0.16723,
            0.080014,
            1.0
          ],
          "textcolor_inverse": [
            0.239216,
            0.254902,
            0.278431,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "M4L 10 Bold",
        "default": {
          "fontface": [
            1
          ],
          "fontsize": [
            10.0
          ],
          "patchlinecolor": [
            0.0,
            0.0,
            0.0,
            0.25
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "Matt",
        "default": {
          "fontface": [
            1
          ],
          "fontsize": [
            10.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "Max 12 Regular",
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "Max For Live",
        "default": {
          "patchlinecolor": [
            0.239216,
            0.254902,
            0.278431,
            0.631373
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "WTF",
        "default": {
          "accentcolor": [
            0.50764,
            0.065317,
            0.112129,
            1.0
          ],
          "bgcolor": [
            0.163647,
            0.174699,
            0.17409,
            1.0
          ],
          "bgfillcolor": {
            "angle": 270.0,
            "autogradient": 0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.32549,
              0.345098,
              0.372549,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "gradient"
          },
          "color": [
            0.113725,
            0.580392,
            0.737255,
            1.0
          ],
          "elementcolor": [
            0.461105,
            0.492646,
            0.591878,
            1.0
          ],
          "fontname": [
            "HydrogenType"
          ],
          "fontsize": [
            18.0
          ],
          "patchlinecolor": [
            0.231373,
            0.121569,
            0.305882,
            0.9
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classic",
        "default": {
          "accentcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "bgcolor": [
            0.83978,
            0.839941,
            0.839753,
            1.0
          ],
          "bgfillcolor": {
            "angle": 270.0,
            "color": [
              0.839216,
              0.839216,
              0.839216,
              1.0
            ],
            "color1": [
              0.83978,
              0.839941,
              0.839753,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "color"
          },
          "color": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "fontname": [
            "Geneva"
          ],
          "fontsize": [
            9.0
          ],
          "patchlinecolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "textcolor_inverse": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicButton",
        "default": {
          "color": [
            1.0,
            0.890196,
            0.090196,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicDial",
        "default": {
          "color": [
            1.0,
            0.890196,
            0.090196,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicGain~",
        "default": {
          "color": [
            0.380392,
            0.380392,
            0.380392,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicGswitch",
        "default": {
          "accentcolor": [
            1.0,
            1.0,
            1.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicGswitch2",
        "default": {
          "accentcolor": [
            1.0,
            1.0,
            1.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicKslider",
        "default": {
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "color": [
            1.0,
            1.0,
            1.0,
            1.0
          ],
          "elementcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "selectioncolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicLed",
        "default": {
          "color": [
            1.0,
            0.0,
            0.0,
            1.0
          ],
          "elementcolor": [
            0.6,
            0.0,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicMatrixctrl",
        "default": {
          "color": [
            1.0,
            0.0,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicMeter~",
        "default": {
          "bgcolor": [
            0.380392,
            0.380392,
            0.380392,
            1.0
          ],
          "elementcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicNodes",
        "default": {
          "color": [
            0.839216,
            0.839216,
            0.839216,
            1.0
          ],
          "elementcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "fontsize": [
            9.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicNslider",
        "default": {
          "color": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicNumber",
        "default": {
          "selectioncolor": [
            1.0,
            0.890196,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicPictslider",
        "default": {
          "elementcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicPreset",
        "default": {
          "color": [
            1.0,
            0.890196,
            0.090196,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicScope~",
        "default": {
          "bgcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "color": [
            0.462745,
            0.933333,
            0.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicTab",
        "default": {
          "color": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "elementcolor": [
            0.839216,
            0.839216,
            0.839216,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicTextbutton",
        "default": {
          "accentcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "color": [
            1.0,
            1.0,
            1.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicToggle",
        "default": {
          "color": [
            0.380392,
            0.380392,
            0.380392,
            1.0
          ],
          "elementcolor": [
            0.376471,
            0.384314,
            0.4,
            0.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicUmenu",
        "default": {
          "color": [
            1.0,
            1.0,
            1.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "classicWaveform~",
        "default": {
          "color": [
            0.380392,
            0.380392,
            0.380392,
            1.0
          ],
          "selectioncolor": [
            0.498039,
            0.498039,
            0.498039,
            0.5
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "dark-night-patch",
        "default": {
          "accentcolor": [
            0.952941,
            0.564706,
            0.098039,
            1.0
          ],
          "bgfillcolor": {
            "angle": 270.0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.376471,
              0.384314,
              0.4,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "gradient"
          },
          "patchlinecolor": [
            0.439216,
            0.74902,
            0.254902,
            0.898039
          ],
          "textcolor": [
            0.862745,
            0.870588,
            0.878431,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "envelope_m4l",
        "default": {
          "bgfillcolor": {
            "angle": 270.0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.376471,
              0.384314,
              0.4,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "gradient"
          }
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "jpatcher001",
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "jpatcher002",
        "default": {
          "bgfillcolor": {
            "angle": 270.0,
            "color": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "color1": [
              0.32549,
              0.345098,
              0.372549,
              0.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "color"
          },
          "clearcolor": [
            0.32549,
            0.345098,
            0.372549,
            0.0
          ],
          "fontname": [
            "Ableton Sans Book"
          ],
          "fontsize": [
            9.5
          ],
          "patchlinecolor": [
            0.65098,
            0.65098,
            0.65098,
            0.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "jpink",
        "default": {
          "accentcolor": [
            0.619608,
            0.0,
            0.360784,
            1.0
          ],
          "bgcolor": [
            0.862745,
            0.870588,
            0.878431,
            1.0
          ],
          "bgfillcolor": {
            "angle": 270.0,
            "autogradient": 0,
            "color": [
              0.619608,
              0.0,
              0.360784,
              1.0
            ],
            "color1": [
              0.376471,
              0.384314,
              0.4,
              1.0
            ],
            "color2": [
              0.290196,
              0.309804,
              0.301961,
              1.0
            ],
            "proportion": 0.39,
            "type": "color"
          },
          "clearcolor": [
            0.113725,
            0.607843,
            0.607843,
            1.0
          ],
          "color": [
            0.619608,
            0.0,
            0.360784,
            1.0
          ],
          "elementcolor": [
            0.619608,
            0.0,
            0.360784,
            1.0
          ],
          "patchlinecolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "selectioncolor": [
            0.619608,
            0.0,
            0.360784,
            1.0
          ],
          "textcolor": [
            0.619608,
            0.0,
            0.360784,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "ksliderWhite",
        "default": {
          "color": [
            1.0,
            1.0,
            1.0,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "lightbutton",
        "default": {
          "bgcolor": [
            0.309495,
            0.299387,
            0.299789,
            1.0
          ],
          "elementcolor": [
            0.654902,
            0.572549,
            0.376471,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjBlue-1",
        "default": {
          "accentcolor": [
            0.317647,
            0.654902,
            0.976471,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjBlue-2",
        "default": {
          "accentcolor": [
            0.317647,
            0.654902,
            0.976471,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjBrown-1",
        "default": {
          "accentcolor": [
            0.654902,
            0.572549,
            0.376471,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjCyan-1",
        "default": {
          "accentcolor": [
            0.029546,
            0.773327,
            0.821113,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjGreen-1",
        "default": {
          "accentcolor": [
            0.0,
            0.533333,
            0.168627,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjGreen-2",
        "default": {
          "accentcolor": [
            0.0,
            0.533333,
            0.168627,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjRed-1",
        "default": {
          "accentcolor": [
            0.784314,
            0.145098,
            0.023529,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjYellow-1",
        "default": {
          "accentcolor": [
            0.82517,
            0.78181,
            0.059545,
            1.0
          ],
          "fontsize": [
            12.059008
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "newobjYellow-2",
        "default": {
          "accentcolor": [
            0.82517,
            0.78181,
            0.059545,
            1.0
          ],
          "fontsize": [
            12.059008
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "numberGold-1",
        "default": {
          "accentcolor": [
            0.764706,
            0.592157,
            0.101961,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "purple",
        "default": {
          "bgcolor": [
            0.304029,
            0.250694,
            0.285628,
            1.0
          ],
          "textcolor_inverse": [
            0.701961,
            0.415686,
            0.886275,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "receives",
        "default": {
          "accentcolor": [
            0.870588,
            0.415686,
            0.062745,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "rsliderGold",
        "default": {
          "bgcolor": [
            0.764706,
            0.592157,
            0.101961,
            1.0
          ],
          "color": [
            0.646639,
            0.821777,
            0.854593,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "sends",
        "default": {
          "accentcolor": [
            0.0,
            0.533333,
            0.168627,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "stb001",
        "default": {
          "fontface": [
            1
          ],
          "fontname": [
            "Arial Bold"
          ],
          "fontsize": [
            10.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "tap",
        "default": {
          "fontname": [
            "Lato Light"
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "tastefulltoggle",
        "default": {
          "bgcolor": [
            0.185512,
            0.263736,
            0.260626,
            1.0
          ],
          "color": [
            0.941176,
            0.690196,
            0.196078,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "tastefultoggle",
        "default": {
          "bgcolor": [
            0.287863,
            0.333333,
            0.329398,
            1.0
          ],
          "color": [
            0.941176,
            0.690196,
            0.196078,
            1.0
          ],
          "elementcolor": [
            0.654902,
            0.572549,
            0.376471,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "test",
        "default": {
          "fontface": [
            1
          ],
          "fontsize": [
            10.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      },
      {
        "name": "whitey",
        "default": {
          "fontname": [
            "Dirty Ego"
          ],
          "fontsize": [
            36.0
          ],
          "patchlinecolor": [
            0.199068,
            0.062496,
            0.060031,
            0.9
          ],
          "selectioncolor": [
            0.011765,
            0.396078,
            0.752941,
            1.0
          ],
          "textcolor_inverse": [
            0.65098,
            0.666667,
            0.662745,
            1.0
          ]
        },
        "parentstyle": "",
        "multi": 0
      }
    ]
  }
}
