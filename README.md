# Constraint-Aware E-Graph HLS Optimizer

Datapath-only constraint-aware HLS optimizer built around a Rust `egg` core, a Python benchmark harness, generated RTL validation, and a final SIGPLAN-style report.

Project repository: <https://github.com/Bakalala/seer_optimizer>

## Final Submission Status

The final report is:

- [`report/main.pdf`](report/main.pdf): compiled report
- [`outputs/project_report.pdf`](outputs/project_report.pdf): exported report copy
- [`report/main.tex`](report/main.tex): LaTeX source

Main claim:

> Equality saturation can generate many equivalent HLS datapaths, but a designer still needs extraction interfaces that can answer constrained design questions. This project adds weighted, constrained, infeasibility-reporting, and Pareto extraction over a retained e-graph frontier.

Validation evidence:

- Analytical benchmark evaluation across six arithmetic kernels.
- Generated Verilog RTL variants tested with ModelSim against independent golden formulas.
- Quartus Prime Pro 19.2 fit/STA reports for all 35 generated RTL variants on Arria 10.
- Narrow FPGA-backed evidence that multiplier-heavy kernels can trade fitted DSP blocks for ALMs.

Important scope note: the project does **not** claim global FPGA optimality, calibrated power modeling, or consistent Fmax/area improvement for every variant. Quartus is an optimizing backend and can legally merge small equivalent datapaths into identical fitted circuits.

## Scope

- Datapath only: arithmetic/dataflow graphs with `input`, `const`, `add`, `sub`, and `mul`
- No control flow, no memory modeling, no loop scheduling, and no frontend/parser work
- Equality saturation is used to explore algebraically equivalent datapaths
- Extraction supports:
  - weighted optimization
  - constrained optimization under explicit budgets
  - exact 2D area/latency Pareto extraction
  - latency-optimal extraction with no budgets
  - normalized power-proxy extraction
  - DSP/LUT resource-budget queries

## Key Artifacts

- Analytical summaries:
  - [`outputs/main_comparison_table.md`](outputs/main_comparison_table.md)
  - [`outputs/baseline_constraints.md`](outputs/baseline_constraints.md)
  - [`outputs/analysis.md`](outputs/analysis.md)
- Structural validation:
  - [`outputs/variant_structure/interpretation.md`](outputs/variant_structure/interpretation.md)
  - [`outputs/variant_structure/variant_structure_summary.csv`](outputs/variant_structure/variant_structure_summary.csv)
- RTL validation:
  - [`outputs/rtl_validation/reports/functional_validation.md`](outputs/rtl_validation/reports/functional_validation.md)
  - [`outputs/rtl_validation/reports/functional_summary.csv`](outputs/rtl_validation/reports/functional_summary.csv)
  - [`outputs/rtl_validation/reports/rtl_quartus_summary.csv`](outputs/rtl_validation/reports/rtl_quartus_summary.csv)
  - [`outputs/rtl_validation/analysis/real_fpga_evidence_table.md`](outputs/rtl_validation/analysis/real_fpga_evidence_table.md)
- HLS exploration:
  - [`outputs/hls_validation/analysis/hls_validation_table.md`](outputs/hls_validation/analysis/hls_validation_table.md)

## What You Need Installed

The analytical optimizer and benchmark harness require:

- Rust toolchain with `cargo` and `rustc`
- Python 3.10 or newer

The Python harness uses only the Python standard library. There is no `requirements.txt` and no third-party Python package install step.

Optional tools for validation/report work:

- ModelSim/Questa or Icarus Verilog for generated RTL functional simulation.
- Intel Quartus Prime Pro for fit/STA validation.
- Tectonic or a standard LaTeX toolchain for compiling `report/main.tex`.

### Verify Your Tooling

Run these first:

```bash
python3 --version
rustc --version
cargo --version
git --version
```

Expected:

- `python3` should be `3.10+`
- `rustc` and `cargo` should both be available on `PATH`

### If Rust Is Missing

Install Rust with `rustup`:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
```

Then verify again:

```bash
rustc --version
cargo --version
```

### If Python venv Support Is Missing

On macOS and most Linux systems, `python3 -m venv` is already available. Verify it:

```bash
python3 -m venv --help
```

If that command fails, install the Python venv package for your platform before continuing.

## Fresh Setup From Scratch

From the repository root:

```bash
git clone git@github.com:Bakalala/seer_optimizer.git seer_optimizer
cd seer_optimizer
python3 -m venv venv
./venv/bin/python -m pip install --upgrade pip
```

There are no Python dependencies to install after that. The `venv` is used so the documented commands are stable and explicit.

## Repository Layout

- [`rust_core/Cargo.toml`](rust_core/Cargo.toml): Rust package manifest and Rust dependencies
- [`rust_core/src/ir.rs`](rust_core/src/ir.rs): request/response schema, IR, metrics, and Rust-side datapath metric evaluation
- [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs): equality saturation, extraction, Pareto logic, and Rust tests
- [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs): datapath rewrite set
- [`rust_core/src/main.rs`](rust_core/src/main.rs): stdin/stdout JSON CLI entrypoint for the Rust optimizer
- [`run_benchmarks.py`](run_benchmarks.py): benchmark construction, optimizer invocation, report generation, CSV/Markdown output
- [`tests/test_benchmarks.py`](tests/test_benchmarks.py): Python integration and reporting tests
- [`benchmark_config.json`](benchmark_config.json): saturation limits, weight sweep, fixed constraint profiles, DSP sweep settings
- [`cost_model.json`](cost_model.json): single source of truth for datapath operation costs shared by Python and Rust
- [`scripts/reproduce.sh`](scripts/reproduce.sh): one-command end-to-end reproduction
- [`scripts/export_rtl_validation.py`](scripts/export_rtl_validation.py): generated Verilog RTL and Quartus validation package exporter
- [`scripts/run_rtl_validation_server.sh`](scripts/run_rtl_validation_server.sh): server-side ModelSim/Quartus validation driver
- [`outputs/rtl_validation/`](outputs/rtl_validation): generated RTL, functional summaries, Quartus summaries, and validation tables
- [`outputs/hls_validation/`](outputs/hls_validation): generated C++/Intel HLS exploration artifacts
- [`report/`](report): SIGPLAN-style report source, figures, bibliography, and compiled PDF
- [`PROPOSAL_COVERAGE.md`](PROPOSAL_COVERAGE.md): section-by-section mapping from the original proposal to the implemented system
- [`HLS_project_proposal.pdf`](HLS_project_proposal.pdf): original proposal document

## Benchmarks

The acceptance suite models one combinational datapath per benchmark:

- `fir8`
- `dot16`
- `gemm_k8`
- `gemm_blocked_k8`
- `conv3x3`
- `stencil5`

Smoke-only toy graphs are also available for quick debugging:

- `identity_mul_add`
- `mul_two`
- `sub_self`

## Cost Model

The datapath cost model is defined in one shared file:

- [`cost_model.json`](cost_model.json)

Both the Rust optimizer and the Python harness read from that file:

- Rust loads the shared file from [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- Python loads the shared file from [`run_benchmarks.py`](run_benchmarks.py)

Default datapath metrics in [`cost_model.json`](cost_model.json):

- `input`, `const`: area `0`, latency `0`, DSP `0`, LUT `0`
- abstract `add`, `sub`: baseline LUT-style costs, area `1`, latency `2`, DSP `0`, LUT `1`
- `add_dsp`, `sub_dsp`: area `2`, latency `1`, DSP `1`, LUT `0`
- `add_lut`, `sub_lut`: area `1`, latency `2`, DSP `0`, LUT `1`
- generic `mul`: area `6`, latency `3`, DSP `1`, LUT `0`
- DSP-backed multiply: area `6`, latency `3`, DSP `1`, LUT `0`
- LUT-backed multiply: area `4`, latency `6`, DSP `0`, LUT `8`
- DSP-backed fused multiply-accumulate: area `7`, latency `3`, DSP `1`, LUT `0`

The extractor keeps the input IR abstract, then chooses concrete implementations during extraction. In practice this means the shared `dsp_max` budget can now be spent on:

- add/sub implementations
- multiply implementations
- fused DSP MAC implementations

This is intentionally a simple proxy model for controlled experiments rather than a synthesis-calibrated hardware estimator.

Important:

- `benchmark_config.json` no longer owns the cost model
- if you change only operation costs, change only [`cost_model.json`](cost_model.json)
- if you introduce brand new operation kinds, you must also add parsing/serialization support in Rust and Python
- after changing [`cost_model.json`](cost_model.json), rerun:

```bash
cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

## Constraint Modes Evaluated By The Harness

The harness runs all of the following:

- weighted extraction
- latency-optimal extraction with no budgets
- power-proxy extraction with no budgets
- minimize latency with `area_max = original_area`
- minimize area with `latency_max = original_latency`
- minimize power proxy with `latency_max = original_latency`
- minimize latency with `power_max = original_power_proxy`
- minimize latency with `dsp_max = 0`
- minimize latency with a configured per-benchmark LUT cap
- exact Pareto extraction
- sampled weight sweep from [`benchmark_config.json`](benchmark_config.json)
- DSP-budget sweep from `dsp_max = 0` up to the number of DSP-eligible arithmetic ops in the original graph

## Exact Commands To Run Everything

All commands below assume you are in the repository root.

### 1. Build The Rust Core

```bash
cargo build --manifest-path rust_core/Cargo.toml
```

This compiles the optimizer binary used by the Python harness.

### 2. Run Rust Tests

```bash
cargo test --manifest-path rust_core/Cargo.toml
```

This validates:

- rewrite behavior
- constraint handling
- Pareto extraction
- infeasible-budget reporting
- latency-unconstrained vs DSP-capped behavior

### 3. Run Python Integration And Report Tests

```bash
./venv/bin/python -m unittest tests/test_benchmarks.py
```

This validates:

- benchmark graph construction
- end-to-end Rust invocation from Python
- report generation
- DSP sweep behavior
- infeasible budget rendering
- summary wording logic

### 4. Run The Full Benchmark Suite

```bash
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

This does all of the following:

- builds the 6 acceptance benchmarks in Python
- invokes the Rust optimizer once per benchmark with a batch of weighted, constrained, Pareto, weight-sweep, and DSP-sweep queries
- writes machine-readable JSON results
- writes the HTML report
- writes the Markdown analysis
- writes the flattened CSV summary

### 5. Run Only Smoke Cases

```bash
./venv/bin/python run_benchmarks.py --smoke --config benchmark_config.json
```

Use this when debugging the harness quickly without running the full benchmark suite.

### 6. Rebuild Only The Report From Existing JSON

If you already have results and just want to regenerate the HTML/Markdown/CSV views:

```bash
./venv/bin/python run_benchmarks.py \
  --config benchmark_config.json \
  --results-input outputs/benchmark_results.json
```

This does not rerun the optimizer. It only reads the existing results JSON and rewrites the report artifacts.

### 7. One-Command Reproduction

```bash
./scripts/reproduce.sh
```

This runs:

```bash
cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

If this script passes, the project is in the expected reproducible state.

## RTL / Quartus Validation

The generated RTL validation package is under [`outputs/rtl_validation/`](outputs/rtl_validation).

Functional simulation only:

```bash
SKIP_RTL_QUARTUS=1 ./scripts/run_rtl_validation_server.sh
```

Full server validation, when Quartus is available and configured:

```bash
SKIP_RTL_SIM=1 JOBS=4 ./scripts/run_rtl_validation_server.sh
```

The final committed run contains:

- 6/6 ModelSim benchmark testbenches passing.
- 35/35 generated RTL variants compiled by Quartus.
- Compact fitted-resource summaries in [`outputs/rtl_validation/reports/rtl_quartus_summary.csv`](outputs/rtl_validation/reports/rtl_quartus_summary.csv).

Do not use the Quartus data as a universal “optimized RTL is faster” claim. The useful FPGA result is narrower: on multiplier-heavy kernels, generated soft/LUT-multiplier variants reduce fitted DSP usage to zero and increase ALM usage, showing real resource steering.

## Report Build

Compile the final report with:

```bash
tectonic -X compile report/main.tex
cp report/main.pdf outputs/project_report.pdf
```

The final PDF is expected to be 7 pages total: six body pages plus references on page 7.

## Where The Outputs Go

The benchmark/report pipeline writes these files under `outputs/`:

- `outputs/benchmark_results.json`: full machine-readable benchmark results
- `outputs/report.html`: main visual report
- `outputs/analysis.md`: markdown analysis summary
- `outputs/benchmark_summary.csv`: flattened CSV for tables/spreadsheets

These files are gitignored.

## How To Open The HTML Report

After running the benchmark suite:

```bash
open outputs/report.html
```

On Linux:

```bash
xdg-open outputs/report.html
```

In VS Code, you can also open `outputs/report.html` and use an HTML preview extension such as Live Preview.

## Command-Line Options For `run_benchmarks.py`

Useful variants:

```bash
./venv/bin/python run_benchmarks.py --config benchmark_config.json
./venv/bin/python run_benchmarks.py --smoke --config benchmark_config.json
./venv/bin/python run_benchmarks.py --output outputs/custom_results.json
./venv/bin/python run_benchmarks.py --report outputs/custom_report.html
./venv/bin/python run_benchmarks.py --analysis outputs/custom_analysis.md
./venv/bin/python run_benchmarks.py --summary-csv outputs/custom_summary.csv
./venv/bin/python run_benchmarks.py --results-input outputs/benchmark_results.json
```

## Running The Rust Optimizer Directly

The Rust binary reads a JSON request on stdin and prints a JSON response on stdout. It supports both:

- single-request mode for direct debugging of one optimization query
- batch mode for one-saturation-per-benchmark execution from the Python harness

Build it:

```bash
cargo build --manifest-path rust_core/Cargo.toml
```

Run it directly:

```bash
cargo run --manifest-path rust_core/Cargo.toml < request.json
```

Or, if already built:

```bash
./rust_core/target/debug/rust_core < request.json
```

The request/response schema is defined in [`rust_core/src/ir.rs`](rust_core/src/ir.rs).

## What To Edit When You Change The Project

### If You Change Saturation Limits, Weight Sweeps, Or Budget Profiles

Edit:

- [`benchmark_config.json`](benchmark_config.json)

Then rerun:

```bash
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

### If You Add Or Change Benchmarks

Edit:

- [`run_benchmarks.py`](run_benchmarks.py)
  - benchmark builder functions
  - `build_acceptance_benchmarks()`

Usually also update:

- [`benchmark_config.json`](benchmark_config.json) if the new benchmark needs explicit LUT caps or budget tuning
- [`tests/test_benchmarks.py`](tests/test_benchmarks.py) to cover the new benchmark

Then rerun:

```bash
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

### If You Change Rewrites Or Extraction Behavior

Edit:

- [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs)
- [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)

Then rerun:

```bash
cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

### If You Change The Cost Model

Edit:

- [`cost_model.json`](cost_model.json)

Then rerun:

```bash
cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

### If You Change Report Semantics Or Visualizations

Edit:

- [`run_benchmarks.py`](run_benchmarks.py)
- [`tests/test_benchmarks.py`](tests/test_benchmarks.py)

Then rerun:

```bash
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

## Recommended Order For A Clean End-To-End Run

Use this exact sequence after pulling changes or switching branches:

```bash
python3 -m venv venv
./venv/bin/python -m pip install --upgrade pip
cargo build --manifest-path rust_core/Cargo.toml
cargo test --manifest-path rust_core/Cargo.toml
./venv/bin/python -m unittest tests/test_benchmarks.py
./venv/bin/python run_benchmarks.py --config benchmark_config.json
open outputs/report.html
```

If `venv` already exists, you can skip the first two commands.

## Limitations

- Custom internal IR only; this project does not parse C/C++/MLIR
- No control-path optimization
- The rewrite set is intentionally bounded to keep extraction tractable
- Some strict constraints can be infeasible within the bounded frontier
- The cost model is a proxy model and should not be interpreted as synthesis-accurate absolute hardware cost
- No CIRCT integration is required for this project
