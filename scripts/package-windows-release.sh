#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
package_info="$repo_dir/package/package-info.json"
version="$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$package_info")"

if [ -z "$version" ]; then
  echo "Could not read package version from: $package_info" >&2
  exit 1
fi

archive_name="s3g-clap-max-${version}-windows-x64-experimental.zip"
archive="$repo_dir/dist/$archive_name"
checksum="$archive.sha256"
if [ -e "$archive" ] || [ -e "$checksum" ]; then
  echo "Refusing to replace an existing Windows release asset: $archive" >&2
  exit 1
fi

"$repo_dir/scripts/build-windows-release.sh" "$@"

build_dir="${S3G_CLAP_MAX_WINDOWS_BUILD_DIR:-$repo_dir/build-windows-x64}"
ctest --test-dir "$build_dir" --output-on-failure -R '^s3g_m4l_'

mkdir -p "$repo_dir/dist"
stage_dir="$(mktemp -d "${TMPDIR:-/tmp}/s3g-clap-max-windows.XXXXXX")"
trap 'rm -rf "$stage_dir"' EXIT
release_name="s3g-clap-max-${version}-windows"
release_dir="$stage_dir/$release_name"
stage_package="$release_dir/s3g-clap-max"
mkdir -p "$stage_package/externals"
cp -R "$repo_dir/package/help" "$stage_package/help"
python3 "$repo_dir/scripts/windows_release_devices.py" \
  "$repo_dir/package/devices" "$stage_package/devices"
cp -R "$repo_dir/package/patchers" "$stage_package/patchers"
cp -R "$repo_dir/package/docs" "$stage_package/docs"
cp "$package_info" "$stage_package/package-info.json"
cp "$repo_dir/package/externals/s3g.clap~.mxe64" \
  "$stage_package/externals/s3g.clap~.mxe64"
cp "$repo_dir/README.md" "$stage_package/README.md"
cp "$repo_dir/INSTALL.md" "$stage_package/INSTALL.md"
cp "$repo_dir/INSTALL-WINDOWS.md" "$stage_package/INSTALL-WINDOWS.md"
cp "$repo_dir/RELEASE_NOTES.md" "$stage_package/RELEASE_NOTES.md"
cp "$repo_dir/LICENSE" "$stage_package/LICENSE"
cp "$repo_dir/THIRD_PARTY_NOTICES.md" \
  "$stage_package/THIRD_PARTY_NOTICES.md"
cp "$repo_dir/INSTALL-WINDOWS.md" "$release_dir/INSTALL-WINDOWS.md"

(
  cd "$release_dir"
  find s3g-clap-max INSTALL-WINDOWS.md -type f -print0 \
    | xargs -0 shasum -a 256 > SHA256SUMS.txt
  shasum -a 256 -c SHA256SUMS.txt >/dev/null
)

(
  cd "$stage_dir"
  cmake -E tar cf "$archive_name" --format=zip "$release_name"
  shasum -a 256 "$archive_name" > "$archive_name.sha256"
)
python3 -B "$repo_dir/scripts/validate-windows-release.py" "$stage_dir/$archive_name"
mv "$stage_dir/$archive_name" "$archive"
mv "$stage_dir/$archive_name.sha256" "$checksum"

echo "Created release archive: $archive"
echo "Created checksum: $checksum"
