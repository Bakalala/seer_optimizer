# RTL Validation

This directory contains direct SystemVerilog variants generated from the optimizer output.
It is intended to validate DSP-vs-logic multiplier mapping with Quartus fit/STA, not
through Intel HLS inference.

## Current validation status

The optimizer generates functionally equivalent RTL variants with different analytical
and structural DSP/LUT intent. A real FPGA fitted-metric validation flow is implemented,
but the available Quartus installation cannot produce fit/STA reports on this server,
so no fitted FPGA improvement is claimed yet.

This server is valid for Rust optimizer tests, Python benchmark tests, RTL generation,
ModelSim functional equivalence, structural analytical validation, and Quartus preflight
failure diagnosis. It is not valid for fitted ALM/DSP claims, Fmax claims, Quartus power
claims, or any real-FPGA improvement statement.

## Functional simulation

```bash
cd outputs/rtl_validation
./scripts/run_functional_sim.sh
```

The script prefers ModelSim/Questa when `vlog` and `vsim` are available, otherwise it
tries Icarus Verilog.

## Quartus fit and timing

Run this package on a different Quartus machine. First verify the selected Quartus
install, license, family, and device with a trivial registered adder:

```bash
cd ~/seer_optimizer
git pull --rebase origin main

QUARTUS_SH=/path/to/quartus_sh \
RTL_FAMILY='<installed licensed family>' \
RTL_DEVICE='<valid device>' \
outputs/rtl_validation/scripts/run_quartus_preflight.sh
```

Then compile the high-value subset first:

```bash
SKIP_RTL_SIM=1 \
QUARTUS_SH=/path/to/quartus_sh \
RTL_FAMILY='<installed licensed family>' \
RTL_DEVICE='<valid device>' \
RTL_ONLY='(conv3x3_original|conv3x3_weighted|dot16_original|dot16_weighted|stencil5_original|stencil5_weighted|stencil5_latency_under_lut|fir8_original|fir8_power_unconstrained)' \
JOBS=1 \
./scripts/run_rtl_validation_server.sh
```

If `outputs/rtl_validation/reports/rtl_quartus_summary.csv` is produced with nonempty
fitted resource fields, run the full matrix:

```bash
SKIP_RTL_SIM=1 \
QUARTUS_SH=/path/to/quartus_sh \
RTL_FAMILY='<installed licensed family>' \
RTL_DEVICE='<valid device>' \
JOBS=1 \
./scripts/run_rtl_validation_server.sh
```

The easiest fitted metrics to use are:

- Primary: fitted DSP blocks.
- Secondary: fitted ALM/ALUT usage.
- Optional: Fmax if STA reports it.
- Excluded: power, unless Power Analyzer output is generated and parsed.

Successful real-FPGA evidence requires at least the original and one optimized variant
to compile on the same family/device, with functional equivalence passing and at least
one optimized variant improving a real fitted metric over `original`.

For direct script use from this directory:

```bash
cd outputs/rtl_validation
RTL_ONLY='(conv3x3_original|conv3x3_weighted|dot16_original|dot16_weighted|stencil5_original|stencil5_weighted|stencil5_latency_under_lut|fir8_original|fir8_power_unconstrained)' JOBS=1 ./scripts/run_quartus_compile.sh
```

Outputs:

- `reports/functional_summary.csv`
- `reports/rtl_quartus_summary.csv`
- `analysis/rtl_validation_table.md`
- `analysis/real_fpga_evidence_table.md`
- `analysis/rtl_expected_vs_actual_dsp.{svg,png}`
- `analysis/rtl_resource_tradeoff.{svg,png}`
- `analysis/rtl_fmax_by_variant.{svg,png}`

Important scope note: the RTL flow forces multiplier/MAC DSP intent. Standalone add/sub
operations are implemented as fabric arithmetic because exact DSP add/sub binding is
architecture- and tool-dependent.
