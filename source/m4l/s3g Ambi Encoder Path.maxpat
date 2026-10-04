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
      286.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 286.0,
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
    "description": "Encodes to the next device on this track automatically. Use s3g Bus Receive 36 before multichannel-input encoders and s3g Bus Send 36 after the chain to reach another track. The 36-channel bus carries up to 5OA.",
    "digest": "Encodes to the next device on this track automatically. Use s3g Bus Receive 36 before multichannel-input encoders and s3g Bus Send 36 after the chain to reach another track. The 36-channel bus carries up to 5OA.",
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
            286.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            286.0,
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
          "id": "obj-clap",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            300.0,
            310.0,
            22.0
          ],
          "text": "s3g.clap~ 32 36",
          "numinlets": 32,
          "numoutlets": 37,
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
          "text": "openifempty \"s3g Ambi Encoder Path 64\" org.s3g.s3g-dsp.ambi-path-encoder-64",
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
          "text": "route 1 3 4 5 6 7 8 9 10 17 18 11 12 13 14 15 19 20 16",
          "numinlets": 1,
          "numoutlets": 20,
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
              "parameter_annotation_name": "Input Count",
              "parameter_longname": "Input Count",
              "parameter_shortname": "Inputs",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                32
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 32,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 32
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
              "parameter_annotation_name": "Active Paths",
              "parameter_longname": "Active Paths",
              "parameter_shortname": "Paths",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 16,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 16
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
              "parameter_annotation_name": "Selected Path",
              "parameter_longname": "Selected Path",
              "parameter_shortname": "Path",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 16,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 16
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
              "parameter_annotation_name": "Selected Source",
              "parameter_longname": "Selected Source",
              "parameter_shortname": "Source",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1,
              "parameter_mmax": 32,
              "parameter_modmode": 0,
              "parameter_order": 4,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 32
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
              "parameter_annotation_name": "Assign",
              "parameter_longname": "Assign",
              "parameter_shortname": "Assign",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 5,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "One",
                "Round Robin",
                "Source"
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
            245.0,
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
              "parameter_annotation_name": "Playback",
              "parameter_longname": "Playback",
              "parameter_shortname": "Play",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 6,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Off",
                "Run",
                "Scrub"
              ]
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
              "parameter_annotation_name": "Loop Mode",
              "parameter_longname": "Loop Mode",
              "parameter_shortname": "Loop",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 7,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "One",
                "Loop",
                "Palindrome"
              ]
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
              "parameter_annotation_name": "Interpolation",
              "parameter_longname": "Interpolation",
              "parameter_shortname": "Interp",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 8,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Linear",
                "Catmull",
                "Hold"
              ]
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
          "id": "obj-param-10",
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
              "parameter_annotation_name": "Rate",
              "parameter_longname": "Rate",
              "parameter_shortname": "Rate",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.08
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.001,
              "parameter_mmax": 4,
              "parameter_modmode": 0,
              "parameter_order": 9,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_10"
        }
      },
      {
        "box": {
          "id": "obj-param-message-10",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            365.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 10 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-10",
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
          "id": "obj-param-17",
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
              "parameter_annotation_name": "Sync",
              "parameter_longname": "Sync",
              "parameter_shortname": "Sync",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 10,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Free",
                "Sync"
              ]
            }
          },
          "varname": "clap_param_17"
        }
      },
      {
        "box": {
          "id": "obj-param-message-17",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            395.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 17 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-17",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            790.0,
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
              "parameter_annotation_name": "Division",
              "parameter_longname": "Division",
              "parameter_shortname": "Division",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                4
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.25,
              "parameter_mmax": 64,
              "parameter_modmode": 0,
              "parameter_order": 11,
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
            425.0,
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
            815.0,
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
              "parameter_annotation_name": "Phase",
              "parameter_longname": "Phase",
              "parameter_shortname": "Phase",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 12,
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
            455.0,
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
            840.0,
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
          "id": "obj-param-12",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            485.0,
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
              "parameter_annotation_name": "Phase Spread",
              "parameter_longname": "Phase Spread",
              "parameter_shortname": "Spread",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 13,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
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
            485.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 12 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-12",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            865.0,
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
          "id": "obj-param-13",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            515.0,
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
              "parameter_annotation_name": "Smooth",
              "parameter_longname": "Smooth",
              "parameter_shortname": "Smooth",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.12
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 0.995,
              "parameter_modmode": 0,
              "parameter_order": 14,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_13"
        }
      },
      {
        "box": {
          "id": "obj-param-message-13",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            515.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 13 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-13",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            890.0,
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
          "id": "obj-param-14",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            545.0,
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
              "parameter_annotation_name": "Ease",
              "parameter_longname": "Ease",
              "parameter_shortname": "Ease",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 15,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
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
            545.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 14 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-14",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            915.0,
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
          "id": "obj-param-15",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            575.0,
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
              "parameter_annotation_name": "Distance Scale",
              "parameter_longname": "Distance Scale",
              "parameter_shortname": "Distance",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.05,
              "parameter_mmax": 8,
              "parameter_modmode": 0,
              "parameter_order": 16,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            575.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 15 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-15",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            940.0,
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
          "id": "obj-param-19",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            605.0,
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
              "parameter_annotation_name": "Doppler",
              "parameter_longname": "Doppler",
              "parameter_shortname": "Doppler",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 17,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_19"
        }
      },
      {
        "box": {
          "id": "obj-param-message-19",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            605.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 19 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-19",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            965.0,
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
          "id": "obj-param-20",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            635.0,
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
              "parameter_annotation_name": "Air",
              "parameter_longname": "Air",
              "parameter_shortname": "Air",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 18,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_20"
        }
      },
      {
        "box": {
          "id": "obj-param-message-20",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            635.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 20 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-20",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            990.0,
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
          "id": "obj-param-16",
          "maxclass": "live.numbox",
          "patching_rect": [
            805.0,
            665.0,
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
                -12
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 19,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            665.0,
            105.0,
            22.0
          ],
          "text": "automateparamid 16 $1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-reflect-16",
          "maxclass": "message",
          "patching_rect": [
            1190.0,
            1015.0,
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
            36
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
            "obj-param-10",
            0
          ],
          "destination": [
            "obj-param-message-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-10",
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
            "obj-param-10",
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
            "obj-param-reflect-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-10",
            0
          ],
          "destination": [
            "obj-param-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-17",
            0
          ],
          "destination": [
            "obj-param-message-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-17",
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
            "obj-param-17",
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
            "obj-param-reflect-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-17",
            0
          ],
          "destination": [
            "obj-param-17",
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
            10
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
            11
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            12
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
            "obj-param-13",
            0
          ],
          "destination": [
            "obj-param-message-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-13",
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
            "obj-param-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paramchanged-route",
            13
          ],
          "destination": [
            "obj-param-reflect-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-13",
            0
          ],
          "destination": [
            "obj-param-13",
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            14
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            15
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
            "obj-param-19",
            0
          ],
          "destination": [
            "obj-param-message-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-19",
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
            "obj-param-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paramchanged-route",
            16
          ],
          "destination": [
            "obj-param-reflect-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-19",
            0
          ],
          "destination": [
            "obj-param-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-20",
            0
          ],
          "destination": [
            "obj-param-message-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-message-20",
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
            "obj-param-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-paramchanged-route",
            17
          ],
          "destination": [
            "obj-param-reflect-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-param-reflect-20",
            0
          ],
          "destination": [
            "obj-param-20",
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
            "obj-param-resync-delay",
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
            "obj-paramchanged-route",
            18
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
            "obj-plugin",
            18
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
            "obj-plugin",
            19
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
            "obj-plugin",
            20
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
            "obj-plugin",
            21
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
            "obj-plugin",
            22
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
            "obj-plugin",
            23
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
            "obj-plugin",
            24
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
            "obj-plugin",
            25
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
            "obj-plugin",
            26
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
            "obj-plugin",
            27
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
            "obj-plugin",
            28
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
            "obj-plugin",
            29
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
            "obj-plugin",
            30
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
            "obj-plugin",
            31
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
            "obj-plugin",
            32
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
            "obj-plugin",
            33
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
            "obj-clap",
            32
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
            "obj-clap",
            33
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
            "obj-clap",
            34
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
            "obj-clap",
            35
          ],
          "destination": [
            "obj-plugout",
            37
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
      "obj-param-1": [
        "Input Count",
        "Inputs",
        1
      ],
      "obj-param-3": [
        "Active Paths",
        "Paths",
        2
      ],
      "obj-param-4": [
        "Selected Path",
        "Path",
        3
      ],
      "obj-param-5": [
        "Selected Source",
        "Source",
        4
      ],
      "obj-param-6": [
        "Assign",
        "Assign",
        5
      ],
      "obj-param-7": [
        "Playback",
        "Play",
        6
      ],
      "obj-param-8": [
        "Loop Mode",
        "Loop",
        7
      ],
      "obj-param-9": [
        "Interpolation",
        "Interp",
        8
      ],
      "obj-param-10": [
        "Rate",
        "Rate",
        9
      ],
      "obj-param-17": [
        "Sync",
        "Sync",
        10
      ],
      "obj-param-18": [
        "Division",
        "Division",
        11
      ],
      "obj-param-11": [
        "Phase",
        "Phase",
        12
      ],
      "obj-param-12": [
        "Phase Spread",
        "Spread",
        13
      ],
      "obj-param-13": [
        "Smooth",
        "Smooth",
        14
      ],
      "obj-param-14": [
        "Ease",
        "Ease",
        15
      ],
      "obj-param-15": [
        "Distance Scale",
        "Distance",
        16
      ],
      "obj-param-19": [
        "Doppler",
        "Doppler",
        17
      ],
      "obj-param-20": [
        "Air",
        "Air",
        18
      ],
      "obj-param-16": [
        "Output",
        "Output",
        19
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
    "name": "s3g Ambi Encoder Path"
  }
}
