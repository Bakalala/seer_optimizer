#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IXX="${INTEL_HLS_CXX:-i++}"
HLS_TARGET="${HLS_TARGET:-}"
MODE_SET="${HLS_DSP_MODES:-default prefer-dsp prefer-softlogic}"

if [[ -z "$HLS_TARGET" ]]; then
  echo "Set HLS_TARGET to your Intel FPGA target/part/family before running." >&2
  echo "Example: HLS_TARGET=<your_target> ./scripts/run_intel_hls.sh" >&2
  exit 1
fi

for src in "$ROOT_DIR"/src/*.cpp; do
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
