`include "header.v"

module seq_det(
    input clk, rst_n, x,
    output reg out
);

    wire z;

    `ifdef MOORE_DET_NONOV
        moore_det_nonov SD(clk, rst_n, x, z);

    `elsif MOORE_DET_OV
        moore_det_ov SD(clk, rst_n, x, z);

    `elsif MEALY_DET_NONOV
        mealy_det_nonov SD(clk, rst_n, x, z);

    `elsif MEALY_DET_OV
        mealy_det_ov SD(clk, rst_n, x, z);
    `endif

    always @(*) begin
        out = z;
    end

endmodule