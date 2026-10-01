# s3g-clap-max

`s3g-clap-max` is a native Max/MSP package for hosting CLAP audio plugins,
including a self-contained Max for Live bridge for 3OA s3g plugins.
The Max object is named `s3g.clap~`; its messages follow the useful parts of
Max's `vst~` interface while using the CLAP ABI directly.

The repository name describes the bridge direction and complements the other
s3g projects:

- `s3g-max` ports s3g DSP code to Max externals.
- `s3g-rnbo-clap` turns RNBO exports into CLAP plugins.
- `s3g-clap-max` opens CLAP plugins inside Max.

## Use

Create the object with fixed Max-visible channel counts:

```max
[s3g.clap~ 2 2]
```

The first argument is the number of signal channels supplied by Max and the
second is the number returned to Max. CLAP ports are flattened in their
reported order. If a plugin is wider, undisplayed input channels receive
silence and output channels beyond the requested width are discarded. If it
is narrower, unused Max outputs are cleared. The final outlet reports status,
plugin metadata, parameter data, parameter changes, and MIDI output.

Add the construction-time `@mc 1` attribute to present those channels as one
Max multichannel inlet and one multichannel outlet:

```max
[s3g.clap~ 16 16 @mc 1]
```

The two arguments set the MC signal widths. A zero count omits that signal
inlet or outlet. For example, the first 16 channels of a fixed 64-output
ambisonic plugin can be exposed as 3OA without declaring all 64 channels:

```max
[s3g.clap~ 0 16 "s3g Ambi Encoder Stochastic" @mc 1]
```

An incoming MC signal wider than the first argument is truncated; one with
fewer channels is zero-padded before it reaches the plugin.

Recreate the object to switch between MC and discrete mode. The rightmost
status outlet remains a standard Max message outlet in both modes.

### Messages

- `open` shows a native file picker that accepts `.clap` bundles or Windows
  CLAP modules.
- `open <path-or-name> [plugin-id]` loads a bundle and optional factory plugin
  ID. A quoted display name such as `open "s3g Ambi Encoder Stochastic"` is
  resolved through `CLAP_PATH` and the standard CLAP locations. Without an ID,
  the first descriptor is selected.
- `openifempty <path-or-name> [plugin-id]` behaves like `open`, but preserves a
  plugin already restored through `setvalueof`. The included Live devices use
  it after device construction to avoid loading a CLAP while Live is compiling
  the initial DSP graph.
- `getpaths` reports the active CLAP search roots as `clappath` messages.
- `close`, `status`, and `getplugins` manage and inspect the loaded bundle.
- `getparams` outputs `params <count>`, one `paraminfo` message per parameter,
  and `paramsdone <count>`. Each `paraminfo` message contains `<index> <id>
  <current> <min> <max> <default> <flags> <name> <module> <display-text>`.
  Public parameter indexes are one-based, like `vst~`.
- `param <index> <plain-value>` and `paramid <clap-id> <plain-value>` set
  parameters.
- `getparam <index>` outputs `paramvalue <index> <value> <display-text>`.
- `editor` or `editor 1` opens the plugin's native Cocoa or Win32 GUI.
  `editor 0` hides it. Embedded and floating CLAP GUIs are supported.
- `midievent <status> <data1> <data2>` sends MIDI to note port 0;
  `midievent <port> <status> <data1> <data2>` selects another port.
- `statewrite <path>` and `stateread <path>` use the CLAP state extension.
- `transport <playing> <tempo-bpm> <song-beats> <song-seconds>
  <time-signature-numerator> <time-signature-denominator> [recording]
  [loop-active] [loop-start-beats] [loop-end-beats]` supplies a CLAP transport
  snapshot. `transportclear` removes it.
- `transportsync <playing> <song-beats> <sample-position>
  <samples-per-beat> <time-signature-numerator>
  <time-signature-denominator> <validity-flags>` accepts `plugsync~` data. The
  included Live devices send this automatically.
- `getlatency` reports `latency <samples>`. Changes requested through the CLAP
  latency extension are also reported automatically.

`s3g.clap~` implements Max's `getvalueof`/`setvalueof` contract. It also
accepts `getstate` and emits the same embedded payload as `state ...`;
`setstate <payload>` restores it. A patcher can
store the selected bundle, exact CLAP plugin ID, and binary CLAP state as a
Blob parameter. Embedded states are capped at 64 MiB. The included Live
devices explicitly capture that payload in a hidden, parameter-enabled
`pattr` Blob and restore it through `setstate`, so
saving a Live Set stores the selected CLAP and its current settings rather than
reselecting the device default when the Set is reopened. The plugin must still
be installed in a discoverable CLAP location on the system reopening the Set.

Parameter and MIDI messages are delivered at sample offset zero of the next
MSP vector. Plugin-produced events are reported as `paramchanged` and
`midiout` messages.

The plugin can also be loaded when the Max object is created. Quote names that
contain spaces:

```max
[s3g.clap~ 0 16 "s3g Ambi Encoder Stochastic" @mc 1]
```

Direct paths take priority. Name discovery searches `CLAP_PATH` entries first,
then `~/Library/Audio/Plug-Ins/CLAP` and
`/Library/Audio/Plug-Ins/CLAP` on macOS. On Windows it searches
`%COMMONPROGRAMFILES%\CLAP` and
`%LOCALAPPDATA%\Programs\Common\CLAP`. It matches filenames and, on macOS,
native bundle display names and identifiers without loading plugin
executables. Case, spaces, underscores, hyphens, and punctuation are ignored.
A unique substring such as `"Encoder Stochastic"` is accepted; ambiguous
matches produce an error with candidate paths.

Loaded CLAP modules remain initialized and mapped until Max exits. This keeps
pending native GUI objects and callbacks from pointing into unloaded plugin
code. Restart Max after rebuilding a CLAP plugin that has already been loaded
during the current session.

## Max for Live 3OA bridge

The package includes five audio devices in `package/devices`:

- **s3g CLAP 3OA Source** sends the ordinary stereo track input through a
  unity stereo input meter and independent channel mutes to the two CLAP
  inputs of `s3g Ambi Encoder Medium 16`. It passes the unmuted dry stereo on
  channels 1–2 and puts 16-channel ACN/SN3D on channels 3–18.
- **s3g CLAP 3OA Insert** passes channels 1–2 unchanged and hosts a CLAP
  processor across channels 3–18. Its default is `s3g Ambi Effect Gain 64`,
  narrowed to the first 16 channels by the bridge.
- **s3g CLAP 3OA Main Out** receives the named 16-channel `master` bus and
  hosts a decoder with up to 32 outputs. Its sixteen output-pair selectors
  route decoded channels 1–32 directly to Live's available external hardware
  pairs. The default `s3g Ambi Decoder Head 2` uses the first pair; a speaker
  decoder can use the remaining pairs.
- **s3g CLAP 3OA Path Encoder** is a fixed wrapper for **s3g Ambi Encoder Path
  64**. It fixes the plugin to two inputs and third order, exposes its remaining
  stable parameters to Live automation, and sends to the private `master` bus.
- **s3g CLAP 3OA Speaker Main Out** is the matching fixed wrapper for **s3g
  Ambi Decoder Speaker 64**. It fixes third-order decoding, receives and sums
  the private `master` bus, exposes stable decoder parameters to Live, and
  routes speaker channels 1–32 through the sixteen hardware-pair selectors.

Put either Main Out device first on a dedicated normal audio track. Source,
Path Encoder, and Insert devices route to it by default. Multiple encoder
tracks with **NEXT** disabled automatically route to and sum at the same
private `master` receiver, following the E4L-style multi-source topology while
remaining namespaced independently. Enable **NEXT** when a Source, Path
Encoder, or Insert must feed the next multichannel device on the same track;
leave NEXT disabled on the last device so it routes to the main bus. The bus
control patchers can change a source track to `Sends Only`, preventing its dry
stereo passthrough from duplicating the decoded signal.

The fixed wrappers do not have a plugin picker because their Live automation
maps depend on stable CLAP parameter IDs. They retain the native editor and
save the complete CLAP state, including non-parameter path or speaker data.
Speaker Main Out exposes the first 32 decoded outputs; layouts using speakers
33–64 need a wider future output wrapper.

The devices use a private `s3g.*` routing namespace. They do not load or send
to `e4l.*` abstractions, so an Envelop for Live system can coexist in the same
Set without either family acknowledging or rerouting the other. The modified
routing abstractions are derived from Envelop for Live under LGPL-2.1; every
generated Max patch includes an attribution comment and the licenses are
bundled beside the runtime patchers. Placing Main Out first is still
recommended so Live exposes the intended auxiliary inputs.

The private handshake is a protocol change. After updating, reload every s3g
routing-device instance in a Set together; an already-open older instance will
not discover a newly loaded namespaced instance.

Each device forwards Live timing from `plugsync~`, embeds the complete CLAP
state in the Live Set, and maps reported CLAP latency to the top-level device's
Defined Latency in samples. See
[`package/docs/s3g-clap-m4l-routing.md`](package/docs/s3g-clap-m4l-routing.md)
for topology, setup, regeneration, and current limitations.

## Build

The build fetches pinned CLAP 1.2.10 and `max-sdk-base` sources when local
paths are not supplied. All builds place the external directly inside
`package/externals`.

For a universal arm64/x86_64 macOS release:

```sh
./scripts/build-release.sh
```

For offline or repeatable local builds:

```sh
./scripts/build-release.sh \
  -DMAX_SDK_BASE_DIR=/path/to/max-sdk-base \
  -DS3G_CLAP_INCLUDE_DIR=/path/to/clap/include
```

To exercise the generic host against a known plugin during `ctest`, also pass
`-DS3G_CLAP_MAX_TEST_PLUGIN=/absolute/path/to/plugin.clap`. Add
`-DS3G_CLAP_MAX_TEST_NAME="Plugin Display Name"` to test human-readable name
resolution.

Regenerate the editable `.maxpat` sources and packaged `.amxd` files with:

```sh
python3 scripts/generate-m4l-devices.py
python3 tests/validate_m4l_devices.py
```

### Windows x64

On Windows with Visual Studio 2022 and CMake installed, use the native MSVC
preset:

```powershell
cmake --preset windows-msvc
cmake --build --preset windows-msvc
```

This produces `package\externals\s3g.clap~.mxe64`. To cross-build the same
Windows x64 object on macOS or Linux, install an `x86_64-w64-mingw32`
MinGW-w64 toolchain and run:

```sh
./scripts/build-windows-release.sh
```

Create platform archives with `./scripts/package-release.sh` on macOS and
`./scripts/package-windows-release.sh` for Windows x64. To rebuild both
objects and place them in one installable Max package, run:

```sh
./scripts/package-combined-release.sh
```

A cross-build proves the PE/COFF binary, imports, and `ext_main` export; final
release qualification should still load it in Max on Windows with a native
Windows CLAP plugin.

## Development install

Link the repository's live package directory into Max:

```sh
./scripts/install-local-package.sh
```

By default this creates:

```text
~/Documents/Max 9/Packages/s3g-clap-max -> <repo>/package
```

Set `S3G_MAX_VERSION` or `S3G_MAX_PACKAGE_ROOT` to override the destination.
The installer refuses to replace a real directory or file at that path.
Restart Max, then open `s3g.clap~.maxhelp` from the package browser.

Expose the generated Max for Live devices in Ableton's User Library with:

```sh
./scripts/install-live-devices.sh
```

This creates a real `~/Music/Ableton/User Library/s3g CLAP` directory and
hard-links the five devices to `package/devices`. Live's indexer ignores
directory and file symlinks in the User Library, while hard links remain tied
to the generated repository files and are indexed as ordinary `.amxd` files.
The repository and User Library must be on the same filesystem. Set
`S3G_LIVE_DEVICE_ROOT` to override the destination. Restart Live after
rebuilding `s3g.clap~`; Max keeps an already-loaded external mapped until its
host exits.

On Windows, build with the MSVC preset and copy or link the repository's
`package` directory to `%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max`.

## Current scope

The host covers processor lifecycle, audio, parameters, MIDI, embedded and
file-based plugin state, Live transport events, latency reporting, native
Cocoa and Win32 editors, host callbacks, and restart requests. The M4L bridge
uses a fixed 3OA layout; it does not dynamically reconfigure CLAP audio ports
or expose CLAP preset discovery. `plugsync~` supplies play state, tempo,
timeline position, and time signature, but not Live loop or record state.

## License

The project is available under the BSD 3-Clause License. Dependency notices
are in `THIRD_PARTY_NOTICES.md`.
