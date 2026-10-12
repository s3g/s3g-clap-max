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

The current installer includes dedicated wrappers for these 77 s3g-dsp plugins
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
- **Effect:** Delay Field, Spectral Spray 2, Spectral Spray 8.
- **Processor:** Buffer 8, Delay 8, Delay 24, Feedback Shift 8, Fissure 8,
  Spectral 8, Spectral 24, Wave Geometry 8.
- **Matrix:** Group 32.
- **Drum:** Break, Clap, Concert Bass, Cowbell, Crash, Echo, Floor Tom,
  Hi-Hat, Kick, Mixer 16, Overload, Snare, Toms.
- **Sample:** Circulator 2, Cutups 2, Doubles 2, Grains 2, Lanes 2, Motion 2,
  Player 2, Wavesets 2.

The installer also includes multichannel send and receive devices. Other
plugins in the
[s3g-dsp plugin index](https://s3g.github.io/s3g-dsp/plugin-index.html)
do not yet have dedicated M4L wrappers, though `s3g.clap~` can host them in Max.

Spectral Spray 2 is a normal stereo insert. Delay Field takes Live stereo input
and puts its 16 outputs in multichannel chain slots 1–16. Follow it with
**s3g Bus Send 36** set to
**INPUT = CHAIN 36** and **CH = 16**. Spectral Spray 8, Buffer 8, Delay 8/24,
Wave Geometry 8, and Matrix Group 32 take input from a preceding
**s3g Bus Receive 36**; follow them with another Bus Send 36 set to
**CHAIN 36** and **CH** to the plugin's output count.
The track's normal stereo lane remains separate. Use a different bus number
for each cross-track stage.

Spectral 8/24 and Feedback Shift 8 use this same receive/send pattern with
their respective 8- or 24-channel widths. Feedback Shift accepts MIDI note
excitation and has an **EXCITE** button. Fissure 8 instead takes optional Live
stereo input, accepts MIDI notes, and has a **STRIKE** button. Its eight output
slots need a following Bus Send 36 set to **CHAIN 36**, **CH 8**; output mode
can fold to the first two or four slots without changing its fixed bus width.

Not every CLAP is a good fit for this 36-channel bus. We are leaving the
64/128-channel **Ambi Matrix Group** and **Ambi Transform Grp Rot** variants,
128-channel **Mixer Node Bus** variants, and **Array Calibrate 64** unwrapped:
their full port width cannot pass through the present 36-slot bus. These are
intentional omissions, not reduced-channel wrappers. Other plugins in the
index are still to be evaluated.

Cascade Taps, Orbit Delay, and Shard Scatter are retired upstream; their
models are available in Delay Field 16, so separate M4L wrappers are omitted.

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

The same explicit pair also feeds the Panner Mains, Output Autogain, and Drum
Mixer 16: put **Bus Receive 36** immediately before the wrapper. Panner and
Autogain read all 36 slots; Drum Mixer reads slots 1–16 as eight stereo pairs.
For Drum sources, set each **Bus Send 36** to **STEREO 2**, **CH 2**, and an odd
**SLOT** from 01 to 15. See the
[routing guide](package/docs/s3g-clap-m4l-routing.md) for more detail.

## License

The project is BSD 3-Clause. The routing abstractions include modified
Envelop for Live code under LGPL-2.1; see
[third-party notices](THIRD_PARTY_NOTICES.md).
