# Quartus Fit/STA Failure Summary

Quartus fit/STA was unavailable in this environment; therefore hardware timing/power validation is left as future work. The generated RTL and functional simulation still validate equivalence and resource intent.

The failure is environmental rather than specific to the generated RTL. Independent sanity projects using a trivial Verilog adder were attempted before this structural-validation run:

| Tool | Family | Device | Result |
| --- | --- | --- | --- |
| `/opt/intelFPGA_pro/quartus_19.2.0b57/quartus/bin/quartus_sh` | Arria 10 | `10AX115H1F34E1SG` | Fails during synthesis with internal `is_legal_device()` in `sutil_device.cpp:1072`. |
| `/opt/intelFPGA_pro/quartus_19.2.0b57/quartus/linux64/quartus_sh` | Arria 10 | `10AX115H1F34E1SG` | Fails to launch directly: `libcomp_qcu.so` is not found. |
| `/opt/intelFPGA_pro/21.1/quartus/bin/quartus_sh` | Arria 10 | `10AS066H1F34E1HG` | Fails before synthesis with `Error (19286): No license for family Arria 10`. |
| `/opt/intelFPGA_pro/21.1/quartus/linux64/quartus_sh` | Arria 10 | `10AS066H1F34E1HG` | Fails to launch directly: `libcomp_qcu.so` is not found. |

Device discovery also found no usable non-Arria compile family in the installed tools:

- Quartus 19.2 `get_family_list` reported only `Arria 10`.
- Quartus 21.1 listed Arria 10 parts, but the available license rejected the family.
- Queried `Arria V`, `Cyclone V`, `Stratix V`, `Cyclone 10 GX`, and `MAX 10` returned no usable part list in these installations.

Consequently, no real Quartus-fitted ALM/DSP/Fmax/slack data is claimed from this server.
