#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT_DIR="$ROOT_DIR/reports"
mkdir -p "$REPORT_DIR/sim"

SIM_TOOL="${SIM_TOOL:-}"
if [[ -z "$SIM_TOOL" ]]; then
  for modelsim_dir in /opt/intelFPGA_pro/*/modelsim_ase/bin /opt/intelFPGA/*/modelsim_ase/bin; do
    if [[ -d "$modelsim_dir" ]]; then
      export PATH="$modelsim_dir:$PATH"
    fi
  done
  if command -v vsim >/dev/null 2>&1 && command -v vlog >/dev/null 2>&1; then
    SIM_TOOL="modelsim"
  elif command -v iverilog >/dev/null 2>&1 && command -v vvp >/dev/null 2>&1; then
    SIM_TOOL="iverilog"
  else
    echo "No supported simulator found. Install/use ModelSim (vlog/vsim) or Icarus (iverilog/vvp)." >&2
    exit 1
  fi
fi

summary="$REPORT_DIR/functional_summary.csv"
echo "benchmark,status,optimized_variants,test_vectors,log_path" > "$summary"
mapfile -t rtl_sources < <(find "$ROOT_DIR/src" -maxdepth 1 \( -name '*.v' -o -name '*.sv' \) | sort)

for tb in "$ROOT_DIR"/tests/tb_*.sv; do
  bench="$(basename "$tb" .sv)"
  bench="${bench#tb_}"
  log="$REPORT_DIR/sim/${bench}.log"
  echo "Simulating $bench with $SIM_TOOL"
  if [[ "$SIM_TOOL" == "modelsim" ]]; then
    work="$REPORT_DIR/sim/work_${bench}"
    rm -rf "$work"
    vlib "$work" >/dev/null
    vlog -quiet -sv -work "$work" "${rtl_sources[@]}" "$tb" > "$log" 2>&1
    if vsim -c -quiet -lib "$work" "tb_${bench}" -do "run -all; quit -f" >> "$log" 2>&1; then
      pass_line="$(grep '^# PASS,' "$log" | tail -1 | sed 's/^# //')"
    else
      pass_line=""
    fi
  else
    out="$REPORT_DIR/sim/${bench}.vvp"
    if iverilog -g2012 -o "$out" "${rtl_sources[@]}" "$tb" > "$log" 2>&1 && vvp "$out" >> "$log" 2>&1; then
      pass_line="$(grep '^PASS,' "$log" | tail -1)"
    else
      pass_line=""
    fi
  fi
  if [[ -n "$pass_line" ]]; then
    IFS=',' read -r _ parsed_bench optimized_variants test_vectors <<< "$pass_line"
    echo "$parsed_bench,pass,$optimized_variants,$test_vectors,$log" >> "$summary"
  else
    echo "$bench,fail,,,$log" >> "$summary"
  fi
done

echo "Wrote $summary"
