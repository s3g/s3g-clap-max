# s3g Max for Live

The s3g Max for Live devices bring s3g-dsp CLAP instruments, processors, and
spatial audio tools into Ableton Live. Live does not host CLAP plugins itself:
the devices use the `s3g.clap~` Max external, and the matching s3g-dsp CLAP
plugins must also be installed.

Start with [Getting Started](https://github.com/s3g/s3g-clap-max/wiki/Getting-Started) for installation and a first
sound. Then choose the routing guide that matches your task:

- [MIDI Routing](https://github.com/s3g/s3g-clap-max/wiki/MIDI-Routing): play the next Live instrument from Relay or
  Tracker, or send MIDI to a different track.
- [Multichannel Audio Routing](https://github.com/s3g/s3g-clap-max/wiki/Multichannel-Audio-Routing): use explicit
  36-channel Send and Receive devices between tracks.
- [Main Hardware Output](https://github.com/s3g/s3g-clap-max/wiki/Main-Hardware-Output): map decoded or panned mono
  channels to your audio interface.

The [wrapper list](https://github.com/s3g/s3g-clap-max#available-wrappers)
shows which s3g-dsp plugins have dedicated Live devices. Individual plugin
controls and output formats are documented in the
[s3g-dsp plugin index](https://s3g.github.io/s3g-dsp/plugin-index.html).

The MIDI bus, 36-channel audio bus, and Main hardware output are different
routes. **MIDI OUT** adds a cross-track path without muting the next
same-track instrument. Audio Send has a separate **DRY KEEP / BUS ONLY**
choice for its normal stereo output.
