# Install s3g-clap-max on Windows x64 (experimental)

This guide applies to a matching `0.7.0` or later Windows x64 release ZIP. The
download contains the Max 9 `s3g.clap~.mxe64` external and the current Max for
Live devices. It does **not** contain the s3g-dsp CLAP plugins or an automatic
installer. Windows Max for Live behavior still needs native validation; test
with a disposable Live Set before relying on it for a project or performance.
The Ambi Energy wrapper is omitted because the matching s3g-dsp Windows CLAP
collection does not include Ambi Energy.

1. Install 64-bit Max 9 and Ableton Live with Max for Live. Save your work and
   quit both applications before replacing a package or device folder.
2. Download the separate [s3g-dsp Windows x64 CLAP prerelease](https://github.com/s3g/s3g-dsp/releases).
   Extract its complete contents into
   `%LOCALAPPDATA%\Programs\Common\CLAP\s3g-dsp`. Keep the `.clap` files and
   shared `Resources` folder together. This is a per-user CLAP location that
   `s3g.clap~` searches; a custom REAPER scan folder alone is not enough for
   Max to find the plugins.
3. Download the matching `s3g-clap-max-<version>-windows-x64-experimental.zip`
   and its `.sha256` file from the [s3g-clap-max releases page](https://github.com/s3g/s3g-clap-max/releases).
   Optionally compare the ZIP's SHA-256 hash with that file using PowerShell's
   `Get-FileHash -Algorithm SHA256` before extracting it.
4. Extract the entire ZIP. Move any existing `s3g-clap-max` package out of
   `%USERPROFILE%\Documents\Max 9\Packages` to a backup location outside
   Max's package scan folder. Copy the extracted inner `s3g-clap-max` folder
   into `Packages`. The result must be
   `%USERPROFILE%\Documents\Max 9\Packages\s3g-clap-max\package-info.json`,
   with `externals\s3g.clap~.mxe64` beside its `devices` and `patchers` folders.
5. In Live's preferences, locate the selected User Library. Move any old
   `s3g CLAP` folder out of that library to a backup location, then create a
   new `s3g CLAP` folder there. Copy all `.amxd` files from the extracted
   `s3g-clap-max\devices` folder into it. Use a normal folder, not a directory
   symlink; Live may not index a symlinked device folder.
6. Restart Max and Live. In Live, add an s3g Drum or Sample device from
   **User Library → s3g CLAP**, open **EDITOR**, and confirm the matching CLAP
   loads. Save and reopen a disposable Set to check state recall. If a device
   appears but its CLAP does not load, check the paths above and Max Console.

Keep the old package and device folder backups until the new setup works.
Avoid leaving old s3g-dsp CLAP collections in other folders scanned by Max;
duplicate plugin names can make discovery ambiguous. The included
`SHA256SUMS.txt` records the extracted release files. This ZIP contains no
macOS installer and does not install or alter the s3g-dsp plugins.
