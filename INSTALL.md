# Install s3g-clap-max on macOS

This download contains the universal `s3g.clap~` Max 9 external and all s3g
Max for Live devices. You do **not** need CMake or a source checkout. The
[s3g-dsp CLAP plugins](https://github.com/s3g/s3g-dsp/releases) are a separate
download; install those first. For the Live devices, you also need Ableton
Live with Max for Live.

1. Quit Max and Ableton Live. Download the macOS zip from the
   [s3g-clap-max releases](https://github.com/s3g/s3g-clap-max/releases).
   If you want to check the download, put its `.sha256` asset beside the zip
   and run `shasum -a 256 -c s3g-clap-max-0.7.0-macos-universal.zip.sha256`.
2. Unzip the archive and double-click **Install s3g-clap-max.command** inside
   the unzipped folder. The installer verifies its bundled checksums and
   `s3g.clap~` signature before copying anything. It does not need `sudo`.
3. If macOS blocks the installer, use **System Settings → Privacy & Security →
   Open Anyway**, then confirm **Open**. Do this only for a download you trust.
   [Apple explains this approval](https://support.apple.com/en-us/102445).
4. Restart Max and Live. In Live, look under **User Library → s3g CLAP**.
   Open an s3g device and press **EDITOR** to verify that its CLAP plugin loads.

The default locations are `~/Documents/Max 9/Packages/s3g-clap-max` and
`~/Music/Ableton/User Library/s3g CLAP`. The installer copies, rather than
hard-links, the release devices. Upgrades preserve the previous package and
Live folder in a timestamped `~/Documents/s3g-clap-max-backups` directory;
other files inside the `s3g CLAP` folder are carried forward. It removes only
the `com.apple.quarantine` attribute from the verified, staged
`s3g.clap~.mxo` bundle. It does not change global Gatekeeper settings or touch
the separately installed s3g-dsp CLAP plugins.

For custom paths or a preflight, run the command from Terminal with
`--dry-run`. Set `S3G_MAX_PACKAGE_ROOT` or `S3G_LIVE_DEVICE_ROOT` to locations
ending in `s3g-clap-max` and `s3g CLAP` respectively. Use `--no-live` if you
only use standalone Max. A custom Live User Library must already be selected
in Live's preferences; the installer cannot change that preference.

Some Sample plugins offer PROJECT, LINK, or EMBED storage. In Live, use LINK
or EMBED: PROJECT does not collect audio into a Live Set. Read the
[M4L routing guide](s3g-clap-max/docs/s3g-clap-m4l-routing.md) for the
36-channel bus, hardware output, and MIDI-bus workflow.
