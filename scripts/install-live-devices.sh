#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
device_source="$repo_dir/package/devices"
live_device_root="${S3G_LIVE_DEVICE_ROOT:-$HOME/Music/Ableton/User Library/s3g CLAP}"

devices=(
  "s3g Tracker.amxd"
  "s3g Bus Send 36.amxd"
  "s3g Bus Receive 36.amxd"
  "s3g Ambi Encoder Path.amxd"
  "s3g Ambi Encoder Point.amxd"
  "s3g Ambi Encoder Cloud.amxd"
  "s3g Ambi Encoder Surface Terrain.amxd"
  "s3g Ambi Encoder Cartography.amxd"
  "s3g Ambi Encoder Ray.amxd"
  "s3g Ambi Encoder Ray Bilocation.amxd"
  "s3g Ambi Encoder Modal.amxd"
  "s3g Ambi Encoder Medium.amxd"
  "s3g Ambi Encoder Membrane Kick.amxd"
  "s3g Ambi Encoder Acid.amxd"
  "s3g Ambi Encoder Horizon.amxd"
  "s3g Ambi Encoder VOT.amxd"
  "s3g Ambi Encoder Vox.amxd"
  "s3g Ambi Encoder Wave Terrain.amxd"
  "s3g Ambi Encoder Stochastic.amxd"
  "s3g Ambi Encoder Neural Ecology.amxd"
  "s3g Ambi Encoder Pulsar.amxd"
  "s3g Ambi Encoder Wind.amxd"
  "s3g Ambi Encoder Water.amxd"
  "s3g Ambi Encoder Pyrosphere.amxd"
  "s3g Ambi Encoder Cryosphere.amxd"
  "s3g Ambi Encoder Insect.amxd"
  "s3g Ambi Encoder Wrangler.amxd"
  "s3g Ambi Effect DJ Filter.amxd"
  "s3g Ambi Effect Delay.amxd"
  "s3g Ambi Effect Pitch.amxd"
  "s3g Ambi Effect Gain.amxd"
  "s3g Ambi Effect Resonance Print.amxd"
  "s3g Ambi Effect Partial Trace.amxd"
  "s3g Ambi Effect Response Trace.amxd"
  "s3g Ambi Effect Displacement.amxd"
  "s3g Ambi Transform Depth 16.amxd"
  "s3g Ambi Transform Rot 64.amxd"
  "s3g Ambi Transform Order Band 64.amxd"
  "s3g Processor Ambi Imprint 64.amxd"
  "s3g Analyzer Meter 64.amxd"
  "s3g Analyzer Ambi Energy 64.amxd"
  "s3g Ambi Decoder Speaker.amxd"
  "s3g Ambi Decoder Head.amxd"
  "s3g Ambi Decoder Stereo.amxd"
  "s3g Ambi Decoder Object.amxd"
  "s3g Ambi Decoder Adaptive.amxd"
  "s3g Ambi Decoder Sub.amxd"
  "s3g Panner Layout.amxd"
  "s3g Panner DBAP.amxd"
  "s3g Panner LBAP.amxd"
  "s3g Panner VBAP.amxd"
  "s3g Main Hardware Out 32.amxd"
  "s3g Output Autogain Stereo.amxd"
  "s3g Output Autogain Quad.amxd"
  "s3g Effect Spectral Spray.amxd"
  "s3g Effect Delay Field.amxd"
  "s3g Effect Spectral Spray 8.amxd"
  "s3g Processor Buffer 8.amxd"
  "s3g Processor Delay 8.amxd"
  "s3g Processor Delay 24.amxd"
  "s3g Processor Wave Geometry 8.amxd"
  "s3g Processor Spectral 8.amxd"
  "s3g Processor Spectral 24.amxd"
  "s3g Processor Feedback Shift 8.amxd"
  "s3g Processor Fissure 8.amxd"
  "s3g Matrix Group 32.amxd"
  "s3g Drum Kick.amxd"
  "s3g Drum Snare.amxd"
  "s3g Drum Floor Tom.amxd"
  "s3g Drum Concert Bass.amxd"
  "s3g Drum Toms.amxd"
  "s3g Drum Hi-Hat.amxd"
  "s3g Drum Clap.amxd"
  "s3g Drum Cowbell.amxd"
  "s3g Drum Crash.amxd"
  "s3g Drum Break.amxd"
  "s3g Drum Overload.amxd"
  "s3g Drum Echo.amxd"
  "s3g Drum Mixer 16.amxd"
  "s3g Sample Player 2.amxd"
  "s3g Sample Doubles 2.amxd"
  "s3g Sample Wavesets 2.amxd"
  "s3g Sample Motion 2.amxd"
  "s3g Sample Lanes 2.amxd"
  "s3g Sample Grains 2.amxd"
  "s3g Sample Cutups 2.amxd"
  "s3g Sample Circulator 2.amxd"
  "s3g Processor Conduit 2.amxd"
  "s3g Processor Formant Matrix 2.amxd"
  "s3g Processor Errant 2.amxd"
  "s3g Processor LF Synth 2.amxd"
  "s3g Processor Lowform 2.amxd"
  "s3g Processor Stack 2.amxd"
  "s3g Macro Delay 8.amxd"
  "s3g Macro Delay 24.amxd"
  "s3g Macro Pitch 8.amxd"
  "s3g Macro Pitch 24.amxd"
  "s3g Macro Fracture Mono 1.amxd"
  "s3g Macro Fracture 8.amxd"
  "s3g Macro Fracture 24.amxd"
  "s3g Macro Shred Mono 1.amxd"
  "s3g Macro Shred 8.amxd"
  "s3g Macro Shred 24.amxd"
  "s3g Sample Cutups 32.amxd"
  "s3g Sample Grains 32.amxd"
  "s3g Sample Kit 32.amxd"
  "s3g Sample Lanes 32.amxd"
  "s3g Sample Motion 32.amxd"
  "s3g Sample Player 16.amxd"
  "s3g Sample Rings 8.amxd"
  "s3g Sample Slicer 2.amxd"
  "s3g Sample Slicer 16.amxd"
  "s3g Sample Wavesets 32.amxd"
)

for device in "${devices[@]}"; do
  if [ ! -f "$device_source/$device" ]; then
    python3 "$repo_dir/scripts/generate-m4l-devices.py"
    python3 -B "$repo_dir/scripts/generate-m4l-ambi36.py"
    python3 -B "$repo_dir/scripts/generate-m4l-extra-effects.py"
    python3 -B "$repo_dir/scripts/generate-m4l-next-batch.py"
    python3 -B "$repo_dir/scripts/generate-m4l-field-tools.py"
    python3 -B "$repo_dir/scripts/generate-m4l-tracker.py"
    break
  fi
done

# Live's User Library indexer does not follow a directory symlink here. Replace
# only the exact development link previously created by this package.
if [ -L "$live_device_root" ]; then
  current_target="$(readlink "$live_device_root")"
  if [ "$current_target" != "$device_source" ]; then
    echo "Refusing to replace unrelated symlink: $live_device_root -> $current_target" >&2
    exit 1
  fi
  unlink "$live_device_root"
elif [ -e "$live_device_root" ] && [ ! -d "$live_device_root" ]; then
  echo "Refusing to replace non-directory path: $live_device_root" >&2
  exit 1
fi

mkdir -p "$live_device_root"

for device in "${devices[@]}"; do
  source_path="$device_source/$device"
  destination_path="$live_device_root/$device"

  if [ -e "$destination_path" ] && [ "$source_path" -ef "$destination_path" ]; then
    echo "Live device hard link already installed: $destination_path"
    continue
  fi

  if [ -L "$destination_path" ]; then
    current_target="$(readlink "$destination_path")"
    if [ "$current_target" != "$source_path" ]; then
      echo "Refusing to replace unrelated symlink: $destination_path -> $current_target" >&2
      exit 1
    fi
    unlink "$destination_path"
  elif [ -e "$destination_path" ]; then
    echo "Refusing to replace existing file: $destination_path" >&2
    exit 1
  fi

  if ! ln "$source_path" "$destination_path"; then
    echo "Could not hard-link $device. The repository and User Library must be on the same filesystem." >&2
    exit 1
  fi
  echo "Linked Live device: $destination_path"
done

echo "Ableton Live devices are available under User Library/s3g CLAP."
