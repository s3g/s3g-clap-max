# Windows x64 release candidate checks

The experimental Windows ZIP is a candidate, not evidence that Max for Live
works on Windows. Keep the artifact unpublished until the exact archive passes
native testing. The macOS ZIP must also be rebuilt from the same final commit
before a joint 0.7.0 release. The v0.5.0 DSP-start crash was traced to the
`multichanneloutputs` callback reporting zero channels for ordinary signal
outlets; the correction is in the 0.7.0 source, but must be checked in the
exact release archive.

The user reports that a current 0.7.0 build passed native Windows Max tests
with DSP running unloaded and with a CLAP processing audio. Whether that
binary came from the rebuilt release ZIP has not yet been established. This
does not cover Max for Live, so the exact-archive gates below remain open.

## Automated candidate gates

- [x] Cross-build the current x64 `s3g.clap~.mxe64` with the pinned Max SDK and
  CLAP headers; verify its `ext_main` export and PE x64 format.
- [x] Pass all 12 generated M4L and Windows-staging validators.
- [x] Package 127 Windows devices, excluding the Mac-only Ambi Energy wrapper;
  change staged external dependency entries from `.mxo`/`iLaX` to
  `.mxe64`/`mx64` without changing macOS source devices.
- [x] Verify every extracted file against the ZIP's `SHA256SUMS.txt`, check the
  ZIP checksum, and run the release archive validator.
- [ ] Run the manually dispatched `Windows x64 candidate` workflow on the final
  committed revision. It must pass the native MSVC build, state codec test,
  and M4L validators.

## Exact-archive Windows acceptance

Use the ZIP identified by its published SHA-256 file. Do not substitute a
separate build or a mix of old and new devices.

- [ ] On Windows x64 with Max 9, install the complete s3g-dsp Windows CLAP
  prerelease and the extracted s3g-clap-max ZIP using `INSTALL-WINDOWS.md`.
  Confirm Max finds the external and the plugin from a clean launch.
- [ ] Run `tests/windows_max_dsp.md` against the external from that exact ZIP:
  first an unloaded `s3g.clap~` connected to `dac~` with DSP on for at least a
  minute and two stop/start cycles, then a loaded stereo CLAP with audio and
  its editor. Record the archive and installed external SHA-256 hashes.
- [ ] In standalone Max, load a simple s3g CLAP plugin, open and close its
  editor, pass audio or MIDI, and save/restore state without a crash.
- [ ] In Ableton Live with Max for Live, load a Drum instrument, a stereo
  Sample instrument, and Tracker. Confirm editor, trigger/MIDI, automation,
  and Set save/reopen. At 120 BPM, Tracker must report 120 BPM.
- [ ] Test Relay or Tracker MIDI into a following Live instrument on the same
  track, then across tracks through **s3g MIDI Bus to Live**. Check channel
  assignments, note-off/PANIC, and Set reopen.
- [ ] Test **Bus Send 36 → Bus Receive 36** across tracks, then a decoder or
  panner into **Main Hardware Out 32**. Change the bus number away and back;
  confirm audio disconnects and reconnects without replacing the device.
- [ ] Open editors while audio runs, adjust parameters, and check Max Console
  for errors, clicks, or lock-skipped warnings. Test Sample LINK/EMBED recall
  from a reopened disposable Set.

## Publication

- [ ] Fix any native failures, then rebuild both Mac and Windows archives from
  one clean commit. Re-run their checksum and extracted-archive checks.
- [ ] Publish the Windows ZIP only as **experimental**, alongside its `.sha256`
  file and the matching s3g-dsp Windows CLAP requirement. Do not describe a
  cross-build or native CI result as Live host acceptance.
