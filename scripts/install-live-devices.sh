#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
device_source="$repo_dir/package/devices"
live_device_root="${S3G_LIVE_DEVICE_ROOT:-$HOME/Music/Ableton/User Library/s3g CLAP}"

devices=(
  "s3g CLAP 3OA Source.amxd"
  "s3g CLAP 3OA Path Encoder.amxd"
  "s3g CLAP 3OA Insert.amxd"
  "s3g CLAP 3OA Main Out.amxd"
  "s3g CLAP 3OA Speaker Main Out.amxd"
)

for device in "${devices[@]}"; do
  if [ ! -f "$device_source/$device" ]; then
    python3 "$repo_dir/scripts/generate-m4l-devices.py"
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
