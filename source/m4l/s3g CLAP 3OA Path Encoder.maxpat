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
    "description": "Fixed stereo Path 64 encoder wrapper: forces two inputs and third-order ACN/SN3D output, exposes stable CLAP parameters to Live, and publishes to the private s3g master bus.",
    "digest": "Fixed stereo Path 64 encoder wrapper: forces two inputs and third-order ACN/SN3D output, exposes stable CLAP parameters to Live, and publishes to the private s3g master bus.",
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
          "text": "s3g CLAP 3OA PATH",
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
          "id": "obj-fixed-label",
          "maxclass": "textbutton",
          "patching_rect": [
            20.0,
            80.0,
            65.0,
            24.0
          ],
          "text": "PATH 18P",
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
          "texton": "PATH 18P",
          "ignoreclick": 1,
          "fontname": "Menlo",
          "fontsize": 8.0,
          "fontface": 0,
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.62745,
            0.62745,
            0.62745,
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
              "parameter_longname": "Path Input Gain",
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
          "annotation": "Mute Path input channel 1 before the CLAP encoder. The ordinary stereo passthrough remains audible.",
          "annotation_name": "Path input 1 mute",
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
              "parameter_longname": "Path Input 1 Mute",
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
          "annotation": "Mute Path input channel 2 before the CLAP encoder. The ordinary stereo passthrough remains audible.",
          "annotation_name": "Path input 2 mute",
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
              "parameter_longname": "Path Input 2 Mute",
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
            280.0,
            22.0
          ],
          "text": "route latency error loaded paramchanged paraminfo state statechanged",
          "numinlets": 1,
          "numoutlets": 8,
          "outlettype": [
            "",
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
          "text": "openifempty \"s3g Ambi Encoder Path 64\" org.s3g.s3g-dsp.ambi-path-encoder-64",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
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
          "id": "obj-param-gate",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            650.0,
            65.0,
            22.0
          ],
          "text": "gate 1 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-enable",
          "maxclass": "message",
          "patching_rect": [
            650.0,
            615.0,
            30.0,
            22.0
          ],
          "text": "1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-loaded-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            400.0,
            55.0,
            22.0
          ],
          "text": "t b b b",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-resync-delay",
          "maxclass": "newobj",
          "patching_rect": [
            720.0,
            470.0,
            62.0,
            22.0
          ],
          "text": "delay 50",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-getparams",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            505.0,
            70.0,
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
          "id": "obj-paramchanged-route",
          "maxclass": "newobj",
          "patching_rect": [
            805.0,
            435.0,
            290.0,
            22.0
          ],
          "text": "route 3 4 5 6 7 8 9 10 17 18 11 12 13 14 15 19 20 16",
          "numinlets": 1,
          "numoutlets": 19,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
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
          "id": "obj-paraminfo-skip-index",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            540.0,
            62.0,
            22.0
          ],
          "text": "zl.slice 1",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-route",
          "maxclass": "newobj",
          "patching_rect": [
            805.0,
            540.0,
            290.0,
            22.0
          ],
          "text": "route 3 4 5 6 7 8 9 10 17 18 11 12 13 14 15 19 20 16",
          "numinlets": 1,
          "numoutlets": 19,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
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
          "id": "obj-param-3",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            125.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Active Paths",
              "parameter_shortname": "Paths",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 16,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 16
            }
          },
          "varname": "clap_param_3"
        }
      },
      {
        "box": {
          "id": "obj-param-message-3",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            125.0,
            105.0,
            22.0
          ],
          "text": "paramid 3 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-3",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            565.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-3",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            565.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-4",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            155.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Selected Path",
              "parameter_shortname": "Path",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 16,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 16
            }
          },
          "varname": "clap_param_4"
        }
      },
      {
        "box": {
          "id": "obj-param-message-4",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            155.0,
            105.0,
            22.0
          ],
          "text": "paramid 4 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-4",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            590.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-4",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            590.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-5",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            185.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Selected Source",
              "parameter_shortname": "Source",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 64,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 64
            }
          },
          "varname": "clap_param_5"
        }
      },
      {
        "box": {
          "id": "obj-param-message-5",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            185.0,
            105.0,
            22.0
          ],
          "text": "paramid 5 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-5",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            615.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-5",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            615.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-6",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            215.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Assign",
              "parameter_shortname": "Assign",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 4,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "One",
                "Round Robin",
                "Source"
              ]
            }
          },
          "varname": "clap_param_6"
        }
      },
      {
        "box": {
          "id": "obj-param-message-6",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            215.0,
            105.0,
            22.0
          ],
          "text": "paramid 6 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-6",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            640.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-6",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            640.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-7",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            245.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Playback",
              "parameter_shortname": "Play",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 5,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Off",
                "Run",
                "Scrub"
              ]
            }
          },
          "varname": "clap_param_7"
        }
      },
      {
        "box": {
          "id": "obj-param-message-7",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            245.0,
            105.0,
            22.0
          ],
          "text": "paramid 7 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-7",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            665.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-7",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            665.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-8",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            275.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Loop Mode",
              "parameter_shortname": "Loop",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 6,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "One",
                "Loop",
                "Palindrome"
              ]
            }
          },
          "varname": "clap_param_8"
        }
      },
      {
        "box": {
          "id": "obj-param-message-8",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            275.0,
            105.0,
            22.0
          ],
          "text": "paramid 8 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-8",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            690.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-8",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            690.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-9",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            305.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Interpolation",
              "parameter_shortname": "Interp",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 7,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Linear",
                "Catmull",
                "Hold"
              ]
            }
          },
          "varname": "clap_param_9"
        }
      },
      {
        "box": {
          "id": "obj-param-message-9",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            305.0,
            105.0,
            22.0
          ],
          "text": "paramid 9 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-9",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            715.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-9",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            715.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-10",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            335.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Rate",
              "parameter_shortname": "Rate",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.08
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.001,
              "parameter_mmax": 4,
              "parameter_modmode": 0,
              "parameter_order": 8,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_10"
        }
      },
      {
        "box": {
          "id": "obj-param-message-10",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            335.0,
            105.0,
            22.0
          ],
          "text": "paramid 10 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-10",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            740.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-10",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            740.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-17",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            365.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Sync",
              "parameter_shortname": "Sync",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 9,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Free",
                "Sync"
              ]
            }
          },
          "varname": "clap_param_17"
        }
      },
      {
        "box": {
          "id": "obj-param-message-17",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            365.0,
            105.0,
            22.0
          ],
          "text": "paramid 17 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-17",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            765.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-17",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            765.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-18",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            395.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Division",
              "parameter_shortname": "Division",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                4
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.25,
              "parameter_mmax": 64,
              "parameter_modmode": 0,
              "parameter_order": 10,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_18"
        }
      },
      {
        "box": {
          "id": "obj-param-message-18",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            395.0,
            105.0,
            22.0
          ],
          "text": "paramid 18 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-18",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            790.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-18",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            790.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-11",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            425.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Phase",
              "parameter_shortname": "Phase",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 11,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_11"
        }
      },
      {
        "box": {
          "id": "obj-param-message-11",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            425.0,
            105.0,
            22.0
          ],
          "text": "paramid 11 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-11",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            815.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-11",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            815.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-12",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            455.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Phase Spread",
              "parameter_shortname": "Spread",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 12,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_12"
        }
      },
      {
        "box": {
          "id": "obj-param-message-12",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            455.0,
            105.0,
            22.0
          ],
          "text": "paramid 12 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-12",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            840.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-12",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            840.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-13",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            485.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Smooth",
              "parameter_shortname": "Smooth",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.12
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 0.995,
              "parameter_modmode": 0,
              "parameter_order": 13,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_13"
        }
      },
      {
        "box": {
          "id": "obj-param-message-13",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            485.0,
            105.0,
            22.0
          ],
          "text": "paramid 13 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-13",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-13",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-14",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            515.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Ease",
              "parameter_shortname": "Ease",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 14,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_14"
        }
      },
      {
        "box": {
          "id": "obj-param-message-14",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            515.0,
            105.0,
            22.0
          ],
          "text": "paramid 14 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-14",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            890.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-14",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            890.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-15",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            545.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Distance Scale",
              "parameter_shortname": "Distance",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.05,
              "parameter_mmax": 8,
              "parameter_modmode": 0,
              "parameter_order": 15,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_15"
        }
      },
      {
        "box": {
          "id": "obj-param-message-15",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            545.0,
            105.0,
            22.0
          ],
          "text": "paramid 15 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-15",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            915.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-15",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            915.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-19",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            575.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Doppler",
              "parameter_shortname": "Doppler",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 16,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_19"
        }
      },
      {
        "box": {
          "id": "obj-param-message-19",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            575.0,
            105.0,
            22.0
          ],
          "text": "paramid 19 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-19",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            940.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-19",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            940.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-20",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            605.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Air",
              "parameter_shortname": "Air",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 17,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_20"
        }
      },
      {
        "box": {
          "id": "obj-param-message-20",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            605.0,
            105.0,
            22.0
          ],
          "text": "paramid 20 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-20",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            965.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-20",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            965.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-16",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            635.0,
            90.0,
            22.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Output",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                -12
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 18,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_16"
        }
      },
      {
        "box": {
          "id": "obj-param-message-16",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            635.0,
            105.0,
            22.0
          ],
          "text": "paramid 16 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-16",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            990.0,
            55.0,
            22.0
          ],
          "text": "zl.nth 1",
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
          "id": "obj-param-reflect-16",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            990.0,
            55.0,
            22.0
          ],
          "text": "set $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-topology-1",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            430.0,
            105.0,
            22.0
          ],
          "text": "paramid 1 2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-topology-2",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            460.0,
            105.0,
            22.0
          ],
          "text": "paramid 2 3",
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
            5
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
            6
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
            "obj-param-loaded-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-loaded-trigger",
            1
          ],
          "destination": [
            "obj-param-enable",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-enable",
            0
          ],
          "destination": [
            "obj-param-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-loaded-trigger",
            0
          ],
          "destination": [
            "obj-param-resync-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-resync-delay",
            0
          ],
          "destination": [
            "obj-param-getparams",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-getparams",
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
            "obj-param-gate",
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
            3
          ],
          "destination": [
            "obj-paramchanged-route",
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
            "obj-paraminfo-skip-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-skip-index",
            1
          ],
          "destination": [
            "obj-paraminfo-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-3",
            0
          ],
          "destination": [
            "obj-param-message-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-3",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-3",
            0
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
            "obj-paramchanged-route",
            0
          ],
          "destination": [
            "obj-param-reflect-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            0
          ],
          "destination": [
            "obj-paraminfo-value-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-3",
            0
          ],
          "destination": [
            "obj-param-reflect-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-3",
            0
          ],
          "destination": [
            "obj-param-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-4",
            0
          ],
          "destination": [
            "obj-param-message-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-4",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-4",
            0
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
            "obj-paramchanged-route",
            1
          ],
          "destination": [
            "obj-param-reflect-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            1
          ],
          "destination": [
            "obj-paraminfo-value-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-4",
            0
          ],
          "destination": [
            "obj-param-reflect-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-4",
            0
          ],
          "destination": [
            "obj-param-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-5",
            0
          ],
          "destination": [
            "obj-param-message-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-5",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-5",
            0
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
            "obj-paramchanged-route",
            2
          ],
          "destination": [
            "obj-param-reflect-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            2
          ],
          "destination": [
            "obj-paraminfo-value-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-5",
            0
          ],
          "destination": [
            "obj-param-reflect-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-5",
            0
          ],
          "destination": [
            "obj-param-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-6",
            0
          ],
          "destination": [
            "obj-param-message-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-6",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-6",
            0
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
            "obj-paramchanged-route",
            3
          ],
          "destination": [
            "obj-param-reflect-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            3
          ],
          "destination": [
            "obj-paraminfo-value-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-6",
            0
          ],
          "destination": [
            "obj-param-reflect-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-6",
            0
          ],
          "destination": [
            "obj-param-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-7",
            0
          ],
          "destination": [
            "obj-param-message-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-7",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-7",
            0
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
            "obj-paramchanged-route",
            4
          ],
          "destination": [
            "obj-param-reflect-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            4
          ],
          "destination": [
            "obj-paraminfo-value-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-7",
            0
          ],
          "destination": [
            "obj-param-reflect-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-7",
            0
          ],
          "destination": [
            "obj-param-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-8",
            0
          ],
          "destination": [
            "obj-param-message-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-8",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-8",
            0
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
            "obj-paramchanged-route",
            5
          ],
          "destination": [
            "obj-param-reflect-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            5
          ],
          "destination": [
            "obj-paraminfo-value-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-8",
            0
          ],
          "destination": [
            "obj-param-reflect-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-8",
            0
          ],
          "destination": [
            "obj-param-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-9",
            0
          ],
          "destination": [
            "obj-param-message-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-9",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-9",
            0
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
            "obj-paramchanged-route",
            6
          ],
          "destination": [
            "obj-param-reflect-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            6
          ],
          "destination": [
            "obj-paraminfo-value-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-9",
            0
          ],
          "destination": [
            "obj-param-reflect-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-9",
            0
          ],
          "destination": [
            "obj-param-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-10",
            0
          ],
          "destination": [
            "obj-param-message-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-10",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-10",
            0
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
            "obj-paramchanged-route",
            7
          ],
          "destination": [
            "obj-param-reflect-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            7
          ],
          "destination": [
            "obj-paraminfo-value-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-10",
            0
          ],
          "destination": [
            "obj-param-reflect-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-10",
            0
          ],
          "destination": [
            "obj-param-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-17",
            0
          ],
          "destination": [
            "obj-param-message-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-17",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-17",
            0
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
            "obj-paramchanged-route",
            8
          ],
          "destination": [
            "obj-param-reflect-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            8
          ],
          "destination": [
            "obj-paraminfo-value-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-17",
            0
          ],
          "destination": [
            "obj-param-reflect-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-17",
            0
          ],
          "destination": [
            "obj-param-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-18",
            0
          ],
          "destination": [
            "obj-param-message-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-18",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-18",
            0
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
            "obj-paramchanged-route",
            9
          ],
          "destination": [
            "obj-param-reflect-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            9
          ],
          "destination": [
            "obj-paraminfo-value-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-18",
            0
          ],
          "destination": [
            "obj-param-reflect-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-18",
            0
          ],
          "destination": [
            "obj-param-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-11",
            0
          ],
          "destination": [
            "obj-param-message-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-11",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-11",
            0
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
            "obj-paramchanged-route",
            10
          ],
          "destination": [
            "obj-param-reflect-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            10
          ],
          "destination": [
            "obj-paraminfo-value-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-11",
            0
          ],
          "destination": [
            "obj-param-reflect-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-11",
            0
          ],
          "destination": [
            "obj-param-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-12",
            0
          ],
          "destination": [
            "obj-param-message-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-12",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-12",
            0
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
            "obj-paramchanged-route",
            11
          ],
          "destination": [
            "obj-param-reflect-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            11
          ],
          "destination": [
            "obj-paraminfo-value-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-12",
            0
          ],
          "destination": [
            "obj-param-reflect-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-12",
            0
          ],
          "destination": [
            "obj-param-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-13",
            0
          ],
          "destination": [
            "obj-param-message-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-13",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-13",
            0
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
            "obj-paramchanged-route",
            12
          ],
          "destination": [
            "obj-param-reflect-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            12
          ],
          "destination": [
            "obj-paraminfo-value-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-13",
            0
          ],
          "destination": [
            "obj-param-reflect-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-13",
            0
          ],
          "destination": [
            "obj-param-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-14",
            0
          ],
          "destination": [
            "obj-param-message-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-14",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-14",
            0
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
            "obj-paramchanged-route",
            13
          ],
          "destination": [
            "obj-param-reflect-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            13
          ],
          "destination": [
            "obj-paraminfo-value-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-14",
            0
          ],
          "destination": [
            "obj-param-reflect-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-14",
            0
          ],
          "destination": [
            "obj-param-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-15",
            0
          ],
          "destination": [
            "obj-param-message-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-15",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-15",
            0
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
            "obj-paramchanged-route",
            14
          ],
          "destination": [
            "obj-param-reflect-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            14
          ],
          "destination": [
            "obj-paraminfo-value-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-15",
            0
          ],
          "destination": [
            "obj-param-reflect-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-15",
            0
          ],
          "destination": [
            "obj-param-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-19",
            0
          ],
          "destination": [
            "obj-param-message-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-19",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-19",
            0
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
            "obj-paramchanged-route",
            15
          ],
          "destination": [
            "obj-param-reflect-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            15
          ],
          "destination": [
            "obj-paraminfo-value-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-19",
            0
          ],
          "destination": [
            "obj-param-reflect-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-19",
            0
          ],
          "destination": [
            "obj-param-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-20",
            0
          ],
          "destination": [
            "obj-param-message-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-20",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-20",
            0
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
            "obj-paramchanged-route",
            16
          ],
          "destination": [
            "obj-param-reflect-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            16
          ],
          "destination": [
            "obj-paraminfo-value-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-20",
            0
          ],
          "destination": [
            "obj-param-reflect-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-20",
            0
          ],
          "destination": [
            "obj-param-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-16",
            0
          ],
          "destination": [
            "obj-param-message-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-16",
            0
          ],
          "destination": [
            "obj-param-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-16",
            0
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
            "obj-paramchanged-route",
            17
          ],
          "destination": [
            "obj-param-reflect-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-route",
            17
          ],
          "destination": [
            "obj-paraminfo-value-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-16",
            0
          ],
          "destination": [
            "obj-param-reflect-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-16",
            0
          ],
          "destination": [
            "obj-param-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-loaded-trigger",
            2
          ],
          "destination": [
            "obj-param-topology-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-topology-1",
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
            "obj-param-loaded-trigger",
            2
          ],
          "destination": [
            "obj-param-topology-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-topology-2",
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
        "Path Input Gain",
        "Input Gain",
        0
      ],
      "obj-input-mute-1": [
        "Path Input 1 Mute",
        "In 1 Mute",
        0
      ],
      "obj-input-mute-2": [
        "Path Input 2 Mute",
        "In 2 Mute",
        0
      ],
      "obj-param-3": [
        "Active Paths",
        "Paths",
        0
      ],
      "obj-param-4": [
        "Selected Path",
        "Path",
        0
      ],
      "obj-param-5": [
        "Selected Source",
        "Source",
        0
      ],
      "obj-param-6": [
        "Assign",
        "Assign",
        0
      ],
      "obj-param-7": [
        "Playback",
        "Play",
        0
      ],
      "obj-param-8": [
        "Loop Mode",
        "Loop",
        0
      ],
      "obj-param-9": [
        "Interpolation",
        "Interp",
        0
      ],
      "obj-param-10": [
        "Rate",
        "Rate",
        0
      ],
      "obj-param-17": [
        "Sync",
        "Sync",
        0
      ],
      "obj-param-18": [
        "Division",
        "Division",
        0
      ],
      "obj-param-11": [
        "Phase",
        "Phase",
        0
      ],
      "obj-param-12": [
        "Phase Spread",
        "Spread",
        0
      ],
      "obj-param-13": [
        "Smooth",
        "Smooth",
        0
      ],
      "obj-param-14": [
        "Ease",
        "Ease",
        0
      ],
      "obj-param-15": [
        "Distance Scale",
        "Distance",
        0
      ],
      "obj-param-19": [
        "Doppler",
        "Doppler",
        0
      ],
      "obj-param-20": [
        "Air",
        "Air",
        0
      ],
      "obj-param-16": [
        "Output",
        "Output",
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
