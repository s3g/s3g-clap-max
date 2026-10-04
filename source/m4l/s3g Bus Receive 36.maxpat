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
      2300.0,
      1700.0
    ],
    "openrect": [
      0.0,
      0.0,
      267.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 267.0,
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
    "description": "Receives and sums a private 36-channel s3g bus, blocks Live's ordinary stereo input, and exposes the bus slots to the next multichannel device without assigning a signal format. A selected pair can be monitored on Live stereo output; the monitor defaults to OFF.",
    "digest": "Receives and sums a private 36-channel s3g bus, blocks Live's ordinary stereo input, and exposes the bus slots to the next multichannel device without assigning a signal format. A selected pair can be monitored on Live stereo output; the monitor defaults to OFF.",
    "tags": "s3g multichannel bus routing",
    "latency": 0,
    "minimum_live_version": "12.0",
    "minimum_max_version": "8.5",
    "boxes": [
      {
        "box": {
          "id": "obj-ui-background",
          "maxclass": "panel",
          "patching_rect": [
            1800.0,
            40.0,
            267.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            267.0,
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
          "id": "obj-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            800.0,
            75.0,
            28.0,
            20.0
          ],
          "text": "BUS",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            10.0,
            28.0,
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
          "id": "obj-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            1010.0,
            100.0,
            56.0,
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
              "parameter_longname": "Multichannel Bus",
              "parameter_shortname": "Bus",
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
          "varname": "bus_number"
        }
      },
      {
        "box": {
          "id": "obj-bus-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            800.0,
            100.0,
            56.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44.0,
            10.0,
            56.0,
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
          "annotation": "Choose multichannel bus from the menu.",
          "annotation_name": "Multichannel Bus"
        }
      },
      {
        "box": {
          "id": "obj-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            930.0,
            100.0,
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
          "id": "obj-bus-number-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1130.0,
            100.0,
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
          "id": "obj-bus-number-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1220.0,
            100.0,
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
            80.0,
            100.0,
            610.0,
            22.0
          ],
          "text": "plugin~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38",
          "numinlets": 38,
          "numoutlets": 38,
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
          "id": "obj-plugout",
          "maxclass": "newobj",
          "patching_rect": [
            80.0,
            430.0,
            610.0,
            22.0
          ],
          "text": "plugout~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38",
          "numinlets": 38,
          "numoutlets": 38,
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
            800.0,
            330.0,
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
          "id": "obj-bus-receive",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1010.0,
            225.0,
            22.0
          ],
          "text": "s3g.bus.receive s3g-bus36-1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-chain-send",
          "maxclass": "newobj",
          "patching_rect": [
            1130.0,
            1010.0,
            245.0,
            22.0
          ],
          "text": "s3g.bus.send s3g-bus36-chain",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-chain-mode",
          "maxclass": "message",
          "patching_rect": [
            1230.0,
            950.0,
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
          "id": "obj-bus-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            1130.0,
            870.0,
            180.0,
            22.0
          ],
          "text": "sprintf s3g-bus36-%ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-init",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1170.0,
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
          "id": "obj-init-defer",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1230.0,
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
          "id": "obj-init-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1290.0,
            42.0,
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
          "id": "obj-bus-output",
          "maxclass": "message",
          "patching_rect": [
            1020.0,
            1290.0,
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
          "id": "obj-monitor-label",
          "maxclass": "comment",
          "patching_rect": [
            800.0,
            165.0,
            42.0,
            20.0
          ],
          "text": "MON",
          "presentation": 1,
          "presentation_rect": [
            130.0,
            10.0,
            42.0,
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
          "id": "obj-monitor-pair",
          "maxclass": "live.numbox",
          "patching_rect": [
            1010.0,
            190.0,
            80.0,
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
              "parameter_longname": "Bus Monitor Pair",
              "parameter_shortname": "Monitor",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 18,
              "parameter_steps": 19,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "monitor_pair"
        }
      },
      {
        "box": {
          "id": "obj-monitor-pair-menu",
          "maxclass": "umenu",
          "patching_rect": [
            800.0,
            190.0,
            80.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            175.0,
            10.0,
            80.0,
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
            "01/02",
            ",",
            "03/04",
            ",",
            "05/06",
            ",",
            "07/08",
            ",",
            "09/10",
            ",",
            "11/12",
            ",",
            "13/14",
            ",",
            "15/16",
            ",",
            "17/18",
            ",",
            "19/20",
            ",",
            "21/22",
            ",",
            "23/24",
            ",",
            "25/26",
            ",",
            "27/28",
            ",",
            "29/30",
            ",",
            "31/32",
            ",",
            "33/34",
            ",",
            "35/36"
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
          "annotation": "Choose bus monitor pair from the menu.",
          "annotation_name": "Bus Monitor Pair"
        }
      },
      {
        "box": {
          "id": "obj-monitor-pair-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            930.0,
            190.0,
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
          "id": "obj-monitor-pair-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1130.0,
            190.0,
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
          "id": "obj-monitor-pair-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1220.0,
            190.0,
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
          "id": "obj-monitor-left",
          "maxclass": "newobj",
          "patching_rect": [
            80.0,
            260.0,
            120.0,
            22.0
          ],
          "text": "selector~ 18 @ramptime 5.",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-monitor-right",
          "maxclass": "newobj",
          "patching_rect": [
            250.0,
            260.0,
            120.0,
            22.0
          ],
          "text": "selector~ 18 @ramptime 5.",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-monitor-output",
          "maxclass": "message",
          "patching_rect": [
            1130.0,
            1290.0,
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
          "id": "obj-identity-start",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            390.0,
            48.0,
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
          "id": "obj-identity-retry",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            450.0,
            78.0,
            22.0
          ],
          "text": "delay 500",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-identity-tick",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            510.0,
            48.0,
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
          "id": "obj-identity-query",
          "maxclass": "message",
          "patching_rect": [
            800.0,
            570.0,
            110.0,
            22.0
          ],
          "text": "goto this_device",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-identity-path",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            630.0,
            68.0,
            22.0
          ],
          "text": "live.path",
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
          "id": "obj-identity-defer",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            690.0,
            68.0,
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
          "id": "obj-identity-route",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            750.0,
            68.0,
            22.0
          ],
          "text": "route id",
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
          "id": "obj-identity-valid",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            810.0,
            130.0,
            22.0
          ],
          "text": "split 1 2147483647",
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
          "id": "obj-identity-attach",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            870.0,
            82.0,
            22.0
          ],
          "text": "prepend id",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-identity-to-buses",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            930.0,
            45.0,
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
          "id": "obj-chain-start-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            1130.0,
            950.0,
            50.0,
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
          "id": "obj-identity-stop",
          "maxclass": "message",
          "patching_rect": [
            1400.0,
            1070.0,
            42.0,
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
          "id": "obj-bus-number-menu-write-gate",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1470.0,
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
          "id": "obj-bus-number-replay-ready",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1170.0,
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
          "id": "obj-bus-number-replay-delay",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1230.0,
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
          "id": "obj-bus-number-replay-order",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1290.0,
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
          "id": "obj-bus-number-replay-close",
          "maxclass": "message",
          "patching_rect": [
            1400.0,
            1350.0,
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
          "id": "obj-bus-number-replay-open",
          "maxclass": "message",
          "patching_rect": [
            1400.0,
            1410.0,
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
            "obj-chain-mode",
            0
          ],
          "destination": [
            "obj-chain-send",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number",
            0
          ],
          "destination": [
            "obj-bus-symbol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-symbol",
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
            "obj-init",
            0
          ],
          "destination": [
            "obj-init-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-defer",
            0
          ],
          "destination": [
            "obj-init-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-trigger",
            1
          ],
          "destination": [
            "obj-bus-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-trigger",
            0
          ],
          "destination": [
            "obj-chain-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-output",
            0
          ],
          "destination": [
            "obj-bus-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-defer",
            0
          ],
          "destination": [
            "obj-bus-number-replay-delay",
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
            "obj-bus-number-replay-ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-ready",
            0
          ],
          "destination": [
            "obj-bus-number-replay-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-delay",
            0
          ],
          "destination": [
            "obj-bus-number-replay-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-order",
            3
          ],
          "destination": [
            "obj-bus-number-replay-close",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-close",
            0
          ],
          "destination": [
            "obj-bus-number-menu-write-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-order",
            2
          ],
          "destination": [
            "obj-bus-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-order",
            1
          ],
          "destination": [
            "obj-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-order",
            0
          ],
          "destination": [
            "obj-bus-number-replay-open",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-replay-open",
            0
          ],
          "destination": [
            "obj-bus-number-menu-write-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-menu",
            0
          ],
          "destination": [
            "obj-bus-number-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number",
            0
          ],
          "destination": [
            "obj-bus-number-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-value-to-menu",
            0
          ],
          "destination": [
            "obj-bus-number-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-menu-set",
            0
          ],
          "destination": [
            "obj-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-menu-to-value",
            0
          ],
          "destination": [
            "obj-bus-number-menu-write-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-number-menu-write-gate",
            0
          ],
          "destination": [
            "obj-bus-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair",
            0
          ],
          "destination": [
            "obj-monitor-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair",
            0
          ],
          "destination": [
            "obj-monitor-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-defer",
            0
          ],
          "destination": [
            "obj-monitor-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-output",
            0
          ],
          "destination": [
            "obj-monitor-pair",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-left",
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
            "obj-monitor-right",
            0
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
            2
          ],
          "destination": [
            "obj-monitor-left",
            1
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
            "obj-monitor-right",
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
            "obj-monitor-left",
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
            "obj-monitor-right",
            2
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
            "obj-monitor-left",
            3
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
            "obj-monitor-right",
            3
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
            "obj-monitor-left",
            4
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
            "obj-monitor-right",
            4
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
            "obj-monitor-left",
            5
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
            "obj-monitor-right",
            5
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
            "obj-monitor-left",
            6
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
            "obj-monitor-right",
            6
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
            "obj-monitor-left",
            7
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
            "obj-monitor-right",
            7
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
            "obj-monitor-left",
            8
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
            "obj-monitor-right",
            8
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
            "obj-monitor-left",
            9
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
            "obj-monitor-right",
            9
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
            "obj-monitor-left",
            10
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
            "obj-monitor-right",
            10
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
            "obj-monitor-left",
            11
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
            "obj-monitor-right",
            11
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
            "obj-monitor-left",
            12
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
            "obj-monitor-right",
            12
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
            "obj-monitor-left",
            13
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
            "obj-monitor-right",
            13
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
            "obj-monitor-left",
            14
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
            "obj-monitor-right",
            14
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
            "obj-monitor-left",
            15
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
            "obj-monitor-right",
            15
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
            "obj-monitor-left",
            16
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
            "obj-monitor-right",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            34
          ],
          "destination": [
            "obj-monitor-left",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            35
          ],
          "destination": [
            "obj-monitor-right",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            36
          ],
          "destination": [
            "obj-monitor-left",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            37
          ],
          "destination": [
            "obj-monitor-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair-menu",
            0
          ],
          "destination": [
            "obj-monitor-pair-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair",
            0
          ],
          "destination": [
            "obj-monitor-pair-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair-value-to-menu",
            0
          ],
          "destination": [
            "obj-monitor-pair-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair-menu-set",
            0
          ],
          "destination": [
            "obj-monitor-pair-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-monitor-pair-menu-to-value",
            0
          ],
          "destination": [
            "obj-monitor-pair",
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
            "obj-identity-start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-start",
            1
          ],
          "destination": [
            "obj-identity-retry",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-start",
            0
          ],
          "destination": [
            "obj-identity-query",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-retry",
            0
          ],
          "destination": [
            "obj-identity-tick",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-tick",
            1
          ],
          "destination": [
            "obj-identity-retry",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-tick",
            0
          ],
          "destination": [
            "obj-identity-query",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-query",
            0
          ],
          "destination": [
            "obj-identity-path",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-path",
            1
          ],
          "destination": [
            "obj-identity-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-defer",
            0
          ],
          "destination": [
            "obj-identity-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-route",
            0
          ],
          "destination": [
            "obj-identity-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-valid",
            0
          ],
          "destination": [
            "obj-identity-attach",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-attach",
            0
          ],
          "destination": [
            "obj-identity-to-buses",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-to-buses",
            1
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
            "obj-identity-to-buses",
            0
          ],
          "destination": [
            "obj-chain-start-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-chain-start-trigger",
            1
          ],
          "destination": [
            "obj-chain-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-chain-start-trigger",
            0
          ],
          "destination": [
            "obj-chain-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-receive",
            0
          ],
          "destination": [
            "obj-identity-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-identity-stop",
            0
          ],
          "destination": [
            "obj-identity-retry",
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
            "obj-plugout",
            2
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
            "obj-plugout",
            3
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
            "obj-plugout",
            4
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
            "obj-plugout",
            5
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
            "obj-plugout",
            6
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
            "obj-plugout",
            7
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
            "obj-plugout",
            8
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
            "obj-plugout",
            9
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
            "obj-plugout",
            10
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
            "obj-plugout",
            11
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
            "obj-plugout",
            12
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
            "obj-plugout",
            13
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
            "obj-plugout",
            14
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
            "obj-plugout",
            15
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
            "obj-plugout",
            16
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
            "obj-plugout",
            17
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
            "obj-plugout",
            18
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
            "obj-plugout",
            19
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
            "obj-plugout",
            20
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
            "obj-plugout",
            21
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
            "obj-plugout",
            22
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
            "obj-plugout",
            23
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
            "obj-plugout",
            24
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
            "obj-plugout",
            25
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
            "obj-plugout",
            26
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
            "obj-plugout",
            27
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
            "obj-plugout",
            28
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
            "obj-plugout",
            29
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
            "obj-plugout",
            30
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
            "obj-plugout",
            31
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
            "obj-plugout",
            32
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
            "obj-plugout",
            33
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            34
          ],
          "destination": [
            "obj-plugout",
            34
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            35
          ],
          "destination": [
            "obj-plugout",
            35
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            36
          ],
          "destination": [
            "obj-plugout",
            36
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-plugin",
            37
          ],
          "destination": [
            "obj-plugout",
            37
          ]
        }
      }
    ],
    "parameters": {
      "obj-bus-number": [
        "Multichannel Bus",
        "Bus",
        0
      ],
      "obj-monitor-pair": [
        "Bus Monitor Pair",
        "Monitor",
        0
      ],
      "parameterbanks": {}
    },
    "dependency_cache": [
      {
        "name": "s3g.live.thisdevice.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.bus.send.maxpat",
        "type": "JSON"
      },
      {
        "name": "s3g.bus.receive.maxpat",
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
