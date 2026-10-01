# s3g CLAP 3OA routing for Max for Live

## Signal contract

The s3g Source and Insert devices use the same device-chain convention as
Envelop for Live:

| Live device channel | Meaning |
| --- | --- |
| 1–2 | Ordinary stereo track signal, passed through unchanged |
| 3–18 | Third-order Ambisonics, 16 channels, ACN order, SN3D normalization |

The named `master` bus itself carries the 16 Ambisonics channels. Main Out
receives those 16 channels and decodes them with a CLAP plugin. Its first two
device channels preserve the ordinary track signal; device channels 3–34
carry up to 32 decoded channels as sixteen independently routable stereo pairs.

## Basic setup

For a repository development install on macOS, first run
`scripts/install-local-package.sh` so Max can resolve `s3g.clap~` and the
routing abstractions, then run `scripts/install-live-devices.sh` to expose the
five devices under **User Library > s3g CLAP**. The latter uses hard links
because Live does not index symbolic links in its User Library. Restart Live
after rebuilding the external.

### Fixed Path-to-speaker pair

1. Create a dedicated normal audio track and put **s3g CLAP 3OA Speaker Main
   Out** on it, preferably as the first device. Do not use Live's global Master
   track. This wrapper always loads **s3g Ambi Decoder Speaker 64**, fixes the
   decoder to third order, receives the private `master` bus, and exposes
   decoded channels 1–32 through the sixteen hardware-pair selectors.
2. Put **s3g CLAP 3OA Path Encoder** on each source audio track. Each instance
   always loads **s3g Ambi Encoder Path 64**, presents two CLAP inputs, fixes
   `Input Count` to `2` and `Order` to `3`, and sends 16-channel ACN/SN3D to
   the private `master` bus when **NEXT** is off.
3. Leave **NEXT** off when an encoder should feed Speaker Main Out directly.
   The private `s3g.bus.send master` / `s3g.bus.receive master` handshake finds
   the decoder track automatically. Multiple encoder tracks routed to that
   same receiver are summed by Live before the decoder, matching the useful
   E4L multi-source workflow without sharing E4L's global bus symbols.
4. Assign only the speaker output pairs needed by the chosen layout. New pairs
   remain **Ext. Out / No Output** until selected. Speaker Main Out exposes 32
   decoded channels; the 41-speaker Cube and LPAC layouts therefore have
   unrouted channels 33–41 in this wrapper.

The fixed wrappers expose the stable plugin parameters in Live's automation
chooser and keep the native CLAP editor available. Their plugin picker is
intentionally disabled: substituting another CLAP would invalidate the fixed
parameter-ID map. Live automation is passed to CLAP by parameter ID;
native-editor and parameter-query values are reflected into Live while the
outgoing path is suppressed with each `live.numbox` object's `set` message.
Restored CLAP state is
synchronized after the plugin loads. Non-parameter data such as Path geometry
and custom speaker state remains part of the saved CLAP Blob.

### General-purpose devices

1. Create a dedicated audio track and put **s3g CLAP 3OA Main Out** first on the
   track. Leave the default binaural decoder in place or use **Load CLAP** to
   choose another decoder with at least 16 inputs and up to 32 useful outputs.
   For binaural monitoring, route decoded pair **1/2** to the desired headphone
   output. For a loudspeaker decoder, assign each active decoded pair to its
   corresponding Live external-output pair.
2. Add **s3g CLAP 3OA Source** to an audio track. It opens **s3g Ambi Encoder
   Medium 16** by name and routes its 16-channel encoding to Main Out.
3. Open the CLAP editor from the device and position the source. Saving the
   Live Set stores the selected bundle, exact plugin ID, and complete CLAP
   state in the device.
4. For Ambisonics-domain processing, put **s3g CLAP 3OA Insert** after the
   Source. Enable **NEXT** on the Source. On a series of Inserts, enable NEXT
   on every device except the last; the last device routes to Main Out.

The Source presents two inputs to `s3g.clap~`. Live's left and right channels
pass through an editable, unity-default stereo `live.gain~` meter and independent
**1 MUTE** / **2 MUTE** controls before reaching those CLAP inputs. The meter
is pre-mute, so incoming activity remains visible while a channel is muted.
Stereo channels 1–2 bypass these diagnostic mutes and remain available to
ordinary downstream devices while the 3OA stream occupies channels 3–18.

## Main Out hardware routing

Main Out adapts Envelop for Live's Live 12 hardware-output strategy.
`plugout~` exposes 34 channels: ordinary track stereo on 1–2 and sixteen
decoded stereo pairs on 3–34. Each pair menu controls the corresponding Max
for Live device output's Live routing channel. New output pairs initialize to
**Ext. Out / No Output**, so they remain silent until explicitly assigned and
cannot accidentally hit the wrong loudspeakers. The sixteen menus use a
compact four-by-four matrix that fits Live's 425 × 169 device area.

The default `s3g Ambi Decoder Head 2` produces only decoded pair 1/2; the other
pairs are zero-filled by `s3g.clap~`. A multichannel decoder such as
`s3g Ambi Decoder Speaker 64` can drive the first 32 decoded channels exposed
by Main Out. The selected routes belong to Live's device-output state, while
the selected CLAP and its state remain stored in the device's Blob parameter.
The fixed Speaker Main Out uses the same direct-output topology but always
loads Speaker 64, fixes its Ambisonics order to 3, and publishes its remaining
stable CLAP parameters to Live automation.

## Independent routing namespace

The devices use the runtime routing layer under `patchers/s3g-routing`.
Abstraction names and global handshake symbols are all private `s3g.*` names;
no `e4l.*` sender or receiver is loaded. Consequently, s3g and Envelop devices
can coexist in one Live Set, but do not automatically exchange bus audio or
routing acknowledgements. Any future bridge between the two systems must be an
explicit translator rather than an accidental shared global symbol.

This private handshake is a protocol change. After updating the package,
reload every s3g Source, Path Encoder, Insert, Main Out, and Speaker Main Out
instance in a Set together. An
already-open device using the former handshake will not discover a newly
loaded device using the private namespace.

The s3g routing layer is derived from Envelop for Live's LGPL-2.1 Max
abstractions. Unmodified source copies live outside the Max package search path
under `vendor/envelop-for-live/patchers`. Every generated runtime patch carries
an attribution comment, and complete license copies are bundled in the bus and
Live patcher directories.

Do not put s3g Main Out on Live's global Master track. Put it first on a normal
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

The carrier uses Max for Live parameter type `3` (Blob). Restore messages are
accepted only when they begin with the embedded-state version tag
`s3g.clap.state.1`; empty/default values are ignored.

The general Source device treats its CLAP host as a stereo encoder. After a fresh or
restored plugin load it requests the plugin's parameter list; if an exact
`Input Count` parameter exists, Source addresses that parameter by its reported
CLAP ID and sets it to `2`. Encoders without that parameter are left unchanged.
This avoids hard-coding the different IDs used by the Path, Cloud, Point, and
Terrain encoders. The stereo `live.gain~` is an editable, stored input trim at
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
Speaker Main Out deliberately have no plugin picker. To ship a different
delayed startup default or create another fixed wrapper, edit the device
specification in `scripts/generate-m4l-devices.py`, then run:

```sh
python3 scripts/generate-m4l-devices.py
python3 tests/validate_m4l_devices.py
```

The editable sources are written to `source/m4l`; Live-ready AMXD files are
written to `package/devices`.
