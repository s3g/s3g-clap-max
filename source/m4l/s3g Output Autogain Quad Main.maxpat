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
      700.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 700.0,
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
    "description": "Receives 32 generic bus channels, folds through fixed Output Autogain Quad 4, and independently assigns L/R/RB/LB to 32 mono hardware slots. Only CLAP source channels 1–32 have Live bus feeds.",
    "digest": "Receives 32 generic bus channels, folds through fixed Output Autogain Quad 4, and independently assigns L/R/RB/LB to 32 mono hardware slots. Only CLAP source channels 1–32 have Live bus feeds.",
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
            700.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            700.0,
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
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-gui-button",
          "maxclass": "live.text",
          "patching_rect": [
            95.0,
            80.0,
            65.0,
            24.0
          ],
          "text": "EDITOR",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            10.0,
            64.0,
            20.0
          ],
          "texton": "EDITOR",
          "active": 1,
          "mode": 0,
          "appearance": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 0,
          "fontname": "Arial",
          "fontsize": 11.0,
          "activebgcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "activebgoncolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "activetextcolor": [
            0.74,
            0.74,
            0.74,
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
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "textoffcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "rounded": 2.0,
          "annotation": "Open this CLAP plugin's editor.",
          "annotation_name": "EDITOR"
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
          "id": "obj-hardware-button",
          "maxclass": "live.text",
          "patching_rect": [
            640.0,
            120.0,
            100.0,
            20.0
          ],
          "text": "HARDWARE",
          "presentation": 1,
          "presentation_rect": [
            84.0,
            10.0,
            100.0,
            20.0
          ],
          "texton": "HARDWARE",
          "active": 1,
          "mode": 0,
          "appearance": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 0,
          "fontname": "Arial",
          "fontsize": 11.0,
          "activebgcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "activebgoncolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "activetextcolor": [
            0.74,
            0.74,
            0.74,
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
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "textoffcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "rounded": 2.0,
          "annotation": "Choose the CLAP plugin for this generic wrapper.",
          "annotation_name": "HARDWARE"
        }
      },
      {
        "box": {
          "id": "obj-hardware-open",
          "maxclass": "message",
          "patching_rect": [
            640.0,
            150.0,
            45.0,
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
          "id": "obj-hardware-pcontrol",
          "maxclass": "newobj",
          "patching_rect": [
            690.0,
            150.0,
            66.0,
            22.0
          ],
          "text": "pcontrol",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-panel",
          "maxclass": "panel",
          "patching_rect": [
            12.0,
            4.0,
            180.0,
            158.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            4.0,
            180.0,
            158.0
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
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-section-divider",
          "maxclass": "panel",
          "patching_rect": [
            196.0,
            4.0,
            1.0,
            158.0
          ],
          "presentation": 1,
          "presentation_rect": [
            196.0,
            4.0,
            1.0,
            158.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "background": 1,
          "ignoreclick": 1,
          "bgcolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "border": 0,
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-output-panel",
          "maxclass": "panel",
          "patching_rect": [
            200.0,
            4.0,
            488.0,
            158.0
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            4.0,
            488.0,
            158.0
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
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-input-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            16.0,
            38.0,
            56.0,
            20.0
          ],
          "text": "RCV BUS",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            38.0,
            56.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 11.0,
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            48.0,
            22.0
          ],
          "hidden": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activetextcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "triangle": 1,
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 9.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Multichannel Input Bus",
              "parameter_shortname": "Input Bus",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 16,
              "parameter_steps": 16,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "input_bus_number"
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            78.0,
            38.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            78.0,
            38.0,
            48.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "items": [
            "01",
            ",",
            "02",
            ",",
            "03",
            ",",
            "04",
            ",",
            "05",
            ",",
            "06",
            ",",
            "07",
            ",",
            "08",
            ",",
            "09",
            ",",
            "10",
            ",",
            "11",
            ",",
            "12",
            ",",
            "13",
            ",",
            "14",
            ",",
            "15",
            ",",
            "16"
          ],
          "menumode": 0,
          "arrow": 1,
          "allowdrag": 0,
          "applycolors": 1,
          "bgfillcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "elementcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "annotation": "Choose multichannel input bus from the menu.",
          "annotation_name": "Multichannel Input Bus"
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            68.0,
            38.0,
            22.0
          ],
          "text": "+ 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            68.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            68.0,
            78.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            180.0,
            610.0,
            22.0
          ],
          "text": "plugin~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34",
          "numinlets": 34,
          "numoutlets": 34,
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
          "id": "obj-autogain-input-gain",
          "maxclass": "live.gain~",
          "patching_rect": [
            125.0,
            245.0,
            400.0,
            60.0
          ],
          "presentation": 1,
          "presentation_rect": [
            16.0,
            66.0,
            168.0,
            68.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "channels": 32,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 32,
          "numoutlets": 35,
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
            "",
            "float",
            "list"
          ],
          "parameter_enable": 1,
          "relative": 1,
          "coldcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "warmcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "hotcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "overloadcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "slidercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "tribordercolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "trioncolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Output AutoGain Input Gain",
              "parameter_shortname": "Input Gain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmax": 6.0,
              "parameter_mmin": -70.0,
              "parameter_modmode": 0,
              "parameter_type": 0,
              "parameter_unitstyle": 4
            }
          },
          "showname": 0,
          "shownumber": 1,
          "varname": "autogain_input_gain"
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
          "text": "s3g.clap~ 32 4",
          "numinlets": 32,
          "numoutlets": 5,
          "outlettype": [
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
            610.0,
            22.0
          ],
          "text": "plugout~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34",
          "numinlets": 34,
          "numoutlets": 34,
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
          "id": "obj-device-split",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            215.0,
            35.0,
            22.0
          ],
          "text": "t l l",
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
          "id": "obj-once",
          "maxclass": "newobj",
          "patching_rect": [
            560.0,
            260.0,
            90.0,
            22.0
          ],
          "text": "s3g.live.once",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-output-init",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            310.0,
            145.0,
            22.0
          ],
          "text": "p Initialize Output Pairs",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 4,
              "architecture": "x64",
              "modernui": 1
            },
            "rect": [
              180.0,
              120.0,
              390.0,
              290.0
            ],
            "openinpresentation": 0,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "boxes": [
              {
                "box": {
                  "id": "init-inlet",
                  "maxclass": "inlet",
                  "patching_rect": [
                    22.0,
                    20.0,
                    30.0,
                    30.0
                  ],
                  "index": 1,
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "init-outputs",
                  "maxclass": "newobj",
                  "patching_rect": [
                    22.0,
                    70.0,
                    190.0,
                    22.0
                  ],
                  "text": "s3g.live.object get audio_outputs",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "init-skip-main",
                  "maxclass": "newobj",
                  "patching_rect": [
                    22.0,
                    110.0,
                    60.0,
                    22.0
                  ],
                  "text": "zl.slice 2",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "init-iterate",
                  "maxclass": "newobj",
                  "patching_rect": [
                    105.0,
                    150.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl.iter 2",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "init-type",
                  "maxclass": "newobj",
                  "patching_rect": [
                    105.0,
                    190.0,
                    225.0,
                    22.0
                  ],
                  "text": "s3g.live.routing routing_type \"Ext. Out\"",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "init-channel",
                  "maxclass": "newobj",
                  "patching_rect": [
                    105.0,
                    230.0,
                    250.0,
                    22.0
                  ],
                  "text": "s3g.live.routing routing_channel \"No Output\"",
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
                    "init-inlet",
                    0
                  ],
                  "destination": [
                    "init-outputs",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-outputs",
                    0
                  ],
                  "destination": [
                    "init-skip-main",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-skip-main",
                    1
                  ],
                  "destination": [
                    "init-iterate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-iterate",
                    0
                  ],
                  "destination": [
                    "init-type",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-type",
                    0
                  ],
                  "destination": [
                    "init-channel",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "obj-bus-receive",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            230.0,
            225.0,
            22.0
          ],
          "text": "s3g.bus.receive s3g-multichannel-1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            250.0,
            180.0,
            22.0
          ],
          "text": "sprintf s3g-multichannel-%ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-init",
          "maxclass": "newobj",
          "patching_rect": [
            680.0,
            215.0,
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
          "id": "obj-input-bus-init-defer",
          "maxclass": "newobj",
          "patching_rect": [
            680.0,
            250.0,
            58.0,
            22.0
          ],
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-output",
          "maxclass": "message",
          "patching_rect": [
            680.0,
            285.0,
            78.0,
            22.0
          ],
          "text": "outputvalue",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-hardware-routing",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            310.0,
            158.0,
            22.0
          ],
          "text": "p Hardware Output Pairs",
          "numinlets": 1,
          "numoutlets": 0,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 4,
              "architecture": "x64",
              "modernui": 1
            },
            "rect": [
              180.0,
              120.0,
              560.0,
              152.0
            ],
            "openinpresentation": 1,
            "default_fontsize": 11.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "locked_bgcolor": [
              0.05098,
              0.05098,
              0.05098,
              1.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "hw-inlet",
                  "maxclass": "inlet",
                  "patching_rect": [
                    10.0,
                    10.0,
                    30.0,
                    30.0
                  ],
                  "index": 1,
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-label-1",
                  "maxclass": "comment",
                  "patching_rect": [
                    12.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "text": "01/02",
                  "presentation": 1,
                  "presentation_rect": [
                    12.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-1",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    44.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    44.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    1
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-2",
                  "maxclass": "comment",
                  "patching_rect": [
                    12.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "text": "03/04",
                  "presentation": 1,
                  "presentation_rect": [
                    12.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-2",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    44.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    44.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    2
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-3",
                  "maxclass": "comment",
                  "patching_rect": [
                    12.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "text": "05/06",
                  "presentation": 1,
                  "presentation_rect": [
                    12.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-3",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    44.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    44.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    3
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-4",
                  "maxclass": "comment",
                  "patching_rect": [
                    12.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "text": "07/08",
                  "presentation": 1,
                  "presentation_rect": [
                    12.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-4",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    44.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    44.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    4
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-5",
                  "maxclass": "comment",
                  "patching_rect": [
                    148.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "text": "09/10",
                  "presentation": 1,
                  "presentation_rect": [
                    148.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-5",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    180.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    180.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    5
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-6",
                  "maxclass": "comment",
                  "patching_rect": [
                    148.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "text": "11/12",
                  "presentation": 1,
                  "presentation_rect": [
                    148.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-6",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    180.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    180.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    6
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-7",
                  "maxclass": "comment",
                  "patching_rect": [
                    148.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "text": "13/14",
                  "presentation": 1,
                  "presentation_rect": [
                    148.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-7",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    180.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    180.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    7
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-8",
                  "maxclass": "comment",
                  "patching_rect": [
                    148.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "text": "15/16",
                  "presentation": 1,
                  "presentation_rect": [
                    148.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-8",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    180.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    180.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    8
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-9",
                  "maxclass": "comment",
                  "patching_rect": [
                    284.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "text": "17/18",
                  "presentation": 1,
                  "presentation_rect": [
                    284.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-9",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    316.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    316.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    9
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-10",
                  "maxclass": "comment",
                  "patching_rect": [
                    284.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "text": "19/20",
                  "presentation": 1,
                  "presentation_rect": [
                    284.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-10",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    316.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    316.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    10
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-11",
                  "maxclass": "comment",
                  "patching_rect": [
                    284.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "text": "21/22",
                  "presentation": 1,
                  "presentation_rect": [
                    284.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-11",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    316.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    316.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    11
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-12",
                  "maxclass": "comment",
                  "patching_rect": [
                    284.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "text": "23/24",
                  "presentation": 1,
                  "presentation_rect": [
                    284.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-12",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    316.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    316.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    12
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-13",
                  "maxclass": "comment",
                  "patching_rect": [
                    420.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "text": "25/26",
                  "presentation": 1,
                  "presentation_rect": [
                    420.0,
                    10.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-13",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    452.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    452.0,
                    10.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    13
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-14",
                  "maxclass": "comment",
                  "patching_rect": [
                    420.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "text": "27/28",
                  "presentation": 1,
                  "presentation_rect": [
                    420.0,
                    42.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-14",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    452.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    452.0,
                    42.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    14
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-15",
                  "maxclass": "comment",
                  "patching_rect": [
                    420.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "text": "29/30",
                  "presentation": 1,
                  "presentation_rect": [
                    420.0,
                    74.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-15",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    452.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    452.0,
                    74.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    15
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              },
              {
                "box": {
                  "id": "obj-output-label-16",
                  "maxclass": "comment",
                  "patching_rect": [
                    420.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "text": "31/32",
                  "presentation": 1,
                  "presentation_rect": [
                    420.0,
                    106.0,
                    32.0,
                    20.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "fontname": "Arial",
                  "fontsize": 11.0,
                  "textcolor": [
                    0.6,
                    0.6,
                    0.6,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-output-selector-16",
                  "maxclass": "bpatcher",
                  "patching_rect": [
                    452.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    452.0,
                    106.0,
                    100.0,
                    20.0
                  ],
                  "name": "s3g.live.routing.channel_selector.maxpat",
                  "args": [
                    16
                  ],
                  "numinlets": 1,
                  "numoutlets": 0,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "lockeddragscroll": 0,
                  "lockedsize": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "viewvisibility": 1
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-1",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-3",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-5",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-8",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-9",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-10",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-11",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-12",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-13",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-14",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-15",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "hw-inlet",
                    0
                  ],
                  "destination": [
                    "obj-output-selector-16",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "obj-quad-output-init",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            215.0,
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
          "id": "obj-quad-output-init-defer",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            250.0,
            58.0,
            22.0
          ],
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-outputvalue",
          "maxclass": "message",
          "patching_rect": [
            800.0,
            285.0,
            78.0,
            22.0
          ],
          "text": "outputvalue",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-label-1",
          "maxclass": "comment",
          "patching_rect": [
            212.0,
            44.0,
            30.0,
            20.0
          ],
          "text": "L",
          "presentation": 1,
          "presentation_rect": [
            212.0,
            44.0,
            30.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 11.0,
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-1",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            70.0,
            22.0
          ],
          "hidden": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activetextcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "triangle": 1,
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 9.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Quad L Output Slot",
              "parameter_shortname": "L Out",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 32,
              "parameter_steps": 33,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "quad_output_1"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-1-menu",
          "maxclass": "umenu",
          "patching_rect": [
            248.0,
            44.0,
            70.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            248.0,
            44.0,
            70.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "items": [
            "OFF",
            ",",
            "01",
            ",",
            "02",
            ",",
            "03",
            ",",
            "04",
            ",",
            "05",
            ",",
            "06",
            ",",
            "07",
            ",",
            "08",
            ",",
            "09",
            ",",
            "10",
            ",",
            "11",
            ",",
            "12",
            ",",
            "13",
            ",",
            "14",
            ",",
            "15",
            ",",
            "16",
            ",",
            "17",
            ",",
            "18",
            ",",
            "19",
            ",",
            "20",
            ",",
            "21",
            ",",
            "22",
            ",",
            "23",
            ",",
            "24",
            ",",
            "25",
            ",",
            "26",
            ",",
            "27",
            ",",
            "28",
            ",",
            "29",
            ",",
            "30",
            ",",
            "31",
            ",",
            "32"
          ],
          "menumode": 0,
          "arrow": 1,
          "allowdrag": 0,
          "applycolors": 1,
          "bgfillcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "elementcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "annotation": "Choose quad l output slot from the menu.",
          "annotation_name": "Quad L Output Slot"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-1-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "+ 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-1-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "- 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-1-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            74.0,
            78.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-gate-1",
          "maxclass": "newobj",
          "patching_rect": [
            210.0,
            400.0,
            175.0,
            22.0
          ],
          "text": "gate~ 32 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 32,
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
          "id": "obj-quad-output-label-2",
          "maxclass": "comment",
          "patching_rect": [
            330.0,
            44.0,
            30.0,
            20.0
          ],
          "text": "R",
          "presentation": 1,
          "presentation_rect": [
            330.0,
            44.0,
            30.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 11.0,
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-2",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            70.0,
            22.0
          ],
          "hidden": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activetextcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "triangle": 1,
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 9.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Quad R Output Slot",
              "parameter_shortname": "R Out",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 32,
              "parameter_steps": 33,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "quad_output_2"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-2-menu",
          "maxclass": "umenu",
          "patching_rect": [
            366.0,
            44.0,
            70.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            366.0,
            44.0,
            70.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "items": [
            "OFF",
            ",",
            "01",
            ",",
            "02",
            ",",
            "03",
            ",",
            "04",
            ",",
            "05",
            ",",
            "06",
            ",",
            "07",
            ",",
            "08",
            ",",
            "09",
            ",",
            "10",
            ",",
            "11",
            ",",
            "12",
            ",",
            "13",
            ",",
            "14",
            ",",
            "15",
            ",",
            "16",
            ",",
            "17",
            ",",
            "18",
            ",",
            "19",
            ",",
            "20",
            ",",
            "21",
            ",",
            "22",
            ",",
            "23",
            ",",
            "24",
            ",",
            "25",
            ",",
            "26",
            ",",
            "27",
            ",",
            "28",
            ",",
            "29",
            ",",
            "30",
            ",",
            "31",
            ",",
            "32"
          ],
          "menumode": 0,
          "arrow": 1,
          "allowdrag": 0,
          "applycolors": 1,
          "bgfillcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "elementcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "annotation": "Choose quad r output slot from the menu.",
          "annotation_name": "Quad R Output Slot"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-2-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "+ 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-2-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "- 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-2-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            74.0,
            78.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-gate-2",
          "maxclass": "newobj",
          "patching_rect": [
            295.0,
            400.0,
            175.0,
            22.0
          ],
          "text": "gate~ 32 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 32,
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
          "id": "obj-quad-output-label-3",
          "maxclass": "comment",
          "patching_rect": [
            448.0,
            44.0,
            30.0,
            20.0
          ],
          "text": "RB",
          "presentation": 1,
          "presentation_rect": [
            448.0,
            44.0,
            30.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 11.0,
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-3",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            70.0,
            22.0
          ],
          "hidden": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activetextcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "triangle": 1,
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 9.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Quad RB Output Slot",
              "parameter_shortname": "RB Out",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                3
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 32,
              "parameter_steps": 33,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "quad_output_3"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-3-menu",
          "maxclass": "umenu",
          "patching_rect": [
            484.0,
            44.0,
            70.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            484.0,
            44.0,
            70.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "items": [
            "OFF",
            ",",
            "01",
            ",",
            "02",
            ",",
            "03",
            ",",
            "04",
            ",",
            "05",
            ",",
            "06",
            ",",
            "07",
            ",",
            "08",
            ",",
            "09",
            ",",
            "10",
            ",",
            "11",
            ",",
            "12",
            ",",
            "13",
            ",",
            "14",
            ",",
            "15",
            ",",
            "16",
            ",",
            "17",
            ",",
            "18",
            ",",
            "19",
            ",",
            "20",
            ",",
            "21",
            ",",
            "22",
            ",",
            "23",
            ",",
            "24",
            ",",
            "25",
            ",",
            "26",
            ",",
            "27",
            ",",
            "28",
            ",",
            "29",
            ",",
            "30",
            ",",
            "31",
            ",",
            "32"
          ],
          "menumode": 0,
          "arrow": 1,
          "allowdrag": 0,
          "applycolors": 1,
          "bgfillcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "elementcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "annotation": "Choose quad rb output slot from the menu.",
          "annotation_name": "Quad RB Output Slot"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-3-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "+ 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-3-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "- 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-3-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            74.0,
            78.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-gate-3",
          "maxclass": "newobj",
          "patching_rect": [
            380.0,
            400.0,
            175.0,
            22.0
          ],
          "text": "gate~ 32 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 32,
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
          "id": "obj-quad-output-label-4",
          "maxclass": "comment",
          "patching_rect": [
            566.0,
            44.0,
            30.0,
            20.0
          ],
          "text": "LB",
          "presentation": 1,
          "presentation_rect": [
            566.0,
            44.0,
            30.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 11.0,
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-4",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            70.0,
            22.0
          ],
          "hidden": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activetextcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "bordercolor": [
            0.28,
            0.28,
            0.28,
            1.0
          ],
          "focusbordercolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.6,
            0.6,
            0.6,
            1.0
          ],
          "triangle": 1,
          "tricolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 9.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Quad LB Output Slot",
              "parameter_shortname": "LB Out",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                4
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 32,
              "parameter_steps": 33,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "quad_output_4"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-4-menu",
          "maxclass": "umenu",
          "patching_rect": [
            602.0,
            44.0,
            70.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            602.0,
            44.0,
            70.0,
            20.0
          ],
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "items": [
            "OFF",
            ",",
            "01",
            ",",
            "02",
            ",",
            "03",
            ",",
            "04",
            ",",
            "05",
            ",",
            "06",
            ",",
            "07",
            ",",
            "08",
            ",",
            "09",
            ",",
            "10",
            ",",
            "11",
            ",",
            "12",
            ",",
            "13",
            ",",
            "14",
            ",",
            "15",
            ",",
            "16",
            ",",
            "17",
            ",",
            "18",
            ",",
            "19",
            ",",
            "20",
            ",",
            "21",
            ",",
            "22",
            ",",
            "23",
            ",",
            "24",
            ",",
            "25",
            ",",
            "26",
            ",",
            "27",
            ",",
            "28",
            ",",
            "29",
            ",",
            "30",
            ",",
            "31",
            ",",
            "32"
          ],
          "menumode": 0,
          "arrow": 1,
          "allowdrag": 0,
          "applycolors": 1,
          "bgfillcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "elementcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "annotation": "Choose quad lb output slot from the menu.",
          "annotation_name": "Quad LB Output Slot"
        }
      },
      {
        "box": {
          "id": "obj-quad-output-4-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "+ 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-4-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            74.0,
            38.0,
            22.0
          ],
          "text": "- 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-4-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            74.0,
            78.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-quad-output-gate-4",
          "maxclass": "newobj",
          "patching_rect": [
            465.0,
            400.0,
            175.0,
            22.0
          ],
          "text": "gate~ 32 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 32,
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
          "text": "openifempty \"s3g Output Autogain Quad 4\" org.s3g.s3g-dsp.mc-to-quad-autogain",
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
          "text": "pattr clap_state @autorestore 1 @thru 0",
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
          "id": "obj-state-restore-init",
          "maxclass": "newobj",
          "patching_rect": [
            525.0,
            740.0,
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
          "id": "obj-state-capture-enable",
          "maxclass": "message",
          "patching_rect": [
            590.0,
            740.0,
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
          "id": "obj-state-capture-gate",
          "maxclass": "newobj",
          "patching_rect": [
            650.0,
            775.0,
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
          "id": "obj-paramchanged-route",
          "maxclass": "newobj",
          "patching_rect": [
            805.0,
            435.0,
            290.0,
            22.0
          ],
          "text": "route 1 2 3 4 5 6 7 8 9",
          "numinlets": 1,
          "numoutlets": 10,
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
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-1",
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
              "parameter_annotation_name": "Input Channels",
              "parameter_longname": "Input Channels",
              "parameter_shortname": "Inputs",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                8
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 2,
              "parameter_mmax": 128,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 127
            }
          },
          "varname": "clap_param_1"
        }
      },
      {
        "box": {
          "id": "obj-param-message-1",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            125.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 1 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-1",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            565.0,
            65.0,
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
          "id": "obj-param-2",
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
              "parameter_annotation_name": "Width",
              "parameter_longname": "Width",
              "parameter_shortname": "Width",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                100
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 200,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_2"
        }
      },
      {
        "box": {
          "id": "obj-param-message-2",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            155.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 2 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-2",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            590.0,
            65.0,
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
          "id": "obj-param-3",
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
              "parameter_annotation_name": "Rotation",
              "parameter_longname": "Rotation",
              "parameter_shortname": "Rotation",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -180,
              "parameter_mmax": 180,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            185.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 3 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-3",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            615.0,
            65.0,
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
              "parameter_annotation_name": "Autogain",
              "parameter_longname": "Autogain",
              "parameter_shortname": "Autogain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 4,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Off",
                "Power/sqrt(N)",
                "Energy sum"
              ]
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
            215.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 4 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-4",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            640.0,
            65.0,
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
              "parameter_annotation_name": "Output Gain",
              "parameter_longname": "Output Gain",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -24,
              "parameter_mmax": 24,
              "parameter_modmode": 0,
              "parameter_order": 5,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            245.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 5 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-5",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            665.0,
            65.0,
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
              "parameter_annotation_name": "Layout",
              "parameter_longname": "Layout",
              "parameter_shortname": "Layout",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 7,
              "parameter_modmode": 0,
              "parameter_order": 6,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Ring projection",
                "Linear left-right",
                "Odd/even stereo",
                "Center-out",
                "Pair-preserving",
                "Sphere projection",
                "Hemisphere projection",
                "Cube projection"
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
            275.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 6 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-6",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            690.0,
            65.0,
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
              "parameter_annotation_name": "Layout Weight",
              "parameter_longname": "Layout Weight",
              "parameter_shortname": "Weight",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                100
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_modmode": 0,
              "parameter_order": 7,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            305.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 7 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-7",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            715.0,
            65.0,
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
              "parameter_annotation_name": "3D Attenuation",
              "parameter_longname": "3D Attenuation",
              "parameter_shortname": "3D Atten",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                45
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_modmode": 0,
              "parameter_order": 8,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            335.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 8 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-8",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            740.0,
            65.0,
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
              "parameter_annotation_name": "3D Distance",
              "parameter_longname": "3D Distance",
              "parameter_shortname": "3D Dist",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                100
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 200,
              "parameter_modmode": 0,
              "parameter_order": 9,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            365.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 9 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-9",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            765.0,
            65.0,
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
          "id": "obj-input-bus-number-menu-write-gate",
          "maxclass": "newobj",
          "patching_rect": [
            900.0,
            425.0,
            65.0,
            22.0
          ],
          "text": "gate 1 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-replay-ready",
          "maxclass": "newobj",
          "patching_rect": [
            900.0,
            335.0,
            34.0,
            22.0
          ],
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-replay-delay",
          "maxclass": "newobj",
          "patching_rect": [
            948.0,
            335.0,
            75.0,
            22.0
          ],
          "text": "delay 100",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-replay-order",
          "maxclass": "newobj",
          "patching_rect": [
            1040.0,
            335.0,
            74.0,
            22.0
          ],
          "text": "t b b b b",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-replay-close",
          "maxclass": "message",
          "patching_rect": [
            1130.0,
            335.0,
            30.0,
            22.0
          ],
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-input-bus-number-replay-open",
          "maxclass": "message",
          "patching_rect": [
            1170.0,
            335.0,
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
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-device",
            0
          ],
          "destination": [
            "obj-device-split",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-device-split",
            0
          ],
          "destination": [
            "obj-bus-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-device-split",
            1
          ],
          "destination": [
            "obj-once",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-once",
            0
          ],
          "destination": [
            "obj-output-init",
            0
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
            "obj-hardware-routing",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-hardware-button",
            0
          ],
          "destination": [
            "obj-hardware-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-hardware-open",
            0
          ],
          "destination": [
            "obj-hardware-pcontrol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-hardware-pcontrol",
            0
          ],
          "destination": [
            "obj-hardware-routing",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number",
            0
          ],
          "destination": [
            "obj-input-bus-symbol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-symbol",
            0
          ],
          "destination": [
            "obj-bus-receive",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-init",
            0
          ],
          "destination": [
            "obj-input-bus-init-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-init-defer",
            0
          ],
          "destination": [
            "obj-input-bus-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-output",
            0
          ],
          "destination": [
            "obj-input-bus-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-init",
            0
          ],
          "destination": [
            "obj-quad-output-init-defer",
            0
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
            "obj-quad-output-init-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-init-defer",
            0
          ],
          "destination": [
            "obj-quad-output-outputvalue",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            2
          ],
          "destination": [
            "obj-autogain-input-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            3
          ],
          "destination": [
            "obj-autogain-input-gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            4
          ],
          "destination": [
            "obj-autogain-input-gain",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            5
          ],
          "destination": [
            "obj-autogain-input-gain",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            6
          ],
          "destination": [
            "obj-autogain-input-gain",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            7
          ],
          "destination": [
            "obj-autogain-input-gain",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            8
          ],
          "destination": [
            "obj-autogain-input-gain",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            9
          ],
          "destination": [
            "obj-autogain-input-gain",
            7
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            10
          ],
          "destination": [
            "obj-autogain-input-gain",
            8
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            11
          ],
          "destination": [
            "obj-autogain-input-gain",
            9
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            12
          ],
          "destination": [
            "obj-autogain-input-gain",
            10
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            13
          ],
          "destination": [
            "obj-autogain-input-gain",
            11
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            14
          ],
          "destination": [
            "obj-autogain-input-gain",
            12
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            15
          ],
          "destination": [
            "obj-autogain-input-gain",
            13
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            16
          ],
          "destination": [
            "obj-autogain-input-gain",
            14
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            17
          ],
          "destination": [
            "obj-autogain-input-gain",
            15
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            18
          ],
          "destination": [
            "obj-autogain-input-gain",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            19
          ],
          "destination": [
            "obj-autogain-input-gain",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            20
          ],
          "destination": [
            "obj-autogain-input-gain",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            21
          ],
          "destination": [
            "obj-autogain-input-gain",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            22
          ],
          "destination": [
            "obj-autogain-input-gain",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            23
          ],
          "destination": [
            "obj-autogain-input-gain",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            24
          ],
          "destination": [
            "obj-autogain-input-gain",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            25
          ],
          "destination": [
            "obj-autogain-input-gain",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            26
          ],
          "destination": [
            "obj-autogain-input-gain",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            27
          ],
          "destination": [
            "obj-autogain-input-gain",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            28
          ],
          "destination": [
            "obj-autogain-input-gain",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            29
          ],
          "destination": [
            "obj-autogain-input-gain",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            30
          ],
          "destination": [
            "obj-autogain-input-gain",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            31
          ],
          "destination": [
            "obj-autogain-input-gain",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            32
          ],
          "destination": [
            "obj-autogain-input-gain",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            33
          ],
          "destination": [
            "obj-autogain-input-gain",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
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
            "obj-autogain-input-gain",
            1
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
            "obj-autogain-input-gain",
            2
          ],
          "destination": [
            "obj-clap",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            3
          ],
          "destination": [
            "obj-clap",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            4
          ],
          "destination": [
            "obj-clap",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            5
          ],
          "destination": [
            "obj-clap",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            6
          ],
          "destination": [
            "obj-clap",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            7
          ],
          "destination": [
            "obj-clap",
            7
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            8
          ],
          "destination": [
            "obj-clap",
            8
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            9
          ],
          "destination": [
            "obj-clap",
            9
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            10
          ],
          "destination": [
            "obj-clap",
            10
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            11
          ],
          "destination": [
            "obj-clap",
            11
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            12
          ],
          "destination": [
            "obj-clap",
            12
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            13
          ],
          "destination": [
            "obj-clap",
            13
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            14
          ],
          "destination": [
            "obj-clap",
            14
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            15
          ],
          "destination": [
            "obj-clap",
            15
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            16
          ],
          "destination": [
            "obj-clap",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            17
          ],
          "destination": [
            "obj-clap",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            18
          ],
          "destination": [
            "obj-clap",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            19
          ],
          "destination": [
            "obj-clap",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            20
          ],
          "destination": [
            "obj-clap",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            21
          ],
          "destination": [
            "obj-clap",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            22
          ],
          "destination": [
            "obj-clap",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            23
          ],
          "destination": [
            "obj-clap",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            24
          ],
          "destination": [
            "obj-clap",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            25
          ],
          "destination": [
            "obj-clap",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            26
          ],
          "destination": [
            "obj-clap",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            27
          ],
          "destination": [
            "obj-clap",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            28
          ],
          "destination": [
            "obj-clap",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            29
          ],
          "destination": [
            "obj-clap",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            30
          ],
          "destination": [
            "obj-clap",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-autogain-input-gain",
            31
          ],
          "destination": [
            "obj-clap",
            31
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
            "obj-quad-output-gate-1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1",
            0
          ],
          "destination": [
            "obj-quad-output-gate-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-outputvalue",
            0
          ],
          "destination": [
            "obj-quad-output-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1-menu",
            0
          ],
          "destination": [
            "obj-quad-output-1-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1",
            0
          ],
          "destination": [
            "obj-quad-output-1-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1-value-to-menu",
            0
          ],
          "destination": [
            "obj-quad-output-1-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1-menu-set",
            0
          ],
          "destination": [
            "obj-quad-output-1-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-1-menu-to-value",
            0
          ],
          "destination": [
            "obj-quad-output-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
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
            "obj-quad-output-gate-1",
            16
          ],
          "destination": [
            "obj-plugout",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            17
          ],
          "destination": [
            "obj-plugout",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            18
          ],
          "destination": [
            "obj-plugout",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            19
          ],
          "destination": [
            "obj-plugout",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            20
          ],
          "destination": [
            "obj-plugout",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            21
          ],
          "destination": [
            "obj-plugout",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            22
          ],
          "destination": [
            "obj-plugout",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            23
          ],
          "destination": [
            "obj-plugout",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            24
          ],
          "destination": [
            "obj-plugout",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            25
          ],
          "destination": [
            "obj-plugout",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            26
          ],
          "destination": [
            "obj-plugout",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            27
          ],
          "destination": [
            "obj-plugout",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            28
          ],
          "destination": [
            "obj-plugout",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            29
          ],
          "destination": [
            "obj-plugout",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            30
          ],
          "destination": [
            "obj-plugout",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-1",
            31
          ],
          "destination": [
            "obj-plugout",
            33
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
            "obj-quad-output-gate-2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2",
            0
          ],
          "destination": [
            "obj-quad-output-gate-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-outputvalue",
            0
          ],
          "destination": [
            "obj-quad-output-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2-menu",
            0
          ],
          "destination": [
            "obj-quad-output-2-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2",
            0
          ],
          "destination": [
            "obj-quad-output-2-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2-value-to-menu",
            0
          ],
          "destination": [
            "obj-quad-output-2-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2-menu-set",
            0
          ],
          "destination": [
            "obj-quad-output-2-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-2-menu-to-value",
            0
          ],
          "destination": [
            "obj-quad-output-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
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
            "obj-quad-output-gate-2",
            16
          ],
          "destination": [
            "obj-plugout",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            17
          ],
          "destination": [
            "obj-plugout",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            18
          ],
          "destination": [
            "obj-plugout",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            19
          ],
          "destination": [
            "obj-plugout",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            20
          ],
          "destination": [
            "obj-plugout",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            21
          ],
          "destination": [
            "obj-plugout",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            22
          ],
          "destination": [
            "obj-plugout",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            23
          ],
          "destination": [
            "obj-plugout",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            24
          ],
          "destination": [
            "obj-plugout",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            25
          ],
          "destination": [
            "obj-plugout",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            26
          ],
          "destination": [
            "obj-plugout",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            27
          ],
          "destination": [
            "obj-plugout",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            28
          ],
          "destination": [
            "obj-plugout",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            29
          ],
          "destination": [
            "obj-plugout",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            30
          ],
          "destination": [
            "obj-plugout",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-2",
            31
          ],
          "destination": [
            "obj-plugout",
            33
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
            "obj-quad-output-gate-3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3",
            0
          ],
          "destination": [
            "obj-quad-output-gate-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-outputvalue",
            0
          ],
          "destination": [
            "obj-quad-output-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3-menu",
            0
          ],
          "destination": [
            "obj-quad-output-3-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3",
            0
          ],
          "destination": [
            "obj-quad-output-3-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3-value-to-menu",
            0
          ],
          "destination": [
            "obj-quad-output-3-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3-menu-set",
            0
          ],
          "destination": [
            "obj-quad-output-3-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-3-menu-to-value",
            0
          ],
          "destination": [
            "obj-quad-output-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
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
            "obj-quad-output-gate-3",
            16
          ],
          "destination": [
            "obj-plugout",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            17
          ],
          "destination": [
            "obj-plugout",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            18
          ],
          "destination": [
            "obj-plugout",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            19
          ],
          "destination": [
            "obj-plugout",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            20
          ],
          "destination": [
            "obj-plugout",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            21
          ],
          "destination": [
            "obj-plugout",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            22
          ],
          "destination": [
            "obj-plugout",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            23
          ],
          "destination": [
            "obj-plugout",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            24
          ],
          "destination": [
            "obj-plugout",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            25
          ],
          "destination": [
            "obj-plugout",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            26
          ],
          "destination": [
            "obj-plugout",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            27
          ],
          "destination": [
            "obj-plugout",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            28
          ],
          "destination": [
            "obj-plugout",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            29
          ],
          "destination": [
            "obj-plugout",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            30
          ],
          "destination": [
            "obj-plugout",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-3",
            31
          ],
          "destination": [
            "obj-plugout",
            33
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
            "obj-quad-output-gate-4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4",
            0
          ],
          "destination": [
            "obj-quad-output-gate-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-outputvalue",
            0
          ],
          "destination": [
            "obj-quad-output-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4-menu",
            0
          ],
          "destination": [
            "obj-quad-output-4-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4",
            0
          ],
          "destination": [
            "obj-quad-output-4-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4-value-to-menu",
            0
          ],
          "destination": [
            "obj-quad-output-4-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4-menu-set",
            0
          ],
          "destination": [
            "obj-quad-output-4-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-4-menu-to-value",
            0
          ],
          "destination": [
            "obj-quad-output-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
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
            "obj-quad-output-gate-4",
            16
          ],
          "destination": [
            "obj-plugout",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            17
          ],
          "destination": [
            "obj-plugout",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            18
          ],
          "destination": [
            "obj-plugout",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            19
          ],
          "destination": [
            "obj-plugout",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            20
          ],
          "destination": [
            "obj-plugout",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            21
          ],
          "destination": [
            "obj-plugout",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            22
          ],
          "destination": [
            "obj-plugout",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            23
          ],
          "destination": [
            "obj-plugout",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            24
          ],
          "destination": [
            "obj-plugout",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            25
          ],
          "destination": [
            "obj-plugout",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            26
          ],
          "destination": [
            "obj-plugout",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            27
          ],
          "destination": [
            "obj-plugout",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            28
          ],
          "destination": [
            "obj-plugout",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            29
          ],
          "destination": [
            "obj-plugout",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            30
          ],
          "destination": [
            "obj-plugout",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-quad-output-gate-4",
            31
          ],
          "destination": [
            "obj-plugout",
            33
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
            4
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
            "obj-device",
            0
          ],
          "destination": [
            "obj-state-restore-init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-restore-init",
            2
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
            "obj-state-restore-init",
            1
          ],
          "destination": [
            "obj-state-capture-enable",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-capture-enable",
            0
          ],
          "destination": [
            "obj-state-capture-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-restore-init",
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
            "obj-state-capture-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-state-capture-gate",
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
            "obj-param-1",
            0
          ],
          "destination": [
            "obj-param-message-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-1",
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
            "obj-param-resync-delay",
            0
          ],
          "destination": [
            "obj-param-1",
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
            "obj-param-reflect-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-1",
            0
          ],
          "destination": [
            "obj-param-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-2",
            0
          ],
          "destination": [
            "obj-param-message-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-2",
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
            "obj-param-resync-delay",
            0
          ],
          "destination": [
            "obj-param-2",
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
            "obj-param-reflect-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-2",
            0
          ],
          "destination": [
            "obj-param-2",
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            2
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            3
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            4
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            5
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            6
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            7
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            8
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
            "obj-input-bus-init-defer",
            0
          ],
          "destination": [
            "obj-input-bus-number-replay-delay",
            0
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
            "obj-input-bus-number-replay-ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-ready",
            0
          ],
          "destination": [
            "obj-input-bus-number-replay-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-delay",
            0
          ],
          "destination": [
            "obj-input-bus-number-replay-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-order",
            3
          ],
          "destination": [
            "obj-input-bus-number-replay-close",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-close",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu-write-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-order",
            2
          ],
          "destination": [
            "obj-input-bus-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-order",
            1
          ],
          "destination": [
            "obj-input-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-order",
            0
          ],
          "destination": [
            "obj-input-bus-number-replay-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-replay-open",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu-write-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-menu",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number",
            0
          ],
          "destination": [
            "obj-input-bus-number-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-value-to-menu",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-menu-set",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-menu-to-value",
            0
          ],
          "destination": [
            "obj-input-bus-number-menu-write-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-bus-number-menu-write-gate",
            0
          ],
          "destination": [
            "obj-input-bus-number",
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
      "inherited_shortname": 1,
      "obj-input-bus-number": [
        "Multichannel Input Bus",
        "Input Bus",
        0
      ],
      "obj-autogain-input-gain": [
        "Output AutoGain Input Gain",
        "Input Gain",
        0
      ],
      "obj-quad-output-1": [
        "Quad L Output Slot",
        "L Out",
        0
      ],
      "obj-quad-output-2": [
        "Quad R Output Slot",
        "R Out",
        0
      ],
      "obj-quad-output-3": [
        "Quad RB Output Slot",
        "RB Out",
        0
      ],
      "obj-quad-output-4": [
        "Quad LB Output Slot",
        "LB Out",
        0
      ],
      "obj-param-1": [
        "Input Channels",
        "Inputs",
        1
      ],
      "obj-param-2": [
        "Width",
        "Width",
        2
      ],
      "obj-param-3": [
        "Rotation",
        "Rotation",
        3
      ],
      "obj-param-4": [
        "Autogain",
        "Autogain",
        4
      ],
      "obj-param-5": [
        "Output Gain",
        "Output",
        5
      ],
      "obj-param-6": [
        "Layout",
        "Layout",
        6
      ],
      "obj-param-7": [
        "Layout Weight",
        "Weight",
        7
      ],
      "obj-param-8": [
        "3D Attenuation",
        "3D Atten",
        8
      ],
      "obj-param-9": [
        "3D Distance",
        "3D Dist",
        9
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
