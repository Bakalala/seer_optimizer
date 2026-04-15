#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IXX="${INTEL_HLS_CXX:-i++}"
HLS_TARGET="${HLS_TARGET:-}"
MODE_SET="${HLS_DSP_MODES:-default prefer-dsp prefer-softlogic}"
SRC_GLOB="${HLS_SRC_GLOB:-*.cpp}"

if [[ -z "$HLS_TARGET" ]]; then
  echo "Set HLS_TARGET to your Intel FPGA target/part/family before running." >&2
  echo "Example: HLS_TARGET=<your_target> ./scripts/run_intel_hls.sh" >&2
  exit 1
fi

if ! command -v "$IXX" >/dev/null 2>&1; then
  echo "Intel HLS compiler not found: $IXX" >&2
  echo "Set INTEL_HLS_CXX=/path/to/i++ or put i++ on PATH." >&2
  exit 1
fi

shopt -s nullglob
sources=("$ROOT_DIR"/src/$SRC_GLOB)
if [[ "${#sources[@]}" -eq 0 ]]; then
  echo "No sources matched HLS_SRC_GLOB=$SRC_GLOB under $ROOT_DIR/src" >&2
  exit 1
fi

for src in "${sources[@]}"; do
  name="$(basename "$src" .cpp)"
  for mode in $MODE_SET; do
    build_dir="$ROOT_DIR/reports/hls/$name/$mode"
    mkdir -p "$build_dir"
    dsp_arg=()
    if [[ "$mode" != "default" ]]; then
      dsp_arg=(--dsp-mode="$mode")
    fi
    echo "Building $name with mode=$mode"
    (
      cd "$build_dir"
      "$IXX" -march="$HLS_TARGET" "${dsp_arg[@]}" "$src" -o "$name"         > build.log 2>&1
    )
  done
done
