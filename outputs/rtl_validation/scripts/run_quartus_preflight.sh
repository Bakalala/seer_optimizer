#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QUARTUS_SH="${QUARTUS_SH:-quartus_sh}"
RTL_FAMILY="${RTL_FAMILY:-Arria 10}"
RTL_DEVICE="${RTL_DEVICE:-10AX090H1F34E1SG}"
PREFLIGHT_DIR="$ROOT_DIR/reports/quartus_preflight"
LOG="$PREFLIGHT_DIR/quartus_preflight.log"

if ! command -v "$QUARTUS_SH" >/dev/null 2>&1; then
  echo "quartus_sh not found. Load Quartus or set QUARTUS_SH=/path/to/quartus_sh." >&2
  exit 1
fi

rm -rf "$PREFLIGHT_DIR"
mkdir -p "$PREFLIGHT_DIR"

cat > "$PREFLIGHT_DIR/preflight_adder.v" <<'VERILOG'
module preflight_adder (
    input  wire        clk,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    output reg  [8:0]  y
);
    always @(posedge clk) begin
        y <= a + b;
    end
endmodule
VERILOG

cat > "$PREFLIGHT_DIR/preflight_adder.qpf" <<'QPF'
PROJECT_REVISION = preflight_adder
QPF

cat > "$PREFLIGHT_DIR/preflight_adder.qsf" <<QSF
set_global_assignment -name FAMILY "$RTL_FAMILY"
set_global_assignment -name DEVICE $RTL_DEVICE
set_global_assignment -name TOP_LEVEL_ENTITY preflight_adder
set_global_assignment -name VERILOG_FILE preflight_adder.v
set_global_assignment -name SDC_FILE preflight_adder.sdc
set_instance_assignment -name VIRTUAL_PIN ON -to *
QSF

cat > "$PREFLIGHT_DIR/preflight_adder.sdc" <<'SDC'
create_clock -period 10.000 [get_ports clk]
SDC

echo "Running Quartus preflight: family=$RTL_FAMILY device=$RTL_DEVICE"
if (cd "$PREFLIGHT_DIR" && "$QUARTUS_SH" --flow compile preflight_adder) > "$LOG" 2>&1; then
  if [[ -f "$PREFLIGHT_DIR/preflight_adder.map.rpt" && -f "$PREFLIGHT_DIR/preflight_adder.fit.rpt" ]] &&
     { [[ -f "$PREFLIGHT_DIR/preflight_adder.sta.rpt" ]] || [[ -f "$PREFLIGHT_DIR/preflight_adder.tan.rpt" ]]; }; then
    echo "Quartus preflight passed. Log: $LOG"
  else
    echo "Quartus preflight failed: compile returned success but did not produce map, fit, and timing reports." >&2
    echo "See log: $LOG" >&2
    exit 1
  fi
else
  echo "Quartus preflight failed. The selected machine/license/device is not usable for validation." >&2
  echo "See log: $LOG" >&2
  exit 1
fi
