# s3g multichannel and Ambisonic routing for Max for Live

For diagrams and a shorter first-use path, start with the
[visual routing guide](s3g-clap-m4l-visual-guide.md).

The installed Ambisonic wrappers are the **s3g Ambi …** devices. The only
multichannel cross-track transport is **s3g Bus Send 36 / Bus Receive 36**;
**s3g Main Hardware Out 32** is the separate hardware endpoint, and
**s3g Bus to Live Stereo 36** breaks a 36-channel chain into ordinary Live
stereo track inputs.

## Channel-preserving MIDI bus

**s3g Tracker**, Relay, Utility NIM Gesture, and Utility Neon MIDI are Max
MIDI Effects. Put one before an instrument on the same track for direct MIDI
output. Open Tracker's **EDITOR** to program its tracks. To send to other
tracks as well, choose a nonzero **MIDI OUT** (01–16), then choose that number
as **MIDI IN** in one or more MIDI-capable s3g instrument wrappers.
Each wrapper defaults to **OFF** and can still receive Live MIDI normally.
Within each receiving CLAP, use its own MIDI receive-channel setting to
select the Tracker lane; the bus passes the original channel nibble through
unchanged. Relay, Utility NIM Gesture, and Utility Neon MIDI can also send to
this private bus. To play Utility Neon MIDI through Tracker, choose Utility's
MIDI OUT as Tracker's MIDI IN, then choose a *different* MIDI OUT on Tracker
for the receiving instrument. If MIDI IN and MIDI OUT match on a MIDI-only
device, the wrapper suppresses its MIDI output to avoid feedback. This MIDI
bus is separate from
**Bus Send/Receive 36**, which
carries audio only. A private bus number does not itself appear as a Live MIDI
track input; use **s3g MIDI Bus to Live** when the destination is an ordinary
Live instrument on another track.

### Send Relay or Tracker to a Live instrument on another track

For a single-track chain, place Relay or Tracker before the Live instrument;
no bus or bridge is needed. To route across tracks:

1. Place Relay or Tracker on its own MIDI track. Select **MIDI OUT = 01** (or
   another unused number) and make it generate notes.
2. On the destination MIDI track, place **s3g MIDI Bus to Live** *before* the
   Ableton instrument, then select **MIDI IN = 01** on the bridge. The bridge
   is a Max MIDI Effect, not an instrument. Its default **OFF** receives no bus.
3. Use Live's normal track monitoring to hear the destination instrument.
   Incoming Live MIDI also passes through the bridge. Press **PANIC** if notes
   remain held; switching the bridge bus also flushes held notes.

The bridge accepts channel-voice MIDI from Relay, Tracker, or the other s3g
MIDI utilities. It ignores CLAP port numbers and sample offsets: the Max bus
hop is scheduler-timed, not sample-accurate. The private bus preserves status
bytes up to the bridge, but Live's own channel routing and the destination
instrument determine whether MIDI channels remain distinct. Live's **MIDI
From** chooser may tap before device-generated MIDI, so use the private bus
bridge when the track chooser does not capture the generated output.
To record generated MIDI as a Live clip, route the bridge's post-effect MIDI
into another track and record there; recording directly on the bridge track
may capture only its pre-effect input.

Changing a Tracker bus resets voices on the old destination; changing a
receiver's bus resets that receiver. Avoid changing bus numbers during a
performance. `s3g.clap~` transports the CLAP MIDI event's original status
and sample offset, but the cross-device Max `send`/`receive` hop is deferred
through Max's scheduler. Its latency and ordering between multiple receivers
are not sample-accurate; test timing in your Live Set before relying on it
for tight sequencing. The wrapper uses the existing Set-state and parameter
save path for Tracker state and bus selection, but editor, recall, and timing
behavior still require acceptance testing in Live after installation.

## Drum family

The ten **s3g Drum** instruments are Max Instruments: Live MIDI reaches their
CLAP note input and their stereo audio returns on the normal Live track. **Drum
Overload** and **Drum Echo** are ordinary stereo audio inserts. Each fixed
wrapper stores the CLAP editor state and exposes a small selection of stable
CLAP parameters to Live automation.
Each instrument also has a momentary **TRIGGER** button beside **EDITOR** for
auditioning its primary hit without MIDI. The button sends a transient trigger
and resets immediately; it is not a saved toggle or an automation parameter.
For instruments with multiple articulations, use MIDI or the plugin editor to
reach the other hits.

For eight independent stereo lanes, put **s3g Bus Send 36** after each
instrument (or on any stereo track). Set **INPUT** to **STEREO 2**, **CH** to
**2**, and give each sender the same **BUS** number but a different odd **SLOT**
from 01 to 15. Put **s3g Bus Receive 36** immediately before **s3g Drum Mixer
16** on a separate normal audio track and select the matching BUS. The mixer
reads the first 16 received slots as eight stereo pairs; it no longer has a
hidden receiver or RCV BUS menu. **Sum** mode reaches Live's regular stereo
output. **Direct** mode also publishes the 16 lanes to the next device, where
another Bus Send 36 can route them onward.

## Generic multichannel bus

### 36-channel explicit bus

**s3g Bus Send 36** and **s3g Bus Receive 36** provide a separate,
format-agnostic numbered bus with 36 signal slots. Fifth-order Ambisonics
needs `(5 + 1)^2 = 36` channels; the two ordinary Live stereo lanes bring
each Max for Live device to 38 channels, below Max for Live's 64-channel
limit. The bus is also suitable for non-Ambisonic channel layouts.

Place Send after a producing device, select **STEREO 2** for Live's normal
stereo input or **CHAIN 36** for auxiliary chain channels 3–38, then choose
BUS, CH, FROM, and destination SLOT. TO shows the last source channel;
source and destination selections wrap at 36. **DRY KEEP / BUS ONLY**
controls the normal stereo output independently of the bus send. Place
Receive before a compatible processor on a normal audio track and select
the same BUS. Receive blocks the ordinary stereo lane and publishes slots
1–36 to the next device on channels 3–38. Its **MON** menu defaults to OFF;
select one of the 18 stereo bus pairs to audition it through the track's
ordinary stereo output. Monitoring does not alter the 36-channel signal
passed to the next device; switch MON back to OFF for a bus-only track.
Use one Receive destination per bus number, with any number of Sends feeding
it. Changing Receive's BUS clears the old bus's sender output assignments
and resets their remembered destination before announcing the new bus. A
nonmatching bus should therefore be silent, while selecting the original bus
again should reconnect its Sends.

**s3g Bus to Live Stereo 36** is a terminal demux after Bus Receive 36 or a
36-channel processor on that same track. It does not create another numbered
bus receiver, so it cannot compete for the bus ACK. Each of its 16 **OUT**
menus selects one of the 18 bus stereo pairs, or OFF. OUT 01/02 defaults OFF;
OUT 03/04 through OUT 31/32 initially map bus pairs 01/02 through 29/30.
To use a tap, create a Live audio track, choose the demux track in **Audio
From**, choose the corresponding device output pair, and set Monitor to **In**.
Route or mute the demux track's own main stereo output as appropriate. Live's
16-stereo-output limit means only 16 pairs can be exposed simultaneously, but
the menus can select all 36 input channels, including pairs 33/34 and 35/36.
Put any further multichannel effect before this terminal device.

The **s3g Ambi …** wrappers use this explicit bus. They have no hidden
receive or send bus and no MAIN/NEXT switch. Their same-track
NEXT routing is fixed on internally: put effects between the encoder and a
Bus Send 36, set that Send to **CHAIN 36** and **CH 36**, then place Bus Receive
36 before the decoder on another track. Use different bus numbers before and
after an encoder (for example, Bus 1 for source audio and Bus 2 for the
Ambisonic bed) to avoid feedback. Multiple encoders may send to the same
Ambisonic bus, which the Receive sums. A further cross-track effect stage
uses another Send/Receive pair and another bus number.

The Ambi wrappers use 36 auxiliary channels at Live positions 3–38; their
stereo lanes remain positions 1–2. The 64-channel CLAP encoders, effects, and
decoders can carry up to fifth-order Ambisonics on this bus. Native 16-output
encoders (including Medium, Modal, Membrane Kick, and Acid) still emit at
most 16 channels, even though their device chain is 38 channels wide. The
wrappers no longer force order 3; choose an order supported by the CLAP and
keep it at or below order 5 when using Bus 36. An editor setting above order
5 produces channels beyond the bus's capacity and those channels are not
transported. The multichannel decoders' gain and recorder handle 36 input
channels; `sfrecord~` writes all 36 when recording.

These devices are generated by `scripts/generate-m4l-ambi36.py`, checked by
`tests/validate_m4l_ambi36_devices.py`, and installed by the normal
`scripts/install-live-devices.sh` installer. Audio, editor loading, automation,
Set recall, and
hardware routing still require acceptance testing in Live.

The four Panner wrappers and the two Output Autogain wrappers use this same
explicit receive. Place Bus Receive 36 immediately before the wrapper.
Panner and Autogain present all 36 received slots to their CLAP inputs.
Follow a Panner or a multichannel Ambi Decoder with **s3g Main Hardware Out
32** on the same track. The CLAP-free Main device takes the preceding
wrapper's first 32 auxiliary outputs, applies a linked 32-channel gain,
remaps each mono channel in its four-page grid, and assigns the 16 underlying
Live output pairs through **HARDWARE**. It is an end-of-chain device; its
normal stereo lanes are silent. Autogain Quad puts its four outputs in chain
slots 1–4 in CLAP order L, R, RB, LB; place Main Hardware Out 32 immediately
after it on the same track, where the grid can map them to any mono hardware
slots. Head and Stereo decoders, and Autogain Stereo, return normal Live
stereo without Main. The adjacent Receive device owns the bus number;
neither processors nor Main have a bus menu.

The Ambi Transform Depth 16 wrapper consumes and returns the first 16 slots.
Ambi Transform Rot 64, Order Band 64, Processor Ambi Imprint 64, Analyzer
Meter 64, and Analyzer Ambi Energy 64 consume and return the first 36 slots
of their 64-channel CLAP ports. Each is an insert between Bus Receive 36 and
Bus Send 36; set Send to **INPUT = CHAIN 36** and **CH = 16** or **36** as
appropriate. The 64-channel field processors initialize new Live instances
at 5OA. Higher editor orders may be saved but cannot pass channels 37–64
through this bus. The two analyzers pass the field through unchanged; Ambi
Energy draws its map only with its CLAP editor open.

The fixed non-Ambisonic Effect/Processor wrappers follow the same rule.
Delay Field takes ordinary Live stereo input and places 16 output channels in
auxiliary slots 1–16. Follow it with Bus Send 36 set to **CHAIN 36**, **CH 16**.
Spectral Spray 8, Buffer 8,
Delay 8/24, Spectral 8/24, Feedback Shift 8, Wave Geometry 8, and Matrix
Group 32 require Bus Receive 36
immediately before them; they read the first 8, 24, or 32 slots and publish
their outputs to those same slot positions.
To cross to another track, follow with Bus Send 36 set to **CHAIN 36** and
**CH 8**, **CH 24**, or **CH 32**. Fissure 8 takes optional Live stereo input
directly and publishes eight auxiliary slots; follow it with Bus Send 36 set
to **CHAIN 36**, **CH 8**. Feedback Shift and Fissure accept MIDI notes and
provide **EXCITE** and **STRIKE** audition buttons, respectively. Fissure's
Stereo/Quad modes fill only the first two/four slots of its fixed eight-slot
output. Spectral Spray 2 remains an ordinary stereo insert.
Cascade Taps, Orbit Delay, and Shard Scatter have been retired in favor of
Delay Field 16; their separate M4L wrappers are not shipped.
None of these wrappers has a hidden named receive bus or direct hardware
assignment. Main Hardware Out 32 addresses up to 32 mono outputs.

## Processor, Macro, and Sample additions

Conduit 2 and Formant Matrix 2 are stereo inserts. Errant 2, LF Synth 2,
Lowform 2, and Stack 2 are MIDI instruments with ordinary Live stereo output.
The 8- and 24-channel Macro Delay, Pitch, Fracture, and Shred devices require
Bus Receive 36 immediately before them. Follow them with Bus Send 36 set to
**INPUT = CHAIN 36** and **CH 8** or **CH 24**, or with Main Hardware Out 32
on the same track. The Mono 1 Fracture and Shred devices instead sum Live's
stereo input at half gain before processing and return dual mono to Live.

Cutups 32, Grains 32, Kit 32, Lanes 32, Motion 32, Player 16, Slicer 16, and
Wavesets 32 are MIDI instruments with no audio input. Their fixed output lanes
appear in auxiliary chain slots 1–32 or 1–16. Follow one with Bus Send 36
using **INPUT = CHAIN 36** and the corresponding **CH**, or with Main Hardware
Out 32 on the same track. Kit starts with one active stereo output pair; raise
its **Active Output Pairs** parameter in the editor or Live automation to use
more of its 32 lanes. Slicer 2 is an ordinary stereo MIDI instrument.

Sample Rings 8 accepts eight channels of live capture: place Bus Receive 36
immediately before it, then route its eight output slots with Bus Send 36 or
Main Hardware Out 32. Its PLAY/STOP controls start and pause transport. Other
Sample devices expose PLAY for audition and KILL to reset their voices; a
loaded sample and, for Slicer, an Auto Map assignment are still required.
