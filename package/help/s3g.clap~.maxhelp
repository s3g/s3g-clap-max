{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "arm64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [70.0, 80.0, 900.0, 610.0],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "s3g.clap~ — host a CLAP plugin in Max/MSP",
          "fontsize": 20.0,
          "patching_rect": [30.0, 20.0, 520.0, 28.0]
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "text": "Create with fixed input/output channel counts. CLAP ports are flattened in port order.",
          "patching_rect": [30.0, 55.0, 650.0, 22.0]
        }
      },
      {
        "box": {
          "id": "open",
          "maxclass": "message",
          "text": "open",
          "patching_rect": [30.0, 100.0, 50.0, 22.0]
        }
      },
      {
        "box": {
          "id": "params",
          "maxclass": "message",
          "text": "getparams",
          "patching_rect": [90.0, 100.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "setparam",
          "maxclass": "message",
          "text": "param 1 $1",
          "patching_rect": [180.0, 100.0, 82.0, 22.0]
        }
      },
      {
        "box": {
          "id": "dial",
          "maxclass": "flonum",
          "patching_rect": [180.0, 70.0, 70.0, 22.0]
        }
      },
      {
        "box": {
          "id": "midi",
          "maxclass": "message",
          "text": "midievent 144 60 100",
          "patching_rect": [275.0, 100.0, 145.0, 22.0]
        }
      },
      {
        "box": {
          "id": "editor",
          "maxclass": "message",
          "text": "editor",
          "patching_rect": [435.0, 100.0, 55.0, 22.0]
        }
      },
      {
        "box": {
          "id": "noise",
          "maxclass": "newobj",
          "text": "noise~",
          "patching_rect": [30.0, 165.0, 48.0, 22.0]
        }
      },
      {
        "box": {
          "id": "gainin",
          "maxclass": "newobj",
          "text": "*~ 0.05",
          "patching_rect": [30.0, 200.0, 55.0, 22.0]
        }
      },
      {
        "box": {
          "id": "clap",
          "maxclass": "newobj",
          "text": "s3g.clap~ 2 2",
          "patching_rect": [30.0, 250.0, 115.0, 22.0]
        }
      },
      {
        "box": {
          "id": "gainout",
          "maxclass": "newobj",
          "text": "live.gain~",
          "patching_rect": [30.0, 305.0, 120.0, 110.0]
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "newobj",
          "text": "ezdac~",
          "patching_rect": [30.0, 450.0, 45.0, 45.0]
        }
      },
      {
        "box": {
          "id": "print",
          "maxclass": "newobj",
          "text": "print s3g.clap",
          "patching_rect": [175.0, 250.0, 105.0, 22.0]
        }
      },
      {
        "box": {
          "id": "messages",
          "maxclass": "comment",
          "linecount": 10,
          "text": "Messages:\nopen [path] [plugin-id]\neditor [1] / editor 0\nclose / status / getplugins\ngetparams / getparam <1-based-index>\nparam <index> <plain-value>\nparamid <clap-id> <plain-value>\nmidievent [port] <status> <data1> <data2>\nstatewrite <path> / stateread <path>\n\nThe rightmost outlet reports loaded, params, paraminfo, paramsdone, paramvalue, paramchanged, midiout, editor, and error messages.",
          "patching_rect": [350.0, 165.0, 480.0, 250.0]
        }
      }
    ],
    "lines": [
      {"patchline": {"source": ["open", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["params", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["dial", 0], "destination": ["setparam", 0]}},
      {"patchline": {"source": ["setparam", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["midi", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["editor", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["noise", 0], "destination": ["gainin", 0]}},
      {"patchline": {"source": ["gainin", 0], "destination": ["clap", 0]}},
      {"patchline": {"source": ["gainin", 0], "destination": ["clap", 1]}},
      {"patchline": {"source": ["clap", 0], "destination": ["gainout", 0]}},
      {"patchline": {"source": ["clap", 1], "destination": ["gainout", 1]}},
      {"patchline": {"source": ["clap", 2], "destination": ["print", 0]}},
      {"patchline": {"source": ["gainout", 0], "destination": ["dac", 0]}},
      {"patchline": {"source": ["gainout", 1], "destination": ["dac", 1]}}
    ]
  }
}
