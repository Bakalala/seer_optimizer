# RTL Validation

This directory contains direct Verilog/SystemVerilog-style RTL variants generated from the optimizer output.
It is intended to validate DSP-vs-logic multiplier mapping with Quartus fit/STA, not
through Intel HLS inference.

## Current validation status

The optimizer generates functionally equivalent RTL variants with different analytical
and structural DSP/LUT intent. The final committed run includes both functional simulation
and Quartus fitted-resource summaries.

Committed evidence:

- ModelSim functional simulation passes for all 6 benchmark testbenches.
- Quartus compiles all 35 generated RTL variants.
- `reports/rtl_quartus_summary.csv` contains fitted DSP, ALM/ALUT, register, Fmax, slack, and status fields.
- `analysis/real_fpga_evidence_table.md` summarizes original-vs-generated resource steering.

Scope of the evidence:

- Strongest claim: multiplier-heavy kernels can trade fitted DSP blocks for ALMs.
- Fmax is reported STA output, not a universal timing-signoff claim.
- Power is not measured by this RTL flow.
- Small kernels often map to identical fitted resources because Quartus optimizes equivalent arithmetic.

## Functional simulation

```bash
cd outputs/rtl_validation
./scripts/run_functional_sim.sh
```

The script prefers ModelSim/Questa when `vlog` and `vsim` are available, otherwise it
tries Icarus Verilog.

## Quartus fit and timing

First verify the selected Quartus install, license, family, and device with a trivial
registered adder:

```bash
cd ~/seer_optimizer
git pull --rebase origin main

QUARTUS_SH=/path/to/quartus_sh \
RTL_FAMILY='<installed licensed family>' \
RTL_DEVICE='<valid device>' \
outputs/rtl_validation/scripts/run_quartus_preflight.sh
```

Then compile a high-value subset first:

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

Useful FPGA evidence requires at least the original and one generated variant to compile
on the same family/device, with functional equivalence passing and at least one generated
variant changing a real fitted metric relative to `original`.

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
