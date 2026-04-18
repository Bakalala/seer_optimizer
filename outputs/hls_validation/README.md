# HLS Validation Export

This folder is generated from `outputs/benchmark_results.json`.

This path is exploratory in the final report. Intel HLS accepts the generated C++
components and produces useful frontend/report artifacts, but it often remaps distinct
source variants to similar estimated hardware. The final validation claim therefore
uses direct generated RTL plus ModelSim/Quartus summaries under `outputs/rtl_validation/`.

## Local correctness test

Run this on any machine with `g++` or `clang++`:

```bash
./scripts/run_cpp_tests.sh
```

This checks functional equivalence only. It does not measure area, latency, DSP,
LUT, or power.

## Intel HLS / Quartus run

Copy this folder to the Linux server with Intel HLS installed, then run:

```bash
HLS_TARGET=<your_fpga_target> ./scripts/run_intel_hls.sh
```

By default the script builds each variant in three modes:

```text
default
prefer-dsp
prefer-softlogic
```

You can override the mode list:

```bash
HLS_TARGET=<your_fpga_target> HLS_DSP_MODES="prefer-dsp prefer-softlogic" ./scripts/run_intel_hls.sh
```

## Report parsing

After Intel HLS runs:

```bash
python3 scripts/parse_hls_reports.py   --root reports/hls   --metadata metadata/generated_variants.json   --out reports/hls_summary.csv
```

Use `metadata/expected_resource_summary.csv` to compare analytical DSP/LUT
expectations with Quartus/HLS reports.

The raw `reports/hls/` project tree is intentionally not tracked in Git because it
contains large generated Intel HLS build directories. The committed artifacts are the
generated C++ sources, metadata, compact CSV/Markdown summaries, and figures needed
to reproduce the report discussion.
