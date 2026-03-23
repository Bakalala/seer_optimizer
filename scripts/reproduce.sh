#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT"

cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json

echo
echo "Reproduction complete."
echo "Report: $ROOT/outputs/report.html"
echo "Analysis: $ROOT/outputs/analysis.md"
echo "Summary CSV: $ROOT/outputs/benchmark_summary.csv"
