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
    "description": "Receives the 16-channel master bus, hosts an s3g CLAP decoder, and routes up to 32 decoded channels directly to selectable Live hardware-output pairs.",
    "digest": "Receives the 16-channel master bus, hosts an s3g CLAP decoder, and routes up to 32 decoded channels directly to selectable Live hardware-output pairs.",
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
          "text": "s3g CLAP 3OA MAIN OUT",
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
          "text": "HARDWARE OUTPUT PAIRS",
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
          "text": "DECODER 1–32",
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
            120.0,
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
          "text": "openifempty \"s3g Ambi Decoder Head 2\"",
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
      }
    ],
    "parameters": {
      "obj-clap-state": [
        "CLAP State",
        "CLAP State",
        0
      ],
      "parameterbanks": {}
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
