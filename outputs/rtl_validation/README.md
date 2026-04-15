# RTL Validation

This directory contains direct SystemVerilog variants generated from the optimizer output.
It is intended to validate DSP-vs-logic multiplier mapping with Quartus fit/STA, not
through Intel HLS inference.

## Functional simulation

```bash
cd outputs/rtl_validation
./scripts/run_functional_sim.sh
```

The script prefers ModelSim/Questa when `vlog` and `vsim` are available, otherwise it
tries Icarus Verilog.

## Quartus fit and timing

```bash
cd outputs/rtl_validation
JOBS=1 ./scripts/run_quartus_compile.sh
```

To run a subset first:

```bash
RTL_ONLY='(dot16|fir8|stencil5)' JOBS=1 ./scripts/run_quartus_compile.sh
```

Outputs:

- `reports/functional_summary.csv`
- `reports/rtl_quartus_summary.csv`
- `analysis/rtl_validation_table.md`
- `analysis/rtl_expected_vs_actual_dsp.{svg,png}`
- `analysis/rtl_resource_tradeoff.{svg,png}`
- `analysis/rtl_fmax_by_variant.{svg,png}`

Important scope note: the RTL flow forces multiplier/MAC DSP intent. Standalone add/sub
operations are implemented as fabric arithmetic because exact DSP add/sub binding is
architecture- and tool-dependent.
