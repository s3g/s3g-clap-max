# Getting Started in Ableton Live

Install the [s3g-dsp CLAP plugins](https://s3g.github.io/s3g-dsp/installing-plugins.html)
first, then install the matching
[s3g-clap-max release](https://github.com/s3g/s3g-clap-max/releases). The
second package supplies `s3g.clap~` and the Max for Live devices, not the
CLAP plugins. You need Ableton Live with Max for Live and Max 9.

On macOS, run the installer inside the extracted s3g-clap-max release. On
Windows, follow the
[Windows installation guide](https://github.com/s3g/s3g-clap-max/blob/main/INSTALL-WINDOWS.md);
Windows Max for Live support remains experimental. Restart Live after
installation.

## Hear a first device

1. In Live's browser, open **User Library → s3g CLAP**.
2. Add a stereo **s3g Drum** or **s3g Sample … 2** instrument to a MIDI
   track. These use Live's normal stereo track output; no s3g audio bus or
   Main device is needed.
3. Click **EDITOR** on the device. If the editor does not open, check that the
   matching CLAP plugin and `s3g.clap~` Max package are installed.
4. Play or draw MIDI notes. For a Drum device, **TRIGGER** also auditions a
   primary hit without MIDI. Some Sample devices need a sample loaded before
   **PLAY** or MIDI can make sound.
5. Save the Live Set, close it, and reopen it to confirm the plugin's state
   returns. For Sample media, choose **LINK** or **EMBED** where available;
   **PROJECT** does not collect files into an Ableton Project.

## Choose your next route

| Task | Start here |
| --- | --- |
| Relay or Tracker to an instrument | [MIDI Routing](https://github.com/s3g/s3g-clap-max/wiki/MIDI-Routing) |
| Audio between tracks, including Ambisonics | [Multichannel Audio Routing](https://github.com/s3g/s3g-clap-max/wiki/Multichannel-Audio-Routing) |
| Decoder or panner to interface outputs | [Main Hardware Output](https://github.com/s3g/s3g-clap-max/wiki/Main-Hardware-Output) |

Do not confuse the private **MIDI OUT / MIDI IN** bus with the audio
**BUS** on Send and Receive 36. Their numbers can match without connecting
the two systems.
