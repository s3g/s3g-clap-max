#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
package_info="$repo_dir/package/package-info.json"
version="$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$package_info")"

if [ -z "$version" ]; then
  echo "Could not read package version from: $package_info" >&2
  exit 1
fi

"$repo_dir/scripts/build-windows-release.sh" "$@"

mkdir -p "$repo_dir/dist"
stage_dir="$(mktemp -d "${TMPDIR:-/tmp}/s3g-clap-max-windows.XXXXXX")"
trap 'rm -rf "$stage_dir"' EXIT
stage_package="$stage_dir/s3g-clap-max"
mkdir -p "$stage_package/externals"
cp -R "$repo_dir/package/help" "$stage_package/help"
cp "$package_info" "$stage_package/package-info.json"
cp "$repo_dir/package/externals/s3g.clap~.mxe64" \
  "$stage_package/externals/s3g.clap~.mxe64"
cp "$repo_dir/README.md" "$stage_package/README.md"
cp "$repo_dir/RELEASE_NOTES.md" "$stage_package/RELEASE_NOTES.md"
cp "$repo_dir/LICENSE" "$stage_package/LICENSE"
cp "$repo_dir/THIRD_PARTY_NOTICES.md" \
  "$stage_package/THIRD_PARTY_NOTICES.md"

archive="$repo_dir/dist/s3g-clap-max-${version}-windows-x64.zip"
(cd "$stage_dir" && cmake -E tar cf "$archive" --format=zip s3g-clap-max)

echo "Created release archive: $archive"
