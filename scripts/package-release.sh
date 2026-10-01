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

mkdir -p "$repo_dir/dist"
stage_dir="$(mktemp -d "${TMPDIR:-/tmp}/s3g-clap-max-release.XXXXXX")"
trap 'rm -rf "$stage_dir"' EXIT
stage_package="$stage_dir/s3g-clap-max"
mkdir -p "$stage_package/externals"
cp -R "$repo_dir/package/help" "$stage_package/help"
cp -R "$repo_dir/package/devices" "$stage_package/devices"
cp -R "$repo_dir/package/patchers" "$stage_package/patchers"
cp -R "$repo_dir/package/docs" "$stage_package/docs"
cp "$package_info" "$stage_package/package-info.json"
cp -R "$repo_dir/package/externals/s3g.clap~.mxo" \
  "$stage_package/externals/s3g.clap~.mxo"
cp "$repo_dir/README.md" "$stage_package/README.md"
cp "$repo_dir/RELEASE_NOTES.md" "$stage_package/RELEASE_NOTES.md"
cp "$repo_dir/LICENSE" "$stage_package/LICENSE"
cp "$repo_dir/THIRD_PARTY_NOTICES.md" \
  "$stage_package/THIRD_PARTY_NOTICES.md"
xattr -cr "$stage_package"

archive="$repo_dir/dist/s3g-clap-max-${version}-macos-universal.zip"
ditto -c -k --keepParent \
  "$stage_dir/s3g-clap-max" "$archive"

echo "Created release archive: $archive"
