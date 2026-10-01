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
    "description": "Receives and sums the private 16-channel s3g master bus, hosts the fixed third-order Speaker 64 decoder with stable Live parameters, and routes decoded channels 1–32 to hardware pairs.",
    "digest": "Receives and sums the private 16-channel s3g master bus, hosts the fixed third-order Speaker 64 decoder with stable Live parameters, and routes decoded channels 1–32 to hardware pairs.",
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
          "text": "s3g CLAP 3OA SPKR OUT",
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
          "text": "SPKR 12P",
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
          "texton": "SPKR 12P",
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
          "id": "obj-output-count",
          "maxclass": "comment",
          "patching_rect": [
            365.0,
            7.0,
            48.0,
            17.0
          ],
          "text": "32CH",
          "presentation": 1,
          "presentation_rect": [
            365.0,
            7.0,
            48.0,
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
          ],
          "textjustification": 2
        }
      },
      {
        "box": {
          "id": "obj-output-panel",
          "maxclass": "panel",
          "patching_rect": [
            8.0,
            36.0,
            409.0,
            125.0
          ],
          "presentation": 1,
          "presentation_rect": [
            8.0,
            36.0,
            409.0,
            125.0
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
          "id": "obj-output-strip",
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
          "id": "obj-output-accent",
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
          "id": "obj-output-heading",
          "maxclass": "comment",
          "patching_rect": [
            16.0,
            39.0,
            220.0,
            16.0
          ],
          "text": "SPEAKER OUTPUT PAIRS",
          "presentation": 1,
          "presentation_rect": [
            16.0,
            39.0,
            220.0,
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
          "id": "obj-output-format",
          "maxclass": "comment",
          "patching_rect": [
            286.0,
            39.0,
            121.0,
            16.0
          ],
          "text": "SPEAKER 1–32",
          "presentation": 1,
          "presentation_rect": [
            286.0,
            39.0,
            121.0,
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
          ],
          "textjustification": 2
        }
      },
      {
        "box": {
          "id": "obj-output-label-1",
          "maxclass": "comment",
          "patching_rect": [
            14.0,
            61.0,
            30.0,
            16.0
          ],
          "text": "01/02",
          "presentation": 1,
          "presentation_rect": [
            14.0,
            61.0,
            30.0,
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
          "id": "obj-output-selector-1",
          "maxclass": "bpatcher",
          "patching_rect": [
            44.0,
            61.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44.0,
            61.0,
            64.0,
            16.0
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
            115.0,
            61.0,
            30.0,
            16.0
          ],
          "text": "03/04",
          "presentation": 1,
          "presentation_rect": [
            115.0,
            61.0,
            30.0,
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
          "id": "obj-output-selector-2",
          "maxclass": "bpatcher",
          "patching_rect": [
            145.0,
            61.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            145.0,
            61.0,
            64.0,
            16.0
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
            216.0,
            61.0,
            30.0,
            16.0
          ],
          "text": "05/06",
          "presentation": 1,
          "presentation_rect": [
            216.0,
            61.0,
            30.0,
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
          "id": "obj-output-selector-3",
          "maxclass": "bpatcher",
          "patching_rect": [
            246.0,
            61.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            246.0,
            61.0,
            64.0,
            16.0
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
            317.0,
            61.0,
            30.0,
            16.0
          ],
          "text": "07/08",
          "presentation": 1,
          "presentation_rect": [
            317.0,
            61.0,
            30.0,
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
          "id": "obj-output-selector-4",
          "maxclass": "bpatcher",
          "patching_rect": [
            347.0,
            61.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            347.0,
            61.0,
            64.0,
            16.0
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
            14.0,
            84.0,
            30.0,
            16.0
          ],
          "text": "09/10",
          "presentation": 1,
          "presentation_rect": [
            14.0,
            84.0,
            30.0,
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
          "id": "obj-output-selector-5",
          "maxclass": "bpatcher",
          "patching_rect": [
            44.0,
            84.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44.0,
            84.0,
            64.0,
            16.0
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
            115.0,
            84.0,
            30.0,
            16.0
          ],
          "text": "11/12",
          "presentation": 1,
          "presentation_rect": [
            115.0,
            84.0,
            30.0,
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
          "id": "obj-output-selector-6",
          "maxclass": "bpatcher",
          "patching_rect": [
            145.0,
            84.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            145.0,
            84.0,
            64.0,
            16.0
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
            216.0,
            84.0,
            30.0,
            16.0
          ],
          "text": "13/14",
          "presentation": 1,
          "presentation_rect": [
            216.0,
            84.0,
            30.0,
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
          "id": "obj-output-selector-7",
          "maxclass": "bpatcher",
          "patching_rect": [
            246.0,
            84.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            246.0,
            84.0,
            64.0,
            16.0
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
            317.0,
            84.0,
            30.0,
            16.0
          ],
          "text": "15/16",
          "presentation": 1,
          "presentation_rect": [
            317.0,
            84.0,
            30.0,
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
          "id": "obj-output-selector-8",
          "maxclass": "bpatcher",
          "patching_rect": [
            347.0,
            84.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            347.0,
            84.0,
            64.0,
            16.0
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
            14.0,
            107.0,
            30.0,
            16.0
          ],
          "text": "17/18",
          "presentation": 1,
          "presentation_rect": [
            14.0,
            107.0,
            30.0,
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
          "id": "obj-output-selector-9",
          "maxclass": "bpatcher",
          "patching_rect": [
            44.0,
            107.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44.0,
            107.0,
            64.0,
            16.0
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
            115.0,
            107.0,
            30.0,
            16.0
          ],
          "text": "19/20",
          "presentation": 1,
          "presentation_rect": [
            115.0,
            107.0,
            30.0,
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
          "id": "obj-output-selector-10",
          "maxclass": "bpatcher",
          "patching_rect": [
            145.0,
            107.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            145.0,
            107.0,
            64.0,
            16.0
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
            216.0,
            107.0,
            30.0,
            16.0
          ],
          "text": "21/22",
          "presentation": 1,
          "presentation_rect": [
            216.0,
            107.0,
            30.0,
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
          "id": "obj-output-selector-11",
          "maxclass": "bpatcher",
          "patching_rect": [
            246.0,
            107.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            246.0,
            107.0,
            64.0,
            16.0
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
            317.0,
            107.0,
            30.0,
            16.0
          ],
          "text": "23/24",
          "presentation": 1,
          "presentation_rect": [
            317.0,
            107.0,
            30.0,
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
          "id": "obj-output-selector-12",
          "maxclass": "bpatcher",
          "patching_rect": [
            347.0,
            107.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            347.0,
            107.0,
            64.0,
            16.0
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
            14.0,
            130.0,
            30.0,
            16.0
          ],
          "text": "25/26",
          "presentation": 1,
          "presentation_rect": [
            14.0,
            130.0,
            30.0,
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
          "id": "obj-output-selector-13",
          "maxclass": "bpatcher",
          "patching_rect": [
            44.0,
            130.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44.0,
            130.0,
            64.0,
            16.0
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
            115.0,
            130.0,
            30.0,
            16.0
          ],
          "text": "27/28",
          "presentation": 1,
          "presentation_rect": [
            115.0,
            130.0,
            30.0,
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
          "id": "obj-output-selector-14",
          "maxclass": "bpatcher",
          "patching_rect": [
            145.0,
            130.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            145.0,
            130.0,
            64.0,
            16.0
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
            216.0,
            130.0,
            30.0,
            16.0
          ],
          "text": "29/30",
          "presentation": 1,
          "presentation_rect": [
            216.0,
            130.0,
            30.0,
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
          "id": "obj-output-selector-15",
          "maxclass": "bpatcher",
          "patching_rect": [
            246.0,
            130.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            246.0,
            130.0,
            64.0,
            16.0
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
            317.0,
            130.0,
            30.0,
            16.0
          ],
          "text": "31/32",
          "presentation": 1,
          "presentation_rect": [
            317.0,
            130.0,
            30.0,
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
          "id": "obj-output-selector-16",
          "maxclass": "bpatcher",
          "patching_rect": [
            347.0,
            130.0,
            64.0,
            16.0
          ],
          "presentation": 1,
          "presentation_rect": [
            347.0,
            130.0,
            64.0,
            16.0
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
          "text": "openifempty \"s3g Ambi Decoder Speaker 64\" org.s3g.s3g-dsp.ambi-speaker-decoder-64",
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
          "text": "route 1 2 4 5 6 7 8 9 12 14 15 16",
          "numinlets": 1,
          "numoutlets": 13,
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
          "text": "route 1 2 4 5 6 7 8 9 12 14 15 16",
          "numinlets": 1,
          "numoutlets": 13,
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
              "parameter_longname": "Layout",
              "parameter_shortname": "Layout",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                7
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 13,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Custom",
                "Quad",
                "Cube 8",
                "Cube 17",
                "Dome 24",
                "Dome 25",
                "Quad+OH",
                "Sphere 24",
                "Dodeca 12",
                "Icosahedron 20",
                "Octo Ring",
                "Cube 41",
                "LPAC 41",
                "SRST 25"
              ]
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
          "text": "paramid 1 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-1",
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
          "id": "obj-param-reflect-1",
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
              "parameter_longname": "Mode",
              "parameter_shortname": "Mode",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 3,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Basic",
                "EPAD",
                "MMD",
                "AllRAD"
              ]
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
          "text": "paramid 2 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-paraminfo-value-2",
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
          "id": "obj-param-reflect-2",
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
          "id": "obj-param-4",
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
              "parameter_longname": "Active Speakers",
              "parameter_shortname": "Speakers",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                24
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 2,
              "parameter_mmax": 64,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 63
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
            185.0,
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
          "id": "obj-param-reflect-4",
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
          "id": "obj-param-5",
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
              "parameter_longname": "Selected Speaker",
              "parameter_shortname": "Speaker",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 64,
              "parameter_modmode": 0,
              "parameter_order": 4,
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
            215.0,
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
          "id": "obj-param-reflect-5",
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
          "id": "obj-param-6",
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
              "parameter_longname": "Speaker Azimuth",
              "parameter_shortname": "Azimuth",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -180,
              "parameter_mmax": 180,
              "parameter_modmode": 0,
              "parameter_order": 5,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            245.0,
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
          "id": "obj-param-reflect-6",
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
          "id": "obj-param-7",
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
              "parameter_longname": "Speaker Elevation",
              "parameter_shortname": "Elevation",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -90,
              "parameter_mmax": 90,
              "parameter_modmode": 0,
              "parameter_order": 6,
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
            275.0,
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
          "id": "obj-param-reflect-7",
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
          "id": "obj-param-8",
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
              "parameter_longname": "Speaker Distance",
              "parameter_shortname": "Distance",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.15,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 7,
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
            305.0,
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
          "id": "obj-param-reflect-8",
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
          "id": "obj-param-9",
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
              "parameter_longname": "Speaker Gain",
              "parameter_shortname": "Gain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 8,
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
            335.0,
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
          "id": "obj-param-reflect-9",
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
          "id": "obj-param-12",
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
              "parameter_longname": "Width",
              "parameter_shortname": "Width",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1.5,
              "parameter_modmode": 0,
              "parameter_order": 9,
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
            365.0,
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
          "id": "obj-param-reflect-12",
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
          "id": "obj-param-14",
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
              "parameter_longname": "Output",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 10,
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
            395.0,
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
          "id": "obj-param-reflect-14",
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
          "id": "obj-param-15",
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
              "parameter_longname": "Weighting",
              "parameter_shortname": "Weighting",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 11,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "None",
                "MaxRE",
                "InPhase"
              ]
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
            425.0,
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
          "id": "obj-param-reflect-15",
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
          "id": "obj-param-16",
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
              "parameter_longname": "Custom Field",
              "parameter_shortname": "Field",
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
              "parameter_type": 2,
              "parameter_enum": [
                "Sphere",
                "Hemisphere"
              ]
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
            455.0,
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
          "id": "obj-param-reflect-16",
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
          "id": "obj-param-topology-1",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            430.0,
            105.0,
            22.0
          ],
          "text": "paramid 3 3",
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
            "obj-plugin",
            2
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
            "obj-plugin",
            3
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
            "obj-plugin",
            4
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
            "obj-plugin",
            5
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
            "obj-plugin",
            6
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
            "obj-plugin",
            7
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
            "obj-plugin",
            8
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
            "obj-plugin",
            9
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
            "obj-plugin",
            10
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
            "obj-plugin",
            11
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
            "obj-plugin",
            12
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
            "obj-plugin",
            13
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
            "obj-plugin",
            14
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
            "obj-plugin",
            15
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
            "obj-plugin",
            16
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
            "obj-plugin",
            17
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-clap",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
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
            "obj-device",
            0
          ],
          "destination": [
            "obj-output-selector-16",
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
            "obj-param-1",
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
            "obj-param-reflect-1",
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
            "obj-paraminfo-value-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-1",
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
            "obj-param-2",
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
            "obj-param-reflect-2",
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
            "obj-paraminfo-value-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paraminfo-value-2",
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
            2
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
            2
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
            3
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
            3
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
            4
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
            4
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
            5
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
            5
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
            6
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
            6
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
            7
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
            7
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
            8
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
            8
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
            9
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
            9
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
            10
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
            10
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
            11
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
            11
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
      }
    ],
    "parameters": {
      "obj-clap-state": [
        "CLAP State",
        "CLAP State",
        0
      ],
      "parameterbanks": {},
      "obj-param-1": [
        "Layout",
        "Layout",
        0
      ],
      "obj-param-2": [
        "Mode",
        "Mode",
        0
      ],
      "obj-param-4": [
        "Active Speakers",
        "Speakers",
        0
      ],
      "obj-param-5": [
        "Selected Speaker",
        "Speaker",
        0
      ],
      "obj-param-6": [
        "Speaker Azimuth",
        "Azimuth",
        0
      ],
      "obj-param-7": [
        "Speaker Elevation",
        "Elevation",
        0
      ],
      "obj-param-8": [
        "Speaker Distance",
        "Distance",
        0
      ],
      "obj-param-9": [
        "Speaker Gain",
        "Gain",
        0
      ],
      "obj-param-12": [
        "Width",
        "Width",
        0
      ],
      "obj-param-14": [
        "Output",
        "Output",
        0
      ],
      "obj-param-15": [
        "Weighting",
        "Weighting",
        0
      ],
      "obj-param-16": [
        "Custom Field",
        "Field",
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
