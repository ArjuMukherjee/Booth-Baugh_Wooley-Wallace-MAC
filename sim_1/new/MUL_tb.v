`timescale 1ns / 1ps

module MUL_tb;

    // Testbench signals
    reg  signed [7:0] A;
    reg  signed [7:0] B;
    wire signed [15:0] OUT;

    // Instantiate the DUT (Device Under Test)
    MUL uut (
        .A(A),
        .B(B),
        .OUT(OUT)
    );

    initial begin
        $display("Time\tA\tB\tOUT");

        // Test case 1
        A = -8'd128; B = 8'd127;
        #10;
        $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);

        // Test case 2
        A = 8'd10; B = 8'd4;
        #10;
        $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);

        // Test case 3
        A = 8'd15; B = 8'd2;
        #10;
        $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);

        // Test case 4
        A = -8'd6; B = 8'd7;
        #10;
        $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);

        // Test case 5
        A = -8'd8; B = -8'd3;
        #10;
        $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);

        // Random tests
        repeat(10) begin
            A = ($random % 256) - 128;
            B = ($random % 256) - 128;
            #10;
            $display("%0t\t%d\t%d\t%d",$time,A,B,OUT);
        end

        $finish;
    end

endmodule
