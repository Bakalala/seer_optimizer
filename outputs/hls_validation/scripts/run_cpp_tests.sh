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

standards=()
if [[ -n "${CXX_STD:-}" ]]; then
  standards+=("$CXX_STD")
fi
standards+=(c++17 c++14 c++11 c++0x "")
compile_ok=0
for standard in "${standards[@]}"; do
  std_arg=()
  std_label="compiler default"
  if [[ -n "$standard" ]]; then
    std_arg=(-std="$standard")
    std_label="-std=$standard"
  fi
  echo "Compiling generated datapath tests with $CXX $std_label"
  if "$CXX" "${std_arg[@]}" -O2 -Wall -Wextra -I"$ROOT_DIR/src"       "$ROOT_DIR"/src/*.cpp "$ROOT_DIR/tests/test_generated_datapaths.cpp"       -o "$REPORT_DIR/generated_datapaths_test"; then
    compile_ok=1
    break
  fi
done

if [[ "$compile_ok" -ne 1 ]]; then
  echo "Failed to compile generated datapath tests. Set CXX=/path/to/newer/g++ or SKIP_CPP_TESTS=1 in the server runner." >&2
  exit 1
fi

"$REPORT_DIR/generated_datapaths_test" | tee "$REPORT_DIR/cpp_correctness.log"
