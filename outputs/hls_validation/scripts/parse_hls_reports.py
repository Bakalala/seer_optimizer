#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
from typing import Any


def load_json(path: Path) -> Any | None:
    if not path.exists():
        return None
    try:
        return json.loads(path.read_text(errors="ignore"))
    except (OSError, json.JSONDecodeError):
        return None


def first_report_json(mode_dir: Path, function_name: str, filename: str) -> Path | None:
    direct = mode_dir / f"{function_name}.prj" / "reports" / "lib" / "json" / filename
    if direct.exists():
        return direct
    matches = sorted(mode_dir.glob(f"*.prj/reports/lib/json/{filename}"))
    return matches[0] if matches else None


def total_resources_from_summary(summary: dict[str, Any] | None) -> dict[str, str]:
    empty = {
        "hls_est_aluts": "",
        "hls_est_ffs": "",
        "hls_est_rams": "",
        "hls_est_dsps": "",
        "hls_est_mlabs": "",
    }
    if not summary:
        return empty
    section = summary.get("estimatedResources", {})
    for child in section.get("children", []):
        if child.get("name") == "Total":
            data = child.get("data", [])
            if len(data) >= 5:
                return {
                    "hls_est_aluts": str(data[0]),
                    "hls_est_ffs": str(data[1]),
                    "hls_est_rams": str(data[2]),
                    "hls_est_dsps": str(data[3]),
                    "hls_est_mlabs": str(data[4]),
                }
    return empty


def total_resources_from_area(area: dict[str, Any] | None) -> dict[str, str]:
    empty = {
        "hls_est_aluts": "",
        "hls_est_ffs": "",
        "hls_est_rams": "",
        "hls_est_dsps": "",
        "hls_est_mlabs": "",
    }
    if not area:
        return empty
    data = area.get("total")
    if isinstance(data, list) and len(data) >= 5:
        return {
            "hls_est_aluts": str(data[0]),
            "hls_est_ffs": str(data[1]),
            "hls_est_rams": str(data[2]),
            "hls_est_dsps": str(data[3]),
            "hls_est_mlabs": str(data[4]),
        }
    return empty


def walk(value: Any):
    if isinstance(value, dict):
        yield value
        for child in value.values():
            yield from walk(child)
    elif isinstance(value, list):
        for child in value:
            yield from walk(child)


def parse_number(value: Any) -> float | None:
    try:
        return float(str(value).replace("~", "").strip())
    except (TypeError, ValueError):
        return None


def schedule_cycles(schedule: dict[str, Any] | None) -> str:
    if not schedule:
        return ""
    max_end = None
    for node in walk(schedule):
        value = parse_number(node.get("end"))
        if value is not None:
            max_end = value if max_end is None else max(max_end, value)
    if max_end is None:
        return ""
    return str(int(max_end)) if max_end.is_integer() else f"{max_end:.2f}"


def quartus_fit_fields(quartus: dict[str, Any] | None) -> dict[str, str]:
    fields = {
        "quartus_fit_alm": "",
        "quartus_fit_reg": "",
        "quartus_fit_dsp": "",
        "quartus_fit_ram": "",
        "quartus_fit_fmax_mhz": "",
        "has_quartus_fit": "false",
    }
    if not quartus:
        return fields
    resource_nodes = quartus.get("quartusFitResourceUsageSummary", {}).get("nodes", [])
    for node in resource_nodes:
        values = {key: str(node.get(key, "")).strip() for key in ("alm", "reg", "dsp", "ram")}
        if values and all(value and value != "TBD" for value in values.values()):
            fields.update(
                {
                    "quartus_fit_alm": values["alm"],
                    "quartus_fit_reg": values["reg"],
                    "quartus_fit_dsp": values["dsp"],
                    "quartus_fit_ram": values["ram"],
                    "has_quartus_fit": "true",
                }
            )
            break
    clock_nodes = quartus.get("quartusFitClockSummary", {}).get("nodes", [])
    for node in clock_nodes:
        fmax = str(node.get("fmax", node.get("clock", ""))).strip()
        if fmax and fmax != "TBD":
            fields["quartus_fit_fmax_mhz"] = fmax
            fields["has_quartus_fit"] = "true"
            break
    return fields


def parse_mode_dir(mode_dir: Path, function_name: str) -> dict[str, str]:
    summary = load_json(first_report_json(mode_dir, function_name, "summary.json") or Path())
    area = load_json(first_report_json(mode_dir, function_name, "area.json") or Path())
    schedule = load_json(first_report_json(mode_dir, function_name, "schedule.json") or Path())
    quartus = load_json(first_report_json(mode_dir, function_name, "quartus.json") or Path())
    resources = total_resources_from_summary(summary)
    if not resources["hls_est_aluts"]:
        resources = total_resources_from_area(area)
    return {
        **resources,
        "hls_schedule_cycles": schedule_cycles(schedule),
        **quartus_fit_fields(quartus),
    }


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
            rows.append(
                {
                    "benchmark": item["benchmark"],
                    "variant": item["variant"],
                    "function_name": function_name,
                    "hls_mode": "",
                    "report_path": str(function_root),
                    "status": "missing_reports",
                }
            )
            continue
        for mode_dir in sorted(path for path in function_root.iterdir() if path.is_dir()):
            metrics = item["metrics"]
            rows.append(
                {
                    "benchmark": item["benchmark"],
                    "variant": item["variant"],
                    "function_name": function_name,
                    "hls_mode": mode_dir.name,
                    "expected_dsp": metrics["dsp_count"],
                    "expected_lut": metrics["lut_count"],
                    "analytical_area": metrics["area"],
                    "analytical_latency": metrics["latency"],
                    "analytical_power": metrics.get("power", ""),
                    **parse_mode_dir(mode_dir, function_name),
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
        "hls_est_aluts",
        "hls_est_ffs",
        "hls_est_rams",
        "hls_est_dsps",
        "hls_est_mlabs",
        "hls_schedule_cycles",
        "quartus_fit_alm",
        "quartus_fit_reg",
        "quartus_fit_dsp",
        "quartus_fit_ram",
        "quartus_fit_fmax_mhz",
        "has_quartus_fit",
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
