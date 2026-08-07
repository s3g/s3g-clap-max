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
mkdir -p "$stage_dir/s3g-clap-max"
cp -R "$repo_dir/package/." "$stage_dir/s3g-clap-max/"

archive="$repo_dir/dist/s3g-clap-max-${version}-macos-universal.zip"
ditto -c -k --sequesterRsrc --keepParent \
  "$stage_dir/s3g-clap-max" "$archive"

echo "Created release archive: $archive"
