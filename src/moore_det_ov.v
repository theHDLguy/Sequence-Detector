module moore_det_ov(input clk, rst_n, x, output reg z);
    parameter A = 3'd1;
    parameter B = 3'd2;
    parameter C = 3'd3;
    parameter D = 3'd4;
    parameter E = 3'd5; // extra state when compared with Mealy Machine
    
    reg [3:0] curr_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            curr_state <= A;
        end 

        else begin
            curr_state <= next_state;
        end
    end
    
    always @(curr_state or x) begin
        case(curr_state)
            A: next_state = x ? B : A;         
            B: next_state = x ? B : C;
            C: next_state = x ? D : A;
            D: next_state = x ? B : E;
            E: next_state = x ? D : A;
            default: next_state = A;
        endcase
    end

    // assign z = (curr_state == D)? 1:0;  // if output z is not reg

    always @(curr_state) begin
        z = (curr_state == D) ? 1:0;
    end

endmodule