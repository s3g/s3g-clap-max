# s3g-clap-max

`s3g-clap-max` hosts CLAP plugins in Max with the `s3g.clap~` object. It also
includes Max for Live devices for s3g-dsp instruments, effects, and
multichannel routing. Install the CLAP plugins separately; this package is the
host and Live bridge, not the plugins themselves.

## Install

You need Max 9 and a CLAP plugin to load. Building from source also requires
CMake and a C++ compiler. The Live devices require Ableton Live with Max for
Live.

On macOS, from a checkout of this repository:

```sh
./scripts/build-release.sh
./scripts/install-local-package.sh
./scripts/install-live-devices.sh  # Only if you use Ableton Live
```

The Max package is linked into `~/Documents/Max 9/Packages`. The Live devices
appear under **User Library → s3g CLAP**. The Live installer uses hard links
because Live may not index symlinks in the User Library; the repository and
User Library must be on the same filesystem. Restart Max and Live after
installing or rebuilding the external.

On Windows, build with Visual Studio 2022 and CMake:

```powershell
cmake --preset windows-msvc
cmake --build --preset windows-msvc
```

Copy `package` to `%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max`. For
Live, copy the `.amxd` files you want from `package\devices` into a normal
folder in your User Library. The Live installation script above is for macOS.

## Use in Max

Create `s3g.clap~` with its input and output channel counts:

```max
[s3g.clap~ 2 2]
```

Send `open` to choose a CLAP plugin, or load one by name with a message such as
`open "s3g Ambi Encoder Stochastic"`. Send `editor 1` to show its plugin editor.
For Max multichannel signals, add `@mc 1`, for example
`[s3g.clap~ 16 16 @mc 1]`. Open `s3g.clap~.maxhelp` in Max for the remaining
messages, MIDI, parameters, and state controls.

## Use in Ableton Live

Live does not load CLAP plugins directly. Add one of the installed s3g Max for
Live devices from **User Library → s3g CLAP** instead. The Drum and stereo
Sample devices work on ordinary Live tracks. Fixed wrappers expose selected
parameters to Live automation; **EDITOR** opens the CLAP editor. Saving a Live
Set stores the plugin's state, but the CLAP plugin must also be installed on
the machine that reopens it.

### Available wrappers

The current installer includes dedicated wrappers for these 65 s3g-dsp plugins
(names below omit the shared `s3g` prefix and CLAP channel suffix):

- **Ambi Encoder:** Acid, Cartography, Cloud, Cryosphere, Horizon, Insect,
  Medium, Membrane Kick, Modal, Neural Ecology, Path, Point, Pulsar,
  Pyrosphere, Ray, Ray Bilocation, Stochastic, Surface Terrain, VOT, Vox,
  Water, Wave Terrain, Wind, Wrangler.
- **Ambi Effect:** DJ Filter, Delay, Displacement, Gain, Partial Trace,
  Pitch, Resonance Print, Response Trace.
- **Ambi Decoder:** Adaptive, Head, Object, Speaker, Stereo, Sub (each has a
  `Main` wrapper).
- **Panner:** DBAP, LBAP, Layout, VBAP (each has a `Main` wrapper).
- **Output:** Autogain Stereo, Autogain Quad Main.
- **Drum:** Break, Clap, Concert Bass, Cowbell, Crash, Echo, Floor Tom,
  Hi-Hat, Kick, Mixer 16, Overload, Snare, Toms.
- **Sample:** Circulator 2, Cutups 2, Doubles 2, Grains 2, Lanes 2, Motion 2,
  Player 2, Wavesets 2.

The installer also includes general-purpose Ambi Source, Insert, and Decoder
Main devices, plus multichannel routing devices. Other plugins in the
[s3g-dsp plugin index](https://s3g.github.io/s3g-dsp/plugin-index.html) do
not yet have dedicated M4L wrappers, though `s3g.clap~` can host them in Max.

For a multichannel Ambisonic chain across tracks:

1. Put an **s3g Ambi Encoder …** device on the source track, followed by
   **s3g Bus Send 36**. Set Send's **INPUT** to **CHAIN 36**, **CH** to the
   active channel count, and choose a **BUS** number.
2. On a separate audio track, place **s3g Bus Receive 36** before an
   **s3g Ambi Decoder …** device. Select the same **BUS** number. Use
   Receive's **MON** menu to audition a bus pair if needed.
3. A stereo decoder uses the track's normal Live output. A hardware-output
   **Main** decoder provides **HARDWARE** output-pair assignments for an audio
   interface.

The Bus 36 transport carries up to 36 channels, enough for fifth-order
Ambisonics. Use a different bus number for each cross-track stage; multiple
Sends can feed one Receive on a bus. To feed a multichannel-input encoder,
place another Send/Receive pair *before* it. Same-track Ambi effects can sit
between the encoder and Send without another bus pair.

The separate 32-channel and Drum 16-channel buses serve the Panner, Autogain,
and Drum workflows. See the [routing guide](package/docs/s3g-clap-m4l-routing.md)
for device-specific setups and limitations.

## License

The project is BSD 3-Clause. The routing abstractions include modified
Envelop for Live code under LGPL-2.1; see
[third-party notices](THIRD_PARTY_NOTICES.md).
