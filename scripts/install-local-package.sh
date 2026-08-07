#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
max_major="${S3G_MAX_VERSION:-9}"
package_source="$repo_dir/package"
package_root="${S3G_MAX_PACKAGE_ROOT:-$HOME/Documents/Max ${max_major}/Packages/s3g-clap-max}"
external="$package_source/externals/s3g.clap~.mxo"

if [ ! -d "$external" ]; then
  "$repo_dir/scripts/build-release.sh"
fi

mkdir -p "$(dirname "$package_root")"
if [ -L "$package_root" ]; then
  current_target="$(readlink "$package_root")"
  if [ "$current_target" = "$package_source" ]; then
    echo "s3g-clap-max package symlink already installed at: $package_root"
    exit 0
  fi
  unlink "$package_root"
elif [ -e "$package_root" ]; then
  echo "Refusing to replace non-symlink path: $package_root" >&2
  exit 1
fi

ln -s "$package_source" "$package_root"

echo "Linked s3g-clap-max package:"
echo "  $package_root -> $package_source"
