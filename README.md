# s3g-clap-max

`s3g-clap-max` hosts CLAP plugins in Max with the `s3g.clap~` object. It also
includes Max for Live devices for s3g-dsp instruments, effects, and
multichannel routing. The Max package, the Live devices, and the s3g-dsp CLAP
plugins are three separate pieces. A device can appear in Live even when its
CLAP plugin is missing; in that case it cannot load or open its editor.

## Install

Install in this order:

1. Install the [s3g-dsp CLAP plugins](https://s3g.github.io/s3g-dsp/installing-plugins.html)
   first. On macOS the packaged installer places them in
   `~/Library/Audio/Plug-Ins/CLAP/s3g-dsp/`. Keep each complete `.clap` bundle
   there; `.amxd` devices do not contain the plugins.
2. Install Max 9. For the Live devices, also use a version of Ableton Live
   with Max for Live. Building this Max package from source requires CMake and
   a C++ compiler.
3. Install the `s3g-clap-max` Max package and, if using Live, its `.amxd`
   devices as described below.

On macOS, from a checkout of this repository:

```sh
./scripts/build-release.sh
./scripts/install-local-package.sh
./scripts/install-live-devices.sh  # Only if you use Ableton Live
```

The Max package is linked into `~/Documents/Max 9/Packages`. The Live devices
appear under **User Library → s3g CLAP**. The Live installer uses hard links
because Live may not index symlinks in the User Library; the repository and
User Library must be on the same filesystem. If your User Library is elsewhere,
set `S3G_LIVE_DEVICE_ROOT` to its intended `s3g CLAP` folder before running
the Live installer. Restart Max and Live after installing or rebuilding the
external.

On Windows, build with Visual Studio 2022 and CMake:

```powershell
cmake --preset windows-msvc
cmake --build --preset windows-msvc
```

Install the s3g-dsp Windows CLAP package separately, then copy `package` to
`%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max`. For Live, copy the
`.amxd` files you want from `package\devices` into a normal folder in your
User Library. The Live installation script above is for macOS; the s3g-dsp
Windows package and its Live workflow remain experimental.

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
the machine that reopens it. If a device appears but its plugin does not load,
check the installed CLAP bundle and Max package before reinstalling the
`.amxd` device. See the [Ableton Live setup guide](https://s3g.github.io/s3g-dsp/ableton-live.html)
for a first-use routing example and troubleshooting.

### Sample storage in Live

Some Sample plugins offer **STORE PROJECT / LINK / EMBED** in their editors;
new instances may show PROJECT. Choose **LINK** to keep samples at their
original file paths, or **EMBED** when the plugin supports storing the audio
inside its state. Keep linked files available when moving a Set to another
computer. **PROJECT** does not automatically collect files into an Ableton
Project. Saving the Set preserves the selected mode, so close and reopen a
test Set to confirm its samples are available before a performance or transfer.

### Available wrappers

The current installer includes dedicated wrappers for these 118 s3g-dsp plugins
(names below omit the shared `s3g` prefix):

- **Tracker:** channel-addressed MIDI sequencer.
- **Ambi Encoder:** Acid, Cartography, Cloud, Cryosphere, Horizon, Insect,
  Medium, Membrane Kick, Modal, Neural Ecology, Path, Point, Pulsar,
  Pyrosphere, Ray, Ray Bilocation, Stochastic, Surface Terrain, VOT, Vox,
  Water, Wave Terrain, Wind, Wrangler.
- **Ambi Effect:** DJ Filter, Delay, Displacement, Gain, Partial Trace,
  Pitch, Resonance Print, Response Trace.
- **Ambi Transform:** Depth 16, Rot 64, Order Band 64.
- **Ambi Decoder:** Adaptive, Head, Object, Speaker, Stereo, Sub.
- **Analyzer:** Meter 64, Ambi Energy 64.
- **Panner:** DBAP, LBAP, Layout, VBAP.
- **Output:** Autogain Stereo, Autogain Quad, Crossover 64.
- **Array Calibrate:** 16, 26, 32.
- **Effect:** Delay Field, Spectral Spray 2, Spectral Spray 8.
- **Processor:** Ambi Grain 16, Ambi Imprint 64, Buffer 8, Conduit 2,
  Delay 8, Delay 24, Errant 2, Fault 8, Feedback Shift 8, Fissure 8,
  Formant Matrix 2, LF Synth 2, Lowform 2, No Input Mixer 8, Spectral 8, Spectral 24,
  Stack 2, Wave Geometry 8.
- **Macro:** Delay 8/24, Pitch 8/24, Fracture Mono 1/8/24,
  Shred Mono 1/8/24.
- **Matrix:** Group 32, Upmix 64.
- **Drum:** Break, Clap, Concert Bass, Cowbell, Crash, Echo, Floor Tom,
  Hi-Hat, Kick, Mixer 16, Overload, Snare, Toms.
- **Sample:** Circulator 2, Cutups 2/32, Doubles 2, Grains 2/32, Kit 32,
  Lanes 2/32, Motion 2/32, Player 2/16, Rings 8, Slicer 2/16,
  Wavesets 2/32.

The installer also includes **s3g Bus Send 36**, **s3g Bus Receive 36**, and
the CLAP-free **s3g Main Hardware Out 32**. Other
plugins in the
[s3g-dsp plugin index](https://s3g.github.io/s3g-dsp/plugin-index.html)
do not yet have dedicated M4L wrappers, though `s3g.clap~` can host them in Max.

For Tracker, place **s3g Tracker** on a MIDI track and choose its **MIDI BUS**
(1–16). On each receiving s3g instrument wrapper, choose the same **MIDI BUS**;
the default **OFF** disconnects it. Set that CLAP's own MIDI receive channel
in its editor to the desired Tracker lane. The separate Tracker bus preserves
MIDI status/channel bytes; it does not use Live's inter-track MIDI routing or
the 36-channel audio bus. For more detail and timing caveats, see
[the M4L routing guide](package/docs/s3g-clap-m4l-routing.md).

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

Array Calibrate 16/26/32 is a matching-width multichannel insert for a
rendered speaker feed. Put Bus Receive 36 before it when the feed comes from
another track. Follow it with Main Hardware Out 32 on the same track, or use
Bus Send 36 set to **INPUT = CHAIN 36** and **CH** to the calibration width
when another track handles output. Array Calibrate 64 is not supported by the
current hardware-out device.

Matrix Upmix 64 and Output Crossover 64 use a **32-input/32-output Live
profile** of their unchanged 64-channel CLAP plugins. Put Bus Receive 36
before either wrapper; only received slots 1–32 are read. Their outputs
occupy chain slots 1–32 and can feed Main Hardware Out 32 on the same track,
or Bus Send 36 set to **INPUT = CHAIN 36, CH = 32** for another track.
In Matrix Upmix, choose input and output formats with at most 32 channels.
In Output Crossover, keep **High Channels ≤ 32** and
**Sub Offset + Sub Count − 1 ≤ 32**; any subwoofer slot above 32 is not
available in Live. The plugin editors still offer 64-channel formats, but
those channels cannot pass through these wrappers.

Processor Fault 8 and Processor Ambi Grain 16 have no audio input; their
outputs occupy chain slots 1–8 and 1–16 respectively. Follow either with
Bus Send 36 set to **INPUT = CHAIN 36** and the matching **CH**, or put Main
Hardware Out 32 after Fault for direct speaker output. Ambi Grain's 16-channel
ambisonic field must pass through a matching decoder before hardware output.
Fault receives Live MIDI
and Tracker MIDI BUS; set its **Performance Mode** to MIDI for note response.
Its **NOTE** and **OFF** buttons audition and release C4. Ambi Grain has no
MIDI input; load an ambisonic file and use playback controls in its CLAP
editor. For Live Sets, use **LINK** or **EMBED** for that file, since
**PROJECT** does not collect media into an Ableton Project.

Processor No Input Mixer 8 has no audio input and publishes eight chain slots.
Follow it with Bus Send 36 at **INPUT = CHAIN 36, CH = 8**, or put Main
Hardware Out 32 directly after it. Start with your monitor level low and leave
the plugin's limiter on. The face exposes **Out** and **Ceiling**, plus **NEW**
and **PANIC** buttons. Live MIDI and Tracker MIDI BUS reach its controller
input; its controller-feedback MIDI output is not forwarded by this wrapper.
Use MIDI channel 16 for its performance commands and NRPN controls; Live's
ordinary inter-track MIDI routing can rewrite the channel, so use the
channel-preserving Tracker MIDI BUS or a suitable direct controller input.
See the
[No Input Mixer control guide](https://s3g.github.io/s3g-dsp/no-input-mixer-control.html)
for the MIDI mapping.

Ambi Transform Depth 16 reads and returns the first 16 received slots.
Ambi Transform Rot 64, Order Band 64, Processor Ambi Imprint 64, Analyzer
Meter 64, and Analyzer Ambi Energy 64 read and return the first 36 slots of
their 64-channel CLAP buses. Put Bus Receive 36 before each and Bus Send 36
after it when crossing tracks; set Send to **CHAIN 36** and **CH 16** or
**CH 36** respectively. The 64-channel field processors start new Live
instances at 5OA, but an editor or restored setting above 5OA cannot travel
through this bus. The analyzers pass audio through unchanged; the Energy
analyzer draws its field only while its editor is open. Imprint responses are
chosen in its CLAP editor.

Macro Delay, Pitch, Fracture, and Shred 8/24 are matching-width bus inserts:
put Bus Receive 36 immediately before them and Bus Send 36 after them with
**INPUT = CHAIN 36** and **CH** matching the Macro width. The two Mono 1
Macros are ordinary stereo-track inserts that sum Live's L/R input to mono
at half gain and return the mono result to both stereo channels. Conduit 2
and Formant Matrix 2 are ordinary stereo inserts; Errant 2, LF Synth 2,
Lowform 2, and Stack 2 are MIDI-controlled stereo instruments.

The 16/32-channel Sample instruments publish their audio in auxiliary
chain slots 1–16 or 1–32. Follow one with Bus Send 36 set to **CHAIN 36**
and the matching **CH** count, or use Main Hardware Out 32 on the same track.
Sample Rings 8 is an audio-input capture device: put Bus Receive 36 before it
for its eight input channels, then Bus Send 36 after it if routing its eight
outputs to another track. Slicer 2 returns normal Live stereo. PLAY auditions
the loaded sound; KILL resets voices, while Rings' STOP pauses its transport.
Sample Neon 32 and Decks 32 do not have Live devices.

Not every CLAP fits this 36-channel bus. The
64/128-channel **Ambi Matrix Group** and **Ambi Transform Grp Rot** variants,
128-channel **Mixer Node Bus** variants, and **Array Calibrate 64** do not have Live devices:
their full port width cannot pass through the present 36-slot bus. These are
intentional omissions, not reduced-channel wrappers. Check the available
wrapper list above before planning a Live Set around another plugin.

Cascade Taps, Orbit Delay, and Shard Scatter are retired upstream; their
models are available in Delay Field 16, so separate M4L wrappers are omitted.

For a multichannel Ambisonic chain across tracks:

1. Put an **s3g Ambi Encoder …** device on the source track, followed by
   **s3g Bus Send 36**. Set Send's **INPUT** to **CHAIN 36**, **CH** to the
   active channel count, and choose a **BUS** number.
2. On a separate audio track, place **s3g Bus Receive 36** before an
   **s3g Ambi Decoder …** device. Select the same **BUS** number. Use
   Receive's **MON** menu to audition a bus pair if needed.
3. Head and Stereo decoders use the track's normal Live stereo output. For a
   multichannel decoder, put **s3g Main Hardware Out 32** immediately after
   it on the same track. Set the Main device's mono routing grid and
   **HARDWARE** output-pair assignments for the audio interface. The Main
   device maps up to 32 chain channels to hardware; it does not host CLAP.

The Bus 36 transport carries up to 36 channels, enough for fifth-order
Ambisonics. Use a different bus number for each cross-track stage; multiple
Sends can feed one Receive on a bus. To feed a multichannel-input encoder,
place another Send/Receive pair *before* it. Same-track Ambi effects can sit
between the encoder and Send without another bus pair.

The same explicit pair also feeds the Panners, Output Autogain, and Drum
Mixer 16: put **Bus Receive 36** immediately before the wrapper. Follow a
Panner or Autogain Quad with **Main Hardware Out 32** on the same track;
Autogain Quad has no normal stereo output of its own.
Panner and
Autogain read all 36 slots; Drum Mixer reads slots 1–16 as eight stereo pairs.
For Drum sources, set each **Bus Send 36** to **STEREO 2**, **CH 2**, and an odd
**SLOT** from 01 to 15. See the
[routing guide](package/docs/s3g-clap-m4l-routing.md) for more detail.

## License

The project is BSD 3-Clause. The routing abstractions include modified
Envelop for Live code under LGPL-2.1; see
[third-party notices](THIRD_PARTY_NOTICES.md).
