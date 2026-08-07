# s3g-clap-max

`s3g-clap-max` is a native Max/MSP package for hosting CLAP audio plugins.
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

- `open` shows a native macOS picker that accepts `.clap` bundles.
- `open <path-or-name> [plugin-id]` loads a bundle and optional factory plugin
  ID. A quoted display name such as `open "s3g Ambi Encoder Stochastic"` is
  resolved through `CLAP_PATH` and the standard CLAP locations. Without an ID,
  the first descriptor is selected.
- `getpaths` reports the active CLAP search roots as `clappath` messages.
- `close`, `status`, and `getplugins` manage and inspect the loaded bundle.
- `getparams` outputs `params <count>`, one `paraminfo` message per parameter,
  and `paramsdone <count>`. Each `paraminfo` message contains `<index> <id>
  <current> <min> <max> <default> <flags> <name> <module> <display-text>`.
  Public parameter indexes are one-based, like `vst~`.
- `param <index> <plain-value>` and `paramid <clap-id> <plain-value>` set
  parameters.
- `getparam <index>` outputs `paramvalue <index> <value> <display-text>`.
- `editor` or `editor 1` opens the plugin's native Cocoa GUI. `editor 0` hides
  it. Embedded and floating CLAP GUIs are supported.
- `midievent <status> <data1> <data2>` sends MIDI to note port 0;
  `midievent <port> <status> <data1> <data2>` selects another port.
- `statewrite <path>` and `stateread <path>` use the CLAP state extension.

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
`/Library/Audio/Plug-Ins/CLAP` on macOS. It matches bundle filenames, native
bundle display names, and bundle identifiers without loading plugin
executables. Case, spaces, underscores, hyphens, and punctuation are ignored.
A unique substring such as `"Encoder Stochastic"` is accepted; ambiguous
matches produce an error with candidate paths.

Loaded CLAP modules remain initialized and mapped until Max exits. This avoids
unsafe Cocoa class unloading when a native editor leaves objects pending in
Max's autorelease pool. Restart Max after rebuilding a CLAP plugin that has
already been loaded during the current session.

## Build

The build fetches pinned CLAP and `max-sdk-base` sources when local paths are
not supplied. On macOS it produces a universal arm64/x86_64 external directly
inside `package/externals`:

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

## Current scope

The host covers processor lifecycle, audio, parameters, MIDI, plugin state,
native Cocoa editors, host callbacks, and basic restart requests. It does not
yet provide Max patcher-embedded state, transport events, latency compensation,
preset discovery, or dynamic audio-port reconfiguration.

## License

The project is available under the BSD 3-Clause License. Dependency notices
are in `THIRD_PARTY_NOTICES.md`.
