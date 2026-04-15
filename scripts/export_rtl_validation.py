#!/usr/bin/env python3
"""Export optimizer IR variants as direct SystemVerilog validation designs."""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import shutil
import stat
import subprocess
import sys
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import run_benchmarks
from scripts import export_hls_cpp

DEFAULT_RESULTS = ROOT / "outputs" / "benchmark_results.json"
DEFAULT_OUTPUT_DIR = ROOT / "outputs" / "rtl_validation"
DEFAULT_BENCHMARKS = export_hls_cpp.DEFAULT_BENCHMARKS
DEFAULT_VARIANTS = export_hls_cpp.DEFAULT_VARIANTS
DEFAULT_FAMILY = "Arria10"
DEFAULT_DEVICE = "10AX115U1F45I1SG"
DEFAULT_CLOCK_NS = 2.0
TEST_VECTOR_COUNT = 200
TEST_MIN = -16
TEST_MAX = 16


def sanitize_identifier(value: str) -> str:
    return export_hls_cpp.sanitize_identifier(value)


def node_var(node_id: str) -> str:
    return sanitize_identifier(node_id)


def input_names_from_graph(graph: dict) -> list[str]:
    return export_hls_cpp.input_names_from_graph(graph)


def variant_graph_and_metrics(payload: dict, variant: str) -> tuple[dict | None, dict | None, str | None]:
    return export_hls_cpp.variant_graph_and_metrics(payload, variant)


def op_counts(graph: dict | None) -> dict[str, int]:
    return export_hls_cpp.op_counts(graph)


def rtl_intended_dsp_count(graph: dict) -> int:
    """Count DSPs that this RTL flow can directly force: multipliers and MACs."""
    count = 0
    for node in graph.get("ir_nodes", []):
        op = node["op"]
        if op in {"mul", "mul_dsp", "mac_dsp"}:
            count += 1
    return count


def rtl_intended_logic_mul_count(graph: dict) -> int:
    return sum(1 for node in graph.get("ir_nodes", []) if node["op"] == "mul_lut")


def sv_name(name: str) -> str:
    return sanitize_identifier(name)


def sv_input_port(name: str) -> str:
    return f"in_{sv_name(name)}"


def repo_relative(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def render_datapath_module(
    *,
    benchmark: str,
    variant: str,
    module_name: str,
    graph: dict,
    metrics: dict,
    input_names: list[str],
) -> str:
    ports = [f"    input  logic signed [31:0] {sv_input_port(name)}" for name in input_names]
    ports.append("    output logic signed [31:0] out")
    lines = [
        "`default_nettype none",
        "",
        f"// benchmark: {benchmark}",
        f"// variant: {variant}",
        (
            "// analytical metrics: "
            f"area={metrics['area']} latency={metrics['latency']} "
            f"power={metrics.get('power', 0)} dsp={metrics['dsp_count']} "
            f"lut={metrics['lut_count']}"
        ),
        f"// rtl intended multiplier/MAC DSPs: {rtl_intended_dsp_count(graph)}",
        f"// expression: {run_benchmarks.graph_to_expr_text(graph)}",
        f"module {module_name}(",
        ",\n".join(ports),
        ");",
        "    import rtl_validation_ops::*;",
        "",
    ]

    for node in graph["ir_nodes"]:
        op = node["op"]
        var = node_var(node["id"])
        inputs = [node_var(item) for item in node.get("inputs", [])]
        metrics_for_op = run_benchmarks.SHARED_OP_METRICS.get(op, {})
        lines.append(
            f"    // op={op} analytical area={metrics_for_op.get('area', 0)} "
            f"latency={metrics_for_op.get('latency', 0)} "
            f"power={metrics_for_op.get('power', 0)} "
            f"dsp={metrics_for_op.get('dsp_count', 0)} "
            f"lut={metrics_for_op.get('lut_count', 0)}"
        )
        if op == "input":
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var} = {sv_input_port(node['name'])};")
        elif op == "const":
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var} = 32'sd{int(node['value'])};")
        elif op in {"add", "add_lut", "add_dsp"}:
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var} = {inputs[0]} + {inputs[1]};")
        elif op in {"sub", "sub_lut", "sub_dsp"}:
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var} = {inputs[0]} - {inputs[1]};")
        elif op in {"mul", "mul_dsp"}:
            lines.append(f"    (* multstyle = \"dsp\" *) logic signed [63:0] {var}_full;")
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var}_full = {inputs[0]} * {inputs[1]};")
            lines.append(f"    assign {var} = {var}_full[31:0];")
        elif op == "mul_lut":
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var} = soft_mul32({inputs[0]}, {inputs[1]});")
        elif op == "mac_dsp":
            lines.append(f"    (* multstyle = \"dsp\" *) logic signed [63:0] {var}_prod_full;")
            lines.append(f"    logic signed [31:0] {var};")
            lines.append(f"    assign {var}_prod_full = {inputs[1]} * {inputs[2]};")
            lines.append(f"    assign {var} = {inputs[0]} + {var}_prod_full[31:0];")
        else:
            raise ValueError(f"unsupported op {op}")
        lines.append("")

    lines.extend(
        [
            f"    assign out = {node_var(graph['root'])};",
            "endmodule",
            "",
            "`default_nettype wire",
            "",
        ]
    )
    return "\n".join(lines)


def render_common_ops() -> str:
    return """`default_nettype none

package rtl_validation_ops;
    function automatic logic signed [31:0] soft_mul32(
        input logic signed [31:0] a,
        input logic signed [31:0] b
    );
        logic [31:0] abs_a;
        logic [31:0] abs_b;
        logic [63:0] acc;
        logic neg;
        begin
            neg = a[31] ^ b[31];
            abs_a = a[31] ? $unsigned(-a) : $unsigned(a);
            abs_b = b[31] ? $unsigned(-b) : $unsigned(b);
            acc = 64'd0;
            for (int i = 0; i < 32; i++) begin
                if (abs_b[i]) begin
                    acc = acc + ({32'd0, abs_a} << i);
                end
            end
            soft_mul32 = neg ? -$signed(acc[31:0]) : $signed(acc[31:0]);
        end
    endfunction
endpackage

`default_nettype wire
"""


def render_wrapper(module_name: str, top_name: str, input_names: list[str]) -> str:
    ports = [
        "    input  logic clk",
        "    input  logic resetn",
        "    input  logic valid_in",
    ]
    ports.extend(f"    input  logic signed [31:0] {sv_input_port(name)}" for name in input_names)
    ports.extend(
        [
            "    output logic valid_out",
            "    output logic signed [31:0] out",
        ]
    )
    reg_decls = []
    inst_ports = []
    for name in input_names:
        port = sv_input_port(name)
        reg = f"{port}_r"
        reg_decls.append(f"    logic signed [31:0] {reg};")
        inst_ports.append(f"        .{port}({reg})")
    input_regs = "\n".join(reg_decls)
    sample_lines = "\n".join(f"            {sv_input_port(name)}_r <= {sv_input_port(name)};" for name in input_names)
    inst = ",\n".join(inst_ports + ["        .out(datapath_out)"])
    return f"""`default_nettype none

module {top_name}(
{',\n'.join(ports)}
);
{input_regs}
    logic signed [31:0] datapath_out;

    {module_name} datapath_inst (
{inst}
    );

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
{sample_lines}
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
"""


def render_testbench(benchmark: str, variants: list[dict], test_vectors: int) -> str:
    input_names = variants[0]["input_names"]
    decls = "\n".join(f"    logic signed [31:0] {sv_input_port(name)};" for name in input_names)
    instantiations = []
    output_decls = []
    for item in variants:
        module = item["module_name"]
        out = f"out_{item['variant']}"
        output_decls.append(f"    logic signed [31:0] {out};")
        ports = [f"        .{sv_input_port(name)}({sv_input_port(name)})" for name in input_names]
        ports.append(f"        .out({out})")
        instantiations.append(f"    {module} u_{item['variant']} (\n" + ",\n".join(ports) + "\n    );")

    assignments = []
    for idx, name in enumerate(input_names):
        assignments.append(
            f"            {sv_input_port(name)} = signed_value({idx}, vec);"
        )
    checks = []
    for item in variants:
        if item["variant"] == "original":
            continue
        checks.append(
            f"""            if (out_{item['variant']} !== out_original) begin
                $display("FAIL,{benchmark},{item['variant']},%0d,%0d,%0d", vec, out_original, out_{item['variant']});
                failures++;
            end"""
        )
    return f"""`timescale 1ns/1ps
`default_nettype none

module tb_{benchmark};
{decls}
{chr(10).join(output_decls)}

{chr(10).join(instantiations)}

    int failures;

    function automatic logic signed [31:0] signed_value(input int input_idx, input int vec);
        int raw;
        begin
            raw = ((vec * 17) + (input_idx * 31) + 7) % {TEST_MAX - TEST_MIN + 1};
            signed_value = 32'sd{TEST_MIN} + raw;
        end
    endfunction

    initial begin
        failures = 0;
        for (int vec = 0; vec < {test_vectors}; vec++) begin
{chr(10).join(assignments)}
            #1;
{chr(10).join(checks)}
        end
        if (failures == 0) begin
            $display("PASS,{benchmark},{len(variants) - 1},{test_vectors}");
            $finish;
        end
        $display("FAIL_SUMMARY,{benchmark},%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
"""


def render_qsf(project_name: str, family: str, device: str) -> str:
    return f"""set_global_assignment -name FAMILY "{family}"
set_global_assignment -name DEVICE {device}
set_global_assignment -name TOP_LEVEL_ENTITY {project_name}_top
set_global_assignment -name SYSTEMVERILOG_FILE ../../src/rtl_validation_ops.sv
set_global_assignment -name SYSTEMVERILOG_FILE ../../src/{project_name}.sv
set_global_assignment -name SYSTEMVERILOG_FILE ../../quartus/{project_name}/{project_name}_top.sv
set_global_assignment -name SDC_FILE {project_name}.sdc
set_global_assignment -name FLOW_DISABLE_ASSEMBLER ON
set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC ON
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON
set_instance_assignment -name VIRTUAL_PIN ON -to *
"""


def render_sdc(clock_ns: float) -> str:
    return f"create_clock -name clk -period {clock_ns:.3f} [get_ports clk]\n"


def render_run_functional_sim() -> str:
    return r"""#!/usr/bin/env bash
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
mapfile -t rtl_sources < <(find "$ROOT_DIR/src" -maxdepth 1 -name '*.sv' ! -name 'rtl_validation_ops.sv' | sort)

for tb in "$ROOT_DIR"/tests/tb_*.sv; do
  bench="$(basename "$tb" .sv)"
  bench="${bench#tb_}"
  log="$REPORT_DIR/sim/${bench}.log"
  echo "Simulating $bench with $SIM_TOOL"
  if [[ "$SIM_TOOL" == "modelsim" ]]; then
    work="$REPORT_DIR/sim/work_${bench}"
    rm -rf "$work"
    vlib "$work" >/dev/null
    vlog -quiet -sv -work "$work" "$ROOT_DIR/src/rtl_validation_ops.sv" "${rtl_sources[@]}" "$tb" > "$log" 2>&1
    if vsim -c -quiet -lib "$work" "tb_${bench}" -do "run -all; quit -f" >> "$log" 2>&1; then
      pass_line="$(grep '^# PASS,' "$log" | tail -1 | sed 's/^# //')"
    else
      pass_line=""
    fi
  else
    out="$REPORT_DIR/sim/${bench}.vvp"
    if iverilog -g2012 -o "$out" "$ROOT_DIR/src/rtl_validation_ops.sv" "${rtl_sources[@]}" "$tb" > "$log" 2>&1 && vvp "$out" >> "$log" 2>&1; then
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
"""


def render_run_quartus_compile() -> str:
    return r"""#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$ROOT_DIR/../.." && pwd)"
QUARTUS_SH="${QUARTUS_SH:-quartus_sh}"
JOBS="${JOBS:-1}"
ONLY="${RTL_ONLY:-}"

if ! command -v "$QUARTUS_SH" >/dev/null 2>&1; then
  echo "quartus_sh not found. Load Quartus or set QUARTUS_SH=/path/to/quartus_sh." >&2
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

run_one() {
  local qpf="$1"
  local dir name log
  dir="$(dirname "$qpf")"
  name="$(basename "$qpf" .qpf)"
  log="$ROOT_DIR/reports/quartus/${name}.log"
  mkdir -p "$(dirname "$log")"
  echo "Compiling $name"
  (cd "$dir" && "$QUARTUS_SH" --flow compile "$name") > "$log" 2>&1
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

python3 "$ROOT_DIR/scripts/parse_quartus_reports.py" \
  --root "$ROOT_DIR" \
  --metadata "$ROOT_DIR/metadata/generated_variants.json" \
  --out "$ROOT_DIR/reports/rtl_quartus_summary.csv"

python3 "$ROOT_DIR/scripts/analyze_rtl_reports.py" \
  --root "$ROOT_DIR" \
  --summary "$ROOT_DIR/reports/rtl_quartus_summary.csv"
"""


def render_parse_quartus_reports() -> str:
    return r'''#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path


def read_text(path: Path) -> str:
    return path.read_text(errors="ignore") if path.exists() else ""


def first_match(text: str, patterns: list[str]) -> str:
    for pattern in patterns:
        match = re.search(pattern, text, re.IGNORECASE | re.MULTILINE)
        if match:
            return match.group(1).replace(",", "").strip()
    return ""


def parse_variant(root: Path, item: dict) -> dict[str, str]:
    name = item["module_name"]
    qdir = root / "quartus" / name
    fit = read_text(qdir / f"{name}.fit.rpt")
    mapr = read_text(qdir / f"{name}.map.rpt")
    sta = read_text(qdir / f"{name}.sta.rpt")
    tan = read_text(qdir / f"{name}.tan.rpt")
    timing = sta or tan
    text = "\n".join([fit, mapr, timing])
    alm = first_match(text, [
        r"Total\s+ALMs\s*[:;]\s*([\d,]+)",
        r"Logic utilization \(in ALMs\)\s*[:;]\s*([\d,]+)",
        r"Combinational ALUTs\s*[:;]\s*([\d,]+)",
    ])
    registers = first_match(text, [
        r"Dedicated logic registers\s*[:;]\s*([\d,]+)",
        r"Total registers\s*[:;]\s*([\d,]+)",
    ])
    dsp = first_match(text, [
        r"Variable precision DSP blocks\s*[:;]\s*([\d,]+)",
        r"DSP block 18-bit elements\s*[:;]\s*([\d,]+)",
        r"Embedded Multiplier 18-bit elements\s*[:;]\s*([\d,]+)",
    ])
    ram = first_match(text, [
        r"Total block memory bits\s*[:;]\s*([\d,]+)",
        r"RAM Blocks\s*[:;]\s*([\d,]+)",
        r"M20K blocks\s*[:;]\s*([\d,]+)",
    ])
    fmax = first_match(timing, [
        r"^\s*clk\s+([\d.]+)\s+MHz",
        r"Fmax\s+Summary.*?clk.*?([\d.]+)\s+MHz",
        r"Restricted Fmax\s*[:;]\s*([\d.]+)\s*MHz",
    ])
    slack = first_match(timing, [
        r"Slack\s*[:;]\s*([+-]?[\d.]+)",
        r"Worst-case setup slack\s*[:;]\s*([+-]?[\d.]+)",
    ])
    status = "compiled" if fit or mapr or timing else "missing_reports"
    return {
        "benchmark": item["benchmark"],
        "variant": item["variant"],
        "module_name": name,
        "analytical_area": str(item["metrics"].get("area", "")),
        "analytical_latency": str(item["metrics"].get("latency", "")),
        "analytical_power": str(item["metrics"].get("power", "")),
        "analytical_dsp_count": str(item["metrics"].get("dsp_count", "")),
        "analytical_lut_count": str(item["metrics"].get("lut_count", "")),
        "rtl_intended_dsp_count": str(item.get("rtl_intended_dsp_count", "")),
        "rtl_intended_logic_mul_count": str(item.get("rtl_intended_logic_mul_count", "")),
        "latency_cycles": "1",
        "quartus_alm_or_alut": alm,
        "quartus_registers": registers,
        "quartus_dsp_blocks": dsp,
        "quartus_ram_blocks": ram,
        "quartus_fmax_mhz": fmax,
        "quartus_worst_slack_ns": slack,
        "timing_passed": "true" if slack and not slack.startswith("-") else ("false" if slack else ""),
        "status": status,
        "report_dir": str(qdir),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description="Parse Quartus RTL validation reports")
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--metadata", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    metadata = json.loads(args.metadata.read_text())
    rows = [
        parse_variant(args.root, item)
        for item in metadata["variants"]
        if item.get("status") == "generated"
    ]
    fields = list(rows[0].keys()) if rows else []
    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    print(f"Wrote {args.out}")


if __name__ == "__main__":
    main()
'''


def render_analyze_rtl_reports() -> str:
    return r'''#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import math
import shutil
import subprocess
from pathlib import Path


VARIANT_ORDER = [
    "original",
    "weighted",
    "latency_unconstrained",
    "power_unconstrained",
    "latency_under_dsp",
    "latency_under_lut",
]


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open() as handle:
        return list(csv.DictReader(handle))


def to_float(value: str) -> float | None:
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_md(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write("| " + " | ".join(fields) + " |\n")
        handle.write("| " + " | ".join("---" for _ in fields) + " |\n")
        for row in rows:
            handle.write("| " + " | ".join(str(row.get(field, "")) for field in fields) + " |\n")


def svg_text(x: float, y: float, text: str, size: int = 12, anchor: str = "middle") -> str:
    return f'<text x="{x:.1f}" y="{y:.1f}" font-size="{size}" text-anchor="{anchor}" fill="#102a43">{text}</text>'


def save_svg_png(path: Path, svg: str) -> None:
    path.write_text(svg)
    convert = shutil.which("convert")
    if convert:
        subprocess.run([convert, str(path), str(path.with_suffix(".png"))], check=False)


def build_expected_vs_actual(rows: list[dict[str, str]]) -> str:
    pts = []
    for row in rows:
        x = to_float(row.get("rtl_intended_dsp_count", ""))
        y = to_float(row.get("quartus_dsp_blocks", ""))
        if x is not None and y is not None:
            pts.append((x, y, row["benchmark"], row["variant"]))
    width, height = 760, 440
    margin = 70
    max_v = max([1.0] + [max(x, y) for x, y, _, _ in pts])
    def sx(x): return margin + x / max_v * (width - 2 * margin)
    def sy(y): return height - margin - y / max_v * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "RTL Intended DSPs vs Quartus Fitted DSPs", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{sx(0)}" y1="{sy(0)}" x2="{sx(max_v)}" y2="{sy(max_v)}" stroke="#9fb3c8" stroke-dasharray="5 5"/>',
        svg_text(width / 2, height - 22, "RTL intended multiplier/MAC DSP count", 13),
        f'<text x="20" y="{height/2}" transform="rotate(-90 20 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Quartus fitted DSP blocks</text>',
    ]
    colors = {"original": "#1f77b4", "weighted": "#ff7f0e", "latency_unconstrained": "#2ca02c", "power_unconstrained": "#9467bd", "latency_under_dsp": "#d62728", "latency_under_lut": "#17becf"}
    for x, y, bench, variant in pts:
        elems.append(f'<circle cx="{sx(x):.1f}" cy="{sy(y):.1f}" r="5" fill="{colors.get(variant, "#333")}"><title>{bench}/{variant}</title></circle>')
    elems.append("</svg>")
    return "\n".join(elems)


def build_resource_tradeoff(rows: list[dict[str, str]]) -> str:
    pts = []
    for row in rows:
        x = to_float(row.get("quartus_dsp_blocks", ""))
        y = to_float(row.get("quartus_alm_or_alut", ""))
        if x is not None and y is not None:
            pts.append((x, y, row["benchmark"], row["variant"]))
    width, height = 760, 440
    margin = 70
    max_x = max([1.0] + [p[0] for p in pts])
    max_y = max([1.0] + [p[1] for p in pts])
    def sx(x): return margin + x / max_x * (width - 2 * margin)
    def sy(y): return height - margin - y / max_y * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "RTL Resource Tradeoff After Quartus Fit", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        svg_text(width / 2, height - 22, "Quartus fitted DSP blocks", 13),
        f'<text x="20" y="{height/2}" transform="rotate(-90 20 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Quartus ALM/ALUT estimate</text>',
    ]
    for x, y, bench, variant in pts:
        elems.append(f'<circle cx="{sx(x):.1f}" cy="{sy(y):.1f}" r="5" fill="#2f80ed"><title>{bench}/{variant}</title></circle>')
    elems.append("</svg>")
    return "\n".join(elems)


def build_fmax(rows: list[dict[str, str]]) -> str:
    data = [row for row in rows if to_float(row.get("quartus_fmax_mhz", "")) is not None]
    width, height = 900, 460
    margin = 70
    max_y = max([1.0] + [to_float(row["quartus_fmax_mhz"]) or 0 for row in data])
    groups = sorted({row["benchmark"] for row in data})
    group_w = (width - 2 * margin) / max(1, len(groups))
    bar_w = group_w / 8
    colors = {"original": "#1f77b4", "weighted": "#ff7f0e", "latency_unconstrained": "#2ca02c", "power_unconstrained": "#9467bd", "latency_under_dsp": "#d62728", "latency_under_lut": "#17becf"}
    def sy(y): return height - margin - y / max_y * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "Quartus STA Fmax by Variant", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<text x="22" y="{height/2}" transform="rotate(-90 22 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Fmax (MHz)</text>',
    ]
    for gi, bench in enumerate(groups):
        rows_b = {row["variant"]: row for row in data if row["benchmark"] == bench}
        base_x = margin + gi * group_w + group_w * 0.1
        elems.append(svg_text(margin + gi * group_w + group_w / 2, height - 40, bench, 11))
        for vi, variant in enumerate(VARIANT_ORDER):
            row = rows_b.get(variant)
            if not row:
                continue
            value = to_float(row["quartus_fmax_mhz"]) or 0
            x = base_x + vi * bar_w
            y = sy(value)
            elems.append(f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_w*0.8:.1f}" height="{height-margin-y:.1f}" fill="{colors.get(variant, "#333")}"><title>{bench}/{variant}: {value:.1f} MHz</title></rect>')
    elems.append("</svg>")
    return "\n".join(elems)


def main() -> None:
    parser = argparse.ArgumentParser(description="Analyze RTL Quartus validation reports")
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    args = parser.parse_args()
    rows = read_rows(args.summary)
    analysis = args.root / "analysis"
    analysis.mkdir(parents=True, exist_ok=True)
    table_fields = [
        "benchmark", "variant", "rtl_intended_dsp_count", "quartus_dsp_blocks",
        "quartus_alm_or_alut", "quartus_fmax_mhz", "quartus_worst_slack_ns",
        "timing_passed", "status",
    ]
    table_rows = [{field: row.get(field, "") for field in table_fields} for row in rows]
    write_csv(analysis / "rtl_validation_table.csv", table_rows, table_fields)
    write_md(analysis / "rtl_validation_table.md", table_rows, table_fields)
    save_svg_png(analysis / "rtl_expected_vs_actual_dsp.svg", build_expected_vs_actual(rows))
    save_svg_png(analysis / "rtl_resource_tradeoff.svg", build_resource_tradeoff(rows))
    save_svg_png(analysis / "rtl_fmax_by_variant.svg", build_fmax(rows))
    print(f"Wrote RTL analysis artifacts to {analysis}")


if __name__ == "__main__":
    main()
'''


def write_executable(path: Path, content: str) -> None:
    path.write_text(content)
    path.chmod(path.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)


def write_metadata_csv(path: Path, variants: list[dict]) -> None:
    fields = [
        "benchmark",
        "variant",
        "module_name",
        "status",
        "analytical_area",
        "analytical_latency",
        "analytical_power",
        "analytical_dsp_count",
        "analytical_lut_count",
        "rtl_intended_dsp_count",
        "rtl_intended_logic_mul_count",
        "source_path",
        "quartus_project_dir",
    ]
    rows = []
    for item in variants:
        metrics = item.get("metrics", {})
        rows.append(
            {
                "benchmark": item.get("benchmark", ""),
                "variant": item.get("variant", ""),
                "module_name": item.get("module_name", ""),
                "status": item.get("status", ""),
                "analytical_area": metrics.get("area", ""),
                "analytical_latency": metrics.get("latency", ""),
                "analytical_power": metrics.get("power", ""),
                "analytical_dsp_count": metrics.get("dsp_count", ""),
                "analytical_lut_count": metrics.get("lut_count", ""),
                "rtl_intended_dsp_count": item.get("rtl_intended_dsp_count", ""),
                "rtl_intended_logic_mul_count": item.get("rtl_intended_logic_mul_count", ""),
                "source_path": item.get("source_path", ""),
                "quartus_project_dir": item.get("quartus_project_dir", ""),
            }
        )
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def render_readme() -> str:
    return """# RTL Validation

This directory contains direct SystemVerilog variants generated from the optimizer output.
It is intended to validate DSP-vs-logic multiplier mapping with Quartus fit/STA, not
through Intel HLS inference.

## Functional simulation

```bash
cd outputs/rtl_validation
./scripts/run_functional_sim.sh
```

The script prefers ModelSim/Questa when `vlog` and `vsim` are available, otherwise it
tries Icarus Verilog.

## Quartus fit and timing

```bash
cd outputs/rtl_validation
JOBS=1 ./scripts/run_quartus_compile.sh
```

To run a subset first:

```bash
RTL_ONLY='(dot16|fir8|stencil5)' JOBS=1 ./scripts/run_quartus_compile.sh
```

Outputs:

- `reports/functional_summary.csv`
- `reports/rtl_quartus_summary.csv`
- `analysis/rtl_validation_table.md`
- `analysis/rtl_expected_vs_actual_dsp.{svg,png}`
- `analysis/rtl_resource_tradeoff.{svg,png}`
- `analysis/rtl_fmax_by_variant.{svg,png}`

Important scope note: the RTL flow forces multiplier/MAC DSP intent. Standalone add/sub
operations are implemented as fabric arithmetic because exact DSP add/sub binding is
architecture- and tool-dependent.
"""


def export_rtl_validation(
    *,
    results_path: Path,
    output_dir: Path,
    benchmarks: list[str],
    variants: list[str],
    family: str,
    device: str,
    clock_ns: float,
    test_vectors: int,
) -> dict:
    results = json.loads(results_path.read_text())
    if output_dir.exists():
        for child in ["src", "tests", "quartus", "scripts", "metadata"]:
            shutil.rmtree(output_dir / child, ignore_errors=True)
    src_dir = output_dir / "src"
    tests_dir = output_dir / "tests"
    quartus_dir = output_dir / "quartus"
    scripts_dir = output_dir / "scripts"
    metadata_dir = output_dir / "metadata"
    reports_dir = output_dir / "reports"
    for directory in (src_dir, tests_dir, quartus_dir, scripts_dir, metadata_dir, reports_dir):
        directory.mkdir(parents=True, exist_ok=True)

    (src_dir / "rtl_validation_ops.sv").write_text(render_common_ops())
    generated_by_benchmark: dict[str, list[dict]] = {}
    variant_metadata: list[dict] = []

    for benchmark in benchmarks:
        payload = results.get("benchmarks", {}).get(benchmark)
        if not payload:
            variant_metadata.append(
                {"benchmark": benchmark, "variant": "", "status": "skipped", "message": "benchmark missing"}
            )
            continue
        input_names = input_names_from_graph(payload["original_ir"])
        generated_by_benchmark[benchmark] = []
        for variant in variants:
            graph, metrics, message = variant_graph_and_metrics(payload, variant)
            module_name = sanitize_identifier(f"{benchmark}_{variant}")
            if graph is None or metrics is None:
                variant_metadata.append(
                    {
                        "benchmark": benchmark,
                        "variant": variant,
                        "module_name": module_name,
                        "status": "skipped",
                        "message": message or "not generated",
                    }
                )
                continue
            source_path = src_dir / f"{module_name}.sv"
            project_dir = quartus_dir / module_name
            project_dir.mkdir(parents=True, exist_ok=True)
            top_name = f"{module_name}_top"
            source_path.write_text(
                render_datapath_module(
                    benchmark=benchmark,
                    variant=variant,
                    module_name=module_name,
                    graph=graph,
                    metrics=metrics,
                    input_names=input_names,
                )
            )
            (project_dir / f"{top_name}.sv").write_text(render_wrapper(module_name, top_name, input_names))
            (project_dir / f"{module_name}.qsf").write_text(render_qsf(module_name, family, device))
            (project_dir / f"{module_name}.qpf").write_text(f"PROJECT_REVISION = {module_name}\n")
            (project_dir / f"{module_name}.sdc").write_text(render_sdc(clock_ns))
            item = {
                "benchmark": benchmark,
                "variant": variant,
                "module_name": module_name,
                "status": "generated",
                "input_names": input_names,
                "metrics": metrics,
                "op_counts": op_counts(graph),
                "rtl_intended_dsp_count": rtl_intended_dsp_count(graph),
                "rtl_intended_logic_mul_count": rtl_intended_logic_mul_count(graph),
                "expression": run_benchmarks.graph_to_expr_text(graph),
                "source_path": repo_relative(source_path),
                "quartus_project_dir": repo_relative(project_dir),
            }
            generated_by_benchmark[benchmark].append(item)
            variant_metadata.append(item)

    for benchmark, items in generated_by_benchmark.items():
        if not any(item["variant"] == "original" for item in items):
            continue
        tests_dir.mkdir(parents=True, exist_ok=True)
        (tests_dir / f"tb_{benchmark}.sv").write_text(render_testbench(benchmark, items, test_vectors))

    write_executable(scripts_dir / "run_functional_sim.sh", render_run_functional_sim())
    write_executable(scripts_dir / "run_quartus_compile.sh", render_run_quartus_compile())
    write_executable(scripts_dir / "parse_quartus_reports.py", render_parse_quartus_reports())
    write_executable(scripts_dir / "analyze_rtl_reports.py", render_analyze_rtl_reports())
    (output_dir / "README.md").write_text(render_readme())

    metadata = {
        "results_path": repo_relative(results_path),
        "output_dir": repo_relative(output_dir),
        "family": family,
        "device": device,
        "clock_ns": clock_ns,
        "benchmarks": benchmarks,
        "requested_variants": variants,
        "test_vectors": test_vectors,
        "variants": variant_metadata,
    }
    (metadata_dir / "generated_variants.json").write_text(json.dumps(metadata, indent=2))
    write_metadata_csv(metadata_dir / "expected_resource_summary.csv", variant_metadata)
    return metadata


def main() -> None:
    parser = argparse.ArgumentParser(description="Export optimized datapaths as direct SystemVerilog")
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument("--benchmarks", nargs="+", default=DEFAULT_BENCHMARKS)
    parser.add_argument("--variants", nargs="+", default=DEFAULT_VARIANTS)
    parser.add_argument("--family", default=DEFAULT_FAMILY)
    parser.add_argument("--device", default=DEFAULT_DEVICE)
    parser.add_argument("--clock-ns", type=float, default=DEFAULT_CLOCK_NS)
    parser.add_argument("--test-vectors", type=int, default=TEST_VECTOR_COUNT)
    args = parser.parse_args()

    metadata = export_rtl_validation(
        results_path=args.results,
        output_dir=args.out,
        benchmarks=args.benchmarks,
        variants=args.variants,
        family=args.family,
        device=args.device,
        clock_ns=args.clock_ns,
        test_vectors=args.test_vectors,
    )
    generated = sum(1 for item in metadata["variants"] if item.get("status") == "generated")
    skipped = sum(1 for item in metadata["variants"] if item.get("status") != "generated")
    print(f"Wrote {generated} RTL variants to {args.out}")
    if skipped:
        print(f"Skipped {skipped} infeasible or missing variants; see metadata/generated_variants.json")


if __name__ == "__main__":
    main()
