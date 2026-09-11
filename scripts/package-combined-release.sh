#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
package_info="$repo_dir/package/package-info.json"
version="$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$package_info")"

if [ -z "$version" ]; then
  echo "Could not read package version from: $package_info" >&2
  exit 1
fi

"$repo_dir/scripts/build-release.sh" "$@"
"$repo_dir/scripts/build-windows-release.sh" "$@"

mac_external="$repo_dir/package/externals/s3g.clap~.mxo"
windows_external="$repo_dir/package/externals/s3g.clap~.mxe64"
if [ ! -d "$mac_external" ] || [ ! -f "$windows_external" ]; then
  echo "Both macOS and Windows externals are required" >&2
  exit 1
fi

mkdir -p "$repo_dir/dist"
stage_dir="$(mktemp -d "${TMPDIR:-/tmp}/s3g-clap-max-combined.XXXXXX")"
trap 'rm -rf "$stage_dir"' EXIT
stage_package="$stage_dir/s3g-clap-max"
mkdir -p "$stage_package/externals"
cp -R "$repo_dir/package/help" "$stage_package/help"
cp "$package_info" "$stage_package/package-info.json"
cp -R "$mac_external" "$stage_package/externals/s3g.clap~.mxo"
cp "$windows_external" "$stage_package/externals/s3g.clap~.mxe64"
cp "$repo_dir/README.md" "$stage_package/README.md"
cp "$repo_dir/RELEASE_NOTES.md" "$stage_package/RELEASE_NOTES.md"
cp "$repo_dir/LICENSE" "$stage_package/LICENSE"
cp "$repo_dir/THIRD_PARTY_NOTICES.md" \
  "$stage_package/THIRD_PARTY_NOTICES.md"
xattr -cr "$stage_package"

archive="$repo_dir/dist/s3g-clap-max-${version}-macos-universal-windows-x64.zip"
ditto -c -k --keepParent "$stage_package" "$archive"

echo "Created combined release archive: $archive"
