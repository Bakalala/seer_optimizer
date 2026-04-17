#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$ROOT_DIR/../.." && pwd)"
QUARTUS_SH="${QUARTUS_SH:-quartus_sh}"
JOBS="${JOBS:-1}"
ONLY="${RTL_ONLY:-}"
RTL_FAMILY="${RTL_FAMILY:-}"
RTL_DEVICE="${RTL_DEVICE:-}"
PYTHON_BIN="${PYTHON_BIN:-}"

if ! command -v "$QUARTUS_SH" >/dev/null 2>&1; then
  echo "quartus_sh not found. Load Quartus or set QUARTUS_SH=/path/to/quartus_sh." >&2
  exit 1
fi

if [[ -z "$PYTHON_BIN" ]]; then
  for candidate in python3.12 python3.11 python3.10 /opt/anaconda3/bin/python3.10 python3; do
    if command -v "$candidate" >/dev/null 2>&1; then
      PYTHON_BIN="$candidate"
      break
    fi
  done
fi
if [[ -z "$PYTHON_BIN" ]]; then
  echo "No Python interpreter found. Set PYTHON_BIN=/path/to/python3.10 or newer." >&2
  exit 1
fi

mapfile -t projects < <(find "$ROOT_DIR/quartus" -mindepth 2 -maxdepth 2 -name '*.qpf' | sort)
if [[ -n "$ONLY" ]]; then
  mapfile -t projects < <(printf '%s\n' "${projects[@]}" | grep -E "$ONLY" || true)
fi
if [[ "${#projects[@]}" -eq 0 ]]; then
  echo "No Quartus projects matched." >&2
  exit 1
fi

if [[ -n "$RTL_FAMILY" || -n "$RTL_DEVICE" ]]; then
  echo "Applying Quartus target override: family=${RTL_FAMILY:-<unchanged>} device=${RTL_DEVICE:-<unchanged>}"
  for qsf in "$ROOT_DIR"/quartus/*/*.qsf; do
    if [[ -n "$RTL_FAMILY" ]]; then
      sed -i.bak -E "s/^set_global_assignment -name FAMILY .*/set_global_assignment -name FAMILY \"$RTL_FAMILY\"/" "$qsf"
    fi
    if [[ -n "$RTL_DEVICE" ]]; then
      sed -i.bak -E "s/^set_global_assignment -name DEVICE .*/set_global_assignment -name DEVICE $RTL_DEVICE/" "$qsf"
    fi
    rm -f "$qsf.bak"
  done
fi

run_one() {
  local qpf="$1"
  local dir name log
  dir="$(dirname "$qpf")"
  name="$(basename "$qpf" .qpf)"
  log="$ROOT_DIR/reports/quartus/${name}.log"
  mkdir -p "$(dirname "$log")"
  rm -rf "$dir/db" "$dir/incremental_db" "$dir/output_files" "$dir/qdb"
  rm -f "$dir"/*.done "$dir"/*.rpt "$dir"/*.summary "$dir"/*.pin "$dir"/*.sof "$dir"/*.pof
  echo "Compiling $name"
  (cd "$dir" && "$QUARTUS_SH" --flow compile "$name") > "$log" 2>&1
  if [[ ! -f "$dir/${name}.map.rpt" || ! -f "$dir/${name}.fit.rpt" ]]; then
    echo "Quartus compile for $name did not produce map and fit reports. See $log" >&2
    return 1
  fi
}

export -f run_one
export ROOT_DIR QUARTUS_SH

if [[ "$JOBS" -le 1 ]]; then
  for qpf in "${projects[@]}"; do
    run_one "$qpf"
  done
else
  printf '%s\n' "${projects[@]}" | xargs -n1 -P "$JOBS" bash -c 'run_one "$0"'
fi

"$PYTHON_BIN" "$ROOT_DIR/scripts/parse_quartus_reports.py" \
  --root "$ROOT_DIR" \
  --metadata "$ROOT_DIR/metadata/generated_variants.json" \
  --out "$ROOT_DIR/reports/rtl_quartus_summary.csv"

"$PYTHON_BIN" "$ROOT_DIR/scripts/analyze_rtl_reports.py" \
  --root "$ROOT_DIR" \
  --summary "$ROOT_DIR/reports/rtl_quartus_summary.csv"
