`timescale 1ps/1ps
`include "seq_det.v"

module seq_det_tb;
    reg clk, rst_n, x;
    wire z;
    
    seq_det sd(clk, rst_n, x, z);
    
    always #2 clk = ~clk;

    initial begin
        {clk, x} = 0;
        
        $display("%m");
        $monitor("%0t: x = %0b, z = %0b", $time, x, z);
        
        // Dump waves
        $dumpfile("seq_det.vcd");
        $dumpvars(0);
        
        #1 rst_n = 0;
        #2 rst_n = 1;
        
        // INPUT:   1 1 0 1 0 1 0 1 0 1 0
        // NON-OV:  0 0 0 0 1 0 0 0 1 0 0
        // OV:      0 0 0 0 1 0 1 0 1 0 1
        
        #3 x = 1;
        #4 x = 1;
        #4 x = 0;
        #4 x = 1;
        #4 x = 0;
        #4 x = 1;
        #4 x = 0;
        #4 x = 1;
        #4 x = 0;
        #4 x = 1;
        #4 x = 0;
        
        #10 $finish;
    end
endmodule