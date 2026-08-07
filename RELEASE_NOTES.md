# s3g-clap-max release notes

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

1. Unzip `s3g-clap-max-0.4.1-macos-universal.zip`.
2. Place the resulting `s3g-clap-max` folder in
   `~/Documents/Max 9/Packages/`.
3. Restart Max.
4. Open `s3g.clap~.maxhelp`.

The included external is an ad-hoc-signed universal macOS binary supporting
Apple Silicon and Intel.
