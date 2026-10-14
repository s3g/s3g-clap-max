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
release_dir="$stage_dir/s3g-clap-max-${version}-macos"
stage_package="$release_dir/s3g-clap-max"
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
cp "$repo_dir/scripts/install-release-macos.sh" \
  "$release_dir/Install s3g-clap-max.command"
chmod +x "$release_dir/Install s3g-clap-max.command"
cp "$repo_dir/INSTALL.md" "$release_dir/INSTALL.md"
/usr/bin/codesign --verify --deep --strict \
  "$stage_package/externals/s3g.clap~.mxo"
(
  cd "$release_dir"
  find s3g-clap-max 'Install s3g-clap-max.command' INSTALL.md \
    -type f -print0 | xargs -0 /usr/bin/shasum -a 256 > SHA256SUMS
  /usr/bin/shasum -a 256 -c SHA256SUMS >/dev/null
)

archive="$repo_dir/dist/s3g-clap-max-${version}-macos-universal.zip"
ditto -c -k --keepParent \
  "$release_dir" "$archive"
(
  cd "$repo_dir/dist"
  /usr/bin/shasum -a 256 "$(basename "$archive")" \
    > "$(basename "$archive").sha256"
)

echo "Created release archive: $archive"
echo "Created checksum: $archive.sha256"
