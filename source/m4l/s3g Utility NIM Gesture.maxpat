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
      3190.0,
      1200.0
    ],
    "openrect": [
      0.0,
      0.0,
      380,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 380,
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
    "description": "s3g Utility NIM Gesture processes Live MIDI and optional MIDI IN bus messages. Its channel-preserving CLAP MIDI output goes directly to the next Live instrument and optionally to the selected MIDI OUT bus. Matching MIDI IN and OUT bus numbers suppress bus output to prevent feedback. The dummy audio outlet keeps the CLAP clock running but is silent. Tracker MIDI bus is opt-in and preserves channels.",
    "digest": "s3g Utility NIM Gesture processes Live MIDI and optional MIDI IN bus messages. Its channel-preserving CLAP MIDI output goes directly to the next Live instrument and optionally to the selected MIDI OUT bus. Matching MIDI IN and OUT bus numbers suppress bus output to prevent feedback. The dummy audio outlet keeps the CLAP clock running but is silent. Tracker MIDI bus is opt-in and preserves channels.",
    "tags": "s3g CLAP fixed MIDI effect",
    "latency": 0,
    "minimum_live_version": "12.0",
    "minimum_max_version": "8.5",
    "boxes": [
      {
        "box": {
          "id": "obj-ui-background",
          "maxclass": "panel",
          "patching_rect": [
            1770,
            40,
            380,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            380,
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
            680,
            40,
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
            880,
            40,
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
          "id": "obj-clap",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            260,
            310.0,
            22.0
          ],
          "text": "s3g.clap~ 0 1",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
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
            40,
            370,
            110,
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
            1530,
            100,
            125,
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
          "id": "obj-tracker-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            680,
            260,
            58.0,
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
              "parameter_longname": "Tracker MIDI Bus",
              "parameter_shortname": "TRK Bus",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 16,
              "parameter_steps": 17,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "tracker_bus_number"
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            780,
            260,
            58.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            142.0,
            10.0,
            58.0,
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
          "annotation": "Choose tracker midi bus from the menu.",
          "annotation_name": "Tracker MIDI Bus"
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            320,
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
          "id": "obj-tracker-bus-number-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            780,
            320,
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
          "id": "obj-tracker-bus-number-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            980,
            320,
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
          "id": "obj-tracker-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            680,
            200,
            58.0,
            20.0
          ],
          "text": "MIDI OUT",
          "presentation": 1,
          "presentation_rect": [
            84.0,
            10.0,
            58.0,
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
          "annotation": "Tracker MIDI bus; OFF disconnects this device."
        }
      },
      {
        "box": {
          "id": "obj-tracker-output-route",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            260,
            125,
            22.0
          ],
          "text": "route midioutat",
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
          "id": "obj-tracker-prepend",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            320,
            145,
            22.0
          ],
          "text": "prepend midieventat",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-gate",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            380,
            70,
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
          "id": "obj-tracker-forward",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            440,
            65,
            22.0
          ],
          "text": "forward",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-change",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            380,
            56,
            22.0
          ],
          "text": "change",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-switch",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            440,
            52,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-tracker-old-bus-panic",
          "maxclass": "message",
          "patching_rect": [
            780,
            500,
            76,
            22
          ],
          "text": "killvoices",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-order",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            560,
            45,
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
          "id": "obj-tracker-bus-pair",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            620,
            60,
            22.0
          ],
          "text": "pak i i",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-unpack",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            680,
            75,
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
          "id": "obj-tracker-bus-safe",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            740,
            235,
            22.0
          ],
          "text": "expr ($i1 > 0) && ($i1 != $i2)",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            780,
            620,
            220,
            22.0
          ],
          "text": "sprintf s3g-tracker-midi-%ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-address",
          "maxclass": "newobj",
          "patching_rect": [
            780,
            680,
            96,
            22.0
          ],
          "text": "prepend send",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-live-event-slice",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            100,
            80,
            22.0
          ],
          "text": "zl slice 2",
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
          "id": "obj-live-event-order",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            160,
            48,
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
          "id": "obj-live-status-unpack",
          "maxclass": "newobj",
          "patching_rect": [
            2400,
            220,
            90,
            22.0
          ],
          "text": "unpack i i i",
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
          "id": "obj-live-status-length",
          "maxclass": "newobj",
          "patching_rect": [
            2400,
            280,
            345,
            22.0
          ],
          "text": "expr (($i1 >= 128) && ($i1 <= 239)) + (($i1 >= 192) && ($i1 <= 223))",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-live-status-gate",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            340,
            62,
            22.0
          ],
          "text": "gate 2",
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
          "id": "obj-live-two-byte-slice",
          "maxclass": "newobj",
          "patching_rect": [
            2400,
            400,
            80,
            22.0
          ],
          "text": "zl slice 2",
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
          "id": "obj-live-midi-bytes",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            460,
            45,
            22.0
          ],
          "text": "iter",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-live-midi-flush",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            520,
            78,
            22.0
          ],
          "text": "midiflush",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-live-midi-out",
          "maxclass": "newobj",
          "patching_rect": [
            2200,
            580,
            70,
            22.0
          ],
          "text": "midiout",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "obj-plugsync",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            630,
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
            220,
            630,
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
            40,
            700,
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
            40,
            770,
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
            40,
            450,
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
            40,
            510,
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
            40,
            560,
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
            210,
            510,
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
            1120,
            100,
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
            1120,
            160,
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
            1120,
            220,
            220.0,
            22.0
          ],
          "text": "openifempty \"s3g Utility NIM Gesture\" org.s3g.s3g-dsp.nim-gesture",
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
            780,
            40,
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
            1120,
            310,
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
            1120,
            370,
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
            1120,
            430,
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
            1120,
            490,
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
            1210,
            550,
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
            1320,
            550,
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
            1120,
            610,
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
            1120,
            670,
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
            1120,
            550,
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
          "id": "obj-tracker-bus-replay-delay",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            800,
            76,
            22.0
          ],
          "text": "delay 250",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-bus-replay",
          "maxclass": "message",
          "patching_rect": [
            780,
            800,
            92,
            22
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
          "id": "obj-midi-in",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            100,
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
            40,
            160,
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
          "id": "obj-param-gate",
          "maxclass": "newobj",
          "patching_rect": [
            1770,
            280,
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
            1880,
            160,
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
            1770,
            160,
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
            1770,
            220,
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
            1770,
            340,
            290.0,
            22.0
          ],
          "text": "route 1 2 5",
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
          "id": "obj-param-1",
          "maxclass": "live.numbox",
          "patching_rect": [
            1770,
            420,
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
              "parameter_annotation_name": "Record",
              "parameter_longname": "Record",
              "parameter_shortname": "Record",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 1,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Off",
                "On"
              ]
            }
          },
          "varname": "clap_param_1",
          "presentation": 1,
          "presentation_rect": [
            12,
            45,
            90,
            20.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-message-1",
          "maxclass": "message",
          "patching_rect": [
            1770,
            480,
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
            1770,
            540,
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
            1910,
            420,
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
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_modmode": 0,
              "parameter_order": 2,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 2,
              "parameter_enum": [
                "Off",
                "On"
              ]
            }
          },
          "varname": "clap_param_2",
          "presentation": 1,
          "presentation_rect": [
            110,
            45,
            90,
            20.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-message-2",
          "maxclass": "message",
          "patching_rect": [
            1910,
            480,
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
            1910,
            540,
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
            2050,
            420,
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
              "parameter_annotation_name": "Live Takeover",
              "parameter_longname": "Live Takeover",
              "parameter_shortname": "Takeover",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                650
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 5000,
              "parameter_modmode": 0,
              "parameter_order": 3,
              "parameter_linknames": 0,
              "parameter_speedlim": 3.0,
              "parameter_unitstyle": 0,
              "parameter_type": 0
            }
          },
          "varname": "clap_param_5",
          "presentation": 1,
          "presentation_rect": [
            208,
            45,
            90,
            20.0
          ],
          "bgcolor": [
            0.15294,
            0.15294,
            0.15294,
            1.0
          ],
          "textcolor": [
            0.72,
            0.72,
            0.72,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-param-message-5",
          "maxclass": "message",
          "patching_rect": [
            2050,
            480,
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
            2050,
            540,
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
          "id": "obj-tracker-midi-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            2850,
            80.0,
            58.0,
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
              "parameter_longname": "Tracker MIDI Bus",
              "parameter_shortname": "TRK Bus",
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_invisible": 0,
              "parameter_mmin": 0,
              "parameter_mmax": 16,
              "parameter_steps": 17,
              "parameter_modmode": 0,
              "parameter_type": 1,
              "parameter_unitstyle": 0
            }
          },
          "varname": "tracker_midi_bus_number"
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-bus-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            2850,
            138.0,
            58.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            266.0,
            10.0,
            58.0,
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
          "annotation": "Choose tracker midi bus from the menu.",
          "annotation_name": "Tracker MIDI Bus"
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            196.0,
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
          "id": "obj-tracker-midi-bus-number-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            254.0,
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
          "id": "obj-tracker-midi-bus-number-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            312.0,
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
          "id": "obj-tracker-midi-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            2850,
            370.0,
            58.0,
            20.0
          ],
          "text": "MIDI IN",
          "presentation": 1,
          "presentation_rect": [
            208.0,
            10.0,
            58.0,
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
          "annotation": "Tracker MIDI bus; OFF disconnects this device."
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-receive",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            428.0,
            80,
            22.0
          ],
          "text": "receive",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            486.0,
            220,
            22.0
          ],
          "text": "sprintf s3g-tracker-midi-%ld",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-set",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            544.0,
            90,
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
          "id": "obj-tracker-midi-change",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            602.0,
            60,
            22.0
          ],
          "text": "change",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-switch",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            660.0,
            60,
            22.0
          ],
          "text": "t i b",
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
          "id": "obj-tracker-midi-panic",
          "maxclass": "message",
          "patching_rect": [
            2850,
            718.0,
            80,
            22
          ],
          "text": "killvoices",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-bus-replay-delay",
          "maxclass": "newobj",
          "patching_rect": [
            2850,
            776.0,
            76,
            22.0
          ],
          "text": "delay 250",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-tracker-midi-bus-replay",
          "maxclass": "message",
          "patching_rect": [
            2850,
            834.0,
            92,
            22
          ],
          "text": "outputvalue",
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
            "obj-clap",
            1
          ],
          "destination": [
            "obj-tracker-output-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-output-route",
            0
          ],
          "destination": [
            "obj-tracker-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-output-route",
            0
          ],
          "destination": [
            "obj-live-event-slice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-event-slice",
            1
          ],
          "destination": [
            "obj-live-event-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-event-order",
            1
          ],
          "destination": [
            "obj-live-status-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-status-unpack",
            0
          ],
          "destination": [
            "obj-live-status-length",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-status-length",
            0
          ],
          "destination": [
            "obj-live-status-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-event-order",
            0
          ],
          "destination": [
            "obj-live-status-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-status-gate",
            0
          ],
          "destination": [
            "obj-live-midi-bytes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-status-gate",
            1
          ],
          "destination": [
            "obj-live-two-byte-slice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-two-byte-slice",
            0
          ],
          "destination": [
            "obj-live-midi-bytes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-midi-bytes",
            0
          ],
          "destination": [
            "obj-live-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-live-midi-flush",
            0
          ],
          "destination": [
            "obj-live-midi-out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-prepend",
            0
          ],
          "destination": [
            "obj-tracker-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-gate",
            0
          ],
          "destination": [
            "obj-tracker-forward",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number",
            0
          ],
          "destination": [
            "obj-tracker-bus-change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-change",
            0
          ],
          "destination": [
            "obj-tracker-bus-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-switch",
            1
          ],
          "destination": [
            "obj-tracker-old-bus-panic",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-old-bus-panic",
            0
          ],
          "destination": [
            "obj-tracker-forward",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-old-bus-panic",
            0
          ],
          "destination": [
            "obj-live-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-switch",
            0
          ],
          "destination": [
            "obj-tracker-bus-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-order",
            1
          ],
          "destination": [
            "obj-tracker-bus-symbol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-symbol",
            0
          ],
          "destination": [
            "obj-tracker-bus-address",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-address",
            0
          ],
          "destination": [
            "obj-tracker-forward",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-order",
            0
          ],
          "destination": [
            "obj-tracker-bus-pair",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-pair",
            0
          ],
          "destination": [
            "obj-tracker-bus-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-unpack",
            1
          ],
          "destination": [
            "obj-tracker-bus-safe",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-unpack",
            0
          ],
          "destination": [
            "obj-tracker-bus-safe",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-safe",
            0
          ],
          "destination": [
            "obj-tracker-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number-menu",
            0
          ],
          "destination": [
            "obj-tracker-bus-number-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number",
            0
          ],
          "destination": [
            "obj-tracker-bus-number-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number-value-to-menu",
            0
          ],
          "destination": [
            "obj-tracker-bus-number-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number-menu-set",
            0
          ],
          "destination": [
            "obj-tracker-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-number-menu-to-value",
            0
          ],
          "destination": [
            "obj-tracker-bus-number",
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
            1
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
            "obj-device",
            0
          ],
          "destination": [
            "obj-tracker-bus-replay-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-replay-delay",
            0
          ],
          "destination": [
            "obj-tracker-bus-replay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-bus-replay",
            0
          ],
          "destination": [
            "obj-tracker-bus-number",
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
            2
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
            "obj-tracker-midi-bus-number-menu",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number-menu-to-value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number-value-to-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number-value-to-menu",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number-menu-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number-menu-set",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number-menu-to-value",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number",
            0
          ],
          "destination": [
            "obj-tracker-midi-change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-change",
            0
          ],
          "destination": [
            "obj-tracker-midi-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-switch",
            1
          ],
          "destination": [
            "obj-tracker-midi-panic",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-panic",
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
            "obj-tracker-midi-switch",
            0
          ],
          "destination": [
            "obj-tracker-midi-symbol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-symbol",
            0
          ],
          "destination": [
            "obj-tracker-midi-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-set",
            0
          ],
          "destination": [
            "obj-tracker-midi-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-receive",
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
            "obj-tracker-midi-bus-replay-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-replay-delay",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-replay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-replay",
            0
          ],
          "destination": [
            "obj-tracker-midi-bus-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-panic",
            0
          ],
          "destination": [
            "obj-live-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-tracker-midi-bus-number",
            0
          ],
          "destination": [
            "obj-tracker-bus-pair",
            1
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
      "obj-tracker-bus-number": [
        "Tracker MIDI Bus",
        "TRK Bus",
        0
      ],
      "obj-param-1": [
        "Record",
        "Record",
        1
      ],
      "obj-param-2": [
        "Playback",
        "Play",
        2
      ],
      "obj-param-5": [
        "Live Takeover",
        "Takeover",
        3
      ],
      "obj-tracker-midi-bus-number": [
        "Tracker MIDI Bus",
        "TRK Bus",
        0
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
      "amxdtype": 1835887981,
      "readonly": 0,
      "devpathtype": 0,
      "devpath": ".",
      "sortmode": 0
    }
  }
}
