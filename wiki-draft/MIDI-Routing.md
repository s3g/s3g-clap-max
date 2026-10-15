# MIDI Routing in Ableton Live

**s3g Relay**, **s3g Tracker**, **s3g Utility NIM Gesture**, and
**s3g Utility Neon MIDI** are Max MIDI Effects. Their generated MIDI can
reach the next instrument on the same track directly, and can also be sent
to a separate numbered MIDI bus. The **MIDI OUT** menu controls only that
additional bus.

## Play an instrument on the same track

Put Relay or Tracker before a Live instrument on a MIDI track. When the s3g
device generates notes, the instrument plays even if **MIDI OUT = OFF**.
Selecting **01–16** copies the output to that private bus; it does not
disable the direct path.

![s3g Relay in Live with MIDI OUT set to 01 and MIDI IN set to OFF](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/relay-midi-out-01.png)

This is the simplest setup. No **s3g MIDI Bus to Live** device is needed on
the same track.

## Play an instrument on another track

1. Put Relay or Tracker on the sending MIDI track and set
   **MIDI OUT = 01**.
2. On the destination MIDI track, put **s3g MIDI Bus to Live** *before*
   the Live instrument. Set the bridge's **MIDI IN = 01**.
3. Use Live's normal track monitoring to hear the destination instrument.

![s3g MIDI Bus to Live in Live with MIDI IN set to 01](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/midi-bus-to-live-in-01.png)

The bridge merges bus MIDI with ordinary incoming Live MIDI on its track. If
the sender also has an instrument after Relay or Tracker, both that
instrument and the remote instrument can sound. Keep the sender on a
separate MIDI track when you want only the remote instrument.

To send to an s3g instrument wrapper on another track, select its matching
**MIDI IN** bus instead of adding the bridge. The private bus preserves MIDI
channel bytes; set the receiving CLAP's own MIDI channel in its editor.

If a MIDI effect's **MIDI IN** and **MIDI OUT** use the same bus number, its
private bus output is suppressed to prevent feedback. Its direct same-track
MIDI path remains separate.

## If the notes do not arrive

Check the sender's **MIDI OUT**, the receiver's **MIDI IN**, the destination
track's monitoring, and any MIDI channel filter inside the receiving plugin.
**OFF** disconnects a private bus but does not mute direct MIDI on the
sender's track. Use the bridge's **PANIC** button if bus notes become stuck.

The cross-track Max bus is scheduler-timed, not sample-accurate. Test timing
in a Live Set before relying on it for tight sequencing.
