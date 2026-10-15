# Standalone Max Setup

Use `s3g.clap~` in Max 9 to host s3g-dsp CLAP plugins without Ableton Live or Max for Live. The Max external and the CLAP plugins are separate installs.

## Install

1. Install Max 9 and the [s3g-dsp CLAP plugins](https://s3g.github.io/s3g-dsp/installing-plugins.html).
2. Download `s3g-clap-max` version 0.7.0 or later from [GitHub Releases](https://github.com/s3g/s3g-clap-max/releases).
   - **macOS:** Quit Max, extract the macOS ZIP, change to the extracted folder in Terminal, and run the installer with `--no-live` so it installs only the Max package:

     ```sh
     ./Install\ s3g-clap-max.command --no-live
     ```

     The default destination is `~/Documents/Max 9/Packages/s3g-clap-max`. If macOS blocks the installer, follow the [macOS installation guide](https://github.com/s3g/s3g-clap-max/blob/main/INSTALL.md).
   - **Windows x64 (experimental):** Extract the matching Windows ZIP and copy its inner `s3g-clap-max` folder to `%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max`. Install the Windows s3g-dsp CLAP collection separately. The [Windows installation guide](https://github.com/s3g/s3g-clap-max/blob/main/INSTALL-WINDOWS.md) gives the CLAP location; skip its Live-device step if you only use Max.
3. Restart Max. You do not need the `.amxd` devices or a Live User Library for standalone Max.

## Open a stereo CLAP plugin

1. In a new Max patch, create `[s3g.clap~ 2 2]`. The first number is the Max-visible input channel count; the second is the output count.
2. Connect a stereo source to its two signal inlets, and its two signal outlets to a level control and audio output. Start at a low level.
3. Connect an `[open]` message to the object's leftmost inlet and click it to choose an installed CLAP plugin with stereo input and output. Then send `[editor 1]` to open that plugin's editor.
4. Turn on Max's audio engine. The rightmost outlet reports status and errors; connect it to `[print]` while troubleshooting.

Open `s3g.clap~.maxhelp` from the installed package's `help` folder for a working patch and examples of MIDI, parameters, and state files.

## Use multichannel audio

For a two-channel source feeding a 36-channel fifth-order Ambisonic field, create:

```max
[s3g.clap~ 2 36 @mc 1]
```

Send `open "s3g Ambi Encoder Path 64"`, then set **INPUTS = 2** and **ORDER = 5OA** in the plugin editor. The object accepts one two-channel MC signal and emits one 36-channel MC signal. Its channel arguments limit what Max can send to and receive from the plugin; channels outside those counts are silent or discarded.

The **Bus Send 36**, **Bus Receive 36**, and **Main Hardware Out 32** devices are for Ableton Live. In standalone Max, patch the MC signal directly to the next processor, decoder, recorder, or output routing.

## If something is missing

If Max cannot create `s3g.clap~`, check that the complete package is in Max 9's `Packages` folder and restart Max. If the object exists but `open` cannot find a plugin, check the separate s3g-dsp CLAP installation. If the editor opens but audio is silent, check Max's audio engine, the patch's gain and connections, the object's channel counts, and the plugin's own input settings.
