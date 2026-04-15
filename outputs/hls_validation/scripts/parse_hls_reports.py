#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path


def read_texts(path: Path) -> str:
    parts = []
    for candidate in path.rglob("*"):
        if candidate.is_file() and candidate.suffix.lower() in {".rpt", ".log", ".txt", ".html"}:
            try:
                parts.append(candidate.read_text(errors="ignore"))
            except OSError:
                pass
    return "\n".join(parts)


def first_number(patterns: list[str], text: str) -> str:
    for pattern in patterns:
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            return match.group(1).replace(",", "")
    return ""


def main() -> None:
    parser = argparse.ArgumentParser(description="Parse Intel HLS/Quartus reports into CSV")
    parser.add_argument("--root", type=Path, default=Path("reports/hls"))
    parser.add_argument("--metadata", type=Path, default=Path("metadata/generated_variants.json"))
    parser.add_argument("--out", type=Path, default=Path("reports/hls_summary.csv"))
    args = parser.parse_args()

    metadata = json.loads(args.metadata.read_text())
    by_function = {item["function_name"]: item for item in metadata["variants"] if item["status"] == "generated"}
    rows = []
    for function_name, item in sorted(by_function.items()):
        function_root = args.root / function_name
        if not function_root.exists():
            rows.append({**item, "hls_mode": "", "report_path": str(function_root), "status": "missing_reports"})
            continue
        for mode_dir in sorted(path for path in function_root.iterdir() if path.is_dir()):
            text = read_texts(mode_dir)
            rows.append(
                {
                    "benchmark": item["benchmark"],
                    "variant": item["variant"],
                    "function_name": function_name,
                    "hls_mode": mode_dir.name,
                    "expected_dsp": item["metrics"]["dsp_count"],
                    "expected_lut": item["metrics"]["lut_count"],
                    "analytical_area": item["metrics"]["area"],
                    "analytical_latency": item["metrics"]["latency"],
                    "analytical_power": item["metrics"].get("power", ""),
                    "quartus_dsp": first_number([r"DSP[^\n\r]*?([0-9][0-9,]*)", r"Multiplier[^\n\r]*?([0-9][0-9,]*)"], text),
                    "quartus_alm_or_lut": first_number([r"ALM[^\n\r]*?([0-9][0-9,]*)", r"LUT[^\n\r]*?([0-9][0-9,]*)"], text),
                    "quartus_registers": first_number([r"Register[^\n\r]*?([0-9][0-9,]*)"], text),
                    "quartus_fmax_mhz": first_number([r"Fmax[^\n\r]*?([0-9]+(?:\.[0-9]+)?)\s*MHz"], text),
                    "quartus_power": first_number([r"Power[^\n\r]*?([0-9]+(?:\.[0-9]+)?)"], text),
                    "report_path": str(mode_dir),
                    "status": "parsed",
                }
            )

    args.out.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "benchmark",
        "variant",
        "function_name",
        "hls_mode",
        "expected_dsp",
        "expected_lut",
        "analytical_area",
        "analytical_latency",
        "analytical_power",
        "quartus_dsp",
        "quartus_alm_or_lut",
        "quartus_registers",
        "quartus_fmax_mhz",
        "quartus_power",
        "report_path",
        "status",
    ]
    with args.out.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})
    print(f"Wrote {args.out}")


if __name__ == "__main__":
    main()
