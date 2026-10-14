# Windows Max DSP regression check

Run this in native Windows Max before accepting a Windows external. The standalone
CLAP host smoke test cannot validate Max's DSP graph or outlet contracts.

## Build with symbols

Use Visual Studio 2022 x64 and the repository's pinned Max SDK and CLAP headers.
Choose an output directory outside Max's search paths and release artifacts:

```powershell
cmake --preset windows-msvc -DC74_LIBRARY_OUTPUT_DIRECTORY=C:/temp/s3g-max-diagnostic
cmake --build build-windows-msvc --config RelWithDebInfo --target s3g_clap_tilde s3g_clap_state_codec_test s3g_clap_host_smoke
ctest --test-dir build-windows-msvc -C RelWithDebInfo -R s3g_clap_state_codec_test --output-on-failure
```

Keep the generated PDB with the diagnostic build. Close Max and Live, locate the
external actually used by Max, check for duplicates, and back it up outside all
Max search folders before replacing it. Record the installed SHA-256 hash. Avoid
restoring previously open patches during these tests.

## Native Max acceptance

1. Start Max in a fresh patch containing only `dac~`. Start and stop DSP; verify
   the selected audio device works.
2. In another fresh patch, create an unloaded `s3g.clap~` and connect its two
   signal outlets to the two `dac~` inlets. Load no CLAP. Start DSP for at least
   one minute and perform two stop/start cycles. Max must stay responsive.
   `snapshot~ 50` on each signal outlet should report finite zero values.
3. Only after step 2 passes, load an existing compatible stereo CLAP. Show its
   editor with `editor 1`, then start DSP. Feed both inputs from
   `cycle~ 223` through `*~ 0.01`; attenuate the two output paths before `dac~`.
   Verify finite, nonzero output using `snapshot~ 50`, editor responsiveness,
   and two DSP stop/start cycles. Close the editor and CLAP, stop DSP, and quit
   Max normally. Record the exact CLAP path/hash without modifying the plug-in.
4. Restart Max and repeat the unloaded case. Keep diagnostic binaries separate
   from published packages. Record Max version, driver, sample rate, signal
   vector size, I/O vector size, and any unrun cases.

## Crash diagnosis and contract

Use WinDbg/CDB or Visual Studio with native debugging. Break on access violations,
retain a full dump, and record the exception thread, registers, all thread stacks,
and loaded module paths. A breakpoint on `MaxAudio!dsp_add64` captures registration;
a breakpoint on the external's `perform64` distinguishes graph setup from audio
processing. Match the external's PDB to the tested binary. MaxAudio export names
plus large offsets may only be nearest-export labels, not private function names.

The historical v0.5.0 crash on Max 9.2.0 was a null read at
`MaxAudio.dll+0x4B3F8` while compiling the downstream graph. Its
`multichanneloutputs` callback returned zero for ordinary signal outlets.
A signal outlet must report one channel in ordinary mode; in MC mode, the first
signal outlet reports the configured output count. Invalid/non-signal outlet
indices return zero. The callback is queried before `dsp64`, even on the ordinary
outlets of this class. See the [Max SDK MC contract](https://sdk.cdn.cycling74.com/max-sdk-8.2.0/chapter_mc.html).

Commit `56d4b24cbe91d063e9a29d3ab5f717dc2ed7d29b` already corrects this callback
and is included in 0.7.0. A native v0.5.0 comparison with only that callback changed
passed unloaded DSP on the same machine. Replacing `object_method("dsp_add64", ...)`
with the typed API did not resolve the faulty outlet metadata. Do not treat the
faulting MaxAudio module or a compiler change alone as proof of the cause.
