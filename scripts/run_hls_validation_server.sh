#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HLS_DIR="$REPO_ROOT/outputs/hls_validation"

export INTEL_HLS_ROOT="${INTEL_HLS_ROOT:-/opt/intelFPGA_pro/21.1/hls}"
export INTEL_HLS_CXX="${INTEL_HLS_CXX:-$INTEL_HLS_ROOT/bin/i++}"
export HLS_TARGET="${HLS_TARGET:-Arria10}"
export HLS_DSP_MODES="${HLS_DSP_MODES:-default prefer-dsp prefer-softlogic}"

if [[ -d "$INTEL_HLS_ROOT/bin" ]]; then
  export PATH="$INTEL_HLS_ROOT/bin:$PATH"
fi

python_bin="${PYTHON_BIN:-}"
if [[ -z "$python_bin" ]]; then
  if command -v python3.10 >/dev/null 2>&1; then
    python_bin=python3.10
  elif command -v python3 >/dev/null 2>&1; then
    python_bin=python3
  else
    echo "No Python found. Set PYTHON_BIN=/path/to/python3.10." >&2
    exit 1
  fi
fi

echo "Repository: $REPO_ROOT"
echo "HLS validation dir: $HLS_DIR"
echo "Intel HLS root: $INTEL_HLS_ROOT"
echo "Intel HLS compiler: $INTEL_HLS_CXX"
echo "HLS target: $HLS_TARGET"
echo "HLS DSP modes: $HLS_DSP_MODES"
echo "Python: $python_bin"

if [[ ! -d "$HLS_DIR" ]]; then
  echo "Missing $HLS_DIR. Run git pull, or regenerate outputs/hls_validation locally and commit it." >&2
  exit 1
fi

if [[ ! -x "$INTEL_HLS_CXX" ]]; then
  echo "Intel HLS compiler is not executable: $INTEL_HLS_CXX" >&2
  echo "Override with INTEL_HLS_CXX=/path/to/i++ if your server uses a different install." >&2
  exit 1
fi

"$INTEL_HLS_CXX" --version || true

cd "$HLS_DIR"

if [[ "${SKIP_CPP_TESTS:-0}" != "1" ]]; then
  echo
  echo "== Local C++ equivalence test =="
  ./scripts/run_cpp_tests.sh
else
  echo
  echo "== Local C++ equivalence test skipped because SKIP_CPP_TESTS=1 =="
fi

echo
echo "== Intel HLS synthesis =="
./scripts/run_intel_hls.sh

echo
echo "== Parse Intel HLS / Quartus reports =="
"$python_bin" scripts/parse_hls_reports.py \
  --root reports/hls \
  --metadata metadata/generated_variants.json \
  --out reports/hls_summary.csv

echo
echo "Wrote $HLS_DIR/reports/hls_summary.csv"
echo "Compare against $HLS_DIR/metadata/expected_resource_summary.csv"
