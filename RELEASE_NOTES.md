# s3g-clap-max release notes

## Unreleased

### Added

- Add fixed stereo Max Instrument wrappers for Sample Player, Doubles,
  Wavesets, Motion, Lanes, Grains, and Cutups. They forward Live MIDI to the
  corresponding stereo CLAP IDs, return two ordinary Live audio channels,
  save editor state, and expose selected parameters to Live automation. Add
  Sample Circulator 2 separately as a stereo-input Max Audio Effect so it can
  capture a Live audio track without losing its two-channel input.

- Add fixed Max for Live wrappers for the ten stereo MIDI Drum instruments,
  stereo Drum Overload and Echo effects, and Drum Mixer 16. A dedicated
  eight-pair **s3g Send Stereo to Drum 16ch Bus** feeds the mixer without
  sharing the generic 32-channel or 3OA bus namespace. The mixer's sum feeds
  Live stereo; its direct channels also remain on the auxiliary device chain.

- Prevent large CLAP state blobs from overflowing Max's signed-short outlet
  atom count. Keep the original stored-state payload for small plugins and
  use a lossless compact payload under the same `s3g.clap.state.1` tag for
  Wrangler-sized states. Restore both forms; reject a state that still cannot
  fit one Max message instead of emitting a truncated count.

- Add eight fixed **s3g 3OA Effect …** 16-channel inserts with MAIN/NEXT
  chaining and selected native Live automation parameters. Add fixed Head and
  Stereo decoders that feed their audio track's ordinary stereo output, and
  fixed Object, Adaptive, and Sub decoders that use the 32-slot mono hardware
  output matrix. All five decoders receive the private 3OA master bus and have
  pre-decoder gain and manual 16-channel recording.
- Rename the generic send to **s3g Send Stereo to 32ch Bus**, keeping its
  private bus symbols and channel layout unchanged. The old device filename
  is intentionally not retained as a compatibility alias.

- Add fixed 3OA wrappers for the remaining 17 Ambi Encoder generators:
  Modal and Medium as mono-input, MIDI-routable audio effects; seven
  MIDI-responsive zero-input encoders as Max Instruments; and eight
  autonomous zero-input encoders as Max Instruments. Their first 16 outputs
  use the existing private MAIN/NEXT 3OA path, with native Live automation
  selections and saved CLAP editor state.

- Name the two hardware-output wrappers **s3g 3OA Decoder Main** and
  **s3g 3OA Decoder Speaker Main**. Here `3OA` replaces `Ambi`, while `Main`
  identifies the hardware-output endpoint for the 3OA routing bus.

- Publish 3OA wrappers under s3g-dsp-style filenames such as **s3g 3OA
  Encoder Cloud**, omitting "CLAP" and placing "Encoder" before its kind.
  The generator, package, and User Library use only the new device names.

- Add fixed 3OA Point, Cloud, and Surface Terrain encoder wrappers with
  integrated 32-slot RCV BUS input, plus stereo Cartography and mono Ray/Ray
  Bilocation wrappers for Live's ordinary track inputs. All use stable CLAP
  IDs, third-order output, private MAIN/NEXT routing, saved CLAP state, and
  selected native Live automation parameters.

- Add format-agnostic **s3g Send Stereo to 32ch Bus** and **s3g Multichannel
  Receive** Max for Live devices. Up to sixteen source tracks can occupy
  distinct stereo pairs on one private 32-channel bus, or intentionally sum
  into a shared pair.
- Store bus, pair, send gain, and dry-output choices as native Live parameters.
  Provide sixteen independently named multichannel buses without sharing the
  existing 3OA `master` bus.
- Route Receive's 32 auxiliary outputs into the immediately following device
  in insert mode; exposing `plugout~` channels alone does not make Live connect
  auxiliary channels across a device-chain boundary.
- Convert **s3g 3OA Encoder Path** to the shared 32-slot input contract.
  It now exposes a stored **Input Bus** selector, receives the private bus
  directly without a separate Receive device, maps slots 1–32 to the first 32
  inputs of Path 64, exposes and recalls an active `Input Count` from 1–32,
  and blocks Live's stereo lane.
- Add one stored, automatable 16-channel `live.gain~` input control to both
  decoder-main wrappers. It scales and meters the complete Ambisonic bed
  before decoding while preserving all channels independently.
- Add manual **FILE / REC / STOP** controls and an elapsed-time display to
  both decoder-main wrappers using `sfrecord~ 16`. Record float32 WAV in native
  ACN/SN3D order after input gain and before decoding. Require file selection
  for each take, disable file replacement during recording, and stop on
  stalled elapsed time. Recording never starts or opens a file on Set recall.
- Add 32 stored mono output assignments to both decoder-main devices. A signal matrix
  maps each decoded channel to a chosen slot or silence, with identity as the
  default. The HARDWARE button opens the existing Live output pair routes.
- Give Send Stereo to 32ch Bus separate metered mono gain controls for input channels
  1 and 2, plus a stored LINKED / UNLINKED switch. Linked is the default and
  copies level 1 to level 2 on recall or when re-enabled. Keep the original
  Send Gain parameter as level 1 for older Live Sets; pan and mute remain
  independent, and dry passthrough is unchanged.

### Changed

- Re-assert saved send/receive bus menu selections after Live device readiness
  in Send Stereo to 32ch Bus, Receive, and Path Encoder. Gate menu write-back during
  the startup replay so it cannot replace saved bus values or automation.
- Make Decoder Main's paged mono routing grid use square 14-pixel cells so its
  matrix dots render round, while retaining the same route parameters and
  hardware-output assignments. Both decoder-main faces now fit 700 pixels.
- Label the Send Stereo to 32ch Bus face **SND BUS** and the Path Encoder face
  **RCV BUS**, spacing their top rows so neither label is clipped. Keep the
  existing saved Live bus parameter names and 1–16 values.
- Replace Decoder Main's 32 narrow mono menus with a paged 8 × 32 `matrixctrl`
  editor. Retain the same 32 native Live route parameters and mono signal
  matrix for saved Sets and automation. Show the linked gain value inside
  `live.gain~` and place FILE/REC below it.
- Match E4L's automation topology for fixed wrappers: native Live parameters
  connect directly to the processor and preserve their explicit top-level
  parameter order. Path Encoder uses a compact 286-pixel face; its nineteen
  stable parameters are available in Live's automation chooser. Add
  `automateparamid` to
  `s3g.clap~` so Live-owned automation does not mark the opaque CLAP state
  manually modified and disable the active envelope.
- Return CLAP editor feedback to the fixed Live controls
  with `set` rather than a normal value. This updates the displayed control
  without re-emitting it and taking control away from an active Arrangement
  automation envelope.
- Use dropdown menus for Bus, Input Bus, and destination Pair, retaining the
  saved one-based Live parameters. Pair labels show their actual bus slots
  (01/02 through 31/32). Keep the decoder gain value in `live.gain~`.
- Remove duplicate faceplate titles, badges, routing explanations, and the
  latency display; preserve automatic latency compensation. Use subdued gray
  text and dials, larger explicitly colored Editor/Load buttons, a consistent
  Editor position, and **MAIN / NEXT ON** route labels.
- Use native momentary `live.text` action buttons, 11-point Arial, consistent
  20-pixel buttons/menus, a shared top toolbar, and aligned gain/pan/mute groups.
  Decoder Main's sixteen 100 × 20 pixel Live hardware pair menus remain readable
  in the HARDWARE window.
- Make the shared s3g bus sender non-invasive: it no longer changes a Live
  track's normal output routing to **Sends Only**. Generic Send provides an
  explicit **DRY KEEP / BUS ONLY** control instead.
- Define 32 as the public multichannel width. Wrappers for s3g-dsp plugins with
  more than two inputs integrate a private-bus receiver, ignore Live's reserved
  stereo lane, and consume only the 32 bus slots. The 34-channel Max declaration
  remains internal Live routing scaffolding. Standalone Receive remains an
  optional adapter for non-integrated multichannel devices.
- Require every generated CLAP wrapper with more than two inputs to use the
  same auxiliary-slot mapping. Source inspection identifies Path, Cloud,
  Point, and Surface Terrain as the Ambisonic encoders with 64 physical inputs;
  all four fixed wrappers now share this layout.
- Generalize the private bus abstraction's in-patcher descriptions so the
  transport no longer claims that all routed audio is 16-channel Ambisonics.
- Retain the E4L-inspired Decoder Main separation: linked 16-channel input gain on
  the left and output routing on the right. Widen the gain control so its
  triangle stays visible; place generic Decoder Main's Load CLAP button below Editor.
- Align Path's Input Bus menu with Editor and MAIN/NEXT; put Multichannel
  Send's Bus, Pair, and dry-output switch together in its top row. Move the
  standalone Receive bus menu to the same top-row alignment.
- Fit device width to visible controls plus a 12-pixel right margin. Reduce
  Source to 324 pixels, Path to 286, Insert to 268, Send to 360, and Receive to 112;
  fit Decoder Main at 700 for its paged mono assignment matrix. Retain
  the full 169-pixel height and black background.

## v0.6.0 — 2026-10-01

This release adds a self-contained Max for Live path for the s3g 3OA CLAP
plugins, using an independent routing namespace that can coexist with Envelop
for Live without cross-routing.

### Added

- Add Source, Insert, and Main Out M4L audio devices using the compatible
  18-channel chain layout: stereo on channels 1–2 and 16-channel ACN/SN3D on
  channels 3–18.
- Add a fixed **Path Encoder** / **Speaker Main Out** pair. Path always hosts
  `s3g Ambi Encoder Path 64`, forces two inputs and third order, and publishes
  its remaining stable CLAP parameters to Live automation. Speaker Main Out
  always hosts `s3g Ambi Decoder Speaker 64`, forces third order, and combines
  its parameter automation with the tested sixteen hardware-output-pair
  selectors.
- Synchronize fixed-wrapper automation in both directions: Live changes are
  sent by stable CLAP ID, while native-editor changes and post-restore
  `getparams` snapshots update parameter-enabled `live.numbox` objects with
  feedback-suppressing `set` messages.
  Keep the complete CLAP state Blob authoritative for non-parameter path and
  speaker-layout data.
- Replace the fixed wrappers' hidden numeric `pattr` automation controls with
  native `live.numbox` parameters. Live automation now leaves a standard Live
  parameter outlet and reaches CLAP directly by stable parameter ID.
- Use Max-supported numeric trigger outlets for fixed-wrapper parameter
  forwarding. The earlier `a` trigger argument was interpreted as a literal
  symbol and could send a stray `a` command to `s3g.clap~` when a device opened.
- Vendor the required LGPL-2.1 Envelop for Live bus and Live-control source
  abstractions outside the Max package search path, and generate credited,
  s3g-namespaced runtime variants from them.
- Persist the selected CLAP path, exact plugin ID, and binary state through a
  Live-native hidden, parameter-enabled `pattr` Blob. Devices explicitly
  request `state` payloads with `getstate`, capture them without echo, and
  restore them with `setstate`; this avoids Live's empty serialization of a
  Blob implicitly bound to a non-UI MSP external.
- Use Max for Live parameter type `3` for that Blob. Type `4` is a file-drop
  parameter and caused Live to save `MxDEmptyFileDrop` instead of CLAP state.
  Filter restores by the `s3g.clap.state.1` tag so an empty/default parameter
  can never be sent to `setstate`.
- Make Blob capture strictly one-way with `pattr @thru 0`; request restore once
  after `s3g.live.thisdevice` initializes, then open a gate for later captures.
  This removes a capture/restore feedback loop that repeatedly reloaded the
  plugin and could destroy an open Cocoa editor from Live's AudioCalc thread.
- Restore state into an already-open matching CLAP instance instead of closing
  and reopening it, preserving its editor and avoiding unnecessary GUI churn.
- Forward Live play state, tempo, timeline positions, and time signature from
  `plugsync~` into CLAP transport events.
- Host the CLAP latency extension, report latency changes in samples, and
  forward them to each M4L device's Defined Latency.
- Add reproducible device generation and structural validation scripts.
- Add `scripts/install-live-devices.sh`, which uses indexer-compatible hard
  links to expose all five development devices in Ableton's User Library.

### Changed

- Report one MC channel for each discrete `s3g.clap~` signal outlet. Max 9.1
  uses `multichanneloutputs` while compiling ordinary DSP graphs; reporting
  zero produced null downstream signal descriptors and crashed Live 12.3.6.
- Use an explicitly typed status outlet and defer each device's default CLAP
  load until after Live constructs the initial DSP graph.
- Normalize the **Load CLAP** and **Editor** text-button outputs to bangs before
  sending their messages to `s3g.clap~`.
- Move the devices onto a fully private `s3g.*` routing layer, including its
  global bus handshake, so Envelop and s3g devices cannot accidentally send
  to or acknowledge each other. Bypass the borrowed receiver's brittle
  device-order validator. Existing Sets must reload all s3g routing devices
  together rather than mixing already-open legacy instances with new ones.
- Rename the output device to **s3g CLAP 3OA Main Out**.
- Expand Main Out to 34 Live device outputs: track stereo plus sixteen decoded
  stereo pairs with independent Live external-hardware routing selectors. Its
  CLAP slot now accepts up to 32 decoder outputs, supporting both the default
  binaural decoder and multichannel loudspeaker decoders.
- Restyle all three devices with the s3g grayscale palette and compact
  monospaced controls. Main Out now fits all sixteen pair menus in a 425 × 169
  Live device using a four-by-four routing matrix.
- Give the Source host two CLAP inputs and preserve Live's left/right channels
  independently, removing the earlier mono sum.
- Add an editable stereo `live.gain~` input trim/meter and independent stored
  mute buttons before the Source CLAP inputs. Its triangle remains visible in
  normal and focused states. The ordinary stereo passthrough is unaffected so
  input and encoded signal flow can be checked independently.
- On each Source plugin load, find an exact `Input Count` parameter by name and
  set its reported CLAP parameter ID to `2`, avoiding encoder-specific IDs.

### Verification

- Universal macOS Max external and generic host smoke executable build.
- Host smoke test passes with Ambi Encoder Medium while CLAP transport is
  active and latency is queried.
- Generated Max patchers and AMXD headers, payloads, explicit state bridges,
  native Live automation parameters,
  topologies, transport wiring, latency wiring, and routing dependencies pass
  the structural device validator.

Live still needs to perform the final host-level check: load the Master and a
Source, verify bus discovery, save/reopen a Set to confirm state recall, and
confirm the latency shown in the device title bar.

## v0.5.0 — 2026-09-11

This release adds first-class Windows x64 support and updates the host build
to the current pinned CLAP and Max SDK baselines.

### Added

- Build `s3g.clap~.mxe64` with Visual Studio 2022 on Windows or MinGW-w64 from
  macOS/Linux.
- Host embedded and floating Win32 CLAP plugin editors in a native resizable
  window.
- Search the standard system and per-user Windows CLAP locations.
- Preserve UTF-8 plugin and state paths when calling Windows wide-character
  filesystem and loader APIs.
- Package a Windows-only Max distribution with
  `scripts/package-windows-release.sh`.
- Rebuild both platform objects and package them together with
  `scripts/package-combined-release.sh`.

### Changed

- Update the pinned CLAP headers from 1.2.6 to 1.2.10.
- Pin `max-sdk-base` to its current `c03a292` baseline, correcting the prior
  invalid SDK commit setting.
- Keep native plugin modules mapped for process lifetime on both supported
  platforms so delayed GUI callbacks cannot reference unloaded code.

### Verification

- Universal macOS arm64/x86_64 external build and CLAP 1.2.10 host smoke test.
- Windows x64 PE/COFF external and Windows host smoke executable cross-build.
- Windows export/import inspection for `ext_main`, `MaxAPI.dll`,
  `MaxAudio.dll`, and Win32 system libraries.

Windows runtime validation in Max is still required on a Windows machine;
the included Windows artifact is cross-compiled and statically inspected.

## v0.4.1 — 2026-08-07

This release makes the object channel arguments describe only the channels
visible in Max, rather than requiring them to cover the plugin's full static
CLAP port width.

### Changed

- Host plugins whose reported CLAP input or output width exceeds the object
  arguments.
- Supply silence to hidden plugin input channels and discard hidden plugin
  output channels.
- Limit an incoming MC signal to the requested visible input width and
  zero-pad it when fewer channels arrive.
- Allow a fixed 64-output ambisonic plugin to expose only its first 16 channels
  for 3OA:

  ```max
  [s3g.clap~ 0 16 "s3g Ambi Encoder Stochastic" @mc 1]
  ```

The full CLAP-reported input and output counts remain available in the
`loaded` status message.

### Verification

- Encoder Stochastic processes through a 16-channel visible output while its
  CLAP port continues to report 64 channels.
- Array HPF 16 passes silent, partial-width input and narrowed-output checks.

## v0.4.0 — 2026-08-07

This release adds native Max multichannel-signal topology while retaining the
discrete topology and all prior CLAP host features.

### Added

- Add `@mc 1` to expose one MC signal inlet and one MC signal outlet.
- Keep the first two object arguments as the maximum flattened CLAP input and
  output channel counts in both modes.
- Support output-only MC instruments such as:

  ```max
  [s3g.clap~ 0 64 "s3g Ambi Encoder Stochastic" @mc 1]
  ```

- Zero-pad missing MC input channels before passing buffers to 64-bit CLAP
  processors.
- Keep the rightmost status outlet as a standard message outlet in MC mode.

`mc` is a construction-time attribute. Recreate the object to switch between
MC and discrete topology.

### Verification

- The external builds as a universal arm64/x86_64 Max bundle.
- Encoder Stochastic passes discovery, processor, parameter, native-editor,
  final-instance close, module-reuse, and autorelease-pool shutdown checks.
- Array HPF 16 passes 16-input/16-output processing with all MC input channels
  absent, verifying safe silent-input padding.

## v0.3.0 — 2026-08-07

This release adds automatic CLAP discovery while retaining all v0.2.1 host
features and shutdown protections.

### Added

- Load plugins by bundle filename, display name, or bundle identifier.
- Use a plugin name directly in the Max object:

  ```max
  [s3g.clap~ 0 64 "s3g Ambi Encoder Stochastic"]
  ```

- Use a name with the `open` message:

  ```max
  open "Encoder Stochastic"
  ```

- Search `CLAP_PATH` entries before the platform-standard CLAP locations.
- Recursively discover `.clap` bundles without loading their executables.
- Ignore case, spaces, underscores, hyphens, and punctuation during matching.
- Accept unique partial names and report candidate paths for ambiguous names.
- Report active discovery roots with the `getpaths` message.

### Verification

- Exact bundle-name, human-readable-name, bundle-identifier, `CLAP_PATH`, and
  ambiguity behavior are covered by the host smoke test.
- Encoder Stochastic is exercised with its native editor, 0-input/64-output
  topology, final-instance close, module reuse, and autorelease-pool shutdown.

## v0.2.1 — 2026-08-06

Initial distribution of `s3g.clap~`, a native Max/MSP external for hosting
CLAP audio plugins.

### Features

- Load macOS `.clap` bundles through a native selection dialog or direct path.
- Process audio with fixed input and output channel counts selected when the
  Max object is created.
- Enumerate, inspect, and control CLAP parameters.
- Send and receive MIDI events.
- Read and write plugin state through the CLAP state extension.
- Host embedded and floating native Cocoa plugin editors.
- Use a control interface modeled after the useful parts of Max's `vst~`
  object.

### Shutdown fix

v0.2.1 keeps initialized CLAP modules mapped for Max's process lifetime. This
prevents crashes when Max closes while a plugin's Cocoa editor still has
pending Objective-C objects. The fix was verified with the 64-output
**s3g Ambi Encoder Stochastic** plugin and its native editor open.

## Installation

1. Unzip the `s3g-clap-max-0.6.0` archive for your platform.
2. Place the resulting `s3g-clap-max` folder in
   `~/Documents/Max 9/Packages/`.
3. Restart Max.
4. Open `s3g.clap~.maxhelp`.

The macOS archive contains an ad-hoc-signed universal external for Apple
Silicon and Intel. The Windows archive contains a native x64 `.mxe64`.
