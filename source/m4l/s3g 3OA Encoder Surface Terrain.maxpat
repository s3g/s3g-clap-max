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
    "description": "Fixed s3g Ambi Encoder Surface Terrain 64 wrapper: directly receives one selected private 32-channel bus, maps its slots to 32 CLAP inputs, blocks Live stereo, fixes third-order ACN/SN3D output, exposes stable parameters, and publishes to master.",
    "digest": "Fixed s3g Ambi Encoder Surface Terrain 64 wrapper: directly receives one selected private 32-channel bus, maps its slots to 32 CLAP inputs, blocks Live stereo, fixes third-order ACN/SN3D output, exposes stable parameters, and publishes to master.",
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
          "id": "obj-chain",
          "maxclass": "live.text",
          "patching_rect": [
            470.0,
            95.0,
            62.0,
            22.0
          ],
          "text": "MAIN",
          "presentation": 1,
          "presentation_rect": [
            198.0,
            10.0,
            76.0,
            20.0
          ],
          "texton": "NEXT ON",
          "automation": "Off",
          "automationon": "On",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "annotation": "Route the 3OA stream to the next s3g device on this track instead of the named main bus.",
          "annotation_name": "Route to next s3g device",
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
              "parameter_longname": "Route to Chain",
              "parameter_shortname": "Chain",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_enum": [
                "Off",
                "On"
              ],
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_type": 2
            }
          },
          "varname": "route_to_chain"
        }
      },
      {
        "box": {
          "id": "obj-input-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            84.0,
            10.0,
            52.0,
            20.0
          ],
          "text": "RCV BUS",
          "presentation": 1,
          "presentation_rect": [
            84.0,
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
            142.0,
            10.0,
            48.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            142.0,
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
          "id": "obj-input-bus-number-value-to-menu",
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
          "id": "obj-input-bus-number-menu-set",
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
          "id": "obj-clap",
          "maxclass": "newobj",
          "patching_rect": [
            125.0,
            300.0,
            310.0,
            22.0
          ],
          "text": "s3g.clap~ 32 16",
          "numinlets": 32,
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
            215.0,
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
          "id": "obj-bus-send",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            260.0,
            125.0,
            22.0
          ],
          "text": "s3g.bus.send master",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": []
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
          "text": "openifempty \"s3g Ambi Encoder Surface Terrain 64\" org.s3g.s3g-dsp.ambi-terrain-navigator-64",
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
          "text": "route 20 30 2 3 4 5 17",
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
          "id": "obj-param-20",
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
                16
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
          "varname": "clap_param_20"
        }
      },
      {
        "box": {
          "id": "obj-param-message-20",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            125.0,
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
          "id": "obj-param-30",
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
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 1,
              "parameter_steps": 32
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
            155.0,
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
          "id": "obj-param-2",
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
              "parameter_annotation_name": "Azimuth",
              "parameter_longname": "Azimuth",
              "parameter_shortname": "Azimuth",
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
          "varname": "clap_param_2"
        }
      },
      {
        "box": {
          "id": "obj-param-message-2",
          "maxclass": "message",
          "patching_rect": [
            1120.0,
            185.0,
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
          "id": "obj-param-3",
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
              "parameter_annotation_name": "Elevation",
              "parameter_longname": "Elevation",
              "parameter_shortname": "Elevation",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -90,
              "parameter_mmax": 90,
              "parameter_modmode": 0,
              "parameter_order": 4,
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
            215.0,
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
          "id": "obj-param-4",
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
              "parameter_annotation_name": "Distance",
              "parameter_longname": "Distance",
              "parameter_shortname": "Distance",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                1
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0.15,
              "parameter_mmax": 3,
              "parameter_modmode": 0,
              "parameter_order": 5,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            245.0,
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
          "id": "obj-param-5",
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
              "parameter_annotation_name": "Rate",
              "parameter_longname": "Rate",
              "parameter_shortname": "Rate",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.035
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 1e-06,
              "parameter_mmax": 2,
              "parameter_modmode": 0,
              "parameter_order": 6,
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
            275.0,
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
          "id": "obj-param-17",
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
              "parameter_annotation_name": "Output",
              "parameter_longname": "Output",
              "parameter_shortname": "Output",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                -9
              ],
              "parameter_invisible": 0,
              "parameter_mmin": -60,
              "parameter_mmax": 12,
              "parameter_modmode": 0,
              "parameter_order": 7,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
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
            305.0,
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
          "id": "obj-param-topology-1",
          "maxclass": "message",
          "patching_rect": [
            720.0,
            430.0,
            105.0,
            22.0
          ],
          "text": "paramid 1 3",
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
            "obj-chain",
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
            0
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
            1
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
            2
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
            3
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
            4
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
            5
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
            6
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
      "inherited_shortname": 1,
      "obj-chain": [
        "Route to Chain",
        "Chain",
        0
      ],
      "obj-input-bus-number": [
        "Multichannel Input Bus",
        "Input Bus",
        0
      ],
      "obj-param-20": [
        "Input Count",
        "Inputs",
        1
      ],
      "obj-param-30": [
        "Selected Source",
        "Source",
        2
      ],
      "obj-param-2": [
        "Azimuth",
        "Azimuth",
        3
      ],
      "obj-param-3": [
        "Elevation",
        "Elevation",
        4
      ],
      "obj-param-4": [
        "Distance",
        "Distance",
        5
      ],
      "obj-param-5": [
        "Rate",
        "Rate",
        6
      ],
      "obj-param-17": [
        "Output",
        "Output",
        7
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
