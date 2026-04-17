#!/usr/bin/env python3
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
    synthesis = read_text(qdir / f"{name}.map.rpt") or read_text(qdir / f"{name}.syn.rpt")
    sta = read_text(qdir / f"{name}.sta.rpt")
    tan = read_text(qdir / f"{name}.tan.rpt")
    timing = sta or tan
    text = "\n".join([fit, synthesis, timing])
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
        r"Total DSP Blocks\s*[:;]\s*([\d,]+)\s*/",
        r"DSP Blocks Needed \[=A\+B-C\]\s*[:;]\s*([\d,]+)\s*/",
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
        r";\s*([\d.]+)\s+MHz\s*;\s*[\d.]+\s+MHz\s*;\s*clk",
        r"^\s*clk\s+([\d.]+)\s+MHz",
        r"Fmax\s+Summary.*?clk.*?([\d.]+)\s+MHz",
        r"Restricted Fmax\s*[:;]\s*([\d.]+)\s*MHz",
    ])
    slack = first_match(timing, [
        r"Slack\s*[:;]\s*([+-]?[\d.]+)",
        r"Worst-case setup slack\s*[:;]\s*([+-]?[\d.]+)",
    ])
    if fit and synthesis:
        status = "compiled"
    elif fit or synthesis or timing:
        status = "partial_reports"
    else:
        status = "missing_reports"
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
