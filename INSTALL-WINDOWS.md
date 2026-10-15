# Install s3g-clap-max on Windows x64

This package contains `s3g.clap~` for Max 9 and the s3g Max for Live devices.
The s3g-dsp CLAP plugins are a separate download. Windows Max for Live support
is still experimental, so try it in a disposable Live Set first.

1. Install Max 9. If you want the Live devices, also install Ableton Live with
   Max for Live. Save your work, then close Max and Live.
2. Download the [s3g-dsp Windows CLAP plugins](https://github.com/s3g/s3g-dsp/releases).
   Extract the complete collection into
   `%LOCALAPPDATA%\Programs\Common\CLAP\s3g-dsp`. Keep the `.clap` files and
   `Resources` folder together.
3. Download and extract the matching experimental Windows ZIP from the
   [s3g-clap-max releases page](https://github.com/s3g/s3g-clap-max/releases).
   If you already have an `s3g-clap-max` folder in
   `%USERPROFILE%\Documents\Max 9\Packages`, move it somewhere safe outside
   `Packages` first. Copy the **inner `s3g-clap-max` folder** from the new ZIP
   into `Packages`. You should end up with
   `%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max\package-info.json`.
4. For Ableton Live, find your User Library location in Live's preferences.
   Move any old `s3g CLAP` device folder somewhere safe, then create a normal
   `s3g CLAP` folder in the User Library. Copy all `.amxd` files from the new
   package's `devices` folder into it. Do not use a folder symlink; Live may
   not index it.
5. Restart Max and Live. In Live, open **User Library → s3g CLAP**, add a Drum
   or Sample device, and click **EDITOR** to confirm its plugin opens. Save and
   reopen a test Set to check that its settings return.

Keep the old folders until the new installation works. If a device appears in
Live but its plugin does not open, check the two install locations above and
look for an error in Max Console. The Windows package omits the Ambi Energy
device because that plugin is not in the Windows s3g-dsp collection.

For MIDI, multichannel audio, and hardware-output routing, start with the
[visual M4L routing guide](https://github.com/s3g/s3g-clap-max/blob/main/package/docs/s3g-clap-m4l-visual-guide.md).
