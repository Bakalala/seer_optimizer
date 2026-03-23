# Seer Optimizer

Datapath-only constraint-aware HLS optimizer built around a Rust `egg` core and a thin Python benchmark/report harness.

## Scope

- Datapath only: arithmetic/dataflow graphs with `input`, `const`, `add`, `sub`, and `mul`.
- No control flow, no memory modeling, no loop scheduling, and no frontend/parser work.
- Equality saturation is used to explore algebraically equivalent datapaths.
- Extraction supports:
  - weighted optimization
  - constrained optimization under explicit budgets
  - exact 2D area/latency Pareto extraction

## Repository Layout

- [`rust_core/src/ir.rs`](rust_core/src/ir.rs): request/response schema, IR, metrics
- [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs): saturation/extraction engine
- [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs): datapath rewrite set
- [`run_benchmarks.py`](run_benchmarks.py): benchmark harness, report generation, CSV/Markdown output
- [`tests/test_benchmarks.py`](tests/test_benchmarks.py): Python integration/report tests
- [`benchmark_config.json`](benchmark_config.json): checked-in sweep and saturation settings
- [`scripts/reproduce.sh`](scripts/reproduce.sh): one-command reproduction path

## Benchmarks

The acceptance suite models one combinational datapath per benchmark:

- `fir8`
- `dot16`
- `gemm_k8`
- `conv3x3`
- `stencil5`

## Cost Model

Default datapath metrics:

- `input`, `const`: area `0`, latency `0`, DSP `0`, LUT `0`
- `add`, `sub`: area `1`, latency `1`, DSP `0`, LUT `1`
- DSP-backed multiply: area `6`, latency `3`, DSP `1`, LUT `0`
- LUT-backed multiply: area `4`, latency `6`, DSP `0`, LUT `8`

This is intentionally a simple proxy model for controlled experiments rather than a foundry-accurate hardware estimator.

## Constraint Modes

The harness evaluates:

- weighted extraction
- minimize latency with `area_max = original_area`
- minimize area with `latency_max = original_latency`
- minimize latency with `dsp_max = 0`
- minimize latency with `lut_max = original_lut_count`
- exact Pareto extraction
- sampled weight sweep from [`benchmark_config.json`](benchmark_config.json)

## Running

Rust tests:

```bash
cargo test --manifest-path rust_core/Cargo.toml
```

Python tests:

```bash
./venv/bin/python -m unittest tests/test_benchmarks.py
```

Generate benchmark outputs and report:

```bash
./venv/bin/python run_benchmarks.py --config benchmark_config.json
```

One-command reproduction:

```bash
./scripts/reproduce.sh
```

Generated artifacts are written under `outputs/` and ignored by git.

## Result Artifacts

Main outputs:

- `outputs/benchmark_results.json`
- `outputs/report.html`
- `outputs/analysis.md`
- `outputs/benchmark_summary.csv`

## Limitations

- Custom internal IR only; this project does not parse C/C++/MLIR.
- No control-path optimization.
- The rewrite set is intentionally bounded to keep extraction tractable.
- Some strict constraints can be infeasible within the bounded frontier.
- The cost model is a proxy model; it should be calibrated further before claiming synthesis-accurate absolute numbers.

## CIRCT

For this project, CIRCT is best treated as a future backend/export target rather than the main optimization engine.

- Keep `egg` as the search/extraction engine.
- Keep the current custom IR as the optimization IR.
- If needed later, lower optimized datapaths into CIRCT `comb`/`hw` as a backend step.

That keeps the paper aligned with its actual contribution: constraint-aware equality saturation for datapaths.
