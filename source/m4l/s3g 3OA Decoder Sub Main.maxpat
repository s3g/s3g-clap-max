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
    "description": "Fixed s3g Ambi Decoder Sub 8 decoder: receives the private 3OA master bus and maps up to 32 mono decoded outputs to Live hardware pairs. Only eight Sub outputs can be active; other slots are silent.",
    "digest": "Fixed s3g Ambi Decoder Sub 8 decoder: receives the private 3OA master bus and maps up to 32 mono decoded outputs to Live hardware pairs. Only eight Sub outputs can be active; other slots are silent.",
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
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            180.0,
            320.0,
            22.0
          ],
          "text": "plugin~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18",
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
          "id": "obj-ambi-input-gain",
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
          "channels": 16,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 16,
          "numoutlets": 19,
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
              "parameter_longname": "Ambisonic Input Gain",
              "parameter_shortname": "3OA Gain",
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
          "varname": "ambisonic_input_gain"
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
          "text": "s3g.clap~ 16 32",
          "numinlets": 16,
          "numoutlets": 33,
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
            560.0,
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
            140.0,
            22.0
          ],
          "text": "s3g.bus.receive master",
          "numinlets": 1,
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
          "id": "obj-mono-matrix",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            340.0,
            200.0,
            22.0
          ],
          "text": "matrix~ 32 32 1. @ramp 5.",
          "numinlets": 32,
          "numoutlets": 33,
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
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-init",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            120.0,
            62.0,
            22.0
          ],
          "text": "loadbang",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-init-defer",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            150.0,
            62.0,
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
          "id": "obj-mono-outputvalue",
          "maxclass": "message",
          "patching_rect": [
            920.0,
            180.0,
            80.0,
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
          "id": "obj-mono-grid",
          "maxclass": "matrixctrl",
          "patching_rect": [
            910.0,
            230.0,
            448.0,
            112.0
          ],
          "presentation": 1,
          "presentation_rect": [
            240.0,
            28.0,
            448.0,
            112.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "list"
          ],
          "columns": 32,
          "rows": 8,
          "range": 2,
          "parameter_enable": 0,
          "horizontalmargin": 0,
          "verticalmargin": 0,
          "horizontalspacing": 0,
          "verticalspacing": 0,
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "elementcolor": [
            0.2,
            0.2,
            0.2,
            1.0
          ],
          "color": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "annotation": "Rows are decoder input channels on the selected page; columns are mono output slots 01–32. Click a lit cell again to disconnect."
        }
      },
      {
        "box": {
          "id": "obj-mono-page-menu",
          "maxclass": "umenu",
          "patching_rect": [
            910.0,
            360.0,
            108.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            204.0,
            142.0,
            108.0,
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
            "IN 01–08",
            ",",
            "IN 09–16",
            ",",
            "IN 17–24",
            ",",
            "IN 25–32"
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
          "annotation": "Choose which eight decoded input channels the grid edits."
        }
      },
      {
        "box": {
          "id": "obj-mono-page-init",
          "maxclass": "newobj",
          "patching_rect": [
            910.0,
            390.0,
            64.0,
            22.0
          ],
          "text": "loadbang",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-page-first",
          "maxclass": "message",
          "patching_rect": [
            990.0,
            390.0,
            36.0,
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
          "id": "obj-mono-page-one",
          "maxclass": "newobj",
          "patching_rect": [
            1040.0,
            390.0,
            40.0,
            22.0
          ],
          "text": "+ 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-page-order",
          "maxclass": "newobj",
          "patching_rect": [
            1090.0,
            390.0,
            58.0,
            22.0
          ],
          "text": "t b i i",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-current-page",
          "maxclass": "newobj",
          "patching_rect": [
            1160.0,
            390.0,
            40.0,
            22.0
          ],
          "text": "i 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-redraw",
          "maxclass": "newobj",
          "patching_rect": [
            910.0,
            430.0,
            58.0,
            22.0
          ],
          "text": "t b b b",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-close",
          "maxclass": "message",
          "patching_rect": [
            980.0,
            430.0,
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
          "id": "obj-mono-click-open",
          "maxclass": "message",
          "patching_rect": [
            1020.0,
            430.0,
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
          "id": "obj-mono-redraw-body",
          "maxclass": "newobj",
          "patching_rect": [
            1060.0,
            430.0,
            46.0,
            22.0
          ],
          "text": "t b b",
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
          "id": "obj-mono-clear",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            430.0,
            50.0,
            22.0
          ],
          "text": "clear",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-select-page",
          "maxclass": "newobj",
          "patching_rect": [
            1190.0,
            430.0,
            105.0,
            22.0
          ],
          "text": "sel 1 2 3 4",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
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
          "id": "obj-mono-click-gate",
          "maxclass": "newobj",
          "patching_rect": [
            910.0,
            480.0,
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
          "id": "obj-mono-click-unpack",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            480.0,
            100.0,
            22.0
          ],
          "text": "unpack i i i",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-channel",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            480.0,
            220.0,
            22.0
          ],
          "text": "expr $i1 + (($i2 - 1) * 8) + 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-channel-store",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            480.0,
            40.0,
            22.0
          ],
          "text": "i 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-value",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            510.0,
            210.0,
            22.0
          ],
          "text": "expr ($i2 != 0) * ($i1 + 1)",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-order",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            510.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-click-pack",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            510.0,
            70.0,
            22.0
          ],
          "text": "pack i i",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-click-route",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            510.0,
            430.0,
            22.0
          ],
          "text": "route 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32",
          "numinlets": 1,
          "numoutlets": 33,
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
          "id": "obj-mono-output-heading-1",
          "maxclass": "comment",
          "patching_rect": [
            240.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "01–04",
          "presentation": 1,
          "presentation_rect": [
            240.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-2",
          "maxclass": "comment",
          "patching_rect": [
            296.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "05–08",
          "presentation": 1,
          "presentation_rect": [
            296.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-3",
          "maxclass": "comment",
          "patching_rect": [
            352.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "09–12",
          "presentation": 1,
          "presentation_rect": [
            352.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-4",
          "maxclass": "comment",
          "patching_rect": [
            408.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "13–16",
          "presentation": 1,
          "presentation_rect": [
            408.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-5",
          "maxclass": "comment",
          "patching_rect": [
            464.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "17–20",
          "presentation": 1,
          "presentation_rect": [
            464.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-6",
          "maxclass": "comment",
          "patching_rect": [
            520.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "21–24",
          "presentation": 1,
          "presentation_rect": [
            520.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-7",
          "maxclass": "comment",
          "patching_rect": [
            576.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "25–28",
          "presentation": 1,
          "presentation_rect": [
            576.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-output-heading-8",
          "maxclass": "comment",
          "patching_rect": [
            632.0,
            8.0,
            56.0,
            18.0
          ],
          "text": "29–32",
          "presentation": 1,
          "presentation_rect": [
            632.0,
            8.0,
            56.0,
            18.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-1",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            28.0,
            30.0,
            14.0
          ],
          "text": "01",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            28.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-1-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            550.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-1-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            550.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-1-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            550.0,
            84.0,
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
          "id": "obj-mono-row-label-2",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            42.0,
            30.0,
            14.0
          ],
          "text": "02",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            42.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-2-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            576.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 2",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-2-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            576.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-2-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            576.0,
            84.0,
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
          "id": "obj-mono-row-label-3",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            56.0,
            30.0,
            14.0
          ],
          "text": "03",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            56.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-3-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            602.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 3",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-3-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            602.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-3-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            602.0,
            84.0,
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
          "id": "obj-mono-row-label-4",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            70.0,
            30.0,
            14.0
          ],
          "text": "04",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            70.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-4-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            628.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 4",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-4-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            628.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-4-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            628.0,
            84.0,
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
          "id": "obj-mono-row-label-5",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            84.0,
            30.0,
            14.0
          ],
          "text": "05",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            84.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-5-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            654.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 5",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-5-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            654.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-5-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            654.0,
            84.0,
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
          "id": "obj-mono-row-label-6",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            98.0,
            30.0,
            14.0
          ],
          "text": "06",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            98.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-6-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            680.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 6",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-6-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            680.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-6-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            680.0,
            84.0,
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
          "id": "obj-mono-row-label-7",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            112.0,
            30.0,
            14.0
          ],
          "text": "07",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            112.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-7-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            706.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 7",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-7-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            706.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-7-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            706.0,
            84.0,
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
          "id": "obj-mono-row-label-8",
          "maxclass": "comment",
          "patching_rect": [
            204.0,
            126.0,
            30.0,
            14.0
          ],
          "text": "08",
          "presentation": 1,
          "presentation_rect": [
            204.0,
            126.0,
            30.0,
            14.0
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontname": "Arial",
          "fontsize": 9.0,
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
          "id": "obj-mono-row-label-8-number",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            732.0,
            190.0,
            22.0
          ],
          "text": "expr (($i1 - 1) * 8) + 8",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-8-format",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            732.0,
            100.0,
            22.0
          ],
          "text": "sprintf symout %02ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-row-label-8-set",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            732.0,
            84.0,
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
          "id": "obj-mono-page-1-rows",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            770.0,
            140.0,
            22.0
          ],
          "text": "t b b b b b b b b",
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
          "id": "obj-mono-page-2-rows",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            805.0,
            140.0,
            22.0
          ],
          "text": "t b b b b b b b b",
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
          "id": "obj-mono-page-3-rows",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            840.0,
            140.0,
            22.0
          ],
          "text": "t b b b b b b b b",
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
          "id": "obj-mono-page-4-rows",
          "maxclass": "newobj",
          "patching_rect": [
            1200.0,
            875.0,
            140.0,
            22.0
          ],
          "text": "t b b b b b b b b",
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
          "id": "obj-mono-output-1",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 1 Output",
              "parameter_shortname": "Out 1",
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
          "varname": "mono_output_1"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            30.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-1-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            30.0,
            46.0,
            22.0
          ],
          "text": "i 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            30.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-1-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            30.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            30.0,
            100.0,
            22.0
          ],
          "text": "set $1 0 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            30.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-1-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            30.0,
            34.0,
            22.0
          ],
          "text": "i 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            30.0,
            84.0,
            22.0
          ],
          "text": "0 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            30.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-1-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            30.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-1-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            30.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-1-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            30.0,
            84.0,
            22.0
          ],
          "text": "0 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 2 Output",
              "parameter_shortname": "Out 2",
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
          "varname": "mono_output_2"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            60.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-2-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            60.0,
            46.0,
            22.0
          ],
          "text": "i 2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            60.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-2-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            60.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            60.0,
            100.0,
            22.0
          ],
          "text": "set $1 1 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            60.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-2-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            60.0,
            34.0,
            22.0
          ],
          "text": "i 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            60.0,
            84.0,
            22.0
          ],
          "text": "1 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            60.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-2-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            60.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-2-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            60.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-2-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            60.0,
            84.0,
            22.0
          ],
          "text": "1 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 3 Output",
              "parameter_shortname": "Out 3",
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
          "varname": "mono_output_3"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            90.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-3-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            90.0,
            46.0,
            22.0
          ],
          "text": "i 3",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            90.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-3-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            90.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            90.0,
            100.0,
            22.0
          ],
          "text": "set $1 2 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            90.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-3-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            90.0,
            34.0,
            22.0
          ],
          "text": "i 2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            90.0,
            84.0,
            22.0
          ],
          "text": "2 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            90.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-3-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            90.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-3-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            90.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-3-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            90.0,
            84.0,
            22.0
          ],
          "text": "2 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 4 Output",
              "parameter_shortname": "Out 4",
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
          "varname": "mono_output_4"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            120.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-4-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            120.0,
            46.0,
            22.0
          ],
          "text": "i 4",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            120.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-4-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            120.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            120.0,
            100.0,
            22.0
          ],
          "text": "set $1 3 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            120.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-4-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            120.0,
            34.0,
            22.0
          ],
          "text": "i 3",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            120.0,
            84.0,
            22.0
          ],
          "text": "3 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            120.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-4-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            120.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-4-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            120.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-4-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            120.0,
            84.0,
            22.0
          ],
          "text": "3 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 5 Output",
              "parameter_shortname": "Out 5",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                5
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
          "varname": "mono_output_5"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            150.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-5-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            150.0,
            46.0,
            22.0
          ],
          "text": "i 5",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            150.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-5-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            150.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            150.0,
            100.0,
            22.0
          ],
          "text": "set $1 4 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            150.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-5-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            150.0,
            34.0,
            22.0
          ],
          "text": "i 4",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            150.0,
            84.0,
            22.0
          ],
          "text": "4 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            150.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-5-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            150.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-5-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            150.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-5-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            150.0,
            84.0,
            22.0
          ],
          "text": "4 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 6 Output",
              "parameter_shortname": "Out 6",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                6
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
          "varname": "mono_output_6"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            180.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-6-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            180.0,
            46.0,
            22.0
          ],
          "text": "i 6",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            180.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-6-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            180.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            180.0,
            100.0,
            22.0
          ],
          "text": "set $1 5 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            180.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-6-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            180.0,
            34.0,
            22.0
          ],
          "text": "i 5",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            180.0,
            84.0,
            22.0
          ],
          "text": "5 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            180.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-6-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            180.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-6-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            180.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-6-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            180.0,
            84.0,
            22.0
          ],
          "text": "5 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 7 Output",
              "parameter_shortname": "Out 7",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                7
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
          "varname": "mono_output_7"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            210.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-7-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            210.0,
            46.0,
            22.0
          ],
          "text": "i 7",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            210.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-7-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            210.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            210.0,
            100.0,
            22.0
          ],
          "text": "set $1 6 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            210.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-7-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            210.0,
            34.0,
            22.0
          ],
          "text": "i 6",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            210.0,
            84.0,
            22.0
          ],
          "text": "6 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            210.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-7-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            210.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-7-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            210.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-7-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            210.0,
            84.0,
            22.0
          ],
          "text": "6 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 8 Output",
              "parameter_shortname": "Out 8",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                8
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
          "varname": "mono_output_8"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            240.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-8-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            240.0,
            46.0,
            22.0
          ],
          "text": "i 8",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            240.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-8-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            240.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            240.0,
            100.0,
            22.0
          ],
          "text": "set $1 7 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            240.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-8-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            240.0,
            34.0,
            22.0
          ],
          "text": "i 7",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            240.0,
            84.0,
            22.0
          ],
          "text": "7 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            240.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-8-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            240.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-8-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            240.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-8-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            240.0,
            84.0,
            22.0
          ],
          "text": "7 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 9 Output",
              "parameter_shortname": "Out 9",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                9
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
          "varname": "mono_output_9"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            270.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-9-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            270.0,
            46.0,
            22.0
          ],
          "text": "i 9",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            270.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-9-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            270.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            270.0,
            100.0,
            22.0
          ],
          "text": "set $1 0 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            270.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-9-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            270.0,
            34.0,
            22.0
          ],
          "text": "i 8",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            270.0,
            84.0,
            22.0
          ],
          "text": "8 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            270.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-9-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            270.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-9-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            270.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-9-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            270.0,
            84.0,
            22.0
          ],
          "text": "8 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 10 Output",
              "parameter_shortname": "Out 10",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                10
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
          "varname": "mono_output_10"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            300.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-10-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            300.0,
            46.0,
            22.0
          ],
          "text": "i 10",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            300.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-10-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            300.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            300.0,
            100.0,
            22.0
          ],
          "text": "set $1 1 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            300.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-10-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            300.0,
            34.0,
            22.0
          ],
          "text": "i 9",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            300.0,
            84.0,
            22.0
          ],
          "text": "9 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            300.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-10-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            300.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-10-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            300.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-10-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            300.0,
            84.0,
            22.0
          ],
          "text": "9 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 11 Output",
              "parameter_shortname": "Out 11",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                11
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
          "varname": "mono_output_11"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            330.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-11-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            330.0,
            46.0,
            22.0
          ],
          "text": "i 11",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            330.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-11-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            330.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            330.0,
            100.0,
            22.0
          ],
          "text": "set $1 2 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            330.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-11-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            330.0,
            34.0,
            22.0
          ],
          "text": "i 10",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            330.0,
            84.0,
            22.0
          ],
          "text": "10 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            330.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-11-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            330.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-11-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            330.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-11-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            330.0,
            84.0,
            22.0
          ],
          "text": "10 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 12 Output",
              "parameter_shortname": "Out 12",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                12
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
          "varname": "mono_output_12"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            360.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-12-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            360.0,
            46.0,
            22.0
          ],
          "text": "i 12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            360.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-12-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            360.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            360.0,
            100.0,
            22.0
          ],
          "text": "set $1 3 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            360.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-12-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            360.0,
            34.0,
            22.0
          ],
          "text": "i 11",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            360.0,
            84.0,
            22.0
          ],
          "text": "11 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            360.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-12-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            360.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-12-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            360.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-12-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            360.0,
            84.0,
            22.0
          ],
          "text": "11 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 13 Output",
              "parameter_shortname": "Out 13",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                13
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
          "varname": "mono_output_13"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            390.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-13-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            390.0,
            46.0,
            22.0
          ],
          "text": "i 13",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            390.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-13-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            390.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            390.0,
            100.0,
            22.0
          ],
          "text": "set $1 4 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            390.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-13-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            390.0,
            34.0,
            22.0
          ],
          "text": "i 12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            390.0,
            84.0,
            22.0
          ],
          "text": "12 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            390.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-13-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            390.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-13-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            390.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-13-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            390.0,
            84.0,
            22.0
          ],
          "text": "12 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 14 Output",
              "parameter_shortname": "Out 14",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                14
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
          "varname": "mono_output_14"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            420.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-14-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            420.0,
            46.0,
            22.0
          ],
          "text": "i 14",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            420.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-14-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            420.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            420.0,
            100.0,
            22.0
          ],
          "text": "set $1 5 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            420.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-14-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            420.0,
            34.0,
            22.0
          ],
          "text": "i 13",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            420.0,
            84.0,
            22.0
          ],
          "text": "13 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            420.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-14-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            420.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-14-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            420.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-14-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            420.0,
            84.0,
            22.0
          ],
          "text": "13 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 15 Output",
              "parameter_shortname": "Out 15",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                15
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
          "varname": "mono_output_15"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            450.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-15-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            450.0,
            46.0,
            22.0
          ],
          "text": "i 15",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            450.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-15-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            450.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            450.0,
            100.0,
            22.0
          ],
          "text": "set $1 6 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            450.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-15-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            450.0,
            34.0,
            22.0
          ],
          "text": "i 14",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            450.0,
            84.0,
            22.0
          ],
          "text": "14 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            450.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-15-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            450.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-15-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            450.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-15-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            450.0,
            84.0,
            22.0
          ],
          "text": "14 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 16 Output",
              "parameter_shortname": "Out 16",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                16
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
          "varname": "mono_output_16"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            480.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-16-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            480.0,
            46.0,
            22.0
          ],
          "text": "i 16",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            480.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-16-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            480.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            480.0,
            100.0,
            22.0
          ],
          "text": "set $1 7 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            480.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-16-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            480.0,
            34.0,
            22.0
          ],
          "text": "i 15",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            480.0,
            84.0,
            22.0
          ],
          "text": "15 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            480.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-16-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            480.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-16-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            480.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-16-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            480.0,
            84.0,
            22.0
          ],
          "text": "15 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 17 Output",
              "parameter_shortname": "Out 17",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                17
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
          "varname": "mono_output_17"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            510.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-17-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            510.0,
            46.0,
            22.0
          ],
          "text": "i 17",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            510.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-17-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            510.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            510.0,
            100.0,
            22.0
          ],
          "text": "set $1 0 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            510.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-17-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            510.0,
            34.0,
            22.0
          ],
          "text": "i 16",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            510.0,
            84.0,
            22.0
          ],
          "text": "16 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            510.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-17-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            510.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-17-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            510.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-17-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            510.0,
            84.0,
            22.0
          ],
          "text": "16 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 18 Output",
              "parameter_shortname": "Out 18",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                18
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
          "varname": "mono_output_18"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            540.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-18-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            540.0,
            46.0,
            22.0
          ],
          "text": "i 18",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            540.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-18-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            540.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            540.0,
            100.0,
            22.0
          ],
          "text": "set $1 1 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            540.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-18-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            540.0,
            34.0,
            22.0
          ],
          "text": "i 17",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            540.0,
            84.0,
            22.0
          ],
          "text": "17 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            540.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-18-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            540.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-18-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            540.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-18-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            540.0,
            84.0,
            22.0
          ],
          "text": "17 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 19 Output",
              "parameter_shortname": "Out 19",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                19
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
          "varname": "mono_output_19"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            570.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-19-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            570.0,
            46.0,
            22.0
          ],
          "text": "i 19",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            570.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-19-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            570.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            570.0,
            100.0,
            22.0
          ],
          "text": "set $1 2 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            570.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-19-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            570.0,
            34.0,
            22.0
          ],
          "text": "i 18",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            570.0,
            84.0,
            22.0
          ],
          "text": "18 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            570.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-19-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            570.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-19-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            570.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-19-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            570.0,
            84.0,
            22.0
          ],
          "text": "18 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 20 Output",
              "parameter_shortname": "Out 20",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                20
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
          "varname": "mono_output_20"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            600.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-20-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            600.0,
            46.0,
            22.0
          ],
          "text": "i 20",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            600.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-20-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            600.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            600.0,
            100.0,
            22.0
          ],
          "text": "set $1 3 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            600.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-20-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            600.0,
            34.0,
            22.0
          ],
          "text": "i 19",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            600.0,
            84.0,
            22.0
          ],
          "text": "19 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            600.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-20-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            600.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-20-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            600.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-20-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            600.0,
            84.0,
            22.0
          ],
          "text": "19 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 21 Output",
              "parameter_shortname": "Out 21",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                21
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
          "varname": "mono_output_21"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            630.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-21-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            630.0,
            46.0,
            22.0
          ],
          "text": "i 21",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            630.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-21-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            630.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            630.0,
            100.0,
            22.0
          ],
          "text": "set $1 4 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            630.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-21-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            630.0,
            34.0,
            22.0
          ],
          "text": "i 20",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            630.0,
            84.0,
            22.0
          ],
          "text": "20 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            630.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-21-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            630.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-21-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            630.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-21-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            630.0,
            84.0,
            22.0
          ],
          "text": "20 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 22 Output",
              "parameter_shortname": "Out 22",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                22
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
          "varname": "mono_output_22"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            660.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-22-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            660.0,
            46.0,
            22.0
          ],
          "text": "i 22",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            660.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-22-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            660.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            660.0,
            100.0,
            22.0
          ],
          "text": "set $1 5 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            660.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-22-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            660.0,
            34.0,
            22.0
          ],
          "text": "i 21",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            660.0,
            84.0,
            22.0
          ],
          "text": "21 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            660.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-22-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            660.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-22-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            660.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-22-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            660.0,
            84.0,
            22.0
          ],
          "text": "21 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 23 Output",
              "parameter_shortname": "Out 23",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                23
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
          "varname": "mono_output_23"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            690.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-23-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            690.0,
            46.0,
            22.0
          ],
          "text": "i 23",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            690.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-23-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            690.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            690.0,
            100.0,
            22.0
          ],
          "text": "set $1 6 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            690.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-23-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            690.0,
            34.0,
            22.0
          ],
          "text": "i 22",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            690.0,
            84.0,
            22.0
          ],
          "text": "22 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            690.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-23-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            690.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-23-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            690.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-23-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            690.0,
            84.0,
            22.0
          ],
          "text": "22 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 24 Output",
              "parameter_shortname": "Out 24",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                24
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
          "varname": "mono_output_24"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            720.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-24-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            720.0,
            46.0,
            22.0
          ],
          "text": "i 24",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            720.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-24-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            720.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            720.0,
            100.0,
            22.0
          ],
          "text": "set $1 7 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            720.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-24-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            720.0,
            34.0,
            22.0
          ],
          "text": "i 23",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            720.0,
            84.0,
            22.0
          ],
          "text": "23 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            720.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-24-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            720.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-24-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            720.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-24-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            720.0,
            84.0,
            22.0
          ],
          "text": "23 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 25 Output",
              "parameter_shortname": "Out 25",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                25
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
          "varname": "mono_output_25"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            750.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-25-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            750.0,
            46.0,
            22.0
          ],
          "text": "i 25",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            750.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-25-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            750.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            750.0,
            100.0,
            22.0
          ],
          "text": "set $1 0 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            750.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-25-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            750.0,
            34.0,
            22.0
          ],
          "text": "i 24",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            750.0,
            84.0,
            22.0
          ],
          "text": "24 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            750.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-25-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            750.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-25-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            750.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-25-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            750.0,
            84.0,
            22.0
          ],
          "text": "24 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 26 Output",
              "parameter_shortname": "Out 26",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                26
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
          "varname": "mono_output_26"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            780.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-26-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            780.0,
            46.0,
            22.0
          ],
          "text": "i 26",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            780.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-26-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            780.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            780.0,
            100.0,
            22.0
          ],
          "text": "set $1 1 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            780.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-26-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            780.0,
            34.0,
            22.0
          ],
          "text": "i 25",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            780.0,
            84.0,
            22.0
          ],
          "text": "25 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            780.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-26-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            780.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-26-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            780.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-26-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            780.0,
            84.0,
            22.0
          ],
          "text": "25 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 27 Output",
              "parameter_shortname": "Out 27",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                27
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
          "varname": "mono_output_27"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            810.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-27-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            810.0,
            46.0,
            22.0
          ],
          "text": "i 27",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            810.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-27-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            810.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            810.0,
            100.0,
            22.0
          ],
          "text": "set $1 2 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            810.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-27-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            810.0,
            34.0,
            22.0
          ],
          "text": "i 26",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            810.0,
            84.0,
            22.0
          ],
          "text": "26 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            810.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-27-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            810.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-27-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            810.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-27-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            810.0,
            84.0,
            22.0
          ],
          "text": "26 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 28 Output",
              "parameter_shortname": "Out 28",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                28
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
          "varname": "mono_output_28"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            840.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-28-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            840.0,
            46.0,
            22.0
          ],
          "text": "i 28",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            840.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-28-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            840.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            840.0,
            100.0,
            22.0
          ],
          "text": "set $1 3 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            840.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-28-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            840.0,
            34.0,
            22.0
          ],
          "text": "i 27",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            840.0,
            84.0,
            22.0
          ],
          "text": "27 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            840.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-28-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            840.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-28-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            840.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-28-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            840.0,
            84.0,
            22.0
          ],
          "text": "27 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 29 Output",
              "parameter_shortname": "Out 29",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                29
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
          "varname": "mono_output_29"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            870.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-29-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            870.0,
            46.0,
            22.0
          ],
          "text": "i 29",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            870.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-29-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            870.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            870.0,
            100.0,
            22.0
          ],
          "text": "set $1 4 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            870.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-29-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            870.0,
            34.0,
            22.0
          ],
          "text": "i 28",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            870.0,
            84.0,
            22.0
          ],
          "text": "28 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            870.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-29-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            870.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-29-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            870.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-29-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            870.0,
            84.0,
            22.0
          ],
          "text": "28 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 30 Output",
              "parameter_shortname": "Out 30",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                30
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
          "varname": "mono_output_30"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            900.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-30-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            900.0,
            46.0,
            22.0
          ],
          "text": "i 30",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            900.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-30-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            900.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            900.0,
            100.0,
            22.0
          ],
          "text": "set $1 5 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            900.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-30-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            900.0,
            34.0,
            22.0
          ],
          "text": "i 29",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            900.0,
            84.0,
            22.0
          ],
          "text": "29 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            900.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-30-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            900.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-30-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            900.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-30-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            900.0,
            84.0,
            22.0
          ],
          "text": "29 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 31 Output",
              "parameter_shortname": "Out 31",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                31
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
          "varname": "mono_output_31"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            930.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-31-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            930.0,
            46.0,
            22.0
          ],
          "text": "i 31",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            930.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-31-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            930.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            930.0,
            100.0,
            22.0
          ],
          "text": "set $1 6 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            930.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-31-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            930.0,
            34.0,
            22.0
          ],
          "text": "i 30",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            930.0,
            84.0,
            22.0
          ],
          "text": "30 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            930.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-31-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            930.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-31-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            930.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-31-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            930.0,
            84.0,
            22.0
          ],
          "text": "30 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            60.0,
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
              "parameter_longname": "Decoder Channel 32 Output",
              "parameter_shortname": "Out 32",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                32
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
          "varname": "mono_output_32"
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-store-input",
          "maxclass": "newobj",
          "patching_rect": [
            1790.0,
            960.0,
            46.0,
            22.0
          ],
          "text": "t b i",
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
          "id": "obj-mono-output-32-store",
          "maxclass": "newobj",
          "patching_rect": [
            1840.0,
            960.0,
            46.0,
            22.0
          ],
          "text": "i 32",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-display-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1900.0,
            960.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-32-display-column",
          "maxclass": "newobj",
          "patching_rect": [
            1980.0,
            960.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-display-set",
          "maxclass": "message",
          "patching_rect": [
            2030.0,
            960.0,
            100.0,
            22.0
          ],
          "text": "set $1 7 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1280.0,
            960.0,
            34.0,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-mono-output-32-old",
          "maxclass": "newobj",
          "patching_rect": [
            1330.0,
            960.0,
            34.0,
            22.0
          ],
          "text": "i 31",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-disconnect",
          "maxclass": "message",
          "patching_rect": [
            1380.0,
            960.0,
            84.0,
            22.0
          ],
          "text": "31 $1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1480.0,
            960.0,
            72.0,
            22.0
          ],
          "text": "split 1 32",
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
          "id": "obj-mono-output-32-zero-based",
          "maxclass": "newobj",
          "patching_rect": [
            1570.0,
            960.0,
            38.0,
            22.0
          ],
          "text": "- 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-mono-output-32-new",
          "maxclass": "newobj",
          "patching_rect": [
            1630.0,
            960.0,
            34.0,
            22.0
          ],
          "text": "t i i",
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
          "id": "obj-mono-output-32-connect",
          "maxclass": "message",
          "patching_rect": [
            1680.0,
            960.0,
            84.0,
            22.0
          ],
          "text": "31 $1 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
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
          "text": "openifempty \"s3g Ambi Decoder Sub 8\" org.s3g.s3g-dsp.ambisonic-sub-decoder",
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
          "text": "route 2 3 5",
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
          "id": "obj-param-2",
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
              "parameter_annotation_name": "Subs",
              "parameter_longname": "Subs",
              "parameter_shortname": "Subs",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 8,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 8
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
            125.0,
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
          "id": "obj-param-3",
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
              "parameter_annotation_name": "Cutoff",
              "parameter_longname": "Cutoff",
              "parameter_shortname": "Cutoff",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                90
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 20,
              "parameter_mmax": 240,
              "parameter_modmode": 0,
              "parameter_order": 2,
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
            155.0,
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
              "parameter_annotation_name": "Output",
              "parameter_longname": "Output",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 18,
              "parameter_modmode": 0,
              "parameter_order": 3,
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
            185.0,
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
          "id": "obj-param-topology-1",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            430.0,
            105.0,
            22.0
          ],
          "text": "paramid 1 3",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-file-button",
          "maxclass": "live.text",
          "patching_rect": [
            1110.0,
            180.0,
            64.0,
            20.0
          ],
          "text": "FILE",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            140.0,
            48.0,
            20.0
          ],
          "texton": "FILE",
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
          "annotation": "Create the 16-channel float32 WAV for a new take. The selected file is created/replaced; choose a new name each time.",
          "annotation_name": "FILE"
        }
      },
      {
        "box": {
          "id": "obj-rec-toggle",
          "maxclass": "live.text",
          "patching_rect": [
            1190.0,
            180.0,
            64.0,
            20.0
          ],
          "text": "REC",
          "presentation": 1,
          "presentation_rect": [
            70.0,
            140.0,
            48.0,
            20.0
          ],
          "texton": "STOP",
          "active": 0,
          "mode": 1,
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
          "annotation": "Record the post-gain 16-channel ACN/SN3D bed before decoding. Select FILE first.",
          "annotation_name": "REC"
        }
      },
      {
        "box": {
          "id": "obj-rec-time",
          "maxclass": "comment",
          "patching_rect": [
            1270.0,
            180.0,
            80.0,
            20.0
          ],
          "text": "00:00",
          "presentation": 1,
          "presentation_rect": [
            124.0,
            140.0,
            60.0,
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
          ],
          "ignoreclick": 1,
          "annotation": "Elapsed recording time (minutes:seconds)."
        }
      },
      {
        "box": {
          "id": "obj-rec-writer",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            500.0,
            280.0,
            22.0
          ],
          "text": "sfrecord~ 16",
          "numinlets": 16,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-file-request",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            220.0,
            45.0,
            22.0
          ],
          "text": "t b b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-dialog",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            260.0,
            105.0,
            22.0
          ],
          "text": "savedialog WAVE",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-file-selected",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            300.0,
            55.0,
            22.0
          ],
          "text": "t b s b",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-format",
          "maxclass": "message",
          "patching_rect": [
            1270.0,
            300.0,
            130.0,
            22.0
          ],
          "text": "samptype float32",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-wave-format",
          "maxclass": "newobj",
          "patching_rect": [
            1180.0,
            340.0,
            85.0,
            22.0
          ],
          "text": "append wave",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-open",
          "maxclass": "newobj",
          "patching_rect": [
            1180.0,
            380.0,
            85.0,
            22.0
          ],
          "text": "prepend open",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-ready",
          "maxclass": "message",
          "patching_rect": [
            1110.0,
            340.0,
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
          "id": "obj-rec-ready-active",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            380.0,
            95.0,
            22.0
          ],
          "text": "prepend active",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-choice",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            220.0,
            55.0,
            22.0
          ],
          "text": "sel 1 0",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-start-gate",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            260.0,
            55.0,
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
          "id": "obj-rec-start-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            300.0,
            45.0,
            22.0
          ],
          "text": "t b b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-file-block",
          "maxclass": "message",
          "patching_rect": [
            1490.0,
            300.0,
            60.0,
            22.0
          ],
          "text": "active 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-start",
          "maxclass": "message",
          "patching_rect": [
            1410.0,
            340.0,
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
          "id": "obj-rec-start-order",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            380.0,
            55.0,
            22.0
          ],
          "text": "t b i i",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-stop",
          "maxclass": "message",
          "patching_rect": [
            1580.0,
            340.0,
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
          "id": "obj-rec-reset",
          "maxclass": "newobj",
          "patching_rect": [
            1580.0,
            380.0,
            80.0,
            22.0
          ],
          "text": "t i i i i i",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "int",
            "int",
            "int",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-ui-set",
          "maxclass": "newobj",
          "patching_rect": [
            1580.0,
            420.0,
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
          "id": "obj-rec-file-active",
          "maxclass": "newobj",
          "patching_rect": [
            1670.0,
            460.0,
            95.0,
            22.0
          ],
          "text": "prepend active",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-file-invert",
          "maxclass": "newobj",
          "patching_rect": [
            1670.0,
            420.0,
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
          "id": "obj-rec-init",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            220.0,
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
          "id": "obj-rec-init-order",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            260.0,
            58.0,
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
          "id": "obj-rec-default-name",
          "maxclass": "message",
          "patching_rect": [
            1760.0,
            300.0,
            140.0,
            22.0
          ],
          "text": "name s3g-3oa.wav",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-reset",
          "maxclass": "message",
          "patching_rect": [
            1760.0,
            340.0,
            75.0,
            22.0
          ],
          "text": "set 00:00",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-clock",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            550.0,
            95.0,
            22.0
          ],
          "text": "snapshot~ 250",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-progress",
          "maxclass": "newobj",
          "patching_rect": [
            1220.0,
            590.0,
            65.0,
            22.0
          ],
          "text": "change 0.",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-watch-gate",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            550.0,
            55.0,
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
          "id": "obj-rec-watch-reset",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            590.0,
            45.0,
            22.0
          ],
          "text": "t b b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-watch-stop",
          "maxclass": "message",
          "patching_rect": [
            1490.0,
            590.0,
            40.0,
            22.0
          ],
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-watch-timeout",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            630.0,
            75.0,
            22.0
          ],
          "text": "delay 2000",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-watch-error",
          "maxclass": "message",
          "patching_rect": [
            1510.0,
            670.0,
            390.0,
            22.0
          ],
          "text": "Recording halted (no time progress). Check audio engine/disk.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-print",
          "maxclass": "newobj",
          "patching_rect": [
            1510.0,
            710.0,
            155.0,
            22.0
          ],
          "text": "print s3g-3oa-recorder",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-rec-seconds",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            590.0,
            58.0,
            22.0
          ],
          "text": "/ 1000.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-whole-seconds",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            630.0,
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
          "id": "obj-rec-time-change",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            670.0,
            55.0,
            22.0
          ],
          "text": "change",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-split",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            710.0,
            40.0,
            22.0
          ],
          "text": "t i i",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-minutes",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            750.0,
            40.0,
            22.0
          ],
          "text": "/ 60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-seconds",
          "maxclass": "newobj",
          "patching_rect": [
            1170.0,
            750.0,
            40.0,
            22.0
          ],
          "text": "% 60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-pack",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            790.0,
            65.0,
            22.0
          ],
          "text": "pack i i",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-format",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            830.0,
            130.0,
            22.0
          ],
          "text": "sprintf %02ld:%02ld",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-rec-time-set",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            870.0,
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
          "id": "obj-rec-credit",
          "maxclass": "comment",
          "patching_rect": [
            1110.0,
            930.0,
            800.0,
            36.0
          ],
          "text": "Recorder reference: Envelop for Live E4L Master Bus by Envelop (LGPL-2.1). Independent s3g controls; native ACN/SN3D capture without E4L's B-format conversion. https://github.com/EnvelopSound/EnvelopForLive",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "fontsize": 9.0
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
            "obj-plugin",
            2
          ],
          "destination": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            15
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
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
            "obj-clap",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
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
            "obj-mono-matrix",
            1
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
            "obj-mono-matrix",
            2
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
            "obj-mono-matrix",
            3
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
            "obj-mono-matrix",
            4
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
            "obj-mono-matrix",
            5
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
            "obj-mono-matrix",
            6
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
            "obj-mono-matrix",
            7
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
            "obj-mono-matrix",
            8
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
            "obj-mono-matrix",
            9
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
            "obj-mono-matrix",
            10
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
            "obj-mono-matrix",
            11
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
            "obj-mono-matrix",
            12
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
            "obj-mono-matrix",
            13
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
            "obj-mono-matrix",
            14
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
            "obj-mono-matrix",
            15
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
            "obj-mono-matrix",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            17
          ],
          "destination": [
            "obj-mono-matrix",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            18
          ],
          "destination": [
            "obj-mono-matrix",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            19
          ],
          "destination": [
            "obj-mono-matrix",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            20
          ],
          "destination": [
            "obj-mono-matrix",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            21
          ],
          "destination": [
            "obj-mono-matrix",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            22
          ],
          "destination": [
            "obj-mono-matrix",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            23
          ],
          "destination": [
            "obj-mono-matrix",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            24
          ],
          "destination": [
            "obj-mono-matrix",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            25
          ],
          "destination": [
            "obj-mono-matrix",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            26
          ],
          "destination": [
            "obj-mono-matrix",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            27
          ],
          "destination": [
            "obj-mono-matrix",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            28
          ],
          "destination": [
            "obj-mono-matrix",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            29
          ],
          "destination": [
            "obj-mono-matrix",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            30
          ],
          "destination": [
            "obj-mono-matrix",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-clap",
            31
          ],
          "destination": [
            "obj-mono-matrix",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-matrix",
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
            "obj-mono-init",
            0
          ],
          "destination": [
            "obj-mono-init-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-init-defer",
            0
          ],
          "destination": [
            "obj-mono-outputvalue",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-init",
            0
          ],
          "destination": [
            "obj-mono-page-first",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-first",
            0
          ],
          "destination": [
            "obj-mono-page-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-menu",
            0
          ],
          "destination": [
            "obj-mono-page-one",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-page-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-order",
            2
          ],
          "destination": [
            "obj-mono-click-channel",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-order",
            1
          ],
          "destination": [
            "obj-mono-current-page",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-order",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-redraw",
            2
          ],
          "destination": [
            "obj-mono-click-close",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-close",
            0
          ],
          "destination": [
            "obj-mono-click-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-redraw",
            1
          ],
          "destination": [
            "obj-mono-redraw-body",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-redraw-body",
            1
          ],
          "destination": [
            "obj-mono-clear",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-clear",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-redraw-body",
            0
          ],
          "destination": [
            "obj-mono-current-page",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-current-page",
            0
          ],
          "destination": [
            "obj-mono-select-page",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-redraw",
            0
          ],
          "destination": [
            "obj-mono-click-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-open",
            0
          ],
          "destination": [
            "obj-mono-click-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-grid",
            0
          ],
          "destination": [
            "obj-mono-click-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-gate",
            0
          ],
          "destination": [
            "obj-mono-click-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-unpack",
            2
          ],
          "destination": [
            "obj-mono-click-value",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-unpack",
            1
          ],
          "destination": [
            "obj-mono-click-channel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-channel",
            0
          ],
          "destination": [
            "obj-mono-click-channel-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-unpack",
            0
          ],
          "destination": [
            "obj-mono-click-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-value",
            0
          ],
          "destination": [
            "obj-mono-click-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-order",
            1
          ],
          "destination": [
            "obj-mono-click-pack",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-order",
            0
          ],
          "destination": [
            "obj-mono-click-channel-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-channel-store",
            0
          ],
          "destination": [
            "obj-mono-click-pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-pack",
            0
          ],
          "destination": [
            "obj-mono-click-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-1-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-1-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-1-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-1-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-1-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-1-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-2-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-2-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-2-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-2-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-2-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-2-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-3-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-3-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-3-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-3-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-3-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-3-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-4-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-4-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-4-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-4-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-4-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-4-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-5-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-5-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-5-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-5-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-5-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-5-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-6-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-6-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-6-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-6-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-6-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-6-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-7-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-7-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-7-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-7-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-7-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-7-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-one",
            0
          ],
          "destination": [
            "obj-mono-row-label-8-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-8-number",
            0
          ],
          "destination": [
            "obj-mono-row-label-8-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-8-format",
            0
          ],
          "destination": [
            "obj-mono-row-label-8-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-row-label-8-set",
            0
          ],
          "destination": [
            "obj-mono-row-label-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-select-page",
            0
          ],
          "destination": [
            "obj-mono-page-1-rows",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            0
          ],
          "destination": [
            "obj-mono-output-1-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            1
          ],
          "destination": [
            "obj-mono-output-2-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            2
          ],
          "destination": [
            "obj-mono-output-3-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            3
          ],
          "destination": [
            "obj-mono-output-4-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            4
          ],
          "destination": [
            "obj-mono-output-5-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            5
          ],
          "destination": [
            "obj-mono-output-6-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            6
          ],
          "destination": [
            "obj-mono-output-7-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-1-rows",
            7
          ],
          "destination": [
            "obj-mono-output-8-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-select-page",
            1
          ],
          "destination": [
            "obj-mono-page-2-rows",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            0
          ],
          "destination": [
            "obj-mono-output-9-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            1
          ],
          "destination": [
            "obj-mono-output-10-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            2
          ],
          "destination": [
            "obj-mono-output-11-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            3
          ],
          "destination": [
            "obj-mono-output-12-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            4
          ],
          "destination": [
            "obj-mono-output-13-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            5
          ],
          "destination": [
            "obj-mono-output-14-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            6
          ],
          "destination": [
            "obj-mono-output-15-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-2-rows",
            7
          ],
          "destination": [
            "obj-mono-output-16-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-select-page",
            2
          ],
          "destination": [
            "obj-mono-page-3-rows",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            0
          ],
          "destination": [
            "obj-mono-output-17-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            1
          ],
          "destination": [
            "obj-mono-output-18-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            2
          ],
          "destination": [
            "obj-mono-output-19-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            3
          ],
          "destination": [
            "obj-mono-output-20-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            4
          ],
          "destination": [
            "obj-mono-output-21-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            5
          ],
          "destination": [
            "obj-mono-output-22-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            6
          ],
          "destination": [
            "obj-mono-output-23-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-3-rows",
            7
          ],
          "destination": [
            "obj-mono-output-24-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-select-page",
            3
          ],
          "destination": [
            "obj-mono-page-4-rows",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            0
          ],
          "destination": [
            "obj-mono-output-25-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            1
          ],
          "destination": [
            "obj-mono-output-26-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            2
          ],
          "destination": [
            "obj-mono-output-27-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            3
          ],
          "destination": [
            "obj-mono-output-28-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            4
          ],
          "destination": [
            "obj-mono-output-29-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            5
          ],
          "destination": [
            "obj-mono-output-30-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            6
          ],
          "destination": [
            "obj-mono-output-31-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-page-4-rows",
            7
          ],
          "destination": [
            "obj-mono-output-32-store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1",
            0
          ],
          "destination": [
            "obj-mono-output-1-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-1-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-store",
            0
          ],
          "destination": [
            "obj-mono-output-1-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-1-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-1-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            0
          ],
          "destination": [
            "obj-mono-output-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1",
            0
          ],
          "destination": [
            "obj-mono-output-1-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-1-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-old",
            0
          ],
          "destination": [
            "obj-mono-output-1-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-1-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-valid",
            0
          ],
          "destination": [
            "obj-mono-output-1-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-1-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-new",
            1
          ],
          "destination": [
            "obj-mono-output-1-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-new",
            0
          ],
          "destination": [
            "obj-mono-output-1-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-1-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2",
            0
          ],
          "destination": [
            "obj-mono-output-2-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-2-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-store",
            0
          ],
          "destination": [
            "obj-mono-output-2-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-2-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-2-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            1
          ],
          "destination": [
            "obj-mono-output-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2",
            0
          ],
          "destination": [
            "obj-mono-output-2-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-2-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-old",
            0
          ],
          "destination": [
            "obj-mono-output-2-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-2-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-valid",
            0
          ],
          "destination": [
            "obj-mono-output-2-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-2-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-new",
            1
          ],
          "destination": [
            "obj-mono-output-2-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-new",
            0
          ],
          "destination": [
            "obj-mono-output-2-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-2-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3",
            0
          ],
          "destination": [
            "obj-mono-output-3-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-3-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-store",
            0
          ],
          "destination": [
            "obj-mono-output-3-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-3-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-3-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            2
          ],
          "destination": [
            "obj-mono-output-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3",
            0
          ],
          "destination": [
            "obj-mono-output-3-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-3-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-old",
            0
          ],
          "destination": [
            "obj-mono-output-3-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-3-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-valid",
            0
          ],
          "destination": [
            "obj-mono-output-3-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-3-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-new",
            1
          ],
          "destination": [
            "obj-mono-output-3-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-new",
            0
          ],
          "destination": [
            "obj-mono-output-3-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-3-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4",
            0
          ],
          "destination": [
            "obj-mono-output-4-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-4-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-store",
            0
          ],
          "destination": [
            "obj-mono-output-4-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-4-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-4-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            3
          ],
          "destination": [
            "obj-mono-output-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4",
            0
          ],
          "destination": [
            "obj-mono-output-4-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-4-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-old",
            0
          ],
          "destination": [
            "obj-mono-output-4-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-4-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-valid",
            0
          ],
          "destination": [
            "obj-mono-output-4-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-4-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-new",
            1
          ],
          "destination": [
            "obj-mono-output-4-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-new",
            0
          ],
          "destination": [
            "obj-mono-output-4-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-4-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5",
            0
          ],
          "destination": [
            "obj-mono-output-5-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-5-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-store",
            0
          ],
          "destination": [
            "obj-mono-output-5-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-5-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-5-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            4
          ],
          "destination": [
            "obj-mono-output-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5",
            0
          ],
          "destination": [
            "obj-mono-output-5-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-5-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-old",
            0
          ],
          "destination": [
            "obj-mono-output-5-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-5-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-valid",
            0
          ],
          "destination": [
            "obj-mono-output-5-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-5-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-new",
            1
          ],
          "destination": [
            "obj-mono-output-5-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-new",
            0
          ],
          "destination": [
            "obj-mono-output-5-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-5-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6",
            0
          ],
          "destination": [
            "obj-mono-output-6-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-6-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-store",
            0
          ],
          "destination": [
            "obj-mono-output-6-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-6-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-6-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            5
          ],
          "destination": [
            "obj-mono-output-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6",
            0
          ],
          "destination": [
            "obj-mono-output-6-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-6-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-old",
            0
          ],
          "destination": [
            "obj-mono-output-6-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-6-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-valid",
            0
          ],
          "destination": [
            "obj-mono-output-6-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-6-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-new",
            1
          ],
          "destination": [
            "obj-mono-output-6-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-new",
            0
          ],
          "destination": [
            "obj-mono-output-6-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-6-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7",
            0
          ],
          "destination": [
            "obj-mono-output-7-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-7-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-store",
            0
          ],
          "destination": [
            "obj-mono-output-7-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-7-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-7-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            6
          ],
          "destination": [
            "obj-mono-output-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7",
            0
          ],
          "destination": [
            "obj-mono-output-7-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-7-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-old",
            0
          ],
          "destination": [
            "obj-mono-output-7-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-7-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-valid",
            0
          ],
          "destination": [
            "obj-mono-output-7-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-7-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-new",
            1
          ],
          "destination": [
            "obj-mono-output-7-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-new",
            0
          ],
          "destination": [
            "obj-mono-output-7-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-7-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8",
            0
          ],
          "destination": [
            "obj-mono-output-8-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-8-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-store",
            0
          ],
          "destination": [
            "obj-mono-output-8-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-8-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-8-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            7
          ],
          "destination": [
            "obj-mono-output-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8",
            0
          ],
          "destination": [
            "obj-mono-output-8-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-8-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-old",
            0
          ],
          "destination": [
            "obj-mono-output-8-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-8-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-valid",
            0
          ],
          "destination": [
            "obj-mono-output-8-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-8-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-new",
            1
          ],
          "destination": [
            "obj-mono-output-8-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-new",
            0
          ],
          "destination": [
            "obj-mono-output-8-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-8-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9",
            0
          ],
          "destination": [
            "obj-mono-output-9-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-9-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-store",
            0
          ],
          "destination": [
            "obj-mono-output-9-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-9-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-9-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            8
          ],
          "destination": [
            "obj-mono-output-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9",
            0
          ],
          "destination": [
            "obj-mono-output-9-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-9-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-old",
            0
          ],
          "destination": [
            "obj-mono-output-9-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-9-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-valid",
            0
          ],
          "destination": [
            "obj-mono-output-9-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-9-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-new",
            1
          ],
          "destination": [
            "obj-mono-output-9-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-new",
            0
          ],
          "destination": [
            "obj-mono-output-9-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-9-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10",
            0
          ],
          "destination": [
            "obj-mono-output-10-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-10-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-store",
            0
          ],
          "destination": [
            "obj-mono-output-10-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-10-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-10-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            9
          ],
          "destination": [
            "obj-mono-output-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10",
            0
          ],
          "destination": [
            "obj-mono-output-10-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-10-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-old",
            0
          ],
          "destination": [
            "obj-mono-output-10-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-10-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-valid",
            0
          ],
          "destination": [
            "obj-mono-output-10-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-10-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-new",
            1
          ],
          "destination": [
            "obj-mono-output-10-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-new",
            0
          ],
          "destination": [
            "obj-mono-output-10-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-10-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11",
            0
          ],
          "destination": [
            "obj-mono-output-11-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-11-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-store",
            0
          ],
          "destination": [
            "obj-mono-output-11-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-11-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-11-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            10
          ],
          "destination": [
            "obj-mono-output-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11",
            0
          ],
          "destination": [
            "obj-mono-output-11-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-11-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-old",
            0
          ],
          "destination": [
            "obj-mono-output-11-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-11-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-valid",
            0
          ],
          "destination": [
            "obj-mono-output-11-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-11-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-new",
            1
          ],
          "destination": [
            "obj-mono-output-11-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-new",
            0
          ],
          "destination": [
            "obj-mono-output-11-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-11-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12",
            0
          ],
          "destination": [
            "obj-mono-output-12-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-12-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-store",
            0
          ],
          "destination": [
            "obj-mono-output-12-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-12-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-12-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            11
          ],
          "destination": [
            "obj-mono-output-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12",
            0
          ],
          "destination": [
            "obj-mono-output-12-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-12-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-old",
            0
          ],
          "destination": [
            "obj-mono-output-12-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-12-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-valid",
            0
          ],
          "destination": [
            "obj-mono-output-12-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-12-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-new",
            1
          ],
          "destination": [
            "obj-mono-output-12-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-new",
            0
          ],
          "destination": [
            "obj-mono-output-12-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-12-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13",
            0
          ],
          "destination": [
            "obj-mono-output-13-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-13-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-store",
            0
          ],
          "destination": [
            "obj-mono-output-13-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-13-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-13-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            12
          ],
          "destination": [
            "obj-mono-output-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13",
            0
          ],
          "destination": [
            "obj-mono-output-13-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-13-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-old",
            0
          ],
          "destination": [
            "obj-mono-output-13-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-13-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-valid",
            0
          ],
          "destination": [
            "obj-mono-output-13-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-13-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-new",
            1
          ],
          "destination": [
            "obj-mono-output-13-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-new",
            0
          ],
          "destination": [
            "obj-mono-output-13-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-13-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14",
            0
          ],
          "destination": [
            "obj-mono-output-14-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-14-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-store",
            0
          ],
          "destination": [
            "obj-mono-output-14-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-14-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-14-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            13
          ],
          "destination": [
            "obj-mono-output-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14",
            0
          ],
          "destination": [
            "obj-mono-output-14-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-14-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-old",
            0
          ],
          "destination": [
            "obj-mono-output-14-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-14-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-valid",
            0
          ],
          "destination": [
            "obj-mono-output-14-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-14-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-new",
            1
          ],
          "destination": [
            "obj-mono-output-14-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-new",
            0
          ],
          "destination": [
            "obj-mono-output-14-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-14-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15",
            0
          ],
          "destination": [
            "obj-mono-output-15-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-15-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-store",
            0
          ],
          "destination": [
            "obj-mono-output-15-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-15-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-15-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            14
          ],
          "destination": [
            "obj-mono-output-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15",
            0
          ],
          "destination": [
            "obj-mono-output-15-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-15-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-old",
            0
          ],
          "destination": [
            "obj-mono-output-15-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-15-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-valid",
            0
          ],
          "destination": [
            "obj-mono-output-15-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-15-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-new",
            1
          ],
          "destination": [
            "obj-mono-output-15-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-new",
            0
          ],
          "destination": [
            "obj-mono-output-15-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-15-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16",
            0
          ],
          "destination": [
            "obj-mono-output-16-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-16-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-store",
            0
          ],
          "destination": [
            "obj-mono-output-16-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-16-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-16-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            15
          ],
          "destination": [
            "obj-mono-output-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16",
            0
          ],
          "destination": [
            "obj-mono-output-16-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-16-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-old",
            0
          ],
          "destination": [
            "obj-mono-output-16-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-16-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-valid",
            0
          ],
          "destination": [
            "obj-mono-output-16-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-16-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-new",
            1
          ],
          "destination": [
            "obj-mono-output-16-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-new",
            0
          ],
          "destination": [
            "obj-mono-output-16-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-16-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17",
            0
          ],
          "destination": [
            "obj-mono-output-17-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-17-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-store",
            0
          ],
          "destination": [
            "obj-mono-output-17-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-17-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-17-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            16
          ],
          "destination": [
            "obj-mono-output-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17",
            0
          ],
          "destination": [
            "obj-mono-output-17-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-17-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-old",
            0
          ],
          "destination": [
            "obj-mono-output-17-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-17-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-valid",
            0
          ],
          "destination": [
            "obj-mono-output-17-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-17-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-new",
            1
          ],
          "destination": [
            "obj-mono-output-17-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-new",
            0
          ],
          "destination": [
            "obj-mono-output-17-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-17-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18",
            0
          ],
          "destination": [
            "obj-mono-output-18-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-18-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-store",
            0
          ],
          "destination": [
            "obj-mono-output-18-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-18-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-18-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            17
          ],
          "destination": [
            "obj-mono-output-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18",
            0
          ],
          "destination": [
            "obj-mono-output-18-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-18-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-old",
            0
          ],
          "destination": [
            "obj-mono-output-18-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-18-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-valid",
            0
          ],
          "destination": [
            "obj-mono-output-18-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-18-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-new",
            1
          ],
          "destination": [
            "obj-mono-output-18-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-new",
            0
          ],
          "destination": [
            "obj-mono-output-18-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-18-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19",
            0
          ],
          "destination": [
            "obj-mono-output-19-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-19-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-store",
            0
          ],
          "destination": [
            "obj-mono-output-19-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-19-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-19-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            18
          ],
          "destination": [
            "obj-mono-output-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19",
            0
          ],
          "destination": [
            "obj-mono-output-19-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-19-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-old",
            0
          ],
          "destination": [
            "obj-mono-output-19-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-19-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-valid",
            0
          ],
          "destination": [
            "obj-mono-output-19-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-19-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-new",
            1
          ],
          "destination": [
            "obj-mono-output-19-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-new",
            0
          ],
          "destination": [
            "obj-mono-output-19-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-19-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20",
            0
          ],
          "destination": [
            "obj-mono-output-20-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-20-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-store",
            0
          ],
          "destination": [
            "obj-mono-output-20-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-20-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-20-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            19
          ],
          "destination": [
            "obj-mono-output-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20",
            0
          ],
          "destination": [
            "obj-mono-output-20-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-20-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-old",
            0
          ],
          "destination": [
            "obj-mono-output-20-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-20-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-valid",
            0
          ],
          "destination": [
            "obj-mono-output-20-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-20-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-new",
            1
          ],
          "destination": [
            "obj-mono-output-20-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-new",
            0
          ],
          "destination": [
            "obj-mono-output-20-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-20-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21",
            0
          ],
          "destination": [
            "obj-mono-output-21-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-21-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-store",
            0
          ],
          "destination": [
            "obj-mono-output-21-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-21-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-21-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            20
          ],
          "destination": [
            "obj-mono-output-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21",
            0
          ],
          "destination": [
            "obj-mono-output-21-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-21-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-old",
            0
          ],
          "destination": [
            "obj-mono-output-21-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-21-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-valid",
            0
          ],
          "destination": [
            "obj-mono-output-21-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-21-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-new",
            1
          ],
          "destination": [
            "obj-mono-output-21-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-new",
            0
          ],
          "destination": [
            "obj-mono-output-21-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-21-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22",
            0
          ],
          "destination": [
            "obj-mono-output-22-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-22-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-store",
            0
          ],
          "destination": [
            "obj-mono-output-22-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-22-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-22-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            21
          ],
          "destination": [
            "obj-mono-output-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22",
            0
          ],
          "destination": [
            "obj-mono-output-22-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-22-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-old",
            0
          ],
          "destination": [
            "obj-mono-output-22-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-22-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-valid",
            0
          ],
          "destination": [
            "obj-mono-output-22-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-22-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-new",
            1
          ],
          "destination": [
            "obj-mono-output-22-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-new",
            0
          ],
          "destination": [
            "obj-mono-output-22-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-22-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23",
            0
          ],
          "destination": [
            "obj-mono-output-23-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-23-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-store",
            0
          ],
          "destination": [
            "obj-mono-output-23-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-23-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-23-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            22
          ],
          "destination": [
            "obj-mono-output-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23",
            0
          ],
          "destination": [
            "obj-mono-output-23-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-23-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-old",
            0
          ],
          "destination": [
            "obj-mono-output-23-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-23-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-valid",
            0
          ],
          "destination": [
            "obj-mono-output-23-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-23-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-new",
            1
          ],
          "destination": [
            "obj-mono-output-23-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-new",
            0
          ],
          "destination": [
            "obj-mono-output-23-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-23-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24",
            0
          ],
          "destination": [
            "obj-mono-output-24-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-24-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-store",
            0
          ],
          "destination": [
            "obj-mono-output-24-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-24-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-24-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            23
          ],
          "destination": [
            "obj-mono-output-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24",
            0
          ],
          "destination": [
            "obj-mono-output-24-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-24-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-old",
            0
          ],
          "destination": [
            "obj-mono-output-24-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-24-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-valid",
            0
          ],
          "destination": [
            "obj-mono-output-24-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-24-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-new",
            1
          ],
          "destination": [
            "obj-mono-output-24-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-new",
            0
          ],
          "destination": [
            "obj-mono-output-24-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-24-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25",
            0
          ],
          "destination": [
            "obj-mono-output-25-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-25-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-store",
            0
          ],
          "destination": [
            "obj-mono-output-25-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-25-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-25-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            24
          ],
          "destination": [
            "obj-mono-output-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25",
            0
          ],
          "destination": [
            "obj-mono-output-25-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-25-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-old",
            0
          ],
          "destination": [
            "obj-mono-output-25-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-25-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-valid",
            0
          ],
          "destination": [
            "obj-mono-output-25-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-25-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-new",
            1
          ],
          "destination": [
            "obj-mono-output-25-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-new",
            0
          ],
          "destination": [
            "obj-mono-output-25-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-25-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26",
            0
          ],
          "destination": [
            "obj-mono-output-26-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-26-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-store",
            0
          ],
          "destination": [
            "obj-mono-output-26-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-26-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-26-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            25
          ],
          "destination": [
            "obj-mono-output-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26",
            0
          ],
          "destination": [
            "obj-mono-output-26-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-26-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-old",
            0
          ],
          "destination": [
            "obj-mono-output-26-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-26-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-valid",
            0
          ],
          "destination": [
            "obj-mono-output-26-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-26-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-new",
            1
          ],
          "destination": [
            "obj-mono-output-26-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-new",
            0
          ],
          "destination": [
            "obj-mono-output-26-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-26-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27",
            0
          ],
          "destination": [
            "obj-mono-output-27-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-27-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-store",
            0
          ],
          "destination": [
            "obj-mono-output-27-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-27-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-27-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            26
          ],
          "destination": [
            "obj-mono-output-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27",
            0
          ],
          "destination": [
            "obj-mono-output-27-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-27-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-old",
            0
          ],
          "destination": [
            "obj-mono-output-27-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-27-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-valid",
            0
          ],
          "destination": [
            "obj-mono-output-27-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-27-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-new",
            1
          ],
          "destination": [
            "obj-mono-output-27-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-new",
            0
          ],
          "destination": [
            "obj-mono-output-27-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-27-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28",
            0
          ],
          "destination": [
            "obj-mono-output-28-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-28-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-store",
            0
          ],
          "destination": [
            "obj-mono-output-28-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-28-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-28-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            27
          ],
          "destination": [
            "obj-mono-output-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28",
            0
          ],
          "destination": [
            "obj-mono-output-28-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-28-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-old",
            0
          ],
          "destination": [
            "obj-mono-output-28-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-28-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-valid",
            0
          ],
          "destination": [
            "obj-mono-output-28-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-28-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-new",
            1
          ],
          "destination": [
            "obj-mono-output-28-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-new",
            0
          ],
          "destination": [
            "obj-mono-output-28-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-28-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29",
            0
          ],
          "destination": [
            "obj-mono-output-29-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-29-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-store",
            0
          ],
          "destination": [
            "obj-mono-output-29-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-29-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-29-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            28
          ],
          "destination": [
            "obj-mono-output-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29",
            0
          ],
          "destination": [
            "obj-mono-output-29-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-29-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-old",
            0
          ],
          "destination": [
            "obj-mono-output-29-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-29-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-valid",
            0
          ],
          "destination": [
            "obj-mono-output-29-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-29-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-new",
            1
          ],
          "destination": [
            "obj-mono-output-29-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-new",
            0
          ],
          "destination": [
            "obj-mono-output-29-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-29-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30",
            0
          ],
          "destination": [
            "obj-mono-output-30-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-30-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-store",
            0
          ],
          "destination": [
            "obj-mono-output-30-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-30-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-30-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            29
          ],
          "destination": [
            "obj-mono-output-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30",
            0
          ],
          "destination": [
            "obj-mono-output-30-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-30-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-old",
            0
          ],
          "destination": [
            "obj-mono-output-30-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-30-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-valid",
            0
          ],
          "destination": [
            "obj-mono-output-30-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-30-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-new",
            1
          ],
          "destination": [
            "obj-mono-output-30-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-new",
            0
          ],
          "destination": [
            "obj-mono-output-30-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-30-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-31",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31",
            0
          ],
          "destination": [
            "obj-mono-output-31-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-31-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-store",
            0
          ],
          "destination": [
            "obj-mono-output-31-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-31-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-31-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            30
          ],
          "destination": [
            "obj-mono-output-31",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31",
            0
          ],
          "destination": [
            "obj-mono-output-31-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-31-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-old",
            0
          ],
          "destination": [
            "obj-mono-output-31-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-31-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-valid",
            0
          ],
          "destination": [
            "obj-mono-output-31-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-31-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-new",
            1
          ],
          "destination": [
            "obj-mono-output-31-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-new",
            0
          ],
          "destination": [
            "obj-mono-output-31-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-31-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-outputvalue",
            0
          ],
          "destination": [
            "obj-mono-output-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32",
            0
          ],
          "destination": [
            "obj-mono-output-32-store-input",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-store-input",
            1
          ],
          "destination": [
            "obj-mono-output-32-store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-store-input",
            0
          ],
          "destination": [
            "obj-mono-redraw",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-store",
            0
          ],
          "destination": [
            "obj-mono-output-32-display-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-display-valid",
            0
          ],
          "destination": [
            "obj-mono-output-32-display-column",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-display-column",
            0
          ],
          "destination": [
            "obj-mono-output-32-display-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-display-set",
            0
          ],
          "destination": [
            "obj-mono-grid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-click-route",
            31
          ],
          "destination": [
            "obj-mono-output-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32",
            0
          ],
          "destination": [
            "obj-mono-output-32-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-trigger",
            1
          ],
          "destination": [
            "obj-mono-output-32-old",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-old",
            0
          ],
          "destination": [
            "obj-mono-output-32-disconnect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-disconnect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-trigger",
            0
          ],
          "destination": [
            "obj-mono-output-32-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-valid",
            0
          ],
          "destination": [
            "obj-mono-output-32-zero-based",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-zero-based",
            0
          ],
          "destination": [
            "obj-mono-output-32-new",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-new",
            1
          ],
          "destination": [
            "obj-mono-output-32-old",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-new",
            0
          ],
          "destination": [
            "obj-mono-output-32-connect",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mono-output-32-connect",
            0
          ],
          "destination": [
            "obj-mono-matrix",
            0
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
            32
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
            0
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
            1
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
            "obj-rec-file-button",
            0
          ],
          "destination": [
            "obj-rec-file-request",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-request",
            1
          ],
          "destination": [
            "obj-rec-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-request",
            0
          ],
          "destination": [
            "obj-rec-dialog",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-dialog",
            0
          ],
          "destination": [
            "obj-rec-file-selected",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-dialog",
            2
          ],
          "destination": [
            "obj-rec-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-selected",
            2
          ],
          "destination": [
            "obj-rec-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-format",
            0
          ],
          "destination": [
            "obj-rec-writer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-selected",
            1
          ],
          "destination": [
            "obj-rec-wave-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-wave-format",
            0
          ],
          "destination": [
            "obj-rec-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-open",
            0
          ],
          "destination": [
            "obj-rec-writer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-selected",
            0
          ],
          "destination": [
            "obj-rec-ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-ready",
            0
          ],
          "destination": [
            "obj-rec-start-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-ready",
            0
          ],
          "destination": [
            "obj-rec-ready-active",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-ready",
            0
          ],
          "destination": [
            "obj-rec-time-reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-ready-active",
            0
          ],
          "destination": [
            "obj-rec-toggle",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-toggle",
            0
          ],
          "destination": [
            "obj-rec-choice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-choice",
            0
          ],
          "destination": [
            "obj-rec-start-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-choice",
            1
          ],
          "destination": [
            "obj-rec-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-gate",
            0
          ],
          "destination": [
            "obj-rec-start-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-trigger",
            1
          ],
          "destination": [
            "obj-rec-file-block",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-block",
            0
          ],
          "destination": [
            "obj-rec-file-button",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-trigger",
            0
          ],
          "destination": [
            "obj-rec-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start",
            0
          ],
          "destination": [
            "obj-rec-start-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-order",
            2
          ],
          "destination": [
            "obj-rec-writer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-order",
            1
          ],
          "destination": [
            "obj-rec-watch-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-start-order",
            0
          ],
          "destination": [
            "obj-rec-watch-reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-stop",
            0
          ],
          "destination": [
            "obj-rec-reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            4
          ],
          "destination": [
            "obj-rec-ui-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-ui-set",
            0
          ],
          "destination": [
            "obj-rec-toggle",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            4
          ],
          "destination": [
            "obj-rec-watch-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            3
          ],
          "destination": [
            "obj-rec-start-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            3
          ],
          "destination": [
            "obj-rec-ready-active",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            2
          ],
          "destination": [
            "obj-rec-watch-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            1
          ],
          "destination": [
            "obj-rec-writer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-reset",
            0
          ],
          "destination": [
            "obj-rec-file-invert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-invert",
            0
          ],
          "destination": [
            "obj-rec-file-active",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-file-active",
            0
          ],
          "destination": [
            "obj-rec-file-button",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-init",
            0
          ],
          "destination": [
            "obj-rec-init-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-init-order",
            2
          ],
          "destination": [
            "obj-rec-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-init-order",
            1
          ],
          "destination": [
            "obj-rec-default-name",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-default-name",
            0
          ],
          "destination": [
            "obj-rec-dialog",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-init-order",
            0
          ],
          "destination": [
            "obj-rec-time-reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-reset",
            0
          ],
          "destination": [
            "obj-rec-time",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-writer",
            0
          ],
          "destination": [
            "obj-rec-clock",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-clock",
            0
          ],
          "destination": [
            "obj-rec-progress",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-progress",
            0
          ],
          "destination": [
            "obj-rec-watch-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-gate",
            0
          ],
          "destination": [
            "obj-rec-watch-reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-reset",
            1
          ],
          "destination": [
            "obj-rec-watch-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-stop",
            0
          ],
          "destination": [
            "obj-rec-watch-timeout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-reset",
            0
          ],
          "destination": [
            "obj-rec-watch-timeout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-timeout",
            0
          ],
          "destination": [
            "obj-rec-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-timeout",
            0
          ],
          "destination": [
            "obj-rec-watch-error",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-watch-error",
            0
          ],
          "destination": [
            "obj-rec-print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-clock",
            0
          ],
          "destination": [
            "obj-rec-seconds",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-seconds",
            0
          ],
          "destination": [
            "obj-rec-whole-seconds",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-whole-seconds",
            0
          ],
          "destination": [
            "obj-rec-time-change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-change",
            0
          ],
          "destination": [
            "obj-rec-time-split",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-split",
            1
          ],
          "destination": [
            "obj-rec-time-seconds",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-seconds",
            0
          ],
          "destination": [
            "obj-rec-time-pack",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-split",
            0
          ],
          "destination": [
            "obj-rec-time-minutes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-minutes",
            0
          ],
          "destination": [
            "obj-rec-time-pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-pack",
            0
          ],
          "destination": [
            "obj-rec-time-format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-format",
            0
          ],
          "destination": [
            "obj-rec-time-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-rec-time-set",
            0
          ],
          "destination": [
            "obj-rec-time",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            0
          ],
          "destination": [
            "obj-rec-writer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            1
          ],
          "destination": [
            "obj-rec-writer",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            2
          ],
          "destination": [
            "obj-rec-writer",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            3
          ],
          "destination": [
            "obj-rec-writer",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            4
          ],
          "destination": [
            "obj-rec-writer",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            5
          ],
          "destination": [
            "obj-rec-writer",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            6
          ],
          "destination": [
            "obj-rec-writer",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            7
          ],
          "destination": [
            "obj-rec-writer",
            7
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            8
          ],
          "destination": [
            "obj-rec-writer",
            8
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            9
          ],
          "destination": [
            "obj-rec-writer",
            9
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            10
          ],
          "destination": [
            "obj-rec-writer",
            10
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            11
          ],
          "destination": [
            "obj-rec-writer",
            11
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            12
          ],
          "destination": [
            "obj-rec-writer",
            12
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            13
          ],
          "destination": [
            "obj-rec-writer",
            13
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            14
          ],
          "destination": [
            "obj-rec-writer",
            14
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            15
          ],
          "destination": [
            "obj-rec-writer",
            15
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
      "obj-ambi-input-gain": [
        "Ambisonic Input Gain",
        "3OA Gain",
        0
      ],
      "obj-mono-output-1": [
        "Decoder Channel 1 Output",
        "Out 1",
        0
      ],
      "obj-mono-output-2": [
        "Decoder Channel 2 Output",
        "Out 2",
        0
      ],
      "obj-mono-output-3": [
        "Decoder Channel 3 Output",
        "Out 3",
        0
      ],
      "obj-mono-output-4": [
        "Decoder Channel 4 Output",
        "Out 4",
        0
      ],
      "obj-mono-output-5": [
        "Decoder Channel 5 Output",
        "Out 5",
        0
      ],
      "obj-mono-output-6": [
        "Decoder Channel 6 Output",
        "Out 6",
        0
      ],
      "obj-mono-output-7": [
        "Decoder Channel 7 Output",
        "Out 7",
        0
      ],
      "obj-mono-output-8": [
        "Decoder Channel 8 Output",
        "Out 8",
        0
      ],
      "obj-mono-output-9": [
        "Decoder Channel 9 Output",
        "Out 9",
        0
      ],
      "obj-mono-output-10": [
        "Decoder Channel 10 Output",
        "Out 10",
        0
      ],
      "obj-mono-output-11": [
        "Decoder Channel 11 Output",
        "Out 11",
        0
      ],
      "obj-mono-output-12": [
        "Decoder Channel 12 Output",
        "Out 12",
        0
      ],
      "obj-mono-output-13": [
        "Decoder Channel 13 Output",
        "Out 13",
        0
      ],
      "obj-mono-output-14": [
        "Decoder Channel 14 Output",
        "Out 14",
        0
      ],
      "obj-mono-output-15": [
        "Decoder Channel 15 Output",
        "Out 15",
        0
      ],
      "obj-mono-output-16": [
        "Decoder Channel 16 Output",
        "Out 16",
        0
      ],
      "obj-mono-output-17": [
        "Decoder Channel 17 Output",
        "Out 17",
        0
      ],
      "obj-mono-output-18": [
        "Decoder Channel 18 Output",
        "Out 18",
        0
      ],
      "obj-mono-output-19": [
        "Decoder Channel 19 Output",
        "Out 19",
        0
      ],
      "obj-mono-output-20": [
        "Decoder Channel 20 Output",
        "Out 20",
        0
      ],
      "obj-mono-output-21": [
        "Decoder Channel 21 Output",
        "Out 21",
        0
      ],
      "obj-mono-output-22": [
        "Decoder Channel 22 Output",
        "Out 22",
        0
      ],
      "obj-mono-output-23": [
        "Decoder Channel 23 Output",
        "Out 23",
        0
      ],
      "obj-mono-output-24": [
        "Decoder Channel 24 Output",
        "Out 24",
        0
      ],
      "obj-mono-output-25": [
        "Decoder Channel 25 Output",
        "Out 25",
        0
      ],
      "obj-mono-output-26": [
        "Decoder Channel 26 Output",
        "Out 26",
        0
      ],
      "obj-mono-output-27": [
        "Decoder Channel 27 Output",
        "Out 27",
        0
      ],
      "obj-mono-output-28": [
        "Decoder Channel 28 Output",
        "Out 28",
        0
      ],
      "obj-mono-output-29": [
        "Decoder Channel 29 Output",
        "Out 29",
        0
      ],
      "obj-mono-output-30": [
        "Decoder Channel 30 Output",
        "Out 30",
        0
      ],
      "obj-mono-output-31": [
        "Decoder Channel 31 Output",
        "Out 31",
        0
      ],
      "obj-mono-output-32": [
        "Decoder Channel 32 Output",
        "Out 32",
        0
      ],
      "obj-param-2": [
        "Subs",
        "Subs",
        1
      ],
      "obj-param-3": [
        "Cutoff",
        "Cutoff",
        2
      ],
      "obj-param-5": [
        "Output",
        "Output",
        3
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
