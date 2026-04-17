#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$ROOT_DIR/../.." && pwd)"
REPORT_DIR="$ROOT_DIR/reports/quartus_env_probe"
PREFLIGHT_DIR="$ROOT_DIR/reports/quartus_preflight"
QUARTUS_19_ROOT="/opt/intelFPGA_pro/quartus_19.2.0b57/quartus"
QUARTUS_19_PARENT="/opt/intelFPGA_pro/quartus_19.2.0b57"
BIN_WRAPPER="$QUARTUS_19_ROOT/bin/quartus_sh"
LINUX64_DIRECT="$QUARTUS_19_ROOT/linux64/quartus_sh"
PREFERRED_PART="10AX115H1F34E1SG"
FAMILY="Arria 10"

mkdir -p "$REPORT_DIR"
rm -f "$REPORT_DIR"/*.log "$REPORT_DIR"/*.txt "$REPORT_DIR"/summary.md "$REPORT_DIR"/working_env.sh

DEVICE_TCL="$REPORT_DIR/device_probe.tcl"
cat > "$DEVICE_TCL" <<'TCL'
puts "FAMILY_LIST_BEGIN"
if {[catch {get_family_list} families]} {
    puts "FAMILY_LIST_ERROR $families"
} else {
    foreach family $families {
        puts $family
    }
}
puts "FAMILY_LIST_END"
puts "ARRIA10_PART_LIST_BEGIN"
if {[catch {get_part_list -family "Arria 10"} parts]} {
    puts "ARRIA10_PART_LIST_ERROR $parts"
} else {
    foreach part $parts {
        puts $part
    }
}
puts "ARRIA10_PART_LIST_END"
TCL

declare -a SUMMARY_ROWS=()
WORKING_LABEL=""
WORKING_QUARTUS_SH=""
WORKING_SETUP=""
WORKING_DEVICE=""

shell_quote() {
  printf "%q" "$1"
}

select_arria10_part() {
  local probe_file="$1"
  if tr ' {}	' '\n' < "$probe_file" | grep -Fx "$PREFERRED_PART" >/dev/null 2>&1; then
    echo "$PREFERRED_PART"
    return 0
  fi
  tr ' {}	' '\n' < "$probe_file" | grep -E '^10AX[A-Z0-9]+$' | head -n 1
}

classify_failure() {
  local log="$1"
  if grep -Eiq "No license|license.*reject|Error \\(19286\\)" "$log"; then
    echo "license"
  elif grep -Eiq "Internal Error|sutil_device.cpp|is_legal_device" "$log"; then
    echo "quartus_internal_crash"
  elif grep -Eiq "cannot open shared object|not found|lib.*\\.so" "$log"; then
    echo "environment_setup"
  elif grep -Eiq "Full Compilation was successful" "$log" && ! has_required_preflight_reports; then
    echo "environment_setup"
  elif grep -Eiq "Illegal device|invalid device|not a valid device|device.*not.*found" "$log"; then
    echo "unsupported_device"
  else
    echo "unknown"
  fi
}

has_required_preflight_reports() {
  { [[ -f "$PREFLIGHT_DIR/preflight_adder.map.rpt" ]] ||
    [[ -f "$PREFLIGHT_DIR/preflight_adder.syn.rpt" ]]; } &&
  [[ -f "$PREFLIGHT_DIR/preflight_adder.fit.rpt" ]] &&
  { [[ -f "$PREFLIGHT_DIR/preflight_adder.sta.rpt" ]] ||
    [[ -f "$PREFLIGHT_DIR/preflight_adder.tan.rpt" ]]; }
}

run_case() {
  local label="$1"
  local quartus_sh="$2"
  local setup="$3"
  local log="$REPORT_DIR/${label}.log"
  local probe_out="$REPORT_DIR/${label}_device_probe.txt"
  local preflight_log="$REPORT_DIR/${label}_preflight.log"
  local selected_device=""
  local version_status="fail"
  local probe_status="fail"
  local preflight_status="fail"
  local reports_status="no"
  local likely_failure="unknown"
  local quoted_quartus quoted_tcl quoted_preflight quoted_probe_out setup_prefix

  quoted_quartus="$(shell_quote "$quartus_sh")"
  quoted_tcl="$(shell_quote "$DEVICE_TCL")"
  quoted_preflight="$(shell_quote "$ROOT_DIR/scripts/run_quartus_preflight.sh")"
  quoted_probe_out="$(shell_quote "$probe_out")"
  setup_prefix=""
  if [[ -n "$setup" ]]; then
    setup_prefix="$setup; "
  fi

  {
    echo "Configuration: $label"
    echo "QUARTUS_SH=$quartus_sh"
    echo "Setup: ${setup:-<none>}"
    echo
  } > "$log"

  echo "== $label: quartus_sh --version =="
  if bash -lc "${setup_prefix}export QUARTUS_SH=$quoted_quartus; \"\$QUARTUS_SH\" --version" >> "$log" 2>&1; then
    version_status="pass"
  fi

  echo "== $label: Tcl device probe =="
  if bash -lc "${setup_prefix}export QUARTUS_SH=$quoted_quartus; \"\$QUARTUS_SH\" -t $quoted_tcl" > "$probe_out" 2>&1; then
    probe_status="pass"
  fi
  {
    echo
    echo "== Device probe output =="
    cat "$probe_out"
  } >> "$log"

  selected_device="$(select_arria10_part "$probe_out" || true)"
  if [[ -z "$selected_device" ]]; then
    selected_device="$PREFERRED_PART"
    echo "No Arria 10 part parsed from probe; falling back to $selected_device" >> "$log"
  else
    echo "Selected Arria 10 part: $selected_device" >> "$log"
  fi

  echo "== $label: trivial preflight on $selected_device =="
  rm -rf "$PREFLIGHT_DIR"
  if bash -lc "${setup_prefix}export QUARTUS_SH=$quoted_quartus; export RTL_FAMILY='$FAMILY'; export RTL_DEVICE='$selected_device'; $quoted_preflight" >> "$log" 2>&1; then
    preflight_status="pass"
  fi
  if [[ -f "$PREFLIGHT_DIR/quartus_preflight.log" ]]; then
    cp "$PREFLIGHT_DIR/quartus_preflight.log" "$preflight_log"
    {
      echo
      echo "== Quartus preflight compile log =="
      cat "$preflight_log"
    } >> "$log"
  else
    cp "$log" "$preflight_log"
    echo "No preflight compile log produced." >> "$preflight_log"
    echo "No preflight compile log produced." >> "$log"
  fi

  if has_required_preflight_reports; then
    reports_status="yes"
  fi

  if [[ "$preflight_status" == "pass" && "$reports_status" == "yes" ]]; then
    WORKING_LABEL="$label"
    WORKING_QUARTUS_SH="$quartus_sh"
    WORKING_SETUP="$setup"
    WORKING_DEVICE="$selected_device"
    likely_failure="none"
  else
    likely_failure="$(classify_failure "$log")"
  fi

  SUMMARY_ROWS+=("$label|$quartus_sh|${setup:-<none>}|$version_status|$probe_status|$selected_device|$preflight_status|$reports_status|$likely_failure|$log|$preflight_log")
}

write_summary() {
  local summary="$REPORT_DIR/summary.md"
  {
    echo "# Quartus Environment Probe Summary"
    echo
    echo "Required pass condition: trivial preflight produces a synthesis report (\`.map.rpt\` or \`.syn.rpt\`), \`.fit.rpt\`, and \`.sta.rpt\` or \`.tan.rpt\`."
    echo
    echo "| Configuration | Version | Device query | Selected device | Preflight exit | Required reports | Likely failure | Log |"
    echo "| --- | --- | --- | --- | --- | --- | --- | --- |"
    local row label quartus setup version probe device preflight reports failure log preflight_log
    for row in "${SUMMARY_ROWS[@]}"; do
      IFS='|' read -r label quartus setup version probe device preflight reports failure log preflight_log <<< "$row"
      echo "| \`$label\` | $version | $probe | \`$device\` | $preflight | $reports | $failure | \`$log\` |"
    done
    echo
    if [[ -n "$WORKING_LABEL" ]]; then
      echo "Passing configuration: \`$WORKING_LABEL\` with device \`$WORKING_DEVICE\`."
      echo
    else
      echo "No tested configuration produced all required preflight reports. Optimizer RTL was not compiled."
      echo
    fi
    for row in "${SUMMARY_ROWS[@]}"; do
      IFS='|' read -r label quartus setup version probe device preflight reports failure log preflight_log <<< "$row"
      echo "## $label"
      echo
      echo "- QUARTUS_SH: \`$quartus\`"
      echo "- Setup: \`$setup\`"
      echo "- Version query: $version"
      echo "- Device query: $probe"
      echo "- Selected device: \`$device\`"
      echo "- Preflight exit: $preflight"
      echo "- Required reports produced: $reports"
      echo "- Likely failure: $failure"
      echo
      echo "Last 80 lines of failing/preflight log:"
      echo
      echo '```text'
      tail -n 80 "$preflight_log"
      echo '```'
      echo
    done
  } > "$summary"
}

write_working_env() {
  local env_file="$REPORT_DIR/working_env.sh"
  {
    echo "# Source this file to reuse the Quartus environment that passed preflight."
    echo "export QUARTUS_SH=$(shell_quote "$WORKING_QUARTUS_SH")"
    echo "export RTL_FAMILY=$(shell_quote "$FAMILY")"
    echo "export RTL_DEVICE=$(shell_quote "$WORKING_DEVICE")"
    if [[ -n "$WORKING_SETUP" ]]; then
      echo "# Setup command used by the probe:"
      echo "# $WORKING_SETUP"
    fi
  } > "$env_file"
}

run_case "A_bin_wrapper" "$BIN_WRAPPER" ""
run_case "B_linux64_direct" "$LINUX64_DIRECT" "export LD_LIBRARY_PATH=$(shell_quote "$QUARTUS_19_ROOT/linux64")"
run_case "C_linux64_root_paths" "$LINUX64_DIRECT" "export QUARTUS_ROOTDIR=$(shell_quote "$QUARTUS_19_ROOT"); export QUARTUS_ROOTDIR_OVERRIDE=$(shell_quote "$QUARTUS_19_ROOT"); export PATH=$(shell_quote "$QUARTUS_19_ROOT/linux64"):$(shell_quote "$QUARTUS_19_ROOT/bin"):\$PATH; export LD_LIBRARY_PATH=$(shell_quote "$QUARTUS_19_ROOT/linux64"):$(shell_quote "$QUARTUS_19_ROOT/linux64/perl/lib/5.28.1/x86_64-linux-thread-multi/CORE"):\${LD_LIBRARY_PATH:-}"

mapfile -t setup_scripts < <(find "$QUARTUS_19_PARENT" /opt/intelFPGA_pro/19.2 -maxdepth 5 -type f \( -name 'settings.sh' -o -name 'setvars.sh' -o -name 'env.sh' -o -name 'init_*' -o -name 'nios2_command_shell.sh' \) -print 2>/dev/null | sort)
setup_index=0
for setup_script in "${setup_scripts[@]}"; do
  if [[ "$(basename "$setup_script")" == "nios2_command_shell.sh" ]]; then
    continue
  fi
  setup_index=$((setup_index + 1))
  label="D${setup_index}_$(basename "$setup_script" | tr -c 'A-Za-z0-9_' '_')"
  run_case "$label" "$BIN_WRAPPER" "export QUARTUS_ROOTDIR=$(shell_quote "$QUARTUS_19_ROOT"); export QUARTUS_ROOTDIR_OVERRIDE=$(shell_quote "$QUARTUS_19_ROOT"); source $(shell_quote "$setup_script")"
done

write_summary

if [[ -n "$WORKING_LABEL" ]]; then
  write_working_env
  echo "Quartus preflight passed with $WORKING_LABEL using $WORKING_DEVICE"
  echo "Wrote $REPORT_DIR/working_env.sh"
  exit 0
fi

echo "No Quartus environment produced all required preflight reports."
echo "Wrote $REPORT_DIR/summary.md"
exit 1
