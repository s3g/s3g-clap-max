#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="${S3G_CLAP_MAX_WINDOWS_BUILD_DIR:-$repo_dir/build-windows-x64}"
toolchain="$repo_dir/cmake/toolchains/mingw-w64-x86_64.cmake"
generator="${S3G_CLAP_MAX_WINDOWS_GENERATOR:-Unix Makefiles}"

cmake_args=(
  --fresh
  -S "$repo_dir"
  -B "$build_dir"
  -G "$generator"
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_TOOLCHAIN_FILE="$toolchain"
  -DBUILD_TESTING=ON
)

if [ "$generator" = "Unix Makefiles" ]; then
  make_program="${S3G_CLAP_MAX_MAKE_PROGRAM:-}"
  if [ -z "$make_program" ]; then
    if command -v gmake >/dev/null 2>&1; then
      make_program="$(command -v gmake)"
    else
      make_program="$(command -v make)"
    fi
  fi
  cmake_args+=("-DCMAKE_MAKE_PROGRAM=$make_program")
fi

cmake "${cmake_args[@]}" "$@"
cmake --build "$build_dir" --config Release

external="$repo_dir/package/externals/s3g.clap~.mxe64"
if [ ! -f "$external" ]; then
  echo "Windows external was not produced: $external" >&2
  exit 1
fi

nm_program="${S3G_CLAP_MAX_NM:-x86_64-w64-mingw32-nm}"
if command -v "$nm_program" >/dev/null 2>&1; then
  if ! "$nm_program" -g "$external" | grep -q ' ext_main$'; then
    echo "Windows external does not export ext_main: $external" >&2
    exit 1
  fi
fi

echo "Built Windows x64 Max external at: $external"
