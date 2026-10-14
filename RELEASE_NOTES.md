# s3g-clap-max v0.7.0

Bring s3g-dsp CLAP plugins into Max 9 and Ableton Live with `s3g.clap~` and a
ready-to-use collection of Max for Live devices. The s3g-dsp plugins are a
separate download and must be installed too.

## What's new

- **Max for Live devices:** 123 dedicated plugin wrappers on macOS, covering
  instruments, effects, ambisonic tools, decoders, panners, and utilities.
  The Windows package includes 122; Ambi Energy 64 is unavailable in the
  matching Windows s3g-dsp collection.
- **Flexible routing:** Bus Send 36 and Bus Receive 36 carry multichannel
  audio between tracks. Bus to Live Stereo 36 returns a selected stereo pair
  to Live, while Main Hardware Out 32 handles multichannel interface output.
  These buses are independent of Envelop for Live.
- **MIDI in Live:** Tracker, Relay, and the MIDI utilities can feed an
  instrument later on the same track. MIDI Bus to Live connects their optional
  cross-track MIDI bus to ordinary Live instruments.
- **Set recall and automation:** Wrappers save CLAP plugin state with the Live
  Set and expose selected controls for Live automation.

## Fixes

- Reduced clicks and dropouts when adjusting CLAP editor controls during
  playback in Live. The previously reported LF Synth 2 slider clicks stopped
  in the tested macOS session. Opening an editor for the first time may still
  cause a brief interruption.
- Corrected Live tempo delivery to CLAP plugins: Tracker now shows 120 BPM
  when Live is set to 120 BPM, rather than 22,050.
- Corrected the Windows DSP-start crash seen with the older v0.5.0 external.
  A separately built v0.7.0 external passed unloaded and loaded-CLAP audio
  tests in native Windows Max. The downloadable Windows ZIP itself and its
  Max for Live devices still need native testing, so the Windows package is
  labeled **experimental**.

## Install and compatibility

Install the [s3g-dsp CLAP plugins](https://github.com/s3g/s3g-dsp/releases)
first. On macOS, download the universal ZIP, unzip it, and run
**Install s3g-clap-max.command** with Max and Live closed. On Windows x64,
follow the manual steps in `INSTALL-WINDOWS.md` inside the experimental ZIP.
Restart Max and Live after installation. Ableton devices require Live with
Max for Live; Live cannot load CLAP plugins directly.

The macOS package is not notarized; approve it in macOS Privacy & Security
only if you trust the download. Sample plugins' PROJECT storage does not
collect audio into a Live Project; use LINK or EMBED where supported. Ten
64/128-channel bus processors do not have dedicated Live wrappers in this
release. For device names and routing examples, see the
[README](https://github.com/s3g/s3g-clap-max#readme).
