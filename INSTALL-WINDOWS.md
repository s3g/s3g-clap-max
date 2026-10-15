# Install s3g-clap-max on Windows x64

This package contains `s3g.clap~` for Max 9 and the s3g Max for Live devices.
The s3g-dsp CLAP plugins are a separate download. Windows Max for Live support
is still experimental, so try it in a disposable Live Set first.

1. Install Max 9. If you want the Live devices, also install Ableton Live with
   Max for Live. Save your work, then close Max and Live.
2. Download the [s3g-dsp Windows CLAP plugins](https://github.com/s3g/s3g-dsp/releases).
   Extract the complete collection into `%COMMONPROGRAMFILES%\CLAP\s3g-dsp`.
   In Explorer, this is usually **This PC → Local Disk (C:) → Program Files →
   Common Files → CLAP → s3g-dsp**. Windows may ask for administrator permission.
   If you cannot use that location, install under
   `%LOCALAPPDATA%\Programs\Common\CLAP\s3g-dsp` instead—not in both places.
   If you also use REAPER, add `%LOCALAPPDATA%\Programs\Common\CLAP` to its CLAP
   paths in **Preferences → Plug-ins → LV2/CLAP**. Keep the `.clap` files and
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

`s3g.clap~` recursively searches both Windows CLAP roots:

- `%COMMONPROGRAMFILES%\CLAP` (recommended all-users Common Files location).
- `%LOCALAPPDATA%\Programs\Common\CLAP` (per-user alternative inside the
  normally hidden AppData folder).

It also searches any existing directories in `CLAP_PATH` (separated by `;`).
Keep only one active copy of each s3g-dsp `.clap` plugin across these paths.
If an older collection is also present, Max can report `ambiguous CLAP name`
and list both matching paths. Move the old collection to a backup location
**outside** every scanned root and `CLAP_PATH` directory; renaming it inside
one of those roots is not enough. A saved Live Set can also recall an older
copy by its stored path. Send `getpaths` to `s3g.clap~` in Max to list its
effective search roots.

Keep old Max-package and Live-device folders as backups until the new
installation works. If a device appears in Live but its plugin does not
open, check the install and search paths above and look for an error in Max
Console. The Windows package omits the Ambi Energy device because that plugin
is not in the Windows s3g-dsp collection.

For MIDI, multichannel audio, and hardware-output routing, start with the
[visual M4L routing guide](https://github.com/s3g/s3g-clap-max/blob/main/package/docs/s3g-clap-m4l-visual-guide.md).
