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
    "description": "Takes 36 Ambisonic channels from the preceding s3g Bus Receive 36, records the post-gain bed, and decodes to Live stereo or hardware. No embedded named bus; maximum bus order is 5OA.",
    "digest": "Takes 36 Ambisonic channels from the preceding s3g Bus Receive 36, records the post-gain bed, and decodes to Live stereo or hardware. No embedded named bus; maximum bus order is 5OA.",
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
          "id": "obj-plugin",
          "maxclass": "newobj",
          "patching_rect": [
            40.0,
            180.0,
            320.0,
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
          "channels": 36,
          "display_range": [
            -70.0,
            6.0
          ],
          "ignoreclick": 0,
          "lastchannelcount": 0,
          "numinlets": 36,
          "numoutlets": 39,
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
              "parameter_shortname": "Ambi Gain",
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
          "text": "s3g.clap~ 36 2",
          "numinlets": 36,
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
          "text": "openifempty \"s3g Ambi Decoder Head 2\" org.s3g.s3g-dsp.ambisonic-head-decoder",
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
          "text": "route 7 11 18",
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
          "id": "obj-param-7",
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
              "parameter_annotation_name": "Yaw",
              "parameter_longname": "Yaw",
              "parameter_shortname": "Yaw",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -180,
              "parameter_mmax": 180,
              "parameter_modmode": 0,
              "parameter_order": 1,
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
            125.0,
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
          "id": "obj-param-11",
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
              "parameter_annotation_name": "Room",
              "parameter_longname": "Room",
              "parameter_shortname": "Room",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 100,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_11"
        }
      },
      {
        "box": {
          "id": "obj-param-message-11",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            155.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 11 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-11",
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
          "id": "obj-param-18",
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
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -24,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_18"
        }
      },
      {
        "box": {
          "id": "obj-param-message-18",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            185.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 18 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-18",
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
          "annotation": "Create the 36-channel float32 WAV for a new take. The selected file is created/replaced; choose a new name each time.",
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
          "annotation": "Record the post-gain 36-channel ACN/SN3D bed before decoding. Select FILE first.",
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
          "text": "sfrecord~ 36",
          "numinlets": 36,
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
          "text": "name s3g-ambi.wav",
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
          "text": "print s3g-ambi-recorder",
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
      }
    ],
    "lines": [
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
            "obj-param-11",
            0
          ],
          "destination": [
            "obj-param-message-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-11",
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
            "obj-param-11",
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
            "obj-param-reflect-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-11",
            0
          ],
          "destination": [
            "obj-param-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-18",
            0
          ],
          "destination": [
            "obj-param-message-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-18",
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
            "obj-param-18",
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
            "obj-param-reflect-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-18",
            0
          ],
          "destination": [
            "obj-param-18",
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
            "obj-ambi-input-gain",
            15
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            16
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            16
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            17
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            17
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            18
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            18
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            19
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            19
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            20
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            20
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            21
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            21
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            22
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            22
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            23
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            23
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            24
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            24
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            25
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            25
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            26
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            26
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            27
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            27
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            28
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            28
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            29
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            29
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            30
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            30
          ],
          "destination": [
            "obj-rec-writer",
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
            "obj-ambi-input-gain",
            31
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
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
            "obj-ambi-input-gain",
            31
          ],
          "destination": [
            "obj-rec-writer",
            31
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
            "obj-ambi-input-gain",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            32
          ],
          "destination": [
            "obj-clap",
            32
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            32
          ],
          "destination": [
            "obj-rec-writer",
            32
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
            "obj-ambi-input-gain",
            33
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            33
          ],
          "destination": [
            "obj-clap",
            33
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            33
          ],
          "destination": [
            "obj-rec-writer",
            33
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
            "obj-ambi-input-gain",
            34
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            34
          ],
          "destination": [
            "obj-clap",
            34
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            34
          ],
          "destination": [
            "obj-rec-writer",
            34
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
            "obj-ambi-input-gain",
            35
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            35
          ],
          "destination": [
            "obj-clap",
            35
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-ambi-input-gain",
            35
          ],
          "destination": [
            "obj-rec-writer",
            35
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
        "Ambi Gain",
        0
      ],
      "obj-param-7": [
        "Yaw",
        "Yaw",
        1
      ],
      "obj-param-11": [
        "Room",
        "Room",
        2
      ],
      "obj-param-18": [
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
    "name": "s3g Ambi Decoder Head Main"
  }
}
