`timescale 1ns / 1ps
module MUL(
    input signed [7:0] A,
    input signed [7:0] B,
    output signed [15:0] OUT
);
    
    wire [29:0] PP;
    booth_encoder be(.A(A),.B(B),.PP(PP));
    wallace_tree wt(.PP(PP),.product(OUT));
    
endmodule
