#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="${S3G_CLAP_MAX_BUILD_DIR:-$repo_dir/build-release}"
generator="${S3G_CLAP_MAX_GENERATOR:-Unix Makefiles}"

cmake_args=(
  --fresh
  -S "$repo_dir"
  -B "$build_dir"
  -G "$generator"
  -DCMAKE_BUILD_TYPE=Release
)

if [ "$generator" = "Unix Makefiles" ] \
    && [ -x "${S3G_CLAP_MAX_MAKE_PROGRAM:-/opt/homebrew/bin/gmake}" ]; then
  cmake_args+=(
    -DCMAKE_MAKE_PROGRAM="${S3G_CLAP_MAX_MAKE_PROGRAM:-/opt/homebrew/bin/gmake}"
  )
fi

cmake "${cmake_args[@]}" "$@"
cmake --build "$build_dir" --config Release

echo "Built Max package at: $repo_dir/package"
