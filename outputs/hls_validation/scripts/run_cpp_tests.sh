#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT_DIR="$ROOT_DIR/reports"
mkdir -p "$REPORT_DIR"

CXX="${CXX:-}"
if [[ -z "$CXX" ]]; then
  if command -v g++ >/dev/null 2>&1; then
    CXX=g++
  elif command -v clang++ >/dev/null 2>&1; then
    CXX=clang++
  else
    echo "No C++ compiler found. Set CXX=/path/to/compiler." >&2
    exit 1
  fi
fi

"$CXX" -std=c++17 -O2 -Wall -Wextra -I"$ROOT_DIR/src"   "$ROOT_DIR"/src/*.cpp "$ROOT_DIR/tests/test_generated_datapaths.cpp"   -o "$REPORT_DIR/generated_datapaths_test"

"$REPORT_DIR/generated_datapaths_test" | tee "$REPORT_DIR/cpp_correctness.log"
