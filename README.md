# s3g-clap-max

`s3g-clap-max` is a native Max/MSP package for hosting CLAP audio plugins,
including a self-contained Max for Live bridge for up to fifth-order Ambisonics.
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
  parameters and mark the external's opaque state modified.
- `automateparamid <clap-id> <plain-value>` is the Max for Live automation
  variant. It queues the same CLAP parameter event without marking the opaque
  external state modified; the originating `live.*` parameter is already
  stored and automated by Live.
- `getparam <index>` outputs `paramvalue <index> <value> <display-text>`.
- `editor` or `editor 1` opens the plugin's native Cocoa or Win32 GUI.
  `editor 0` hides it. Embedded and floating CLAP GUIs are supported.
- `midievent <status> <data1> <data2>` sends MIDI to note port 0;
  `midievent <port> <status> <data1> <data2>` selects another port.
- `killvoices` requests a CLAP reset on the next audio vector, clearing active
  voices and queued MIDI without unloading the plug-in or its sample media.
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

## Max for Live multichannel and Ambisonic bridge

The standard User Library installation has 74 Max for Live devices. Older 3OA
artifacts remain in the repository as generation inputs but are not installed.

- **s3g Send Stereo to 32ch Bus** places a Live track's stereo signal into one of
  sixteen selectable pairs on a private, format-agnostic 32-channel bus. It
  provides stored bus, pair, separate input levels with a link switch, pan,
  mute, and dry-output controls without changing
  the track's normal Live routing.
- **s3g Multichannel Receive** sums one selected private bus and actively
  routes its 32 slots into the immediately following multichannel M4L
  processor. It remains available as an advanced adapter for custom Max or
  third-party processors; fixed s3g encoder wrappers receive the bus directly.
  Live's internally reserved stereo lane is blocked and is not counted as
  part of the 32-channel bus.
- **s3g Bus Send 36** and **s3g Bus Receive 36** are the explicit
  format-agnostic transport for up to 36 channels (enough for fifth-order
  Ambisonics). They reserve Live channels 1–2 for stereo and map bus slots
  1–36 to device channels 3–38. Their numbered `s3g-bus36` namespace is
  separate from the existing 32-channel and older 3OA buses. Send accepts stereo
  or a 36-channel device chain, with saved CH/FROM/SLOT controls; Receive
  belongs before a compatible processor on a normal audio track. Its
  OFF-by-default MON menu auditions any of the 18 bus pairs on normal stereo
  output without changing the multichannel pass-through. The installed set of
  41 **s3g Ambi …** wrappers uses this bus: encoder/effect chains pass
  to the next same-track device automatically, and cross-track connections
  require an explicit Send/Receive pair. Live acceptance testing is still needed.
- **s3g Drum Kick**, **Snare**, **Floor Tom**, **Concert Bass**, **Toms**,
  **Hi-Hat**, **Clap**, **Cowbell**, **Crash**, and **Break** are fixed stereo
  MIDI instruments. **s3g Drum Overload** and **Echo** are stereo inserts.
  **s3g Send Stereo to Drum 16ch Bus** routes eight selectable stereo pairs
  to the dedicated **s3g Drum Mixer 16** receiver. The Drum bus is distinct
  from the 32-channel bus and 3OA master; see the
  [routing guide](package/docs/s3g-clap-m4l-routing.md#drum-family).
- **s3g Sample Player 2**, **Doubles 2**, **Wavesets 2**, **Motion 2**,
  **Lanes 2**, **Grains 2**, and **Cutups 2** are fixed stereo Max
  Instruments. Live MIDI reaches each CLAP note port, audio returns on the
  ordinary stereo track, and selected CLAP parameters are exposed to Live.
  **PLAY** auditions MIDI note 60 on channel 1 (Doubles uses its transport
  Play note 43). **KILL** uses each plugin's Stop All command where available;
  Player resets its voices without unloading media, and Doubles uses Stop so
  its current deck positions can resume.
  Load and edit sample media in the plugin editor. The multichannel Sample
  variants are not part of these wrappers.
- **s3g Sample Circulator 2** is a stereo-input Max Audio Effect so Live
  audio can feed its live-capture input. Its editor provides file loading and
  transport. Its **PLAY** and **KILL** buttons start and pause its loop readers;
  KILL does not erase captured loops. On an audio track, Live does not provide
  the MIDI stream of a MIDI Instrument to this effect.

### Historical 3OA wrappers (not installed)

The following device descriptions document the former 16-channel routing
design. Use the installed `s3g Ambi …` equivalents and the explicit Bus 36
workflow instead; these old names are absent from the User Library.

- **s3g 3OA Source** sends the ordinary stereo track input through a
  unity stereo input meter and independent channel mutes to the two CLAP
  inputs of `s3g Ambi Encoder Medium 16`. It passes the unmuted dry stereo on
  channels 1–2 and puts 16-channel ACN/SN3D on channels 3–18.
- **s3g 3OA Insert** passes channels 1–2 unchanged and hosts a CLAP
  processor across channels 3–18. Its default is `s3g Ambi Effect Gain 64`,
  narrowed to the first 16 channels by the bridge.
- Eight fixed **s3g 3OA Effect …** devices (DJ Filter, Delay, Pitch, Gain,
  Resonance Print, Partial Trace, Response Trace, and Displacement) insert on
  an audio track after an encoder or Source. They process the first 16 3OA
  channels, pass Live's ordinary stereo unchanged, and route their result to
  **NEXT ON** or **MAIN**. The CLAP editor and saved state remain available;
  selected parameters are native Live automation targets.
- **s3g 3OA Decoder Main** receives the named 16-channel `master` bus and
  passes the complete Ambisonic bed through one linked 16-channel input-gain
  control before hosting a decoder with up to 32 outputs. Thirty-two narrow
  paged mono routing grid independently maps decoded channels 1–32 to output slots 1–32.
  **HARDWARE** opens the sixteen underlying Live stereo output routes; assign
  these to interface pairs. The default `s3g Ambi Decoder Head 2` uses slots
  1–2; a speaker decoder can use the remaining slots.
- **s3g 3OA Decoder Head Main** and **s3g 3OA Decoder Stereo Main** are fixed
  stereo endpoints: each receives the 16-channel 3OA master bus and sends its
  decoded two-channel output to the audio track's normal Live output. Set that
  track's Audio To destination to **Master**; no HARDWARE menu is needed.
- **s3g 3OA Decoder Object Main**, **Adaptive Main**, and **Sub Main** are fixed
  hardware endpoints with the same 32-slot mono grid and HARDWARE pair menu as
  Speaker Main. Sub produces up to eight channels; Object and Adaptive expose
  only their first 32 decoded channels through this Live matrix.
- **s3g 3OA Encoder Path** is a fixed wrapper for **s3g Ambi Encoder Path
  64**. Its visible **RCV BUS** selector receives 32 private bus slots
  directly and maps them to 32 CLAP inputs, blocks Live stereo, fixes third
  order, and sends to the private `master` bus. Its compact face has an
  **RCV BUS** dropdown; nineteen stable CLAP parameters remain available in
  Live's automation chooser, including a recalled active **Inputs** count
  from 1–32.
- **s3g 3OA Encoder Point**, **s3g 3OA Encoder Cloud**, and **s3g 3OA Encoder
  Surface Terrain** use the same integrated **RCV BUS** and 32-slot contract. They
  require matching Send Stereo to 32ch Bus devices on source tracks; their saved
  input counts can be reduced below 32.
- **s3g 3OA Encoder Cartography** accepts Live stereo directly. **s3g 3OA
  Encoder Ray** and **s3g 3OA Encoder Ray Bilocation** accept Live channel 1 as mono.
  These fixed wrappers need no multichannel send, pass the dry stereo chain
  through, and publish 16-channel third-order output to MAIN or NEXT.
- **s3g 3OA Encoder Modal** and **s3g 3OA Encoder Medium** are mono-input
  Max Audio Effects with MIDI input; route a separate MIDI track to them when
  note control is needed. **Membrane Kick**, **Acid**, **VOT**, **Vox**, **Wave
  Terrain**, **Stochastic**, and **Neural Ecology** are MIDI-responsive Max
  Instruments. **Horizon**, **Pulsar**, **Wind**, **Water**, **Pyrosphere**,
  **Cryosphere**, **Insect**, and **Wrangler** are autonomous Max Instruments
  without CLAP MIDI note ports. All publish 3OA to MAIN or NEXT, expose selected
  native Live automation parameters, and retain their full editor state.
- **s3g 3OA Decoder Speaker Main** is the matching fixed wrapper for **s3g
  Ambi Decoder Speaker 64**. It fixes third-order decoding, receives and sums
  the private `master` bus, exposes stable decoder parameters to Live, and
  maps speaker channels 1–32 independently to the same mono output slots.

### Other installed endpoints

- **s3g Panner Layout Main**, **s3g Panner DBAP Main**, **s3g Panner LBAP
  Main**, and **s3g Panner VBAP Main** are direct, non-ambisonic hardware
  endpoints. Each receives a numbered generic 32-channel bus from **s3g Send
  Stereo to 32ch Bus** or **s3g Send Multichannel to 32ch Bus**, pans source
  lanes 1–32, and maps speaker lanes 1–32
  through the mono output grid and Live hardware-pair selector. They do not
  receive the 3OA `master` bus.
- **s3g Output Autogain Stereo** receives the generic 32-channel bus and
  returns two channels to its track's ordinary Live stereo output.
  **s3g Output Autogain Quad Main** receives that same bus and assigns its
  L/R/RB/LB outputs individually to mono slots; **HARDWARE** maps the sixteen
  underlying stereo pairs to interface outputs. Put either receiver on a
  dedicated normal audio track and match its **RCV BUS** to the senders'
  **SND BUS**. Their CLAPs have 128 inputs, but only inputs 1–32 are fed by
  this Live bus; higher inputs remain silent even if selected in the editor.

Routing choices use dropdown menus: **Bus** offers 01–16, and the older 32ch
Send's **Pair** menu shows destination slots 01/02 through 31/32. The installed
Ambi Path Encoder has no integrated receiver or bus menu; place Bus Receive 36
before it. Its processed stream always routes to the next same-track device.
Send Stereo to 32ch Bus has separate **LEVEL 1** and **LEVEL 2** faders. **LINKED**
makes either fader move both levels; **UNLINKED** lets them move independently.
Linking again copies level 1 to level 2. Older Sets recall their saved Send
Gain as level 1 and link the channels by default, restoring both inputs to
that value. Pan and mute remain independent; these levels affect the bus feed,
not the dry stereo passthrough.
Existing one-based Live parameter values are preserved for Set recall and
automation. Latency compensation is automatic and has no faceplate control.
Decoder Main's input gain is directly adjustable and shows its value in `live.gain~`.
Faces omit the duplicate device title and routing explanations, use subdued
gray controls, and place **Editor** consistently at the upper left, with
**Load CLAP** beside it on generic Source/Insert wrappers and below it on
generic Decoder Main. Send Stereo to 32ch Bus groups SND BUS, Pair, and
DRY KEEP/BUS ONLY on its top row. Decoder Main's
8 × 32 `matrixctrl` grid shows eight decoded channels per page and all 32 mono
output slots. Live-style buttons and menus use 11-point Arial and a shared
20-pixel control height. Hardware decoder-main faces are 700 pixels wide, with the
linked gain and FILE/REC controls balanced under Editor and HARDWARE.
Source is 324 pixels wide, Path 286, Insert 268, Send Stereo to 32ch Bus 360,
and Multichannel Receive 112. The generator fits each face to its visible
contents with a 12-pixel right margin; all remain 169 pixels high.
Installed Ambi encoder and insert wrappers no longer have a MAIN/NEXT button;
same-track NEXT routing is enabled internally.

Decoder Main's grid rows are decoded channels and columns are mono output slots:
selecting row `01`, column `06` sends decoded channel 1 to slot 6. Click the
lit cell again to disconnect that channel. The **IN 01–08 / 09–16 / 17–24 /
25–32** menu selects the input page; row labels update with it. Two channels can share
a slot and will sum. Slots 01/02 form Live output pair 1, slots 03/04 pair 2,
and so on. Click **HARDWARE** to assign these pairs to the available stereo
interface outputs. Existing pair assignments in a saved Set are retained;
mono assignments default to channel-for-channel routing. Enable the required
stereo interface outputs in Live's Audio Settings.

All decoder-main devices include **FILE** and **REC / STOP** controls for a
16-channel, float32 WAV capture of the incoming ACN/SN3D stream, after input
gain and before decoding. Choose a file, then start and stop the take manually;
choose a file again for each new take. Recording is independent of Live's
transport and never resumes automatically when a Set reopens. Choosing an
existing filename replaces that file, so use a new filename to keep earlier takes.

Put either decoder-main device first on a dedicated normal audio track. Source,
Path Encoder, and Insert devices route to it by default. Path Encoder belongs
on a dedicated track; set its **RCV BUS** to the same number selected on its
source tracks' Send Stereo to 32ch Bus devices. Multiple encoder tracks with
**NEXT** disabled automatically route to and sum at the same private `master`
receiver. Enable **NEXT** when an encoder or Insert must feed the next
multichannel device on its track; leave NEXT disabled on the last device so it
routes to the main bus. The bus transport does not change a track to `Sends
Only`; normal track-output policy remains under the user's control.

The fixed wrappers do not have a plugin picker because their Live automation
maps depend on stable CLAP parameter IDs. They retain the native editor and
save the complete CLAP state, including non-parameter path or speaker data.
Path's visible dials are the actual Live parameters—not display-only mirrors—
and receive feedback from changes made in the native CLAP editor.
Decoder Speaker Main exposes the first 32 decoded outputs; layouts using speakers
33–64 need a wider future output wrapper.
The four Panner Main devices likewise expose only the first 32 of their CLAPs'
64 source and speaker lanes. Put each on its own normal audio track, match its
**RCV BUS** to the senders' **SND BUS**, and assign the desired interface pairs
under **HARDWARE**. Source and speaker layouts remain in the native plugin
editor and are saved with the Live Set.
The new Multichannel Send goes after a device that writes up to 32 channels to
the Live auxiliary chain (channels 3–34). Set **INPUT** to **CHAIN 32**, choose
**CH** 1–32 and **FROM** to choose the first source channel. **TO** displays
the calculated last source channel: CH 8 and FROM 01 shows TO 08. Use
**SLOT** to choose the first destination
slot on the Panner's bus. **STEREO 2** instead reads Live channels 1–2; only
those two channels can be sent in that mode. Source and destination spans wrap
at channel 32. **DRY KEEP**
leaves the ordinary stereo track output audible; **BUS ONLY** mutes it without
muting the multichannel bus feed.

As a package rule, s3g-dsp plugins with more than two inputs consume only the
32 slots supplied by their integrated private-bus receiver. Their wrappers
ignore Live's normal stereo input, so they cannot be fed accidentally by
placing them directly on a conventional audio track. The Max device graph
still has two reserved Live channels plus 32 auxiliary channels internally,
but the plugin-visible input width is 32 rather than 34.

The devices use a private `s3g.*` routing namespace. They do not load or send
to `e4l.*` abstractions, so an Envelop for Live system can coexist in the same
Set without either family acknowledging or rerouting the other. The modified
routing abstractions are derived from Envelop for Live under LGPL-2.1; every
generated Max patch includes an attribution comment and the licenses are
bundled beside the runtime patchers. Placing a decoder-main device first is still
recommended so Live exposes the intended auxiliary inputs.

The private handshake is a protocol change. After updating, reload every s3g
routing-device instance in a Set together; an already-open older instance will
not discover a newly loaded namespaced instance.

Each CLAP device forwards Live timing from `plugsync~`, embeds the complete CLAP
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
python3 -B scripts/generate-m4l-ambi36.py
python3 -B tests/validate_m4l_ambi36_devices.py
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
hard-links the devices to `package/devices`. Live's indexer ignores
directory and file symlinks in the User Library, while hard links remain tied
to the generated repository files and are indexed as ordinary `.amxd` files.
The standard installer now links the Ambi 36-channel wrappers and does not
reinstall the older 3OA device names. Previously installed 3OA links are not
removed by the installer; the one-time replacement was backed up and cleaned
from the User Library separately.
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
