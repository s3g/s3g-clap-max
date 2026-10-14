#!/usr/bin/env bash
# Install the downloaded macOS release without a source checkout or sudo.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: Install s3g-clap-max.command [--dry-run] [--no-live]

Install the bundled Max 9 package and, by default, its Max for Live devices.
Set S3G_MAX_PACKAGE_ROOT or S3G_LIVE_DEVICE_ROOT for custom locations.
Quit Max and Ableton Live before installing.
EOF
}

dry_run=0
install_live=1
for option in "$@"; do
  case "$option" in
    --dry-run) dry_run=1 ;;
    --no-live) install_live=0 ;;
    -h|--help) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
done

fail() { echo "ERROR: $*" >&2; exit 1; }
release_root="$(cd "$(dirname "$0")" && pwd -P)"
payload="$release_root/s3g-clap-max"
max_major="${S3G_MAX_VERSION:-9}"
max_root="${S3G_MAX_PACKAGE_ROOT:-$HOME/Documents/Max ${max_major}/Packages/s3g-clap-max}"
live_root="${S3G_LIVE_DEVICE_ROOT:-$HOME/Music/Ableton/User Library/s3g CLAP}"
backup_parent="${S3G_MAX_BACKUP_ROOT:-$HOME/Documents/s3g-clap-max-backups}"
external="$payload/externals/s3g.clap~.mxo"

[[ "${max_root##*/}" == "s3g-clap-max" ]] || fail "Max target must end in s3g-clap-max"
[[ "${live_root##*/}" == "s3g CLAP" ]] || fail "Live target must end in s3g CLAP"
[[ -f "$release_root/SHA256SUMS" && -f "$payload/package-info.json" ]] \
  || fail "Incomplete release folder; unzip the entire downloaded archive"
[[ -d "$external" && -f "$external/Contents/MacOS/s3g.clap~" ]] \
  || fail "The s3g.clap~ external is missing"
[[ -d "$payload/devices" ]] || fail "The M4L devices are missing"

echo "Verifying downloaded release files..."
(cd "$release_root" && /usr/bin/shasum -a 256 -c SHA256SUMS >/dev/null) \
  || fail "Release file checksum failed; download the archive again"
/usr/bin/codesign --verify --deep --strict "$external" \
  || fail "The s3g.clap~ code signature is invalid"
/usr/bin/lipo "$external/Contents/MacOS/s3g.clap~" \
  -verify_arch arm64 x86_64 >/dev/null \
  || fail "The s3g.clap~ external is not universal arm64/x86_64"
/usr/bin/grep -Eq '"name"[[:space:]]*:[[:space:]]*"s3g-clap-max"' \
  "$payload/package-info.json" || fail "Unexpected Max package identity"

if [[ -L "$max_root" ]]; then
  old_link="$(readlink "$max_root")"
  case "$old_link" in
    */s3g-clap-max/package|*/s3g-clap-max) ;;
    *) fail "Refusing unrelated Max package symlink: $max_root -> $old_link" ;;
  esac
elif [[ -e "$max_root" ]]; then
  [[ -d "$max_root" && -f "$max_root/package-info.json" ]] \
    || fail "Refusing to replace an unrecognized Max package target: $max_root"
  /usr/bin/grep -Eq '"name"[[:space:]]*:[[:space:]]*"s3g-clap-max"' \
    "$max_root/package-info.json" || fail "Existing Max package has another identity"
fi
if (( install_live )) && [[ -L "$live_root" ]]; then
  fail "Refusing to replace a symlinked Live device folder: $live_root"
fi
if (( install_live )) && [[ -e "$live_root" && ! -d "$live_root" ]]; then
  fail "Refusing to replace a non-folder Live target: $live_root"
fi

echo "Max package: $max_root"
if (( install_live )); then echo "Live devices: $live_root"; fi
echo "Backups, if upgrading: $backup_parent"
if (( dry_run )); then
  echo "Dry run complete; nothing was installed or changed."
  exit 0
fi

max_parent="$(dirname "$max_root")"
live_parent="$(dirname "$live_root")"
mkdir -p "$max_parent"
if (( install_live )); then mkdir -p "$live_parent"; fi
stage_max="$(mktemp -d "$max_parent/.s3g-clap-max-stage.XXXXXX")"
stage_live=""
backup_run=""
old_max_moved=0
old_live_moved=0
new_max_moved=0
new_live_moved=0
finished=0

cleanup() {
  status=$?
  trap - EXIT
  if (( status != 0 && ! finished )); then
    echo "Installation failed; restoring prior locations..." >&2
    if [[ -z "$backup_run" ]] && (( new_max_moved || new_live_moved )); then
      mkdir -p "$backup_parent"
      backup_run="$(mktemp -d "$backup_parent/failed-$(date +%Y%m%d-%H%M%S)-XXXXXX")"
    fi
    if (( new_live_moved )) && [[ -e "$live_root" ]]; then
      mv "$live_root" "$backup_run/Failed New Live Devices" || true
    fi
    if (( old_live_moved )) && [[ -e "$backup_run/Previous Live Folder" || -L "$backup_run/Previous Live Folder" ]]; then
      mv "$backup_run/Previous Live Folder" "$live_root" || true
    fi
    if (( new_max_moved )) && [[ -e "$max_root" ]]; then
      mv "$max_root" "$backup_run/Failed New Max Package" || true
    fi
    if (( old_max_moved )) && [[ -e "$backup_run/Previous Max Package" || -L "$backup_run/Previous Max Package" ]]; then
      mv "$backup_run/Previous Max Package" "$max_root" || true
    fi
    [[ -z "$backup_run" ]] || echo "Recovery files: $backup_run" >&2
  fi
  [[ ! -d "$stage_max" ]] || rm -rf "$stage_max"
  [[ -z "$stage_live" || ! -d "$stage_live" ]] || rm -rf "$stage_live"
  exit "$status"
}
trap cleanup EXIT

/usr/bin/ditto "$payload" "$stage_max"
# Only this verified, staged external loses Gatekeeper's quarantine marker.
# Other extended attributes, plug-ins, and global Gatekeeper settings stay intact.
/usr/bin/xattr -drs com.apple.quarantine \
  "$stage_max/externals/s3g.clap~.mxo" 2>/dev/null || true
attributes="$(/usr/bin/xattr -lr "$stage_max/externals/s3g.clap~.mxo")" \
  || fail "Could not inspect installed external attributes"
[[ "$attributes" != *com.apple.quarantine* ]] \
  || fail "Could not remove quarantine from the staged s3g.clap~ external"
/usr/bin/codesign --verify --deep --strict \
  "$stage_max/externals/s3g.clap~.mxo" \
  || fail "Staged external signature verification failed"

if (( install_live )); then
  stage_live="$(mktemp -d "$live_parent/.s3g-clap-live-stage.XXXXXX")"
  if [[ -d "$live_root" ]]; then
    /usr/bin/ditto "$live_root" "$stage_live"
  fi
  device_count=0
  while IFS= read -r -d '' source_device; do
    name="${source_device##*/}"
    target="$stage_live/$name"
    if [[ -e "$target" || -L "$target" ]]; then
      [[ -f "$target" && ! -L "$target" ]] \
        || fail "Unexpected prior device target: $target"
      /bin/unlink "$target"
    fi
    /usr/bin/ditto "$source_device" "$target"
    /usr/bin/cmp -s "$source_device" "$target" \
      || fail "Staged Live device differs: $name"
    device_count=$((device_count + 1))
  done < <(/usr/bin/find "$payload/devices" -maxdepth 1 -type f \
    -name '*.amxd' -print0)
  (( device_count >= 3 )) || fail "No complete M4L device set found"
fi

if [[ -e "$max_root" || -L "$max_root" ]] \
    || { (( install_live )) && [[ -d "$live_root" ]]; }; then
  mkdir -p "$backup_parent"
  backup_run="$(mktemp -d "$backup_parent/$(date +%Y%m%d-%H%M%S)-XXXXXX")"
  if [[ -e "$max_root" || -L "$max_root" ]]; then
    if [[ -L "$max_root" ]]; then
      /usr/bin/ditto "$max_root/" "$backup_run/Max Package Copy"
    else
      /usr/bin/ditto "$max_root" "$backup_run/Max Package Copy"
    fi
  fi
  if (( install_live )) && [[ -d "$live_root" ]]; then
    /usr/bin/ditto "$live_root" "$backup_run/Live Devices Copy"
  fi
fi

if [[ -e "$max_root" || -L "$max_root" ]]; then
  mv "$max_root" "$backup_run/Previous Max Package"
  old_max_moved=1
fi
if (( install_live )) && [[ -d "$live_root" ]]; then
  mv "$live_root" "$backup_run/Previous Live Folder"
  old_live_moved=1
fi
mv "$stage_max" "$max_root"
new_max_moved=1
if (( install_live )); then
  mv "$stage_live" "$live_root"
  new_live_moved=1
fi

/usr/bin/codesign --verify --deep --strict \
  "$max_root/externals/s3g.clap~.mxo" \
  || fail "Installed external signature verification failed"
/usr/bin/cmp -s "$payload/externals/s3g.clap~.mxo/Contents/MacOS/s3g.clap~" \
  "$max_root/externals/s3g.clap~.mxo/Contents/MacOS/s3g.clap~" \
  || fail "Installed external differs from the release"
if (( install_live )); then
  while IFS= read -r -d '' source_device; do
    name="${source_device##*/}"
    /usr/bin/cmp -s "$source_device" "$live_root/$name" \
      || fail "Installed Live device differs: $name"
  done < <(/usr/bin/find "$payload/devices" -maxdepth 1 -type f \
    -name '*.amxd' -print0)
fi
finished=1
echo "Installed s3g-clap-max. Restart Max and Ableton Live."
if (( install_live )); then echo "Installed $device_count Live devices."; fi
[[ -z "$backup_run" ]] || echo "Previous installation backed up at: $backup_run"
