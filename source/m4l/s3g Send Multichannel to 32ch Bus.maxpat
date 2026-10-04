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
      940.0,
      720.0
    ],
    "openrect": [
      0.0,
      0.0,
      648.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 648.0,
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
    "description": "Maps Live stereo or up to 32 auxiliary chain channels onto the private 32-channel bus. TO displays FROM plus CH minus one with 32-channel wrap; SLOT selects the first destination bus slot. STEREO supplies at most two channels. Stereo dry output can be kept or muted independently of the bus send.",
    "digest": "Maps Live stereo or up to 32 auxiliary chain channels onto the private 32-channel bus. TO displays FROM plus CH minus one with 32-channel wrap; SLOT selects the first destination bus slot. STEREO supplies at most two channels. Stereo dry output can be kept or muted independently of the bus send.",
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
            0.0,
            0.0,
            648.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            648.0,
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
            12.0,
            10.0,
            52.0,
            20.0
          ],
          "text": "SND BUS",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            10.0,
            52.0,
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
          "id": "obj-source-label",
          "maxclass": "comment",
          "patching_rect": [
            130.0,
            10.0,
            38.0,
            20.0
          ],
          "text": "INPUT",
          "presentation": 1,
          "presentation_rect": [
            130.0,
            10.0,
            38.0,
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
          "id": "obj-width-label",
          "maxclass": "comment",
          "patching_rect": [
            274.0,
            10.0,
            23.0,
            20.0
          ],
          "text": "CH",
          "presentation": 1,
          "presentation_rect": [
            274.0,
            10.0,
            23.0,
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
          "id": "obj-source-first-label",
          "maxclass": "comment",
          "patching_rect": [
            362.0,
            10.0,
            36.0,
            20.0
          ],
          "text": "FROM",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            10.0,
            36.0,
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
          "id": "obj-source-last-label",
          "maxclass": "comment",
          "patching_rect": [
            462.0,
            10.0,
            20.0,
            20.0
          ],
          "text": "TO",
          "presentation": 1,
          "presentation_rect": [
            462.0,
            10.0,
            20.0,
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
          "id": "obj-destination-first-label",
          "maxclass": "comment",
          "patching_rect": [
            546.0,
            10.0,
            36.0,
            20.0
          ],
          "text": "SLOT",
          "presentation": 1,
          "presentation_rect": [
            546.0,
            10.0,
            36.0,
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
            70.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            70.0,
            10.0,
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
          "annotation": "Choose multichannel bus from the menu.",
          "annotation_name": "Multichannel Bus"
        }
      },
      {
        "box": {
          "id": "obj-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            40.0,
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
            1100.0,
            40.0,
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
            1150.0,
            40.0,
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
          "id": "obj-source-mode",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
            90.0,
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
              "parameter_longname": "Source Input",
              "parameter_shortname": "Input",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                2
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 2,
              "parameter_steps": 2,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "source_mode"
        }
      },
      {
        "box": {
          "id": "obj-source-mode-menu",
          "maxclass": "umenu",
          "patching_rect": [
            172.0,
            10.0,
            90.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            172.0,
            10.0,
            90.0,
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
            "STEREO 2",
            ",",
            "CHAIN 32"
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
          "annotation": "Choose source input from the menu.",
          "annotation_name": "Source Input"
        }
      },
      {
        "box": {
          "id": "obj-source-mode-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            40.0,
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
          "id": "obj-source-mode-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            40.0,
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
          "id": "obj-source-mode-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            40.0,
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
          "id": "obj-channel-count",
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
              "parameter_longname": "Send Channels",
              "parameter_shortname": "Channels",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                32
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 32,
              "parameter_steps": 32,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "channel_count"
        }
      },
      {
        "box": {
          "id": "obj-channel-count-menu",
          "maxclass": "umenu",
          "patching_rect": [
            302.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            302.0,
            10.0,
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
          "annotation": "Choose send channels from the menu.",
          "annotation_name": "Send Channels"
        }
      },
      {
        "box": {
          "id": "obj-channel-count-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            40.0,
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
          "id": "obj-channel-count-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            40.0,
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
          "id": "obj-channel-count-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            40.0,
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
          "id": "obj-source-first",
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
              "parameter_longname": "First Source Channel",
              "parameter_shortname": "From",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 32,
              "parameter_steps": 32,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "source_first"
        }
      },
      {
        "box": {
          "id": "obj-source-first-menu",
          "maxclass": "umenu",
          "patching_rect": [
            402.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            402.0,
            10.0,
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
          "annotation": "Choose first source channel from the menu.",
          "annotation_name": "First Source Channel"
        }
      },
      {
        "box": {
          "id": "obj-source-first-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            40.0,
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
          "id": "obj-source-first-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            40.0,
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
          "id": "obj-source-first-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            40.0,
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
          "id": "obj-destination-first",
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
              "parameter_longname": "First Bus Slot",
              "parameter_shortname": "Slot",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 32,
              "parameter_steps": 32,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "destination_first"
        }
      },
      {
        "box": {
          "id": "obj-destination-first-menu",
          "maxclass": "umenu",
          "patching_rect": [
            588.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            588.0,
            10.0,
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
          "annotation": "Choose first bus slot from the menu.",
          "annotation_name": "First Bus Slot"
        }
      },
      {
        "box": {
          "id": "obj-destination-first-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            1050.0,
            40.0,
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
          "id": "obj-destination-first-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            1100.0,
            40.0,
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
          "id": "obj-destination-first-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            40.0,
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
          "id": "obj-source-last-display",
          "maxclass": "umenu",
          "patching_rect": [
            486.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            10.0,
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
          "ignoreclick": 1,
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
          "arrow": 0,
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
          "annotation": "Calculated last source channel; wraps after 32.",
          "annotation_name": "Last Source Channel"
        }
      },
      {
        "box": {
          "id": "obj-source-last-values",
          "maxclass": "newobj",
          "patching_rect": [
            1260.0,
            260.0,
            65.0,
            22.0
          ],
          "text": "pak 1 32",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-last-calculate",
          "maxclass": "newobj",
          "patching_rect": [
            1340.0,
            260.0,
            225.0,
            22.0
          ],
          "text": "expr ($i1 + $i2 - 2) % 32",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-source-last-set",
          "maxclass": "newobj",
          "patching_rect": [
            1575.0,
            260.0,
            90.0,
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
          "id": "obj-bus-gain",
          "maxclass": "live.gain~",
          "patching_rect": [
            125.0,
            345.0,
            168.0,
            70.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            60.0,
            168.0,
            70.0
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
              "parameter_longname": "Multichannel Bus Gain",
              "parameter_shortname": "Bus Gain",
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
          "varname": "multichannel_bus_gain"
        }
      },
      {
        "box": {
          "id": "obj-dry-mode",
          "maxclass": "live.text",
          "patching_rect": [
            470.0,
            155.0,
            85.0,
            22.0
          ],
          "text": "DRY KEEP",
          "presentation": 1,
          "presentation_rect": [
            195.0,
            60.0,
            84.0,
            20.0
          ],
          "texton": "BUS ONLY",
          "automation": "Keep",
          "automationon": "Bus Only",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "mode": 1,
          "activebgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "activebgoncolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "activetextcolor": [
            0.6,
            0.6,
            0.6,
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
          "fontname": "Arial",
          "fontsize": 11.0,
          "rounded": 2.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Dry Output",
              "parameter_shortname": "Dry",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_enum": [
                "Keep",
                "Bus Only"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "dry_output"
        }
      },
      {
        "box": {
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            220.0,
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
          "id": "obj-plugout",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            430.0,
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
          "id": "obj-route-matrix",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            300.0,
            220.0,
            22.0
          ],
          "text": "matrix~ 34 32 1. @ramp 5.",
          "numinlets": 34,
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
          "id": "obj-route-values",
          "maxclass": "newobj",
          "patching_rect": [
            720.0,
            300.0,
            110.0,
            22.0
          ],
          "text": "pak 2 32 1 1",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-route-order",
          "maxclass": "newobj",
          "patching_rect": [
            840.0,
            300.0,
            50.0,
            22.0
          ],
          "text": "t b l",
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
          "id": "obj-route-unpack",
          "maxclass": "newobj",
          "patching_rect": [
            900.0,
            300.0,
            130.0,
            22.0
          ],
          "text": "unpack i i i i",
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
          "id": "obj-route-rebuild",
          "maxclass": "newobj",
          "patching_rect": [
            840.0,
            340.0,
            50.0,
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
          "id": "obj-route-clear",
          "maxclass": "message",
          "patching_rect": [
            900.0,
            340.0,
            46.0,
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
          "id": "obj-route-iterate",
          "maxclass": "newobj",
          "patching_rect": [
            840.0,
            380.0,
            65.0,
            22.0
          ],
          "text": "uzi 32",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-route-index",
          "maxclass": "newobj",
          "patching_rect": [
            920.0,
            380.0,
            42.0,
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
          "id": "obj-route-source",
          "maxclass": "newobj",
          "patching_rect": [
            980.0,
            380.0,
            400.0,
            22.0
          ],
          "text": "expr (($i1 <= $i3) && (($i2 == 2) || (($i2 == 1) && ($i1 <= 2)))) * ((($i2 == 1) * ($i1 - 1)) + (($i2 == 2) * ((($i4 + $i1 - 2) % 32) + 2)) + 1) - 1",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-route-destination",
          "maxclass": "newobj",
          "patching_rect": [
            980.0,
            420.0,
            225.0,
            22.0
          ],
          "text": "expr ($i1 + $i2 - 2) % 32",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-route-source-valid",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            380.0,
            72.0,
            22.0
          ],
          "text": "split 0 33",
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
          "id": "obj-route-cell",
          "maxclass": "newobj",
          "patching_rect": [
            1490.0,
            380.0,
            90.0,
            22.0
          ],
          "text": "pack i i 1.",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-dry-invert",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            190.0,
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
          "id": "obj-dry-left",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            380.0,
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
          "id": "obj-dry-right",
          "maxclass": "newobj",
          "patching_rect": [
            95.0,
            380.0,
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
          "id": "obj-device",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            220.0,
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
            300.0,
            215.0,
            22.0
          ],
          "text": "s3g.bus.send s3g-multichannel-1",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-bus-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            260.0,
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
          "id": "obj-bus-mode",
          "maxclass": "message",
          "patching_rect": [
            700.0,
            300.0,
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
          "id": "obj-init",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            390.0,
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
            470.0,
            425.0,
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
            470.0,
            460.0,
            110.0,
            22.0
          ],
          "text": "t b b b b b b",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang",
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
            590.0,
            495.0,
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
          "id": "obj-source-output",
          "maxclass": "message",
          "patching_rect": [
            685.0,
            495.0,
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
          "id": "obj-width-output",
          "maxclass": "message",
          "patching_rect": [
            780.0,
            495.0,
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
          "id": "obj-source-first-output",
          "maxclass": "message",
          "patching_rect": [
            875.0,
            495.0,
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
          "id": "obj-destination-first-output",
          "maxclass": "message",
          "patching_rect": [
            970.0,
            495.0,
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
          "id": "obj-dry-output",
          "maxclass": "message",
          "patching_rect": [
            1065.0,
            495.0,
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
          "id": "obj-bus-number-menu-write-gate",
          "maxclass": "newobj",
          "patching_rect": [
            1120.0,
            540.0,
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
            1120.0,
            450.0,
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
            1168.0,
            450.0,
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
            1260.0,
            450.0,
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
            1350.0,
            450.0,
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
            1390.0,
            450.0,
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
            "obj-plugin",
            0
          ],
          "destination": [
            "obj-dry-left",
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
            "obj-dry-right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-dry-mode",
            0
          ],
          "destination": [
            "obj-dry-invert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-dry-invert",
            0
          ],
          "destination": [
            "obj-dry-left",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-dry-invert",
            0
          ],
          "destination": [
            "obj-dry-right",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-dry-left",
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
            "obj-dry-right",
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
            "obj-source-mode",
            0
          ],
          "destination": [
            "obj-route-values",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count",
            0
          ],
          "destination": [
            "obj-route-values",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first",
            0
          ],
          "destination": [
            "obj-route-values",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first",
            0
          ],
          "destination": [
            "obj-route-values",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first",
            0
          ],
          "destination": [
            "obj-source-last-values",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count",
            0
          ],
          "destination": [
            "obj-source-last-values",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-last-values",
            0
          ],
          "destination": [
            "obj-source-last-calculate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-last-calculate",
            0
          ],
          "destination": [
            "obj-source-last-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-last-set",
            0
          ],
          "destination": [
            "obj-source-last-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-values",
            0
          ],
          "destination": [
            "obj-route-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-order",
            1
          ],
          "destination": [
            "obj-route-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-order",
            0
          ],
          "destination": [
            "obj-route-rebuild",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-unpack",
            0
          ],
          "destination": [
            "obj-route-source",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-unpack",
            1
          ],
          "destination": [
            "obj-route-source",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-unpack",
            2
          ],
          "destination": [
            "obj-route-source",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-unpack",
            3
          ],
          "destination": [
            "obj-route-destination",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-rebuild",
            1
          ],
          "destination": [
            "obj-route-clear",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-clear",
            0
          ],
          "destination": [
            "obj-route-matrix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-rebuild",
            0
          ],
          "destination": [
            "obj-route-iterate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-iterate",
            2
          ],
          "destination": [
            "obj-route-index",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-index",
            1
          ],
          "destination": [
            "obj-route-destination",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-index",
            0
          ],
          "destination": [
            "obj-route-source",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-destination",
            0
          ],
          "destination": [
            "obj-route-cell",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-source",
            0
          ],
          "destination": [
            "obj-route-source-valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-source-valid",
            0
          ],
          "destination": [
            "obj-route-cell",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-cell",
            0
          ],
          "destination": [
            "obj-route-matrix",
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
            "obj-bus-send",
            2
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
            "obj-bus-mode",
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
            "obj-init",
            0
          ],
          "destination": [
            "obj-bus-mode",
            0
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
            5
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
            "obj-init-trigger",
            4
          ],
          "destination": [
            "obj-source-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-output",
            0
          ],
          "destination": [
            "obj-source-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-trigger",
            3
          ],
          "destination": [
            "obj-width-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-width-output",
            0
          ],
          "destination": [
            "obj-channel-count",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-init-trigger",
            2
          ],
          "destination": [
            "obj-source-first-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first-output",
            0
          ],
          "destination": [
            "obj-source-first",
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
            "obj-destination-first-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first-output",
            0
          ],
          "destination": [
            "obj-destination-first",
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
            "obj-dry-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-dry-output",
            0
          ],
          "destination": [
            "obj-dry-mode",
            0
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
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
            "obj-route-matrix",
            33
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-route-matrix",
            0
          ],
          "destination": [
            "obj-bus-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            1
          ],
          "destination": [
            "obj-bus-gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            2
          ],
          "destination": [
            "obj-bus-gain",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            3
          ],
          "destination": [
            "obj-bus-gain",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            4
          ],
          "destination": [
            "obj-bus-gain",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            5
          ],
          "destination": [
            "obj-bus-gain",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            6
          ],
          "destination": [
            "obj-bus-gain",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            7
          ],
          "destination": [
            "obj-bus-gain",
            7
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            8
          ],
          "destination": [
            "obj-bus-gain",
            8
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            9
          ],
          "destination": [
            "obj-bus-gain",
            9
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            10
          ],
          "destination": [
            "obj-bus-gain",
            10
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            11
          ],
          "destination": [
            "obj-bus-gain",
            11
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            12
          ],
          "destination": [
            "obj-bus-gain",
            12
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            13
          ],
          "destination": [
            "obj-bus-gain",
            13
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            14
          ],
          "destination": [
            "obj-bus-gain",
            14
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            15
          ],
          "destination": [
            "obj-bus-gain",
            15
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            16
          ],
          "destination": [
            "obj-bus-gain",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            17
          ],
          "destination": [
            "obj-bus-gain",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            18
          ],
          "destination": [
            "obj-bus-gain",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            19
          ],
          "destination": [
            "obj-bus-gain",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            20
          ],
          "destination": [
            "obj-bus-gain",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            21
          ],
          "destination": [
            "obj-bus-gain",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            22
          ],
          "destination": [
            "obj-bus-gain",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            23
          ],
          "destination": [
            "obj-bus-gain",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            24
          ],
          "destination": [
            "obj-bus-gain",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            25
          ],
          "destination": [
            "obj-bus-gain",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            26
          ],
          "destination": [
            "obj-bus-gain",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            27
          ],
          "destination": [
            "obj-bus-gain",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            28
          ],
          "destination": [
            "obj-bus-gain",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            29
          ],
          "destination": [
            "obj-bus-gain",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            30
          ],
          "destination": [
            "obj-bus-gain",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-route-matrix",
            31
          ],
          "destination": [
            "obj-bus-gain",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-gain",
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
            "obj-source-mode-menu",
            0
          ],
          "destination": [
            "obj-source-mode-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-mode",
            0
          ],
          "destination": [
            "obj-source-mode-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-mode-value-to-menu",
            0
          ],
          "destination": [
            "obj-source-mode-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-mode-menu-set",
            0
          ],
          "destination": [
            "obj-source-mode-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-mode-menu-to-value",
            0
          ],
          "destination": [
            "obj-source-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count-menu",
            0
          ],
          "destination": [
            "obj-channel-count-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count",
            0
          ],
          "destination": [
            "obj-channel-count-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count-value-to-menu",
            0
          ],
          "destination": [
            "obj-channel-count-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count-menu-set",
            0
          ],
          "destination": [
            "obj-channel-count-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-count-menu-to-value",
            0
          ],
          "destination": [
            "obj-channel-count",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first-menu",
            0
          ],
          "destination": [
            "obj-source-first-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first",
            0
          ],
          "destination": [
            "obj-source-first-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first-value-to-menu",
            0
          ],
          "destination": [
            "obj-source-first-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first-menu-set",
            0
          ],
          "destination": [
            "obj-source-first-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-source-first-menu-to-value",
            0
          ],
          "destination": [
            "obj-source-first",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first-menu",
            0
          ],
          "destination": [
            "obj-destination-first-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first",
            0
          ],
          "destination": [
            "obj-destination-first-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first-value-to-menu",
            0
          ],
          "destination": [
            "obj-destination-first-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first-menu-set",
            0
          ],
          "destination": [
            "obj-destination-first-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-destination-first-menu-to-value",
            0
          ],
          "destination": [
            "obj-destination-first",
            0
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
      "obj-source-mode": [
        "Source Input",
        "Input",
        0
      ],
      "obj-channel-count": [
        "Send Channels",
        "Channels",
        0
      ],
      "obj-source-first": [
        "First Source Channel",
        "From",
        0
      ],
      "obj-destination-first": [
        "First Bus Slot",
        "Slot",
        0
      ],
      "obj-bus-gain": [
        "Multichannel Bus Gain",
        "Bus Gain",
        0
      ],
      "obj-dry-mode": [
        "Dry Output",
        "Dry",
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
