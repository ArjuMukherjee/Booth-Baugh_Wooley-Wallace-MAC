`timescale 1ns / 1ps
module ripple_carry_adder(
    input [12:0] A,
    input [12:0] B,
    output [12:0] C,
    output cout
);
    wire [12:0] carry;
    
    half_adder h1(.x(A[0]),.y(B[0]),.s(C[0]),.c(carry[0]));
    genvar i;
    generate
        for(i=0;i<12;i=i+1) begin : fa_inst
            full_adder f(.x(A[i+1]),.y(B[i+1]),.z(carry[i]),.s(C[i+1]),.c(carry[i+1]));
        end
    endgenerate
    
    assign cout = carry[12];
    
endmodule