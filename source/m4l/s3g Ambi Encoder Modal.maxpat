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
      324.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 324.0,
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
    "description": "Encodes to the next device on this track automatically. Use s3g Bus Receive 36 before multichannel-input encoders and s3g Bus Send 36 after the chain to reach another track. This CLAP has at most 16 Ambisonic outputs.",
    "digest": "Encodes to the next device on this track automatically. Use s3g Bus Receive 36 before multichannel-input encoders and s3g Bus Send 36 after the chain to reach another track. This CLAP has at most 16 Ambisonic outputs.",
    "tags": "s3g CLAP Ambisonics explicit 36-channel bus",
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
            324.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            324.0,
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
            12.0,
            80.0,
            224.0,
            72.0
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
              "parameter_longname": "s3g Ambi Encoder Modal 16 Input Gain",
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
            248.0,
            88.0,
            64.0,
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
          "annotation": "Mute s3g Ambi Encoder Modal 16 input channel 1 before it is panned into the selected multichannel bus pair.",
          "annotation_name": "s3g Ambi Encoder Modal 16 input 1 mute",
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
              "parameter_longname": "s3g Ambi Encoder Modal 16 Input 1 Mute",
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
          "id": "obj-clap",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            300.0,
            310.0,
            22.0
          ],
          "text": "s3g.clap~ 1 16",
          "numinlets": 1,
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
          "text": "openifempty \"s3g Ambi Encoder Modal 16\" org.s3g.s3g-dsp.accelerometer-field-encoder-16",
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
          "text": "route 2 63 30",
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
              "parameter_annotation_name": "Modal profile",
              "parameter_longname": "Modal profile",
              "parameter_shortname": "Body",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                10
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 24,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 25
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
          "id": "obj-param-63",
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
              "parameter_annotation_name": "Modal lift",
              "parameter_longname": "Modal lift",
              "parameter_shortname": "Lift",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.65
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_63"
        }
      },
      {
        "box": {
          "id": "obj-param-message-63",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            155.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 63 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-63",
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
          "id": "obj-param-30",
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
              "parameter_annotation_name": "Output gain",
              "parameter_longname": "Output gain",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                -11
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_30"
        }
      },
      {
        "box": {
          "id": "obj-param-message-30",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            185.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 30 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-30",
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
          "id": "obj-param-topology-2",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            460.0,
            105.0,
            22.0
          ],
          "text": "paramid 29 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-midi-in",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            205.0,
            50.0,
            22.0
          ],
          "text": "midiin",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "obj-midi-parse",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            240.0,
            75.0,
            22.0
          ],
          "text": "midiparse",
          "numinlets": 1,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "int",
            "int",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-bus-insert",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            230.0,
            100.0,
            22.0
          ],
          "text": "s3g.bus.insert",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-next-trigger",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            260.0,
            48.0,
            22.0
          ],
          "text": "t l b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "list",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "obj-next-mode",
          "maxclass": "message",
          "patching_rect": [
            530.0,
            260.0,
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
          "id": "obj-next-send",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            300.0,
            220.0,
            22.0
          ],
          "text": "s3g.bus.send s3g-chain-next",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": []
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
            "obj-param-63",
            0
          ],
          "destination": [
            "obj-param-message-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-63",
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
            "obj-param-63",
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
            "obj-param-reflect-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-63",
            0
          ],
          "destination": [
            "obj-param-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-30",
            0
          ],
          "destination": [
            "obj-param-message-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-30",
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
            "obj-param-30",
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
            "obj-param-reflect-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-30",
            0
          ],
          "destination": [
            "obj-param-30",
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
      },
      {
        "patchline": {
          "source": [
            "obj-midi-in",
            0
          ],
          "destination": [
            "obj-midi-parse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-midi-parse",
            7
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
            "obj-device",
            0
          ],
          "destination": [
            "obj-bus-insert",
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
            "obj-next-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-next-trigger",
            1
          ],
          "destination": [
            "obj-next-mode",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-next-mode",
            0
          ],
          "destination": [
            "obj-next-send",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-next-trigger",
            0
          ],
          "destination": [
            "obj-next-send",
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
      "obj-input-meter": [
        "s3g Ambi Encoder Modal 16 Input Gain",
        "Input Gain",
        0
      ],
      "obj-input-mute-1": [
        "Input 1 Mute",
        "In 1 Mute",
        0
      ],
      "obj-param-2": [
        "Modal profile",
        "Body",
        1
      ],
      "obj-param-63": [
        "Modal lift",
        "Lift",
        2
      ],
      "obj-param-30": [
        "Output gain",
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
    },
    "name": "s3g Ambi Encoder Modal"
  }
}
