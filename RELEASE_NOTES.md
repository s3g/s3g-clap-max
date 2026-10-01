# s3g-clap-max release notes

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
