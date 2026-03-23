# Proposal Coverage Review

This document maps the current repository against the proposal in [`HLS_project_proposal.pdf`](HLS_project_proposal.pdf), titled *Constraint-Aware E-Graph Optimization for High-Level Synthesis*.

## Bottom Line

The core proposal is covered:

- Rust `egg`-based equality saturation optimizer: implemented
- Constraint-aware extraction: implemented
- Area/latency tradeoff exploration and Pareto extraction: implemented
- Datapath-oriented HLS benchmark suite: implemented
- Analytical hardware cost model and report generation: implemented

The remaining differences are intentional scope decisions that were made later in the project:

- No control-flow or loop transformations
- No MLIR/CIRCT frontend work
- No BRAM or memory-system modeling
- No explicit power-optimization objective, although the framework supports weighted multi-metric scoring and resource-aware constraints

## Proposal Section Mapping

### 1. Introduction

Proposal goal:

- build an e-graph optimizer for HLS
- extend it with constraint-aware extraction
- evaluate it on representative kernels

Repo coverage:

- Optimizer core: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)
- Equality-saturation rewrites: [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs)
- Benchmark harness and evaluation: [`run_benchmarks.py`](run_benchmarks.py)
- End-to-end reproduction path: [`scripts/reproduce.sh`](scripts/reproduce.sh)

Status: covered

### 2. Prior Work / Delta From SEER

Proposal delta from SEER:

- constraint-aware extraction
- multi-objective cost modeling
- tradeoff-curve exploration instead of one extracted point

Repo coverage:

- Constraint-aware extraction under `area_max`, `latency_max`, `dsp_max`, and `lut_max`: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs), [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- Weighted optimization with multiple hardware-related metrics collapsed into a scalar objective: [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- Exact Pareto extraction plus sampled weight sweeps: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs), [`run_benchmarks.py`](run_benchmarks.py)
- Resource-scaling DSP sweep for “bigger FPGA, faster datapath?” analysis: [`run_benchmarks.py`](run_benchmarks.py)

Status: covered

### 3.1 System Architecture

Proposal items:

1. Parse kernels into an intermediate representation
2. Construct an e-graph
3. Apply rewrite rules iteratively
4. Extract optimized implementations using constraint-aware cost models
5. Use Rust `egg`

Repo coverage:

- Custom JSON IR with explicit nodes and root: [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- Python benchmark builders emit the IR directly: [`run_benchmarks.py`](run_benchmarks.py)
- E-graph construction and `egg` runner: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)
- Iterative rewrite saturation: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs), [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs)
- Weighted, constrained, and Pareto extraction: [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)

Clarification:

- The project uses a custom internal IR generated directly by benchmark builders instead of a parser for C/C++ or MLIR. That was an explicit later scope decision and still satisfies the proposal’s “intermediate representation” requirement.

Status: covered

### 3.2 Rewrite Rules

Proposal items:

- strength reduction
- constant folding
- reassociation
- expression balancing
- SEER-inspired HLS-style rewrites where reasonable

Repo coverage:

- Strength reduction / multiply-by-two expansion: [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs)
- Constant folding and algebraic simplification through analysis/extraction: [`rust_core/src/language.rs`](rust_core/src/language.rs), [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)
- Reassociation and factoring/distribution rewrites: [`rust_core/src/rewrites.rs`](rust_core/src/rewrites.rs)
- Balanced datapath alternatives emerge through extraction over equivalent addition/multiplication structures

Clarification:

- The proposal text mentions simplified HLS-style loop optimizations. Those were intentionally dropped when the project scope was narrowed to datapath-only arithmetic graphs.

Status: covered for datapath rewrites; control/loop rewrites intentionally out of scope

### 3.3 Constraint-Aware Extraction

Proposal items:

- minimize latency subject to area constraints
- minimize area subject to latency constraints
- minimize latency subject to resource usage constraints
- multi-objective cost functions

Repo coverage:

- `latency_under_area`: implemented
- `area_under_latency`: implemented
- `latency_under_dsp`: implemented
- `latency_under_lut`: implemented
- weighted scalarized extraction: implemented
- exact Pareto frontier over area/latency: implemented

Files:

- [`rust_core/src/optimizer.rs`](rust_core/src/optimizer.rs)
- [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- [`benchmark_config.json`](benchmark_config.json)

Clarification:

- Resource constraints currently model DSPs and LUTs, and DSP usage can now be assigned across add/sub/mul/mac implementations during extraction.
- BRAM is not modeled because the final project scope excludes memory-system optimization.

Status: covered for datapath resources

### 3.4 Benchmarks

Proposal benchmark families:

- GEMM
- 2D convolution
- FIR filter
- vector dot product
- stencil computations

Repo coverage:

- `fir8`
- `dot16`
- `gemm_k8`
- `gemm_blocked_k8`
- `conv3x3`
- `stencil5`

Files:

- Benchmark builders: [`run_benchmarks.py`](run_benchmarks.py)
- Benchmark tests: [`tests/test_benchmarks.py`](tests/test_benchmarks.py)

Clarification:

- The current GEMM coverage now includes both a naive-style inner-product datapath (`gemm_k8`) and a blocked-style accumulation datapath (`gemm_blocked_k8`).
- These are direct arithmetic IR benchmarks, not imported full PolyBench programs. That is consistent with the later decision to stay datapath-only and avoid parser/frontend work.

Status: covered

### 3.5 Evaluation Metrics

Proposal metrics:

- latency
- critical-path depth
- hardware area
- resource utilization
- comparison against baseline, unconstrained equality saturation, and constrained extraction

Repo coverage:

- Latency: implemented
- Area: implemented
- DSP/LUT resource utilization: implemented
- Baseline vs weighted vs constrained vs Pareto comparisons: implemented
- HTML, Markdown, CSV, and JSON reporting: implemented

Files:

- Shared cost model definition: [`cost_model.json`](cost_model.json)
- Rust metrics/extraction consumption: [`rust_core/src/ir.rs`](rust_core/src/ir.rs)
- Python-side baseline metric and reporting consumption: [`run_benchmarks.py`](run_benchmarks.py)

Clarification:

- In this datapath-only model, latency is computed from the longest dependency chain, so it already serves as the critical-path-depth proxy.

Status: covered

### 4. Timeline Deliverables

Proposal deliverables implied by the timeline:

- working Rust/`egg` optimizer
- hardware-aware cost model
- benchmark evaluation
- result analysis/report

Repo coverage:

- Rust optimizer core: implemented
- Hardware-aware analytical cost model: implemented
- Benchmark suite and automated evaluation: implemented
- Report artifacts and reproduction script: implemented

Status: covered

## Remaining Scope Differences

These are the only material items from the proposal text that are not implemented literally, and they were deliberately removed from scope during the project:

- Loop/control-path transformations
- MLIR/CIRCT integration
- BRAM-aware or memory-aware optimization
- Explicit power objective as a first-class optimization target

Those do not block the current paper implementation because the final agreed scope is strictly datapath-only.
