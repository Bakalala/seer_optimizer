#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RTL_DIR="$REPO_ROOT/outputs/rtl_validation"

if [[ -n "${QUARTUS_BIN_DIR:-}" ]]; then
  export PATH="$QUARTUS_BIN_DIR:${PATH}"
elif [[ -z "${QUARTUS_SH:-}" ]]; then
  export PATH="${QUARTUS_ROOT:-/opt/intelFPGA_pro/quartus_19.2.0b57/quartus}/bin:${PATH}"
fi
for modelsim_dir in /opt/intelFPGA_pro/*/modelsim_ase/bin /opt/intelFPGA/*/modelsim_ase/bin; do
  if [[ -d "$modelsim_dir" ]]; then
    export PATH="$modelsim_dir:$PATH"
  fi
done
export QUARTUS_SH="${QUARTUS_SH:-quartus_sh}"
export JOBS="${JOBS:-1}"

echo "Repository: $REPO_ROOT"
echo "RTL validation dir: $RTL_DIR"
echo "Quartus compiler: $(command -v "$QUARTUS_SH" || true)"
echo "ModelSim vlog: $(command -v vlog || true)"
echo "ModelSim vsim: $(command -v vsim || true)"
echo "Quartus jobs: $JOBS"
if [[ -n "${RTL_ONLY:-}" ]]; then
  echo "RTL project filter: $RTL_ONLY"
fi

if [[ ! -d "$RTL_DIR" ]]; then
  echo "RTL validation directory missing. Run: python3 scripts/export_rtl_validation.py" >&2
  exit 1
fi

echo
echo "== Functional simulation =="
if [[ "${SKIP_RTL_SIM:-0}" == "1" ]]; then
  echo "Skipping RTL simulation because SKIP_RTL_SIM=1"
else
  (cd "$RTL_DIR" && ./scripts/run_functional_sim.sh)
fi

echo
echo "== Quartus fit and timing =="
if [[ "${SKIP_QUARTUS:-0}" == "1" || "${SKIP_RTL_QUARTUS:-0}" == "1" ]]; then
  echo "Skipping Quartus because SKIP_QUARTUS=1 or SKIP_RTL_QUARTUS=1"
else
  if [[ "${SKIP_QUARTUS_PREFLIGHT:-0}" != "1" ]]; then
    (cd "$RTL_DIR" && ./scripts/run_quartus_preflight.sh)
  else
    echo "Skipping Quartus preflight because SKIP_QUARTUS_PREFLIGHT=1"
  fi
  (cd "$RTL_DIR" && ./scripts/run_quartus_compile.sh)
fi

echo
echo "Outputs:"
echo "$RTL_DIR/reports/functional_summary.csv"
echo "$RTL_DIR/reports/rtl_quartus_summary.csv"
echo "$RTL_DIR/analysis/rtl_validation_table.md"
echo "$RTL_DIR/analysis/real_fpga_evidence_table.md"
