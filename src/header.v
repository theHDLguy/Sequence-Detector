`include "defines.v"

`ifdef MOORE_DET_NONOV
`include "moore_det_nonov.v"

`elsif MOORE_DET_OV
`include "moore_det_ov.v"

`elsif MEALY_DET_NONOV
`include "mealy_det_nonov.v"

`elsif MEALY_DET_OV
`include "mealy_det_ov.v"
`endif