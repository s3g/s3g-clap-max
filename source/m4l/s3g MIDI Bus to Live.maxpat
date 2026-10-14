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
      1920.0,
      1450.0
    ],
    "openrect": [
      0.0,
      0.0,
      224.0,
      169.0
    ],
    "openinpresentation": 1,
    "devicewidth": 224.0,
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
    "description": "Receive a private s3g MIDI bus from Relay, Tracker, or a MIDI utility and send its channel voice messages to the following Live instrument. Live MIDI passes through; PANIC releases held bus notes.",
    "digest": "Receive a private s3g MIDI bus from Relay, Tracker, or a MIDI utility and send its channel voice messages to the following Live instrument. Live MIDI passes through; PANIC releases held bus notes.",
    "tags": "s3g MIDI bus receiver Live MIDI effect",
    "latency": 0,
    "minimum_live_version": "12.0",
    "minimum_max_version": "8.5",
    "boxes": [
      {
        "box": {
          "id": "obj-ui-background",
          "maxclass": "panel",
          "patching_rect": [
            1650.0,
            40.0,
            224.0,
            169.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            224.0,
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
          "rounded": 0
        }
      },
      {
        "box": {
          "id": "obj-bus-label",
          "maxclass": "comment",
          "patching_rect": [
            400.0,
            240.0,
            58.0,
            20.0
          ],
          "text": "MIDI IN",
          "presentation": 1,
          "presentation_rect": [
            12.0,
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
          "annotation": "Receive Relay or Tracker on this private s3g MIDI bus."
        }
      },
      {
        "box": {
          "id": "obj-bus-number",
          "maxclass": "live.numbox",
          "patching_rect": [
            400.0,
            280.0,
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
              "parameter_longname": "s3g MIDI Input Bus",
              "parameter_shortname": "MIDI In",
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
          "varname": "bus_number"
        }
      },
      {
        "box": {
          "id": "obj-bus-number-menu",
          "maxclass": "umenu",
          "patching_rect": [
            500.0,
            280.0,
            58.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            72.0,
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
          "annotation": "Choose s3g midi input bus from the menu.",
          "annotation_name": "s3g MIDI Input Bus"
        }
      },
      {
        "box": {
          "id": "obj-bus-number-menu-to-value",
          "maxclass": "newobj",
          "patching_rect": [
            620.0,
            340.0,
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
          "id": "obj-bus-number-value-to-menu",
          "maxclass": "newobj",
          "patching_rect": [
            720.0,
            340.0,
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
          "id": "obj-bus-number-menu-set",
          "maxclass": "newobj",
          "patching_rect": [
            820.0,
            340.0,
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
          "id": "obj-panic-button",
          "maxclass": "live.text",
          "patching_rect": [
            1110.0,
            1120.0,
            70.0,
            24.0
          ],
          "text": "PANIC",
          "presentation": 1,
          "presentation_rect": [
            142.0,
            10.0,
            70.0,
            20.0
          ],
          "texton": "PANIC",
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
          "annotation": "Send note-offs for held notes from the s3g MIDI bus.",
          "annotation_name": "PANIC"
        }
      },
      {
        "box": {
          "id": "obj-midi-in",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            100,
            60,
            22.0
          ],
          "text": "midiin",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "obj-midi-out",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            1300,
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
          "id": "obj-device",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            100,
            135,
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
          "id": "obj-bus-replay-delay",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            160,
            75,
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
          "id": "obj-bus-replay",
          "maxclass": "message",
          "patching_rect": [
            400,
            210,
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
          "id": "obj-bus-change",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            400,
            58,
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
          "id": "obj-bus-switch",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            460,
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
          "id": "obj-bus-symbol",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            520,
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
          "id": "obj-bus-set",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            580,
            95,
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
          "id": "obj-bus-receive",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            640,
            78,
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
          "id": "obj-bus-route",
          "maxclass": "newobj",
          "patching_rect": [
            400,
            700,
            210,
            22.0
          ],
          "text": "route midieventat killvoices",
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
          "id": "obj-panic-bang",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            760,
            40,
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
          "id": "obj-event-slice",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            760,
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
          "id": "obj-event-order",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            820,
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
          "id": "obj-status-unpack",
          "maxclass": "newobj",
          "patching_rect": [
            1000,
            880,
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
          "id": "obj-status-length",
          "maxclass": "newobj",
          "patching_rect": [
            1000,
            940,
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
          "id": "obj-status-gate",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            1000,
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
          "id": "obj-two-byte-slice",
          "maxclass": "newobj",
          "patching_rect": [
            1000,
            1060,
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
          "id": "obj-midi-bytes",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            1120,
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
          "id": "obj-midi-flush",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            1180,
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
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-midi-in",
            0
          ],
          "destination": [
            "obj-midi-out",
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
            "obj-bus-replay-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-replay-delay",
            0
          ],
          "destination": [
            "obj-bus-replay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-replay",
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
            "obj-bus-number",
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
            "obj-bus-change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-change",
            0
          ],
          "destination": [
            "obj-bus-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-switch",
            1
          ],
          "destination": [
            "obj-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-switch",
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
            "obj-bus-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-set",
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
            "obj-bus-receive",
            0
          ],
          "destination": [
            "obj-bus-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-route",
            1
          ],
          "destination": [
            "obj-panic-bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-panic-bang",
            0
          ],
          "destination": [
            "obj-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-panic-button",
            0
          ],
          "destination": [
            "obj-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-bus-route",
            0
          ],
          "destination": [
            "obj-event-slice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-event-slice",
            1
          ],
          "destination": [
            "obj-event-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-event-order",
            1
          ],
          "destination": [
            "obj-status-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-status-unpack",
            0
          ],
          "destination": [
            "obj-status-length",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-status-length",
            0
          ],
          "destination": [
            "obj-status-gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-event-order",
            0
          ],
          "destination": [
            "obj-status-gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-status-gate",
            0
          ],
          "destination": [
            "obj-midi-bytes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-status-gate",
            1
          ],
          "destination": [
            "obj-two-byte-slice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-two-byte-slice",
            0
          ],
          "destination": [
            "obj-midi-bytes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-midi-bytes",
            0
          ],
          "destination": [
            "obj-midi-flush",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-midi-flush",
            0
          ],
          "destination": [
            "obj-midi-out",
            0
          ]
        }
      }
    ],
    "parameters": {
      "obj-bus-number": [
        "s3g MIDI Input Bus",
        "MIDI In",
        0
      ],
      "parameterbanks": {},
      "inherited_shortname": 1
    },
    "dependency_cache": [
      {
        "name": "s3g.live.thisdevice.maxpat",
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
