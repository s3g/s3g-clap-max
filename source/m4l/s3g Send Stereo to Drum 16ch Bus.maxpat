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
      360.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 360.0,
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
    "description": "Routes a stereo Live track into one selectable pair of a private 16-channel s3g bus without imposing an Ambisonics format or changing the track's normal output routing.",
    "digest": "Routes a stereo Live track into one selectable pair of a private 16-channel s3g bus without imposing an Ambisonics format or changing the track's normal output routing.",
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
            360.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            360.0,
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
          "id": "obj-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
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
            70.0,
            10.0,
            56.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            70.0,
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
          "id": "obj-pair-label",
          "maxclass": "comment",
          "patching_rect": [
            138.0,
            10.0,
            28.0,
            20.0
          ],
          "text": "PAIR",
          "presentation": 1,
          "presentation_rect": [
            138.0,
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
          "id": "obj-pair-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            470.0,
            95.0,
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
              "parameter_longname": "Destination Pair",
              "parameter_shortname": "Pair",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 8,
              "parameter_steps": 8,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "pair_number"
        }
      },
      {
        "box": {
          "id": "obj-pair-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            170.0,
            10.0,
            80.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            170.0,
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
            "15/16"
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
          "annotation": "Choose destination pair from the menu.",
          "annotation_name": "Destination Pair"
        }
      },
      {
        "box": {
          "id": "obj-pair-number-menu-to-value",
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
          "id": "obj-pair-number-value-to-menu",
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
          "id": "obj-pair-number-menu-set",
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
          "id": "obj-gain-1-label",
          "maxclass": "comment",
          "patching_rect": [
            12.0,
            44.0,
            60.0,
            20.0
          ],
          "text": "LEVEL 1",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            44.0,
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
          ]
        }
      },
      {
        "box": {
          "id": "obj-gain-2-label",
          "maxclass": "comment",
          "patching_rect": [
            196.0,
            44.0,
            60.0,
            20.0
          ],
          "text": "LEVEL 2",
          "presentation": 1,
          "presentation_rect": [
            196.0,
            44.0,
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
          ]
        }
      },
      {
        "box": {
          "id": "obj-send-gain",
          "maxclass": "live.gain~",
          "patching_rect": [
            125.0,
            220.0,
            105.0,
            48.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            80.0,
            100.0,
            48.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "channels": 1,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 1,
          "numoutlets": 4,
          "orientation": 1,
          "outlettype": [
            "signal",
            "",
            "float",
            "list"
          ],
          "parameter_enable": 1,
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
              "parameter_longname": "Multichannel Send Gain",
              "parameter_shortname": "Send Gain",
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
          "shownumber": 0,
          "varname": "multichannel_send_gain"
        }
      },
      {
        "box": {
          "id": "obj-send-gain-2",
          "maxclass": "live.gain~",
          "patching_rect": [
            245.0,
            220.0,
            105.0,
            48.0
          ],
          "presentation": 1,
          "presentation_rect": [
            196.0,
            80.0,
            100.0,
            48.0
          ],
          "fontname": "Arial",
          "fontsize": 11.0,
          "channels": 1,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 1,
          "numoutlets": 4,
          "orientation": 1,
          "outlettype": [
            "signal",
            "",
            "float",
            "list"
          ],
          "parameter_enable": 1,
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
              "parameter_longname": "Send Input 2 Gain",
              "parameter_shortname": "Gain 2",
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
          "shownumber": 0,
          "varname": "send_input_2_gain"
        }
      },
      {
        "box": {
          "id": "obj-gain-link",
          "maxclass": "live.text",
          "patching_rect": [
            750.0,
            220.0,
            80.0,
            22.0
          ],
          "text": "UNLINKED",
          "presentation": 1,
          "presentation_rect": [
            116.0,
            44.0,
            68.0,
            20.0
          ],
          "texton": "LINKED",
          "automation": "Unlinked",
          "automationon": "Linked",
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
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "textcolor": [
            0.74,
            0.74,
            0.74,
            1.0
          ],
          "textoffcolor": [
            0.74,
            0.74,
            0.74,
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
              "parameter_longname": "Send Gain Link",
              "parameter_shortname": "Link",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_enum": [
                "Unlinked",
                "Linked"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "send_gain_link"
        }
      },
      {
        "box": {
          "id": "obj-input-pan-1",
          "maxclass": "live.dial",
          "patching_rect": [
            590.0,
            385.0,
            42.0,
            36.0
          ],
          "presentation": 1,
          "presentation_rect": [
            124.0,
            80.0,
            40.0,
            48.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "annotation": "Pan Send input channel 1 across the selected destination pair.",
          "annotation_name": "Send input 1 pan",
          "activedialcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "activefgdialcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "activeneedlecolor": [
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
            0.74,
            0.74,
            0.74,
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
          "fontsize": 11.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_annotation_name": "Send Input 1 Pan",
              "parameter_longname": "Send Input 1 Pan",
              "parameter_shortname": "Pan 1",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                -50.0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -50.0,
              "parameter_mmax": 50.0,
              "parameter_modmode": 0,
              "parameter_speedlim": 3.0,
              "parameter_type": 0,
              "parameter_unitstyle": 0
            }
          },
          "varname": "input_1_pan"
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
            12.0,
            136.0,
            56.0,
            20.0
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
          "annotation": "Mute Send input channel 1 before it is panned into the selected multichannel bus pair.",
          "annotation_name": "Send input 1 mute",
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
              "parameter_longname": "Send Input 1 Mute",
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
          "id": "obj-input-pan-2",
          "maxclass": "live.dial",
          "patching_rect": [
            590.0,
            430.0,
            42.0,
            36.0
          ],
          "presentation": 1,
          "presentation_rect": [
            308.0,
            80.0,
            40.0,
            48.0
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "float"
          ],
          "parameter_enable": 1,
          "annotation": "Pan Send input channel 2 across the selected destination pair.",
          "annotation_name": "Send input 2 pan",
          "activedialcolor": [
            0.65,
            0.65,
            0.65,
            1.0
          ],
          "activefgdialcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ],
          "activeneedlecolor": [
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
            0.74,
            0.74,
            0.74,
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
          "fontsize": 11.0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_annotation_name": "Send Input 2 Pan",
              "parameter_longname": "Send Input 2 Pan",
              "parameter_shortname": "Pan 2",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                50.0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -50.0,
              "parameter_mmax": 50.0,
              "parameter_modmode": 0,
              "parameter_speedlim": 3.0,
              "parameter_type": 0,
              "parameter_unitstyle": 0
            }
          },
          "varname": "input_2_pan"
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
            196.0,
            136.0,
            56.0,
            20.0
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
          "annotation": "Mute Send input channel 2 before it is panned into the selected multichannel bus pair.",
          "annotation_name": "Send input 2 mute",
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
              "parameter_longname": "Send Input 2 Mute",
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
            258.0,
            10.0,
            76.0,
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
            300.0,
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
            300.0,
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
          "id": "obj-input-mute-1-invert",
          "maxclass": "newobj",
          "patching_rect": [
            640.0,
            300.0,
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
            640.0,
            340.0,
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
            390.0,
            300.0,
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
            445.0,
            300.0,
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
          "id": "obj-input-panner",
          "maxclass": "newobj",
          "patching_rect": [
            510.0,
            300.0,
            82.0,
            22.0
          ],
          "text": "M4L.pan2~",
          "numinlets": 4,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "obj-gate-left",
          "maxclass": "newobj",
          "patching_rect": [
            165.0,
            300.0,
            170.0,
            22.0
          ],
          "text": "gate~ 8 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
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
          "id": "obj-gate-right",
          "maxclass": "newobj",
          "patching_rect": [
            165.0,
            340.0,
            170.0,
            22.0
          ],
          "text": "gate~ 8 1 @ramptime 5.",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
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
          "text": "s3g.bus.send s3g-drum16-1",
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
          "text": "sprintf s3g-drum16-%ld",
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
            68.0,
            22.0
          ],
          "text": "t b b b b",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-channel-init-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            460.0,
            68.0,
            22.0
          ],
          "text": "t b b b b",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
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
            550.0,
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
          "id": "obj-pair-output",
          "maxclass": "message",
          "patching_rect": [
            640.0,
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
            730.0,
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
          "id": "obj-pan-1-output",
          "maxclass": "message",
          "patching_rect": [
            820.0,
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
          "id": "obj-mute-1-output",
          "maxclass": "message",
          "patching_rect": [
            820.0,
            525.0,
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
          "id": "obj-pan-2-output",
          "maxclass": "message",
          "patching_rect": [
            910.0,
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
          "id": "obj-mute-2-output",
          "maxclass": "message",
          "patching_rect": [
            910.0,
            525.0,
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
          "id": "obj-gain-link-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            750.0,
            265.0,
            40.0,
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
          "id": "obj-gain-link-on",
          "maxclass": "newobj",
          "patching_rect": [
            750.0,
            305.0,
            42.0,
            22.0
          ],
          "text": "sel 1",
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
          "id": "obj-gain-link-1-to-2",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            305.0,
            62.0,
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
          "id": "obj-gain-link-2-to-1",
          "maxclass": "newobj",
          "patching_rect": [
            900.0,
            305.0,
            62.0,
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
          "id": "obj-gain-1-set",
          "maxclass": "newobj",
          "patching_rect": [
            900.0,
            345.0,
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
          "id": "obj-gain-2-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            345.0,
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
          "id": "obj-gain-1-output",
          "maxclass": "message",
          "patching_rect": [
            750.0,
            345.0,
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
          "id": "obj-gain-link-init-delay",
          "maxclass": "newobj",
          "patching_rect": [
            1000.0,
            465.0,
            62.0,
            22.0
          ],
          "text": "delay 50",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-gain-link-output",
          "maxclass": "message",
          "patching_rect": [
            1000.0,
            495.0,
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
            "obj-plugin",
            0
          ],
          "destination": [
            "obj-send-gain",
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
            "obj-send-gain-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-send-gain",
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
            "obj-send-gain-2",
            0
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
            "obj-send-gain",
            1
          ],
          "destination": [
            "obj-gain-link-1-to-2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-send-gain-2",
            1
          ],
          "destination": [
            "obj-gain-link-2-to-1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-1-to-2",
            0
          ],
          "destination": [
            "obj-gain-2-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-2-to-1",
            0
          ],
          "destination": [
            "obj-gain-1-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-1-set",
            0
          ],
          "destination": [
            "obj-send-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-2-set",
            0
          ],
          "destination": [
            "obj-send-gain-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link",
            0
          ],
          "destination": [
            "obj-gain-link-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-trigger",
            1
          ],
          "destination": [
            "obj-gain-link-1-to-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-trigger",
            1
          ],
          "destination": [
            "obj-gain-link-2-to-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-trigger",
            0
          ],
          "destination": [
            "obj-gain-link-on",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-on",
            0
          ],
          "destination": [
            "obj-gain-1-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-1-output",
            0
          ],
          "destination": [
            "obj-send-gain",
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
            "obj-gain-link-init-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-init-delay",
            0
          ],
          "destination": [
            "obj-gain-link-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gain-link-output",
            0
          ],
          "destination": [
            "obj-gain-link",
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
            "obj-input-panner",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-pan-1",
            0
          ],
          "destination": [
            "obj-input-panner",
            1
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
            "obj-input-panner",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-pan-2",
            0
          ],
          "destination": [
            "obj-input-panner",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-panner",
            0
          ],
          "destination": [
            "obj-gate-left",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-input-panner",
            1
          ],
          "destination": [
            "obj-gate-right",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number",
            0
          ],
          "destination": [
            "obj-gate-left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number",
            0
          ],
          "destination": [
            "obj-gate-right",
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
            "obj-init-defer",
            0
          ],
          "destination": [
            "obj-channel-init-trigger",
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
            2
          ],
          "destination": [
            "obj-pair-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-output",
            0
          ],
          "destination": [
            "obj-pair-number",
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
            "obj-channel-init-trigger",
            3
          ],
          "destination": [
            "obj-pan-1-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pan-1-output",
            0
          ],
          "destination": [
            "obj-input-pan-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-init-trigger",
            2
          ],
          "destination": [
            "obj-mute-1-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mute-1-output",
            0
          ],
          "destination": [
            "obj-input-mute-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-init-trigger",
            1
          ],
          "destination": [
            "obj-pan-2-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pan-2-output",
            0
          ],
          "destination": [
            "obj-input-pan-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-channel-init-trigger",
            0
          ],
          "destination": [
            "obj-mute-2-output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-mute-2-output",
            0
          ],
          "destination": [
            "obj-input-mute-2",
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
            "obj-bus-mode",
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
            "obj-pair-number-menu",
            0
          ],
          "destination": [
            "obj-pair-number-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number",
            0
          ],
          "destination": [
            "obj-pair-number-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number-value-to-menu",
            0
          ],
          "destination": [
            "obj-pair-number-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number-menu-set",
            0
          ],
          "destination": [
            "obj-pair-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-pair-number-menu-to-value",
            0
          ],
          "destination": [
            "obj-pair-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-gate-left",
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
            "obj-gate-right",
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
            "obj-gate-left",
            1
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
            "obj-gate-right",
            1
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
            "obj-gate-left",
            2
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
            "obj-gate-right",
            2
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
            "obj-gate-left",
            3
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
            "obj-gate-right",
            3
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
            "obj-gate-left",
            4
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
            "obj-gate-right",
            4
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
            "obj-gate-left",
            5
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
            "obj-gate-right",
            5
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
            "obj-gate-left",
            6
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
            "obj-gate-right",
            6
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
            "obj-gate-left",
            7
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
            "obj-gate-right",
            7
          ],
          "destination": [
            "obj-plugout",
            17
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
      "obj-pair-number": [
        "Destination Pair",
        "Pair",
        0
      ],
      "obj-send-gain": [
        "Multichannel Send Gain",
        "Send Gain",
        0
      ],
      "obj-send-gain-2": [
        "Send Input 2 Gain",
        "Gain 2",
        0
      ],
      "obj-gain-link": [
        "Send Gain Link",
        "Link",
        0
      ],
      "obj-input-pan-1": [
        "Send Input 1 Pan",
        "Pan 1",
        0
      ],
      "obj-input-mute-1": [
        "Send Input 1 Mute",
        "In 1 Mute",
        0
      ],
      "obj-input-pan-2": [
        "Send Input 2 Pan",
        "Pan 2",
        0
      ],
      "obj-input-mute-2": [
        "Send Input 2 Mute",
        "In 2 Mute",
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
        "name": "M4L.pan2~.maxpat",
        "type": "JSON"
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
