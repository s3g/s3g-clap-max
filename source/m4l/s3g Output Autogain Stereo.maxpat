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
      196.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 196.0,
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
    "description": "Receives 32 generic bus channels, folds them through fixed Output Autogain Stereo 2, and returns two channels to the normal Live track output. CLAP source channels 33–128 have no Live bus feed.",
    "digest": "Receives 32 generic bus channels, folds them through fixed Output Autogain Stereo 2, and returns two channels to the normal Live track output. CLAP source channels 33–128 have no Live bus feed.",
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
            196.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            196.0,
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
          "text": "s3g.clap~ 32 2",
          "numinlets": 32,
          "numoutlets": 3,
          "outlettype": [
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
            105.0,
            22.0
          ],
          "text": "plugout~ 1 2",
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
          "text": "openifempty \"s3g Output Autogain Stereo 2\" org.s3g.s3g-dsp.mc-to-stereo-autogain",
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
            780.0,
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
            780.0,
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
            828.0,
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
            920.0,
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
            1010.0,
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
            1050.0,
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
            "obj-bus-receive",
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
            "obj-plugout",
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
            "obj-plugout",
            1
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
            2
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
