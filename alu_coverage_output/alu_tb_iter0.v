`timescale 1ns/1ps

module alu_tb_iter0;

    reg  [7:0] a;
    reg  [7:0] b;
    reg  [3:0] op;

    wire [7:0] y;
    wire zero;
    wire negative;
    wire carry;
    wire overflow;

    coverage_guided_alu dut (
        .a(a),
        .b(b),
        .op(op),
        .y(y),
        .zero(zero),
        .negative(negative),
        .carry(carry),
        .overflow(overflow)
    );

    initial begin
        $dumpfile("alu_coverage_output/alu_iter0.vcd");
        $dumpvars(0, alu_tb_iter0);

        // Test 1
        a  = 8'd0;
        b  = 8'd0;
        op = 4'd0;
        #10;

        // Test 2
        a  = 8'd255;
        b  = 8'd1;
        op = 4'd0;
        #10;

        // Test 3
        a  = 8'd127;
        b  = 8'd1;
        op = 4'd0;
        #10;

        // Test 4
        a  = 8'd128;
        b  = 8'd1;
        op = 4'd1;
        #10;

        // Test 5
        a  = 8'd5;
        b  = 8'd10;
        op = 4'd1;
        #10;

        // Test 6
        a  = 8'd170;
        b  = 8'd85;
        op = 4'd2;
        #10;

        // Test 7
        a  = 8'd170;
        b  = 8'd85;
        op = 4'd3;
        #10;

        // Test 8
        a  = 8'd255;
        b  = 8'd15;
        op = 4'd4;
        #10;

        // Test 9
        a  = 8'd0;
        b  = 8'd77;
        op = 4'd5;
        #10;

        // Test 10
        a  = 8'd129;
        b  = 8'd7;
        op = 4'd6;
        #10;

        // Test 11
        a  = 8'd129;
        b  = 8'd1;
        op = 4'd7;
        #10;

        // Test 12
        a  = 8'd128;
        b  = 8'd7;
        op = 4'd8;
        #10;

        // Test 13
        a  = 8'd128;
        b  = 8'd127;
        op = 4'd9;
        #10;

        // Test 14
        a  = 8'd127;
        b  = 8'd128;
        op = 4'd9;
        #10;

        // Test 15
        a  = 8'd200;
        b  = 8'd100;
        op = 4'd10;
        #10;

        // Test 16
        a  = 8'd85;
        b  = 8'd0;
        op = 4'd15;
        #10;

        $display("Baseline stimulus complete.");
        $finish;
    end

endmodule