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
      3220.0,
      1320.0
    ],
    "openrect": [
      0.0,
      0.0,
      620.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 620.0,
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
    "description": "Terminal 36-channel chain demux. Place after Bus Receive 36 or a 36-channel processor. Each of 16 Live stereo outputs selects one of 18 input bus pairs, or OFF; the first output defaults OFF to avoid an unintended main stereo feed. This device does not join or alter the numbered s3g bus handshake.",
    "digest": "Terminal 36-channel chain demux. Place after Bus Receive 36 or a 36-channel processor. Each of 16 Live stereo outputs selects one of 18 input bus pairs, or OFF; the first output defaults OFF to avoid an unintended main stereo feed. This device does not join or alter the numbered s3g bus handshake.",
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
            2550.0,
            40.0,
            620.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            620.0,
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
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            80.0,
            100.0,
            620.0,
            22.0
          ],
          "text": "plugin~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 @chans 38",
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
            1120.0,
            620.0,
            22.0
          ],
          "text": "plugout~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 @chans 32",
          "numinlets": 32,
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
          "id": "obj-init",
          "maxclass": "newobj",
          "patching_rect": [
            1800.0,
            1070.0,
            70.0,
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
            1800.0,
            1110.0,
            70.0,
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
            1800.0,
            1150.0,
            38.0,
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
          "id": "obj-init-values",
          "maxclass": "message",
          "patching_rect": [
            1800.0,
            1190.0,
            85.0,
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
          "id": "obj-tap-01-label",
          "maxclass": "comment",
          "patching_rect": [
            820.0,
            80.0,
            76.0,
            20.0
          ],
          "text": "OUT 01/02",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            10.0,
            76.0,
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
          "id": "obj-tap-01",
          "maxclass": "live.numbox",
          "patching_rect": [
            820.0,
            115.0,
            62.0,
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
              "parameter_longname": "Live Tap 01 Pair",
              "parameter_shortname": "Tap 01",
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
          "varname": "tap_01"
        }
      },
      {
        "box": {
          "id": "obj-tap-01-menu",
          "maxclass": "umenu",
          "patching_rect": [
            920.0,
            115.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90.0,
            10.0,
            62.0,
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
          "annotation": "Choose live tap 01 pair from the menu.",
          "annotation_name": "Live Tap 01 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-01-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            155.0,
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
          "id": "obj-tap-01-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            155.0,
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
          "id": "obj-tap-01-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            195.0,
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
          "id": "obj-tap-01-left",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            205.0,
            160.0,
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
          "id": "obj-tap-01-right",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            240.0,
            160.0,
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
          "id": "obj-tap-02-label",
          "maxclass": "comment",
          "patching_rect": [
            1240.0,
            80.0,
            76.0,
            20.0
          ],
          "text": "OUT 03/04",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            10.0,
            76.0,
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
          "id": "obj-tap-02",
          "maxclass": "live.numbox",
          "patching_rect": [
            1240.0,
            115.0,
            62.0,
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
              "parameter_longname": "Live Tap 02 Pair",
              "parameter_shortname": "Tap 02",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
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
          "varname": "tap_02"
        }
      },
      {
        "box": {
          "id": "obj-tap-02-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1340.0,
            115.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            242.0,
            10.0,
            62.0,
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
          "annotation": "Choose live tap 02 pair from the menu.",
          "annotation_name": "Live Tap 02 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-02-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            155.0,
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
          "id": "obj-tap-02-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            155.0,
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
          "id": "obj-tap-02-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            195.0,
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
          "id": "obj-tap-02-left",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            205.0,
            160.0,
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
          "id": "obj-tap-02-right",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            240.0,
            160.0,
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
          "id": "obj-tap-03-label",
          "maxclass": "comment",
          "patching_rect": [
            1660.0,
            80.0,
            76.0,
            20.0
          ],
          "text": "OUT 05/06",
          "presentation": 1,
          "presentation_rect": [
            316.0,
            10.0,
            76.0,
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
          "id": "obj-tap-03",
          "maxclass": "live.numbox",
          "patching_rect": [
            1660.0,
            115.0,
            62.0,
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
              "parameter_longname": "Live Tap 03 Pair",
              "parameter_shortname": "Tap 03",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
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
          "varname": "tap_03"
        }
      },
      {
        "box": {
          "id": "obj-tap-03-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1760.0,
            115.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            394.0,
            10.0,
            62.0,
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
          "annotation": "Choose live tap 03 pair from the menu.",
          "annotation_name": "Live Tap 03 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-03-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            155.0,
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
          "id": "obj-tap-03-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            155.0,
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
          "id": "obj-tap-03-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            195.0,
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
          "id": "obj-tap-03-left",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            205.0,
            160.0,
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
          "id": "obj-tap-03-right",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            240.0,
            160.0,
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
          "id": "obj-tap-04-label",
          "maxclass": "comment",
          "patching_rect": [
            2080.0,
            80.0,
            76.0,
            20.0
          ],
          "text": "OUT 07/08",
          "presentation": 1,
          "presentation_rect": [
            468.0,
            10.0,
            76.0,
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
          "id": "obj-tap-04",
          "maxclass": "live.numbox",
          "patching_rect": [
            2080.0,
            115.0,
            62.0,
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
              "parameter_longname": "Live Tap 04 Pair",
              "parameter_shortname": "Tap 04",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                3
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
          "varname": "tap_04"
        }
      },
      {
        "box": {
          "id": "obj-tap-04-menu",
          "maxclass": "umenu",
          "patching_rect": [
            2180.0,
            115.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            546.0,
            10.0,
            62.0,
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
          "annotation": "Choose live tap 04 pair from the menu.",
          "annotation_name": "Live Tap 04 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-04-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            2180.0,
            155.0,
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
          "id": "obj-tap-04-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            155.0,
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
          "id": "obj-tap-04-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            195.0,
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
          "id": "obj-tap-04-left",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            205.0,
            160.0,
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
          "id": "obj-tap-04-right",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            240.0,
            160.0,
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
          "id": "obj-tap-05-label",
          "maxclass": "comment",
          "patching_rect": [
            820.0,
            300.0,
            76.0,
            20.0
          ],
          "text": "OUT 09/10",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            46.0,
            76.0,
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
          "id": "obj-tap-05",
          "maxclass": "live.numbox",
          "patching_rect": [
            820.0,
            335.0,
            62.0,
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
              "parameter_longname": "Live Tap 05 Pair",
              "parameter_shortname": "Tap 05",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                4
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
          "varname": "tap_05"
        }
      },
      {
        "box": {
          "id": "obj-tap-05-menu",
          "maxclass": "umenu",
          "patching_rect": [
            920.0,
            335.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90.0,
            46.0,
            62.0,
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
          "annotation": "Choose live tap 05 pair from the menu.",
          "annotation_name": "Live Tap 05 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-05-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            375.0,
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
          "id": "obj-tap-05-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            375.0,
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
          "id": "obj-tap-05-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            415.0,
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
          "id": "obj-tap-05-left",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            425.0,
            160.0,
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
          "id": "obj-tap-05-right",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            460.0,
            160.0,
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
          "id": "obj-tap-06-label",
          "maxclass": "comment",
          "patching_rect": [
            1240.0,
            300.0,
            76.0,
            20.0
          ],
          "text": "OUT 11/12",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            46.0,
            76.0,
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
          "id": "obj-tap-06",
          "maxclass": "live.numbox",
          "patching_rect": [
            1240.0,
            335.0,
            62.0,
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
              "parameter_longname": "Live Tap 06 Pair",
              "parameter_shortname": "Tap 06",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                5
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
          "varname": "tap_06"
        }
      },
      {
        "box": {
          "id": "obj-tap-06-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1340.0,
            335.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            242.0,
            46.0,
            62.0,
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
          "annotation": "Choose live tap 06 pair from the menu.",
          "annotation_name": "Live Tap 06 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-06-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            375.0,
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
          "id": "obj-tap-06-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            375.0,
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
          "id": "obj-tap-06-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            415.0,
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
          "id": "obj-tap-06-left",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            425.0,
            160.0,
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
          "id": "obj-tap-06-right",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            460.0,
            160.0,
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
          "id": "obj-tap-07-label",
          "maxclass": "comment",
          "patching_rect": [
            1660.0,
            300.0,
            76.0,
            20.0
          ],
          "text": "OUT 13/14",
          "presentation": 1,
          "presentation_rect": [
            316.0,
            46.0,
            76.0,
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
          "id": "obj-tap-07",
          "maxclass": "live.numbox",
          "patching_rect": [
            1660.0,
            335.0,
            62.0,
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
              "parameter_longname": "Live Tap 07 Pair",
              "parameter_shortname": "Tap 07",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                6
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
          "varname": "tap_07"
        }
      },
      {
        "box": {
          "id": "obj-tap-07-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1760.0,
            335.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            394.0,
            46.0,
            62.0,
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
          "annotation": "Choose live tap 07 pair from the menu.",
          "annotation_name": "Live Tap 07 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-07-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            375.0,
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
          "id": "obj-tap-07-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            375.0,
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
          "id": "obj-tap-07-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            415.0,
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
          "id": "obj-tap-07-left",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            425.0,
            160.0,
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
          "id": "obj-tap-07-right",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            460.0,
            160.0,
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
          "id": "obj-tap-08-label",
          "maxclass": "comment",
          "patching_rect": [
            2080.0,
            300.0,
            76.0,
            20.0
          ],
          "text": "OUT 15/16",
          "presentation": 1,
          "presentation_rect": [
            468.0,
            46.0,
            76.0,
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
          "id": "obj-tap-08",
          "maxclass": "live.numbox",
          "patching_rect": [
            2080.0,
            335.0,
            62.0,
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
              "parameter_longname": "Live Tap 08 Pair",
              "parameter_shortname": "Tap 08",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                7
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
          "varname": "tap_08"
        }
      },
      {
        "box": {
          "id": "obj-tap-08-menu",
          "maxclass": "umenu",
          "patching_rect": [
            2180.0,
            335.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            546.0,
            46.0,
            62.0,
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
          "annotation": "Choose live tap 08 pair from the menu.",
          "annotation_name": "Live Tap 08 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-08-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            2180.0,
            375.0,
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
          "id": "obj-tap-08-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            375.0,
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
          "id": "obj-tap-08-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            415.0,
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
          "id": "obj-tap-08-left",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            425.0,
            160.0,
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
          "id": "obj-tap-08-right",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            460.0,
            160.0,
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
          "id": "obj-tap-09-label",
          "maxclass": "comment",
          "patching_rect": [
            820.0,
            520.0,
            76.0,
            20.0
          ],
          "text": "OUT 17/18",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            82.0,
            76.0,
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
          "id": "obj-tap-09",
          "maxclass": "live.numbox",
          "patching_rect": [
            820.0,
            555.0,
            62.0,
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
              "parameter_longname": "Live Tap 09 Pair",
              "parameter_shortname": "Tap 09",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                8
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
          "varname": "tap_09"
        }
      },
      {
        "box": {
          "id": "obj-tap-09-menu",
          "maxclass": "umenu",
          "patching_rect": [
            920.0,
            555.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90.0,
            82.0,
            62.0,
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
          "annotation": "Choose live tap 09 pair from the menu.",
          "annotation_name": "Live Tap 09 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-09-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            595.0,
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
          "id": "obj-tap-09-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            595.0,
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
          "id": "obj-tap-09-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            635.0,
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
          "id": "obj-tap-09-left",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            645.0,
            160.0,
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
          "id": "obj-tap-09-right",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            680.0,
            160.0,
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
          "id": "obj-tap-10-label",
          "maxclass": "comment",
          "patching_rect": [
            1240.0,
            520.0,
            76.0,
            20.0
          ],
          "text": "OUT 19/20",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            82.0,
            76.0,
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
          "id": "obj-tap-10",
          "maxclass": "live.numbox",
          "patching_rect": [
            1240.0,
            555.0,
            62.0,
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
              "parameter_longname": "Live Tap 10 Pair",
              "parameter_shortname": "Tap 10",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                9
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
          "varname": "tap_10"
        }
      },
      {
        "box": {
          "id": "obj-tap-10-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1340.0,
            555.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            242.0,
            82.0,
            62.0,
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
          "annotation": "Choose live tap 10 pair from the menu.",
          "annotation_name": "Live Tap 10 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-10-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            595.0,
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
          "id": "obj-tap-10-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            595.0,
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
          "id": "obj-tap-10-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            635.0,
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
          "id": "obj-tap-10-left",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            645.0,
            160.0,
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
          "id": "obj-tap-10-right",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            680.0,
            160.0,
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
          "id": "obj-tap-11-label",
          "maxclass": "comment",
          "patching_rect": [
            1660.0,
            520.0,
            76.0,
            20.0
          ],
          "text": "OUT 21/22",
          "presentation": 1,
          "presentation_rect": [
            316.0,
            82.0,
            76.0,
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
          "id": "obj-tap-11",
          "maxclass": "live.numbox",
          "patching_rect": [
            1660.0,
            555.0,
            62.0,
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
              "parameter_longname": "Live Tap 11 Pair",
              "parameter_shortname": "Tap 11",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                10
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
          "varname": "tap_11"
        }
      },
      {
        "box": {
          "id": "obj-tap-11-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1760.0,
            555.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            394.0,
            82.0,
            62.0,
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
          "annotation": "Choose live tap 11 pair from the menu.",
          "annotation_name": "Live Tap 11 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-11-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            595.0,
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
          "id": "obj-tap-11-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            595.0,
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
          "id": "obj-tap-11-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            635.0,
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
          "id": "obj-tap-11-left",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            645.0,
            160.0,
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
          "id": "obj-tap-11-right",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            680.0,
            160.0,
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
          "id": "obj-tap-12-label",
          "maxclass": "comment",
          "patching_rect": [
            2080.0,
            520.0,
            76.0,
            20.0
          ],
          "text": "OUT 23/24",
          "presentation": 1,
          "presentation_rect": [
            468.0,
            82.0,
            76.0,
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
          "id": "obj-tap-12",
          "maxclass": "live.numbox",
          "patching_rect": [
            2080.0,
            555.0,
            62.0,
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
              "parameter_longname": "Live Tap 12 Pair",
              "parameter_shortname": "Tap 12",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                11
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
          "varname": "tap_12"
        }
      },
      {
        "box": {
          "id": "obj-tap-12-menu",
          "maxclass": "umenu",
          "patching_rect": [
            2180.0,
            555.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            546.0,
            82.0,
            62.0,
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
          "annotation": "Choose live tap 12 pair from the menu.",
          "annotation_name": "Live Tap 12 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-12-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            2180.0,
            595.0,
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
          "id": "obj-tap-12-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            595.0,
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
          "id": "obj-tap-12-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            635.0,
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
          "id": "obj-tap-12-left",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            645.0,
            160.0,
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
          "id": "obj-tap-12-right",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            680.0,
            160.0,
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
          "id": "obj-tap-13-label",
          "maxclass": "comment",
          "patching_rect": [
            820.0,
            740.0,
            76.0,
            20.0
          ],
          "text": "OUT 25/26",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            118.0,
            76.0,
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
          "id": "obj-tap-13",
          "maxclass": "live.numbox",
          "patching_rect": [
            820.0,
            775.0,
            62.0,
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
              "parameter_longname": "Live Tap 13 Pair",
              "parameter_shortname": "Tap 13",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                12
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
          "varname": "tap_13"
        }
      },
      {
        "box": {
          "id": "obj-tap-13-menu",
          "maxclass": "umenu",
          "patching_rect": [
            920.0,
            775.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90.0,
            118.0,
            62.0,
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
          "annotation": "Choose live tap 13 pair from the menu.",
          "annotation_name": "Live Tap 13 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-13-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            815.0,
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
          "id": "obj-tap-13-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            815.0,
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
          "id": "obj-tap-13-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            855.0,
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
          "id": "obj-tap-13-left",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            865.0,
            160.0,
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
          "id": "obj-tap-13-right",
          "maxclass": "newobj",
          "patching_rect": [
            990.0,
            900.0,
            160.0,
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
          "id": "obj-tap-14-label",
          "maxclass": "comment",
          "patching_rect": [
            1240.0,
            740.0,
            76.0,
            20.0
          ],
          "text": "OUT 27/28",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            118.0,
            76.0,
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
          "id": "obj-tap-14",
          "maxclass": "live.numbox",
          "patching_rect": [
            1240.0,
            775.0,
            62.0,
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
              "parameter_longname": "Live Tap 14 Pair",
              "parameter_shortname": "Tap 14",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                13
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
          "varname": "tap_14"
        }
      },
      {
        "box": {
          "id": "obj-tap-14-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1340.0,
            775.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            242.0,
            118.0,
            62.0,
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
          "annotation": "Choose live tap 14 pair from the menu.",
          "annotation_name": "Live Tap 14 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-14-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            815.0,
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
          "id": "obj-tap-14-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            815.0,
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
          "id": "obj-tap-14-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1240.0,
            855.0,
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
          "id": "obj-tap-14-left",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            865.0,
            160.0,
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
          "id": "obj-tap-14-right",
          "maxclass": "newobj",
          "patching_rect": [
            1410.0,
            900.0,
            160.0,
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
          "id": "obj-tap-15-label",
          "maxclass": "comment",
          "patching_rect": [
            1660.0,
            740.0,
            76.0,
            20.0
          ],
          "text": "OUT 29/30",
          "presentation": 1,
          "presentation_rect": [
            316.0,
            118.0,
            76.0,
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
          "id": "obj-tap-15",
          "maxclass": "live.numbox",
          "patching_rect": [
            1660.0,
            775.0,
            62.0,
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
              "parameter_longname": "Live Tap 15 Pair",
              "parameter_shortname": "Tap 15",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                14
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
          "varname": "tap_15"
        }
      },
      {
        "box": {
          "id": "obj-tap-15-menu",
          "maxclass": "umenu",
          "patching_rect": [
            1760.0,
            775.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            394.0,
            118.0,
            62.0,
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
          "annotation": "Choose live tap 15 pair from the menu.",
          "annotation_name": "Live Tap 15 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-15-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1760.0,
            815.0,
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
          "id": "obj-tap-15-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            815.0,
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
          "id": "obj-tap-15-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1660.0,
            855.0,
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
          "id": "obj-tap-15-left",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            865.0,
            160.0,
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
          "id": "obj-tap-15-right",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            900.0,
            160.0,
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
          "id": "obj-tap-16-label",
          "maxclass": "comment",
          "patching_rect": [
            2080.0,
            740.0,
            76.0,
            20.0
          ],
          "text": "OUT 31/32",
          "presentation": 1,
          "presentation_rect": [
            468.0,
            118.0,
            76.0,
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
          "id": "obj-tap-16",
          "maxclass": "live.numbox",
          "patching_rect": [
            2080.0,
            775.0,
            62.0,
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
              "parameter_longname": "Live Tap 16 Pair",
              "parameter_shortname": "Tap 16",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                15
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
          "varname": "tap_16"
        }
      },
      {
        "box": {
          "id": "obj-tap-16-menu",
          "maxclass": "umenu",
          "patching_rect": [
            2180.0,
            775.0,
            62.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            546.0,
            118.0,
            62.0,
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
          "annotation": "Choose live tap 16 pair from the menu.",
          "annotation_name": "Live Tap 16 Pair"
        }
      },
      {
        "box": {
          "id": "obj-tap-16-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            2180.0,
            815.0,
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
          "id": "obj-tap-16-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            815.0,
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
          "id": "obj-tap-16-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            2080.0,
            855.0,
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
          "id": "obj-tap-16-left",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            865.0,
            160.0,
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
          "id": "obj-tap-16-right",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            900.0,
            160.0,
            22.0
          ],
          "text": "selector~ 18 @ramptime 5.",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      }
    ],
    "lines": [
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
            0
          ],
          "destination": [
            "obj-init-values",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01-menu",
            0
          ],
          "destination": [
            "obj-tap-01-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01",
            0
          ],
          "destination": [
            "obj-tap-01-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-01-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01-menu-set",
            0
          ],
          "destination": [
            "obj-tap-01-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-01",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-01",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01",
            0
          ],
          "destination": [
            "obj-tap-01-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01",
            0
          ],
          "destination": [
            "obj-tap-01-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
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
            "obj-tap-01-left",
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
            "obj-tap-01-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02-menu",
            0
          ],
          "destination": [
            "obj-tap-02-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02",
            0
          ],
          "destination": [
            "obj-tap-02-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-02-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02-menu-set",
            0
          ],
          "destination": [
            "obj-tap-02-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-02",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-02",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02",
            0
          ],
          "destination": [
            "obj-tap-02-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02",
            0
          ],
          "destination": [
            "obj-tap-02-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-02-left",
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
            "obj-tap-02-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
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
            "obj-tap-02-left",
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
            "obj-tap-02-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03-menu",
            0
          ],
          "destination": [
            "obj-tap-03-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03",
            0
          ],
          "destination": [
            "obj-tap-03-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-03-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03-menu-set",
            0
          ],
          "destination": [
            "obj-tap-03-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-03",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-03",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03",
            0
          ],
          "destination": [
            "obj-tap-03-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03",
            0
          ],
          "destination": [
            "obj-tap-03-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-03-left",
            0
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
            "obj-tap-03-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
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
            "obj-tap-03-left",
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
            "obj-tap-03-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04-menu",
            0
          ],
          "destination": [
            "obj-tap-04-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04",
            0
          ],
          "destination": [
            "obj-tap-04-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-04-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04-menu-set",
            0
          ],
          "destination": [
            "obj-tap-04-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-04",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-04",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04",
            0
          ],
          "destination": [
            "obj-tap-04-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04",
            0
          ],
          "destination": [
            "obj-tap-04-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-04-left",
            0
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
            "obj-tap-04-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
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
            "obj-tap-04-left",
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
            "obj-tap-04-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05-menu",
            0
          ],
          "destination": [
            "obj-tap-05-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05",
            0
          ],
          "destination": [
            "obj-tap-05-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-05-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05-menu-set",
            0
          ],
          "destination": [
            "obj-tap-05-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-05",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-05",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05",
            0
          ],
          "destination": [
            "obj-tap-05-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05",
            0
          ],
          "destination": [
            "obj-tap-05-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-05-left",
            0
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
            "obj-tap-05-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
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
            "obj-tap-05-left",
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
            "obj-tap-05-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06-menu",
            0
          ],
          "destination": [
            "obj-tap-06-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06",
            0
          ],
          "destination": [
            "obj-tap-06-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-06-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06-menu-set",
            0
          ],
          "destination": [
            "obj-tap-06-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-06",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-06",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06",
            0
          ],
          "destination": [
            "obj-tap-06-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06",
            0
          ],
          "destination": [
            "obj-tap-06-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-06-left",
            0
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
            "obj-tap-06-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
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
            "obj-tap-06-left",
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
            "obj-tap-06-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07-menu",
            0
          ],
          "destination": [
            "obj-tap-07-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07",
            0
          ],
          "destination": [
            "obj-tap-07-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-07-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07-menu-set",
            0
          ],
          "destination": [
            "obj-tap-07-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-07",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-07",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07",
            0
          ],
          "destination": [
            "obj-tap-07-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07",
            0
          ],
          "destination": [
            "obj-tap-07-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-07-left",
            0
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
            "obj-tap-07-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
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
            "obj-tap-07-left",
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
            "obj-tap-07-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08-menu",
            0
          ],
          "destination": [
            "obj-tap-08-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08",
            0
          ],
          "destination": [
            "obj-tap-08-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-08-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08-menu-set",
            0
          ],
          "destination": [
            "obj-tap-08-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-08",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-08",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08",
            0
          ],
          "destination": [
            "obj-tap-08-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08",
            0
          ],
          "destination": [
            "obj-tap-08-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-08-left",
            0
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
            "obj-tap-08-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
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
            "obj-tap-08-left",
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
            "obj-tap-08-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09-menu",
            0
          ],
          "destination": [
            "obj-tap-09-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09",
            0
          ],
          "destination": [
            "obj-tap-09-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-09-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09-menu-set",
            0
          ],
          "destination": [
            "obj-tap-09-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-09",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-09",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09",
            0
          ],
          "destination": [
            "obj-tap-09-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09",
            0
          ],
          "destination": [
            "obj-tap-09-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-09-left",
            0
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
            "obj-tap-09-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
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
            "obj-tap-09-left",
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
            "obj-tap-09-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10-menu",
            0
          ],
          "destination": [
            "obj-tap-10-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10",
            0
          ],
          "destination": [
            "obj-tap-10-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-10-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10-menu-set",
            0
          ],
          "destination": [
            "obj-tap-10-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10",
            0
          ],
          "destination": [
            "obj-tap-10-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10",
            0
          ],
          "destination": [
            "obj-tap-10-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-10-left",
            0
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
            "obj-tap-10-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
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
            "obj-tap-10-left",
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
            "obj-tap-10-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11-menu",
            0
          ],
          "destination": [
            "obj-tap-11-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11",
            0
          ],
          "destination": [
            "obj-tap-11-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-11-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11-menu-set",
            0
          ],
          "destination": [
            "obj-tap-11-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11",
            0
          ],
          "destination": [
            "obj-tap-11-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11",
            0
          ],
          "destination": [
            "obj-tap-11-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-11-left",
            0
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
            "obj-tap-11-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
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
            "obj-tap-11-left",
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
            "obj-tap-11-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12-menu",
            0
          ],
          "destination": [
            "obj-tap-12-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12",
            0
          ],
          "destination": [
            "obj-tap-12-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-12-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12-menu-set",
            0
          ],
          "destination": [
            "obj-tap-12-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12",
            0
          ],
          "destination": [
            "obj-tap-12-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12",
            0
          ],
          "destination": [
            "obj-tap-12-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-12-left",
            0
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
            "obj-tap-12-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
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
            "obj-tap-12-left",
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
            "obj-tap-12-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13-menu",
            0
          ],
          "destination": [
            "obj-tap-13-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13",
            0
          ],
          "destination": [
            "obj-tap-13-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-13-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13-menu-set",
            0
          ],
          "destination": [
            "obj-tap-13-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13",
            0
          ],
          "destination": [
            "obj-tap-13-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13",
            0
          ],
          "destination": [
            "obj-tap-13-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-13-left",
            0
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
            "obj-tap-13-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
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
            "obj-tap-13-left",
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
            "obj-tap-13-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14-menu",
            0
          ],
          "destination": [
            "obj-tap-14-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14",
            0
          ],
          "destination": [
            "obj-tap-14-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-14-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14-menu-set",
            0
          ],
          "destination": [
            "obj-tap-14-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14",
            0
          ],
          "destination": [
            "obj-tap-14-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14",
            0
          ],
          "destination": [
            "obj-tap-14-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-14-left",
            0
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
            "obj-tap-14-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
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
            "obj-tap-14-left",
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
            "obj-tap-14-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15-menu",
            0
          ],
          "destination": [
            "obj-tap-15-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15",
            0
          ],
          "destination": [
            "obj-tap-15-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-15-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15-menu-set",
            0
          ],
          "destination": [
            "obj-tap-15-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15",
            0
          ],
          "destination": [
            "obj-tap-15-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15",
            0
          ],
          "destination": [
            "obj-tap-15-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-15-left",
            0
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
            "obj-tap-15-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
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
            "obj-tap-15-left",
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
            "obj-tap-15-right",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16-menu",
            0
          ],
          "destination": [
            "obj-tap-16-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16",
            0
          ],
          "destination": [
            "obj-tap-16-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16-value-to-menu",
            0
          ],
          "destination": [
            "obj-tap-16-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16-menu-set",
            0
          ],
          "destination": [
            "obj-tap-16-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16-menu-to-value",
            0
          ],
          "destination": [
            "obj-tap-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-values",
            0
          ],
          "destination": [
            "obj-tap-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16",
            0
          ],
          "destination": [
            "obj-tap-16-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16",
            0
          ],
          "destination": [
            "obj-tap-16-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tap-16-left",
            0
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
            "obj-tap-16-right",
            0
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
            2
          ],
          "destination": [
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
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
            "obj-tap-16-left",
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
            "obj-tap-16-right",
            18
          ]
        }
      }
    ],
    "parameters": {
      "obj-tap-01": [
        "Live Tap 01 Pair",
        "Tap 01",
        0
      ],
      "obj-tap-02": [
        "Live Tap 02 Pair",
        "Tap 02",
        0
      ],
      "obj-tap-03": [
        "Live Tap 03 Pair",
        "Tap 03",
        0
      ],
      "obj-tap-04": [
        "Live Tap 04 Pair",
        "Tap 04",
        0
      ],
      "obj-tap-05": [
        "Live Tap 05 Pair",
        "Tap 05",
        0
      ],
      "obj-tap-06": [
        "Live Tap 06 Pair",
        "Tap 06",
        0
      ],
      "obj-tap-07": [
        "Live Tap 07 Pair",
        "Tap 07",
        0
      ],
      "obj-tap-08": [
        "Live Tap 08 Pair",
        "Tap 08",
        0
      ],
      "obj-tap-09": [
        "Live Tap 09 Pair",
        "Tap 09",
        0
      ],
      "obj-tap-10": [
        "Live Tap 10 Pair",
        "Tap 10",
        0
      ],
      "obj-tap-11": [
        "Live Tap 11 Pair",
        "Tap 11",
        0
      ],
      "obj-tap-12": [
        "Live Tap 12 Pair",
        "Tap 12",
        0
      ],
      "obj-tap-13": [
        "Live Tap 13 Pair",
        "Tap 13",
        0
      ],
      "obj-tap-14": [
        "Live Tap 14 Pair",
        "Tap 14",
        0
      ],
      "obj-tap-15": [
        "Live Tap 15 Pair",
        "Tap 15",
        0
      ],
      "obj-tap-16": [
        "Live Tap 16 Pair",
        "Tap 16",
        0
      ],
      "parameterbanks": {}
    },
    "dependency_cache": [],
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
