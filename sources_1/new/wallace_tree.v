`timescale 1ns / 1ps
module wallace_tree(
    input [29:0] PP,
    output [15:0] product
);
    
    wire s1_1, s1_2, s1_3;
    wire s2_4, s2_5, s2_6, s2_7, s2_8, s2_9, s2_10, s2_11, s2_12;
    
    wire c1_1, c1_2, c1_3;
    wire c2_4, c2_5, c2_6, c2_7, c2_8, c2_9, c2_10, c2_11, c2_12;
    
    wire cout;
    
    wire [12:0] rca_out;
    
    // STAGE 1
    half_adder h1(.x(PP[23]),.y(1'b1),.s(s1_1),.c(c1_1));
    half_adder h2(.x(PP[24]),.y(1'b1),.s(s1_2),.c(c1_2));
    half_adder h3(.x(PP[25]),.y(1'b1),.s(s1_3),.c(c1_3));
    
    // STAGE 2
    half_adder h4(.x(PP[28]),.y(1'b1),.s(s2_4),.c(c2_4));
    half_adder h5(.x(PP[27]),.y(1'b1),.s(s2_5),.c(c2_5));
    half_adder h6(.x(PP[6]),.y(PP[13]),.s(s2_6),.c(c2_6));
    
    full_adder f7(.x(PP[19]),.y(PP[26]),.z(c1_3),.s(s2_7),.c(c2_7));
    full_adder f8(.x(PP[18]),.y(s1_3),.z(c1_2),.s(s2_8),.c(c2_8));
    full_adder f9(.x(PP[17]),.y(s1_2),.z(c1_1),.s(s2_9),.c(c2_9));
    full_adder f10(.x(PP[9]),.y(PP[16]),.z(s1_1),.s(s2_10),.c(c2_10));
    full_adder f11(.x(PP[8]),.y(PP[15]),.z(PP[22]),.s(s2_11),.c(c2_11));
    full_adder f12(.x(PP[7]),.y(PP[14]),.z(PP[21]),.s(s2_12),.c(c2_12));
    
    // STAGE 3
    ripple_carry_adder rca(
        .A({c2_4,c2_5,c2_7,c2_8,c2_9,c2_10,c2_11,c2_12,c2_6,PP[20],PP[5],PP[11],PP[3]}),
        .B({PP[29],s2_4,s2_5,s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_6,PP[12],PP[4],PP[10]}),
        .C(rca_out),
        .cout(cout)
    );
    
    assign product = {rca_out,PP[2],PP[1],PP[0]};
    
endmodule