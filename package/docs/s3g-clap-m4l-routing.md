# s3g multichannel and Ambisonic routing for Max for Live

The installed Ambisonic wrappers are the **s3g Ambi …** devices described in
the 36-channel section below. Later references to **s3g 3OA …** devices
document the prior design only; those devices have been removed from the
standard User Library installation.

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

For eight independent stereo lanes, put **s3g Send Stereo to Drum 16ch Bus**
after each instrument (or on any stereo audio track). Give all contributing
sends the same **SND BUS** number and distinct **PAIR** numbers 1–8. Each send
has independent level, pan, and mute for its two input channels; **DRY KEEP**
also passes the track's usual stereo audio, while **BUS ONLY** suppresses only
that local stereo output. Put **s3g Drum Mixer 16** first on a separate normal
audio track and choose the matching **RCV BUS**. The wrapper embeds the
receiver; no standalone Receive device is needed. Mixer **Sum** mode reaches
Live's regular stereo output. **Direct** mode puts pair 1 on that stereo
output and all eight pairs on auxiliary device-chain channels 3–18, for a
following Max device that declares those channels; Live's ordinary stereo
master does not expose the other seven pairs by itself.

The Drum buses use `s3g-drum16-1` through `s3g-drum16-16`. They are separate
from both the generic `s3g-multichannel-*` bus and the 3OA `master` bus, so
an Ambisonics sender cannot accidentally feed the Drum Mixer.

## Generic multichannel bus

### 36-channel explicit bus

**s3g Bus Send 36** and **s3g Bus Receive 36** provide a separate,
format-agnostic numbered bus with 36 signal slots. Fifth-order Ambisonics
needs `(5 + 1)^2 = 36` channels; the two ordinary Live stereo lanes bring
each Max for Live device to 38 channels, below Max for Live's 64-channel
limit. The bus is also suitable for non-Ambisonic channel layouts. It does
not connect to the older `s3g-multichannel-*`, `s3g-drum16-*`, or 3OA
`master` buses.

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

The opt-in **s3g Ambi …** wrappers use this explicit bus. They have no hidden
numbered receive or `master` send and no MAIN/NEXT switch. Their same-track
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
transported. The Main decoders' gain and recorder now handle 36 input
channels; `sfrecord~` writes all 36 when recording.

These devices are generated by `scripts/generate-m4l-ambi36.py`, checked by
`tests/validate_m4l_ambi36_devices.py`, and installed by the normal
`scripts/install-live-devices.sh` installer. The former 3OA device files have
been removed from the User Library, with independent backups retained outside
Live's scan folders. Audio, editor loading, automation, Set recall, and
hardware routing still require acceptance testing in Live.

The routing layer is format-agnostic. **s3g Send Stereo to 32ch Bus** publishes to a
private 32-channel transport that does not assume Ambisonics, a speaker layout,
or even a CLAP processor. Fixed s3g multichannel wrappers receive that transport
directly through a visible **Input Bus** selector.

Put one Send on every contributing Live track, choose the same **Bus** number,
and give each sender a distinct stereo **Pair**. Pair 1 occupies bus slots 1/2,
pair 2 occupies 3/4, and so on through pair 16 and slots 31/32. On an integrated
encoder such as Path, Point, Cloud, or Surface Terrain, choose the same
**Input Bus** number. The sender then
routes directly into that wrapper's 32 auxiliary inputs, while the wrapper
blocks the destination track's ordinary stereo input.

For a multichannel-producing device, place **s3g Send Multichannel to 32ch
Bus** after it on the same track. Set **INPUT** to **CHAIN 32** to read its
auxiliary device-chain outputs 3–34 as source channels 1–32. Set **CH** to the
number of active channels (for example 4 for quad, 8 for an eight-channel
processor, or 32 for a full-width output). **FROM** picks the first source
channel. **TO** is a read-only menu showing the calculated last source channel;
for CH 8 and FROM 01 it shows 08, and FROM 30 shows 05 after wrapping. **SLOT**
picks the first destination bus slot. The selected channels map in order, with
source and destination numbering wrapping from 32 back to 1. For a conventional
stereo track, select **STEREO 2** instead: Live inputs
1–2 are the only possible sources, even if CH is set higher. The linked
`live.gain~` scales all selected bus channels; **DRY KEEP / BUS ONLY** controls
only the ordinary stereo track output. Keep this Send last in the chain unless
you deliberately want another device to receive its remapped auxiliary output.

Set the matching **RCV BUS** on a Panner Main track. A quad source with
CHAIN 32, CH 4, FROM 01, SLOT 09, for example, shows TO 04 and occupies Panner
input slots 09–12. A full-width 32-channel source normally uses FROM 01 and
SLOT 01. Other
senders on the same bus sum if they occupy the same slots. This path carries
ordinary source channels, not encoded Ambisonics.

On the device faces, Send Stereo to 32ch Bus labels its selector **SND BUS** and
the multichannel encoder wrappers label theirs **RCV BUS**. These are the two ends of the
same numbered bus, not separate bus types; their saved Live parameters retain
their existing names and values.
Send, standalone Receive, and the four multichannel encoders re-announce their saved bus selection after
Live reports the device ready. Initialization reads the stored value and
refreshes the menu before replaying it; it does not select bus 1 over a saved
choice or write a new value into Live automation.

Live internally reserves device channels 1–2 for its stereo chain, so the Max
patch must declare 34 device channels and place bus slots 1–32 on auxiliary
channels 3–34. That is transport scaffolding, not a 34-channel bus: every
multichannel `s3g.clap~` wrapper ignores channels 1–2 and presents exactly 32
inputs to its CLAP plugin.

```text
Track A · Send bus 1 pair 1 ─┐
Track B · Send bus 1 pair 2 ─┼─ Path Encoder · Input Bus 1
Track C · Send bus 1 pair 3 ─┘
```

Multiple senders assigned to the same pair sum deliberately. Use different
pairs when the downstream processor must see independent inputs. Bus and pair
choices, both send levels, their link state, pan, mute, and the sender's
**DRY KEEP / BUS ONLY** state are Live
parameters and are saved with the Set. The private bus name is derived from
the displayed number (`s3g-multichannel-1` through
`s3g-multichannel-16`). These names are distinct from the 3OA `master` bus.
Assign each receiving encoder its own bus number: multiple senders may target
one receiver, but the Live auxiliary-output route is not a fan-out transport
to multiple receivers with the same number.

The sender uses one mono `live.gain~` per input channel. **LINKED** mirrors a
change to either level onto the other; **UNLINKED** keeps the volumes separate.
Turning LINKED back on copies level 1 to level 2. The original saved Send Gain
parameter remains level 1; older Sets default to linked levels and restore
their previous gain to both inputs. Pan and mute remain independent in either
mode. These levels scale only the bus feed.

The sender never changes the track's normal Live output routing. **DRY KEEP**
passes channels 1–2 normally; **BUS ONLY** silences those two local outputs
while continuing to publish the selected multichannel pair. Moving a live
signal between pairs uses a short crossfade, but pair assignment is intended
primarily as Set topology rather than continuous automation.

The standalone **s3g Multichannel Receive** remains an optional transport
adapter rather than a CLAP host. It routes its outputs into the immediately
following device, which must declare the auxiliary channels it consumes; an
ordinary stereo-only device will discard them. This is useful for custom Max
devices and non-integrated multichannel processors.

The fixed **3OA Path, Point, Cloud, and Surface Terrain Encoders** do not
require that extra device. Each embeds the same private receiver, exposes the
selected bus as a stored Live parameter, maps bus slots 1–32 directly to CLAP
inputs 1–32, recalls its user-selected `Input Count` from 1–32, and publishes
its 16-channel third-order result on the separate 3OA `master` bus. Point and
Surface Terrain start at 16 active inputs; Cloud and Path start at 32. Lower
saved counts are not reset to the default when the Set is reopened.

The fixed **s3g Panner Layout Main**, **DBAP Main**, **LBAP Main**, and **VBAP
Main** wrappers receive this same generic bus directly; they do not decode or
use the 3OA `master` bus. Put one on a dedicated normal audio track, preferably
first in the chain, and set **RCV BUS** to the senders' **SND BUS**. Each CLAP
has 64 source inputs and 64 speaker outputs, but this Live endpoint exposes
source lanes 1–32 and speaker lanes 1–32 only. The remaining CLAP inputs are
silent and outputs 33–64 cannot reach hardware through this wrapper. Adjust
the source/speaker configuration in the native editor and save the Live Set.
The input `live.gain~` meters and scales the 32 source lanes together. The
four-page mono grid maps each speaker output to a Live output slot, while
**HARDWARE** assigns its sixteen underlying stereo pairs to interface outputs.
No ordinary Live stereo input or output is passed around the Panner.

The fixed **s3g Output Autogain Stereo** and **s3g Output Autogain Quad Main**
wrappers also receive the selected generic bus directly on a dedicated normal
audio track. The stereo wrapper folds bus inputs 1–32 to Live's ordinary stereo
track output, so use Live's normal track routing. The quad wrapper folds those
inputs to four outputs in CLAP order **L, R, RB, LB**. Its four mono menus each
select an output slot 01–32 or **OFF**; **HARDWARE** assigns the sixteen Live
stereo output pairs beneath those slots to physical interface pairs. Its
ordinary stereo lane is silent. Both CLAPs declare 128 inputs, but the current
Live endpoint supplies only the first 32. Saved Input Channels settings above
32 are not overwritten; channels 33–128 simply have no signal here.

The fixed **Cartography**, **Ray**, and **Ray Bilocation** encoder wrappers use
Live's ordinary input instead: Cartography takes stereo, while Ray and Ray
Bilocation take only Live channel 1 as mono. Live's stereo chain passes through
unchanged on channels 1–2; none of these three wrappers selects a multichannel
receive bus. These encoders force third-order ACN/SN3D output, publish
channels 3–18 to the same private 3OA main/next path, and retain their full
CLAP editor state alongside their exposed Live controls.

The remaining generator wrappers use **s3g 3OA Encoder <kind>** names and the
same private MAIN/NEXT routing. Modal and Medium have a real mono CLAP audio
input, so their fixed wrappers are Max Audio Effects: Live channel 1 drives the
exciter through the visible input gain/mute, and channel 2 remains in the dry
stereo lane. Both also accept MIDI through their Max `midiin` path. Route a
separate MIDI track to that audio effect in Live when you want note control.
They are not 32-channel receive-bus devices.

Membrane Kick, Acid, VOT, Vox, Wave Terrain, Stochastic, and Neural Ecology
declare MIDI note inputs but no audio input. Their wrappers are Max Instruments
on MIDI tracks; notes, note-offs, and CC reach `s3g.clap~` through `midiparse`.
Horizon, Pulsar, Wind, Water, Pyrosphere, Cryosphere, Insect, and Wrangler
also have no audio input but are autonomous generators. Their Max Instrument
wrappers do not wire MIDI, because those CLAPs declare no note port. In every
case, `s3g.clap~ 0 16` exposes the first 16 ACN/SN3D output channels on Live
device channels 3–18. Order is fixed to 3OA; Modal and Acid additionally fix
their output format to Ambisonics. Selected stable CLAP parameters appear in
Live's automation chooser, while the full editor state is saved in the Set.

This is the package rule: an s3g-dsp plugin with one or two inputs may accept
the normal Live track input. A plugin designed for more than two inputs embeds
a private multichannel receiver and never accepts that stereo lane. Placing
such a wrapper on an ordinary Live track therefore produces no plugin input
unless matching Send Stereo to 32ch Bus devices target its selected Input Bus.
Zero-input generators need neither a Send nor a Receive.

## Signal contract

The s3g Source and Insert devices use the same device-chain convention as
Envelop for Live:

| Live device channel | Meaning |
| --- | --- |
| 1–2 | Ordinary stereo track signal, passed through unchanged |
| 3–18 | Third-order Ambisonics, 16 channels, ACN order, SN3D normalization |

The named `master` bus itself carries the 16 Ambisonics channels. Decoder Main
receives those 16 channels and decodes them with a CLAP plugin. Its first two
device channels preserve the ordinary track signal; device channels 3–34
carry up to 32 decoded channels as sixteen independently routable stereo pairs.
Decoder Main's face provides a mono assignment for each decoded channel before
these Live output pairs.

## Device face

Live displays each device's name, so the black faceplate contains controls and
their short labels rather than a second title or signal-format explanation.
**Editor** occupies the same upper-left toolbar position in all five CLAP wrappers;
generic Source/Insert loaders place **Load CLAP** beside it, while generic
Decoder Main places it below Editor in the left column. Fixed wrappers do not
offer a plugin picker. Path's RCV BUS and MAIN/NEXT switch share the top
row; Send groups SND BUS, Pair, and DRY KEEP/BUS ONLY in that row.

Buttons use native `live.text` controls. Buttons and menus share a 20-pixel
height and 11-point Arial text, with the subdued s3g grayscale palette. Source
gain/mute and Send level/link/pan/mute controls are grouped below the routing row.
Both decoder-main faces are 700 × 169 pixels: the linked gain, its built-in value
display, and FILE/REC controls sit below Editor and HARDWARE on the left.
The four Panner Main faces also use the 700 × 169 hardware layout; their
**RCV BUS** menu replaces the decoder's FILE/REC controls.
On the right, a paged 8 × 32 `matrixctrl` grid uses square 14-pixel cells to
show eight decoded channels
as rows and mono output slots 01–32 as columns. The **IN** menu selects
channels 01–08, 09–16, 17–24, or 25–32; row numbers update with the page.
Click a cell to route a channel, or click its lit cell again to disconnect it.
**HARDWARE** opens a separate window with the
sixteen 100 × 20 pixel Live hardware pair menus. Other faces remain
169 pixels high but fit their width to their controls: Source is 324 pixels
wide, Path 286, Insert 268, Send Stereo to 32ch Bus 360, and Multichannel Receive 112.
The generator keeps a 12-pixel right margin after the last visible element,
and the black panel always fills the fitted face. Source's stereo gain meter
is shorter to fit the compact layout; buttons and menus keep their readable sizes.

Source, Path, and Insert show **MAIN** when publishing to the shared 16-channel
3OA main bus, or **NEXT ON** when feeding the next s3g device on the same track.
This is separate from the numbered 32-channel input buses: **Bus** / **Input
Bus** choose 01–16, and Send's **Pair** menu identifies slots 01/02–31/32.
Send's per-channel pan controls position each input across that selected pair;
its channel mute buttons silence only the bus feed. Source's stereo gain
meters the signal before its channel mutes; neither control changes its dry
stereo passthrough. Decoder Main's linked input gain meters and scales all sixteen
Ambisonic channels before decoding. Its right-hand menus map each decoded
channel to a mono output slot.

Latency compensation is automatic; there is no user latency display or input.
See the transport/state/latency section below for the internal forwarding.

## Basic setup

For a repository development install on macOS, first run
`scripts/install-local-package.sh` so Max can resolve `s3g.clap~` and the
routing abstractions, then run `scripts/install-live-devices.sh` to expose the
devices under **User Library > s3g CLAP**. The latter uses hard links
because Live does not index symbolic links in its User Library. Restart Live
after rebuilding the external.

### Fixed Path-to-speaker pair

1. Create a dedicated normal audio track and put **s3g 3OA Decoder Speaker
   Main** on it, preferably as the first device. Do not use Live's global Master
   track. This wrapper always loads **s3g Ambi Decoder Speaker 64**, fixes the
   decoder to third order, receives the private `master` bus, and exposes
   decoded channels 1–32 through the mono assignment matrix. Use **HARDWARE**
   to assign its sixteen underlying Live output pairs to your interface.
2. Put **s3g Send Stereo to 32ch Bus** on each source track. Select the same Bus on
   every sender and assign distinct Pairs so the sources remain discrete.
3. On a dedicated encoder track, add **s3g 3OA Encoder Path** and set its
   **Input Bus** to the senders' Bus. Path always loads **s3g Ambi Encoder Path
   64**, receives all 32 bus slots directly, maps them to 32 CLAP inputs, fixes
   `Order` to `3`, exposes a recalled `Input Count` limited to the first 32 bus
   slots, and sends 16-channel ACN/SN3D to the private `master` bus.
4. Leave the route button on **MAIN** when Path Encoder should feed Decoder Speaker Main
   directly.
   The private `s3g.bus.send master` / `s3g.bus.receive master` handshake finds
   the decoder track automatically. Multiple encoder tracks can still publish
   to that receiver and are summed before the decoder without sharing E4L's
   global bus symbols.
5. Click **HARDWARE** and assign only the interface output pairs needed by the
   chosen layout. New pairs remain **Ext. Out / No Output** until selected.
   Assign individual speaker channels with the four-page mono routing grid. Decoder Speaker Main exposes 32
   decoded channels; the 41-speaker Cube and LPAC layouts therefore have
   unrouted channels 33–41 in this wrapper.

The fixed wrappers expose the stable plugin parameters in Live's automation
chooser and keep the native CLAP editor available. Their plugin picker is
intentionally disabled: substituting another CLAP would invalidate the fixed
parameter-ID map. Live automation is passed to CLAP by parameter ID;
native-editor and parameter-query values are reflected into Live with a silent
`set` message so feedback cannot re-emit from the control and override active
automation. Path uses a compact 286-pixel device face; its nineteen stable
parameters remain native Live controls inside the patch, available through
Live's automation chooser without a second bank of visible dials.
Restored CLAP state is
synchronized after the plugin loads. Non-parameter data such as Path geometry
and custom speaker state remains part of the saved CLAP Blob.

### General-purpose devices

1. Create a dedicated audio track and put **s3g 3OA Decoder Main** first on the
   track. Leave the default binaural decoder in place or use **Load CLAP** to
   choose another decoder with at least 16 inputs and up to 32 useful outputs.
   For binaural monitoring, route decoded pair **1/2** to the desired headphone
   output. For a loudspeaker decoder, assign each active decoded pair to its
   corresponding Live external-output pair.
2. Add **s3g 3OA Source** to an audio track. It opens **s3g Ambi Encoder
   Medium 16** by name and routes its 16-channel encoding to Decoder Main.
3. Open the CLAP editor from the device and position the source. Saving the
   Live Set stores the selected bundle, exact plugin ID, and complete CLAP
   state in the device.
4. For Ambisonics-domain processing, put **s3g 3OA Insert** after the
   Source. Switch the Source to **NEXT ON**. On a series of Inserts, use **NEXT ON**
   on every device except the last; the last device routes to Decoder Main.

The Source presents two inputs to `s3g.clap~`. Live's left and right channels
pass through an editable, unity-default stereo `live.gain~` meter and independent
**1 MUTE** / **2 MUTE** controls before reaching those CLAP inputs. The meter
is pre-mute, so incoming activity remains visible while a channel is muted.
Stereo channels 1–2 bypass these diagnostic mutes and remain available to
ordinary downstream devices while the 3OA stream occupies channels 3–18.

Path, Cloud, Point, and Surface Terrain expose 64 physical CLAP inputs but
their Live wrappers deliberately address only the first 32. Encoders with one
or two physical inputs remain ordinary Live source wrappers and do not acquire
artificial 32-channel inputs.

## Decoder Main hardware routing

Decoder Main adapts Envelop for Live's Live 12 hardware-output strategy.
`plugout~` exposes 34 channels: ordinary track stereo on 1–2 and 32 decoded
mono slots on 3–34. A 32 × 32 signal matrix maps each decoded channel to one
slot with a short ramp. Every channel defaults to its matching slot, and its
stored grid route can select a different slot or disconnect it. Several decoded
channels may intentionally sum into one slot. Adjacent slots still form the
sixteen stereo DeviceIO buses that Live can route to interface outputs. Click
**HARDWARE** to open their pair selectors; these keep existing Live Set output
assignments. New pairs initialize to **Ext. Out / No Output**, so a new device
is silent until the needed pairs are assigned. Enable those stereo interface
outputs in Live's Audio Settings. This is mono signal assignment within Decoder
Main; Live's physical DeviceIO routing remains paired. For example, grid route
`05 → 12` sends decoded channel 5 to slot 12 (the right side of Live output
pair 6), then HARDWARE assigns pair 6 to an interface output pair. The grid
cannot split that hardware pair across two independently selected interface
routes, but any decoded channel can choose either mono slot of any pair.

The default `s3g Ambi Decoder Head 2` produces only decoded pair 1/2; the other
pairs are zero-filled by `s3g.clap~`. A multichannel decoder such as
`s3g Ambi Decoder Speaker 64` can drive the first 32 decoded channels exposed
by Decoder Main. Before decoding, a 16-channel `live.gain~` applies one stored and automatable
gain value to all 16 incoming Ambisonic channels and meters the complete bed.
The hardware routes belong to Live's device-output state; the 32 mono choices
are the same native Live parameters as before, saved with the device. The grid
and selected page are only an editor for those parameters. The gain,
selected CLAP, and its state remain stored with the device. The fixed Decoder
Speaker Main uses the same gain and direct-output topology but always loads Speaker
64, fixes its Ambisonics order to 3, and publishes its remaining stable CLAP
parameters to Live automation.

### Fixed 3OA effects and stereo decoder endpoints

The eight fixed **s3g 3OA Effect …** wrappers—DJ Filter, Delay, Pitch, Gain,
Resonance Print, Partial Trace, Response Trace, and Displacement—are 16-channel
inserts on an audio track. Put one after a Source or Encoder on the same track,
set the upstream device to **NEXT ON**, and set each effect to **NEXT ON** until
the last device, which should use **MAIN**. The stereo track lane passes through
unchanged; only 3OA channels 1–16 are processed. Use the CLAP editor for the
full plugin and Live automation for the selected fixed parameters.

**s3g 3OA Decoder Head Main** and **s3g 3OA Decoder Stereo Main** receive the
same private 3OA master bus, but send their decoded two channels to the normal
Live stereo output of their audio track. Put either on a dedicated normal audio
track and set **Audio To → Master**; these devices intentionally have no
HARDWARE menu or 32-slot matrix. They do not pass the track's dry stereo input.
Speaker, Object, Adaptive, and Sub Main remain hardware endpoints with the
mono slot matrix and Live output-pair assignment. Object and Adaptive expose
their first 32 decoded channels; Sub produces at most eight active channels.

### 3OA recording

All fixed decoder-main wrappers include a manual `sfrecord~ 16` recorder. Its tap is
after the linked input gain and before the decoder, so it captures all sixteen
native ACN/SN3D channels independently, not the decoded speaker or stereo outputs.
The capture is a float32 WAV, with no B-format/FuMa conversion.

1. Click **FILE** and choose a new `.wav` filename. File selection opens the
   destination and enables REC; it does not start recording. Choosing an
   existing file replaces it, so use a new name to preserve an earlier take.
2. Click **REC** to start. The button changes to **STOP**, the adjacent timer
   shows elapsed minutes/seconds, and FILE is disabled during the take.
3. Click **STOP** to close the file. Choose FILE again before another take.

Input gain affects the recording. The controls are independent of Live's
transport and are not saved as armed/recording state: reopening a Set never
opens or overwrites a recording file or starts a take. Cancelling the file
dialog leaves recording disabled. If the recorder's elapsed time stops
advancing for two seconds, the device stops the take and prints a warning in
the Max console; check the audio engine and disk before selecting a new file.

## Independent routing namespace

The devices use the runtime routing layer under `patchers/s3g-routing`.
Abstraction names and global handshake symbols are all private `s3g.*` names;
no `e4l.*` sender or receiver is loaded. Consequently, s3g and Envelop devices
can coexist in one Live Set, but do not automatically exchange bus audio or
routing acknowledgements. Any future bridge between the two systems must be an
explicit translator rather than an accidental shared global symbol.

This private handshake is a protocol change. After updating the package,
reload every s3g Source, Path Encoder, Insert, Decoder Main, and Decoder Speaker Main
instance in a Set together. An
already-open device using the former handshake will not discover a newly
loaded device using the private namespace.

The shared sender abstraction no longer initializes a Live track to
**Sends Only**. Track output policy now belongs to the device or the user,
which keeps the generic bus reusable and avoids silently changing Live I/O.

The s3g routing layer is derived from Envelop for Live's LGPL-2.1 Max
abstractions. Unmodified source copies live outside the Max package search path
under `vendor/envelop-for-live/patchers`. Every generated runtime patch carries
an attribution comment, and complete license copies are bundled in the bus and
Live patcher directories.

Do not put s3g Decoder Main on Live's global Master track. Put it first on a normal
audio track so Live exposes the intended multichannel routing destination.
Unlike the upstream receiver, `s3g.bus.receive` does not reject the destination
when Live's device-order query gives a false result while editing in Max.

## Transport, state, and latency

Each device polls `plugsync~` and sends the valid play state, tempo, beat and
seconds positions, and time signature to CLAP on every scheduler update. The
bridge advances those positions sample-accurately between updates. Live's
loop and record states are not exposed by `plugsync~`; a custom patch can use
the public `transport` message when it has those values from another source.

Each device has a hidden, parameter-enabled `pattr` Blob as its Live-native
state carrier. After plugin load, editor/parameter changes, and fixed-wrapper
automation changes, the device asks `s3g.clap~` for an explicit `state`
payload and stores it in the `pattr` without echo. Live Set restore sends that
payload back through `setstate`, preserving the bundle path, exact CLAP ID,
and binary state. This avoids relying on Live to invoke `getvalueof` on a Blob
implicitly bound to a non-UI MSP external. On another machine, restore first
tries the stored path and then
searches for the bundle name in the normal CLAP locations. The same CLAP plugin
must be installed on that machine.

The Max status outlet has a signed-short message length. A small state keeps
the original raw `s3g.clap.state.1` representation; a larger state such as
Wrangler's uses a lossless run-length-packed payload under the same tag. The
bridge restores both, so existing saved Sets retain their state. If a plugin
produces an incompressible state that still exceeds one Max message, capture
fails with an error instead of sending an invalid atom count; keep the previous
saved state and use `statewrite` for that exceptionally large preset.

The carrier uses Max for Live parameter type `3` (Blob). Restore messages are
accepted only when they begin with the embedded-state version tag
`s3g.clap.state.1`; empty/default values are ignored. Captures are silent
(`pattr @thru 0`). Once the Live device API reports that the device exists,
the patch requests the restored Blob exactly once and only then enables future
captures. Restoring a matching plugin updates its existing instance rather
than closing its editor and reopening the CLAP.

The general Source device treats its CLAP host as a stereo encoder. After a fresh or
restored plugin load it requests the plugin's parameter list; if an exact
`Input Count` parameter exists, Source addresses that parameter by its reported
CLAP ID and sets it to `2`. Encoders without that parameter are left unchanged.
This avoids hard-coding the different IDs used by optional stereo-loaded
encoders. The stereo `live.gain~` is an editable, stored input trim at
unity by default, placed before the two encoder-input mute controls.

CLAP latency is reported in samples. The devices send each `latency` update to
the top-level `thispatcher`, which updates the Max for Live Defined Latency
used by Live's delay compensation. Recheck the device latency in Live after a
plugin mode change that alters its processing latency.

The default CLAP is opened shortly after device construction, rather than as a
`s3g.clap~` creation argument. This lets Live finish compiling the initial DSP
graph before CLAP activation or latency callbacks. `openifempty` preserves a
plugin and state already restored from the Live Set.

## Changing the default plugins

**Load CLAP** on the three general-purpose devices can choose any installed
plugin at runtime; the choice is saved with the Set. The fixed Path Encoder and
Decoder Speaker Main deliberately have no plugin picker; the same applies to all
other fixed effects and decoders. To ship a different
delayed startup default or create another fixed wrapper, edit the device
specification in `scripts/generate-m4l-devices.py`, then run:

```sh
python3 scripts/generate-m4l-devices.py
python3 tests/validate_m4l_devices.py
```

The editable sources are written to `source/m4l`; Live-ready AMXD files are
written to `package/devices`.
