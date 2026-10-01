{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "rect": [
      120.0,
      90.0,
      760.0,
      720.0
    ],
    "openrect": [
      0.0,
      0.0,
      425.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 425.0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "editing_bgcolor": [
      0.05098,
      0.05098,
      0.05098,
      1.0
    ],
    "locked_bgcolor": [
      0.05098,
      0.05098,
      0.05098,
      1.0
    ],
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
    "description": "Hosts a stereo-to-3OA s3g CLAP encoder in the private s3g 18-channel chain/bus layout.",
    "digest": "Hosts a stereo-to-3OA s3g CLAP encoder in the private s3g 18-channel chain/bus layout.",
    "tags": "s3g CLAP Ambisonics 3OA",
    "latency": 0,
    "minimum_live_version": "12.0",
    "minimum_max_version": "8.5",
    "boxes": [
      {
        "box": {
          "id": "obj-ui-background",
          "maxclass": "panel",
          "patching_rect": [
            0.0,
            0.0,
            425.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            425.0,
            169.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-title-strip",
          "maxclass": "panel",
          "patching_rect": [
            0.0,
            0.0,
            425.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            425.0,
            30.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.09412,
            0.09412,
            0.09412,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-title-accent",
          "maxclass": "panel",
          "patching_rect": [
            0.0,
            0.0,
            425.0,
            2.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            425.0,
            2.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-title",
          "maxclass": "comment",
          "patching_rect": [
            20.0,
            20.0,
            300.0,
            24.0
          ],
          "text": "s3g CLAP 3OA SOURCE",
          "presentation": 1,
          "presentation_rect": [
            10.0,
            6.0,
            152.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 10.5,
          "textcolor": [
            0.82745,
            0.82745,
            0.82745,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-load-button",
          "maxclass": "textbutton",
          "patching_rect": [
            20.0,
            80.0,
            65.0,
            24.0
          ],
          "text": "LOAD CLAP",
          "presentation": 1,
          "presentation_rect": [
            166.0,
            7.0,
            62.0,
            17.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "int"
          ],
          "texton": "LOAD CLAP",
          "fontname": "Menlo",
          "fontsize": 8.0,
          "fontface": 0,
          "bgcolor": [
            0.28235,
            0.28235,
            0.28235,
            1.0
          ],
          "textcolor": [
            0.71765,
            0.71765,
            0.71765,
            1.0
          ],
          "rounded": 0.0
        }
      },
      {
        "box": {
          "id": "obj-gui-button",
          "maxclass": "textbutton",
          "patching_rect": [
            95.0,
            80.0,
            65.0,
            24.0
          ],
          "text": "EDITOR",
          "presentation": 1,
          "presentation_rect": [
            233.0,
            7.0,
            56.0,
            17.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "int"
          ],
          "texton": "EDITOR",
          "fontname": "Menlo",
          "fontsize": 8.0,
          "fontface": 0,
          "bgcolor": [
            0.28235,
            0.28235,
            0.28235,
            1.0
          ],
          "textcolor": [
            0.71765,
            0.71765,
            0.71765,
            1.0
          ],
          "rounded": 0.0
        }
      },
      {
        "box": {
          "id": "obj-latency-label",
          "maxclass": "comment",
          "patching_rect": [
            170.0,
            80.0,
            90.0,
            22.0
          ],
          "text": "LAT",
          "presentation": 1,
          "presentation_rect": [
            298.0,
            7.0,
            20.0,
            17.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-latency-number",
          "maxclass": "number",
          "patching_rect": [
            265.0,
            80.0,
            60.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            319.0,
            7.0,
            38.0,
            17.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "minimum": 0,
          "fontname": "Menlo",
          "fontsize": 8.0,
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.63922,
            0.63922,
            0.63922,
            1.0
          ],
          "border": 1,
          "triangle": 0,
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "obj-open",
          "maxclass": "message",
          "patching_rect": [
            20.0,
            118.0,
            42.0,
            22.0
          ],
          "text": "open",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-editor",
          "maxclass": "message",
          "patching_rect": [
            95.0,
            118.0,
            54.0,
            22.0
          ],
          "text": "editor 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-chain",
          "maxclass": "live.text",
          "patching_rect": [
            470.0,
            95.0,
            62.0,
            22.0
          ],
          "text": "NEXT OFF",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            7.0,
            54.0,
            17.0
          ],
          "texton": "NEXT ON",
          "automation": "Off",
          "automationon": "On",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "annotation": "Route the 3OA stream to the next s3g device on this track instead of the named main bus.",
          "annotation_name": "Route to next s3g device",
          "mode": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activebgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "activetextcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "activetextoncolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "textcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "textoffcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "focusbordercolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "rounded": 0.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Route to Chain",
              "parameter_shortname": "Chain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_enum": [
                "Off",
                "On"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "route_to_chain"
        }
      },
      {
        "box": {
          "id": "obj-routing-panel",
          "maxclass": "panel",
          "patching_rect": [
            8.0,
            36.0,
            409.0,
            54.0
          ],
          "presentation": 1,
          "presentation_rect": [
            8.0,
            36.0,
            409.0,
            54.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "border": 1,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-routing-strip",
          "maxclass": "panel",
          "patching_rect": [
            9.0,
            37.0,
            407.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            9.0,
            37.0,
            407.0,
            19.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.09412,
            0.09412,
            0.09412,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-routing-accent",
          "maxclass": "panel",
          "patching_rect": [
            8.0,
            36.0,
            409.0,
            2.0
          ],
          "presentation": 1,
          "presentation_rect": [
            8.0,
            36.0,
            409.0,
            2.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-routing-heading",
          "maxclass": "comment",
          "patching_rect": [
            16.0,
            39.0,
            150.0,
            16.0
          ],
          "text": "SIGNAL ROUTING",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            39.0,
            150.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.71765,
            0.71765,
            0.71765,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-label-1",
          "maxclass": "comment",
          "patching_rect": [
            16.0,
            64.0,
            34.0,
            16.0
          ],
          "text": "INPUT",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            64.0,
            34.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-value-1",
          "maxclass": "comment",
          "patching_rect": [
            50.0,
            64.0,
            78.0,
            16.0
          ],
          "text": "STEREO 1–2",
          "presentation": 1,
          "presentation_rect": [
            50.0,
            64.0,
            78.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.63922,
            0.63922,
            0.63922,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-label-2",
          "maxclass": "comment",
          "patching_rect": [
            136.0,
            64.0,
            34.0,
            16.0
          ],
          "text": "3OA",
          "presentation": 1,
          "presentation_rect": [
            136.0,
            64.0,
            34.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-value-2",
          "maxclass": "comment",
          "patching_rect": [
            170.0,
            64.0,
            103.0,
            16.0
          ],
          "text": "ACN/SN3D 3–18",
          "presentation": 1,
          "presentation_rect": [
            170.0,
            64.0,
            103.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.63922,
            0.63922,
            0.63922,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-label-3",
          "maxclass": "comment",
          "patching_rect": [
            282.0,
            64.0,
            34.0,
            16.0
          ],
          "text": "BUS",
          "presentation": 1,
          "presentation_rect": [
            282.0,
            64.0,
            34.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-routing-value-3",
          "maxclass": "comment",
          "patching_rect": [
            316.0,
            64.0,
            58.0,
            16.0
          ],
          "text": "MAIN",
          "presentation": 1,
          "presentation_rect": [
            316.0,
            64.0,
            58.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.63922,
            0.63922,
            0.63922,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-panel",
          "maxclass": "panel",
          "patching_rect": [
            8.0,
            98.0,
            409.0,
            63.0
          ],
          "presentation": 1,
          "presentation_rect": [
            8.0,
            98.0,
            409.0,
            63.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "border": 1,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-input-strip",
          "maxclass": "panel",
          "patching_rect": [
            9.0,
            99.0,
            407.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            9.0,
            99.0,
            407.0,
            19.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.09412,
            0.09412,
            0.09412,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-input-accent",
          "maxclass": "panel",
          "patching_rect": [
            8.0,
            98.0,
            409.0,
            2.0
          ],
          "presentation": 1,
          "presentation_rect": [
            8.0,
            98.0,
            409.0,
            2.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-input-heading",
          "maxclass": "comment",
          "patching_rect": [
            16.0,
            101.0,
            230.0,
            16.0
          ],
          "text": "STEREO INPUT · GAIN PRE-MUTE",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            101.0,
            230.0,
            16.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "textcolor": [
            0.71765,
            0.71765,
            0.71765,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-meter",
          "maxclass": "live.gain~",
          "patching_rect": [
            125.0,
            220.0,
            250.0,
            42.0
          ],
          "presentation": 1,
          "presentation_rect": [
            16.0,
            121.0,
            268.0,
            32.0
          ],
          "channels": 2,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 2,
          "numoutlets": 5,
          "orientation": 1,
          "outlettype": [
            "signal",
            "signal",
            "",
            "float",
            "list"
          ],
          "parameter_enable": 1,
          "coldcolor": [
            0.63922,
            0.63922,
            0.63922,
            1.0
          ],
          "warmcolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "hotcolor": [
            0.82745,
            0.82745,
            0.82745,
            1.0
          ],
          "overloadcolor": [
            0.82745,
            0.82745,
            0.82745,
            1.0
          ],
          "slidercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "tribordercolor": [
            0.82745,
            0.82745,
            0.82745,
            1.0
          ],
          "tricolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "trioncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Source Input Gain",
              "parameter_shortname": "Input Gain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 1,
              "parameter_mmax": 6.0,
              "parameter_mmin": -70.0,
              "parameter_modmode": 0,
              "parameter_type": 0,
              "parameter_unitstyle": 4
            }
          },
          "showname": 0,
          "shownumber": 0,
          "varname": "source_input_gain"
        }
      },
      {
        "box": {
          "id": "obj-input-mute-1",
          "maxclass": "live.text",
          "patching_rect": [
            470.0,
            370.0,
            70.0,
            22.0
          ],
          "text": "1 LIVE",
          "presentation": 1,
          "presentation_rect": [
            292.0,
            121.0,
            57.0,
            32.0
          ],
          "texton": "1 MUTE",
          "automation": "Live",
          "automationon": "Mute",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "annotation": "Mute Source input channel 1 before the CLAP encoder. The ordinary stereo passthrough remains audible.",
          "annotation_name": "Source input 1 mute",
          "mode": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activebgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "activetextcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "activetextoncolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "textcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "textoffcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "focusbordercolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "rounded": 0.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Input 1 Mute",
              "parameter_shortname": "In 1 Mute",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_enum": [
                "Live",
                "Mute"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "input_1_mute"
        }
      },
      {
        "box": {
          "id": "obj-input-mute-2",
          "maxclass": "live.text",
          "patching_rect": [
            470.0,
            400.0,
            70.0,
            22.0
          ],
          "text": "2 LIVE",
          "presentation": 1,
          "presentation_rect": [
            354.0,
            121.0,
            57.0,
            32.0
          ],
          "texton": "2 MUTE",
          "automation": "Live",
          "automationon": "Mute",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "annotation": "Mute Source input channel 2 before the CLAP encoder. The ordinary stereo passthrough remains audible.",
          "annotation_name": "Source input 2 mute",
          "mode": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activebgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "activetextcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "activetextoncolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bgoncolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "textcolor": [
            0.05098,
            0.05098,
            0.05098,
            1.0
          ],
          "textoffcolor": [
            0.62745,
            0.62745,
            0.62745,
            1.0
          ],
          "bordercolor": [
            0.4,
            0.4,
            0.4,
            1.0
          ],
          "focusbordercolor": [
            0.77255,
            0.77255,
            0.77255,
            1.0
          ],
          "fontname": "Menlo",
          "fontsize": 8.0,
          "rounded": 0.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Input 2 Mute",
              "parameter_shortname": "In 2 Mute",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_enum": [
                "Live",
                "Mute"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "input_2_mute"
        }
      },
      {
        "box": {
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            180.0,
            55.0,
            22.0
          ],
          "text": "plugin~",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-mute-1-invert",
          "maxclass": "newobj",
          "patching_rect": [
            410.0,
            370.0,
            38.0,
            22.0
          ],
          "text": "!- 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-mute-2-invert",
          "maxclass": "newobj",
          "patching_rect": [
            410.0,
            410.0,
            38.0,
            22.0
          ],
          "text": "!- 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-mute-1-gain",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            270.0,
            42.0,
            22.0
          ],
          "text": "*~ 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-mute-2-gain",
          "maxclass": "newobj",
          "patching_rect": [
            185.0,
            270.0,
            42.0,
            22.0
          ],
          "text": "*~ 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-clap",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            300.0,
            310.0,
            22.0
          ],
          "text": "s3g.clap~ 2 16",
          "numinlets": 2,
          "numoutlets": 17,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "list"
          ],
          "varname": "clap"
        }
      },
      {
        "box": {
          "id": "obj-plugout",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            365.0,
            320.0,
            22.0
          ],
          "text": "plugout~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18",
          "numinlets": 18,
          "numoutlets": 18,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-device",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            180.0,
            125.0,
            22.0
          ],
          "text": "s3g.live.thisdevice",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-bus-send",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            230.0,
            125.0,
            22.0
          ],
          "text": "s3g.bus.send master",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-plugsync",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            520.0,
            70.0,
            22.0
          ],
          "text": "plugsync~",
          "numinlets": 2,
          "numoutlets": 9,
          "outlettype": [
            "int",
            "int",
            "int",
            "float",
            "list",
            "float",
            "float",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-timesig",
          "maxclass": "newobj",
          "patching_rect": [
            250.0,
            555.0,
            75.0,
            22.0
          ],
          "text": "unpack i i",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-transport-pack",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            600.0,
            180.0,
            22.0
          ],
          "text": "pak i f f f i i i",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-transport",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            635.0,
            145.0,
            22.0
          ],
          "text": "prepend transportsync",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-route-status",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            400.0,
            165.0,
            22.0
          ],
          "text": "route latency error loaded paramchanged state statechanged",
          "numinlets": 1,
          "numoutlets": 7,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-latency-message",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            435.0,
            100.0,
            22.0
          ],
          "text": "prepend latency",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-thispatcher",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            470.0,
            72.0,
            22.0
          ],
          "text": "thispatcher",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-print",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            435.0,
            115.0,
            22.0
          ],
          "text": "print s3g-clap-m4l",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-loadbang",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            520.0,
            65.0,
            22.0
          ],
          "text": "loadbang",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-delayed-load",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            555.0,
            65.0,
            22.0
          ],
          "text": "delay 100",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-default-open",
          "maxclass": "message",
          "patching_rect": [
            525.0,
            590.0,
            220.0,
            22.0
          ],
          "text": "openifempty \"s3g Ambi Encoder Medium 16\"",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-load-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            20.0,
            118.0,
            30.0,
            22.0
          ],
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-editor-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            95.0,
            118.0,
            30.0,
            22.0
          ],
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-clap-state",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            670.0,
            260.0,
            22.0
          ],
          "text": "pattr clap_state @autorestore 1 @thru 2",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "saved_object_attributes": {
            "parameter_enable": 1,
            "parameter_mappable": 0
          },
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "CLAP State",
              "parameter_shortname": "CLAP State",
              "parameter_invisible": 1,
              "parameter_type": 3
            }
          },
          "varname": "clap_state"
        }
      },
      {
        "box": {
          "id": "obj-state-valid",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            690.0,
            170.0,
            22.0
          ],
          "text": "routepass s3g.clap.state.1",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-state-restore",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            705.0,
            105.0,
            22.0
          ],
          "text": "prepend setstate",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-state-capture-delay",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            705.0,
            65.0,
            22.0
          ],
          "text": "delay 100",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-state-get",
          "maxclass": "message",
          "patching_rect": [
            730.0,
            705.0,
            58.0,
            22.0
          ],
          "text": "getstate",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-state-change-bang",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            740.0,
            30.0,
            22.0
          ],
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-getparams",
          "maxclass": "message",
          "patching_rect": [
            570.0,
            400.0,
            68.0,
            22.0
          ],
          "text": "getparams",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-route-paraminfo",
          "maxclass": "newobj",
          "patching_rect": [
            570.0,
            435.0,
            94.0,
            22.0
          ],
          "text": "route paraminfo",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-split-paraminfo",
          "maxclass": "newobj",
          "patching_rect": [
            570.0,
            470.0,
            42.0,
            22.0
          ],
          "text": "t l l",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-param-id",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            505.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 2",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-input-count-name",
          "maxclass": "newobj",
          "patching_rect": [
            570.0,
            505.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 8",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-is-input-count",
          "maxclass": "newobj",
          "patching_rect": [
            570.0,
            540.0,
            108.0,
            22.0
          ],
          "text": "sel \"Input Count\"",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-input-count-id",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            540.0,
            30.0,
            22.0
          ],
          "text": "i",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-set-input-count",
          "maxclass": "message",
          "patching_rect": [
            650.0,
            575.0,
            92.0,
            22.0
          ],
          "text": "paramid $1 2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-plugin",
            0
          ],
          "destination": [
            "obj-plugout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            1
          ],
          "destination": [
            "obj-plugout",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            0
          ],
          "destination": [
            "obj-input-meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            1
          ],
          "destination": [
            "obj-input-meter",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-meter",
            0
          ],
          "destination": [
            "obj-input-mute-1-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-meter",
            1
          ],
          "destination": [
            "obj-input-mute-2-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-1",
            0
          ],
          "destination": [
            "obj-input-mute-1-invert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-2",
            0
          ],
          "destination": [
            "obj-input-mute-2-invert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-1-invert",
            0
          ],
          "destination": [
            "obj-input-mute-1-gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-2-invert",
            0
          ],
          "destination": [
            "obj-input-mute-2-gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-1-gain",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-mute-2-gain",
            0
          ],
          "destination": [
            "obj-clap",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-device",
            0
          ],
          "destination": [
            "obj-bus-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-chain",
            0
          ],
          "destination": [
            "obj-bus-send",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            0
          ],
          "destination": [
            "obj-plugout",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            1
          ],
          "destination": [
            "obj-plugout",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            2
          ],
          "destination": [
            "obj-plugout",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            3
          ],
          "destination": [
            "obj-plugout",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            4
          ],
          "destination": [
            "obj-plugout",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            5
          ],
          "destination": [
            "obj-plugout",
            7
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            6
          ],
          "destination": [
            "obj-plugout",
            8
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            7
          ],
          "destination": [
            "obj-plugout",
            9
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            8
          ],
          "destination": [
            "obj-plugout",
            10
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            9
          ],
          "destination": [
            "obj-plugout",
            11
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            10
          ],
          "destination": [
            "obj-plugout",
            12
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            11
          ],
          "destination": [
            "obj-plugout",
            13
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            12
          ],
          "destination": [
            "obj-plugout",
            14
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            13
          ],
          "destination": [
            "obj-plugout",
            15
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            14
          ],
          "destination": [
            "obj-plugout",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            15
          ],
          "destination": [
            "obj-plugout",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            0
          ],
          "destination": [
            "obj-transport-pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            6
          ],
          "destination": [
            "obj-transport-pack",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            7
          ],
          "destination": [
            "obj-transport-pack",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            5
          ],
          "destination": [
            "obj-transport-pack",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            4
          ],
          "destination": [
            "obj-timesig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-timesig",
            0
          ],
          "destination": [
            "obj-transport-pack",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-timesig",
            1
          ],
          "destination": [
            "obj-transport-pack",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugsync",
            8
          ],
          "destination": [
            "obj-transport-pack",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-transport-pack",
            0
          ],
          "destination": [
            "obj-transport",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-transport",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            16
          ],
          "destination": [
            "obj-route-status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            0
          ],
          "destination": [
            "obj-latency-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            0
          ],
          "destination": [
            "obj-latency-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-latency-message",
            0
          ],
          "destination": [
            "obj-thispatcher",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            1
          ],
          "destination": [
            "obj-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-loadbang",
            0
          ],
          "destination": [
            "obj-delayed-load",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-delayed-load",
            0
          ],
          "destination": [
            "obj-default-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-default-open",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap-state",
            0
          ],
          "destination": [
            "obj-state-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-valid",
            0
          ],
          "destination": [
            "obj-state-restore",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-restore",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            4
          ],
          "destination": [
            "obj-clap-state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            2
          ],
          "destination": [
            "obj-state-change-bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            3
          ],
          "destination": [
            "obj-state-change-bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            5
          ],
          "destination": [
            "obj-state-change-bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-change-bang",
            0
          ],
          "destination": [
            "obj-state-capture-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-capture-delay",
            0
          ],
          "destination": [
            "obj-state-get",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-get",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-load-button",
            0
          ],
          "destination": [
            "obj-load-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-load-trigger",
            0
          ],
          "destination": [
            "obj-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-open",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gui-button",
            0
          ],
          "destination": [
            "obj-editor-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-editor-trigger",
            0
          ],
          "destination": [
            "obj-editor",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-editor",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-status",
            2
          ],
          "destination": [
            "obj-source-getparams",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-getparams",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            16
          ],
          "destination": [
            "obj-source-route-paraminfo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-route-paraminfo",
            0
          ],
          "destination": [
            "obj-source-split-paraminfo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-split-paraminfo",
            1
          ],
          "destination": [
            "obj-source-param-id",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-param-id",
            0
          ],
          "destination": [
            "obj-source-input-count-id",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-split-paraminfo",
            0
          ],
          "destination": [
            "obj-source-input-count-name",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-input-count-name",
            0
          ],
          "destination": [
            "obj-source-is-input-count",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-is-input-count",
            0
          ],
          "destination": [
            "obj-source-input-count-id",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-input-count-id",
            0
          ],
          "destination": [
            "obj-source-set-input-count",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-set-input-count",
            0
          ],
          "destination": [
            "obj-clap",
            0
          ]
        }
      }
    ],
    "parameters": {
      "obj-clap-state": [
        "CLAP State",
        "CLAP State",
        0
      ],
      "parameterbanks": {},
      "obj-chain": [
        "Route to Chain",
        "Chain",
        0
      ],
      "obj-input-meter": [
        "Source Input Gain",
        "Input Gain",
        0
      ],
      "obj-input-mute-1": [
        "Input 1 Mute",
        "In 1 Mute",
        0
      ],
      "obj-input-mute-2": [
        "Input 2 Mute",
        "In 2 Mute",
        0
      ]
    },
    "dependency_cache": [
      {
        "name": "s3g.clap~.mxo",
        "type": "iLaX"
      },
      {
        "name": "s3g.live.thisdevice.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.bus.send.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.bus.insert.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.bus.receive.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.live.once.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.live.routing.channel_selector.maxpat",
        "type": "JSON"
      }
    ],
    "autosave": 0,
    "project": {
      "version": 1,
      "autoorganize": 1,
      "hideprojectwindow": 1,
      "showdependencies": 1,
      "autolocalize": 0,
      "contents": {
        "patchers": {}
      },
      "layout": {},
      "searchpath": {},
      "detailsvisible": 0,
      "amxdtype": 1633771873,
      "readonly": 0,
      "devpathtype": 0,
      "devpath": ".",
      "sortmode": 0
    }
  }
}
