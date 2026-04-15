# Analytical Cost Model

Source: `/Users/aliseifeldin/Desktop/McGill_Masters/HLS/Project/seer_optimizer/cost_model.json`

Metric accumulation functions:

- `area = sum(child.area) + op.area`
- `latency = max(child.latency) + op.latency`
- `power = sum(child.power) + op.power`
- `dsp_count = sum(child.dsp_count) + op.dsp_count`
- `lut_count = sum(child.lut_count) + op.lut_count`

| Operation | Area | Latency | Power | DSP | LUT | Role |
|---|---:|---:|---:|---:|---:|---|
| `input` | 0 | 0 | 0 | 0 | 0 | leaf value |
| `const` | 0 | 0 | 0 | 0 | 0 | leaf constant |
| `add` | 1 | 2 | 1 | 0 | 1 | generic add baseline |
| `add_lut` | 1 | 2 | 1 | 0 | 1 | LUT-bound add candidate |
| `add_dsp` | 2 | 1 | 2 | 1 | 0 | DSP-bound add candidate |
| `sub` | 1 | 2 | 1 | 0 | 1 | generic subtract baseline |
| `sub_lut` | 1 | 2 | 1 | 0 | 1 | LUT-bound subtract candidate |
| `sub_dsp` | 2 | 1 | 2 | 1 | 0 | DSP-bound subtract candidate |
| `mul` | 6 | 3 | 3 | 1 | 0 | generic multiply baseline |
| `mul_lut` | 4 | 6 | 6 | 0 | 8 | LUT-bound multiply candidate |
| `mul_dsp` | 6 | 3 | 3 | 1 | 0 | DSP-bound multiply candidate |
| `mac_dsp` | 7 | 3 | 4 | 1 | 0 | fused DSP multiply-accumulate candidate |
