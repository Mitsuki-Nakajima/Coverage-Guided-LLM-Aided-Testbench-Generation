`timescale 1ns/1ps

module alu_tb_iter3;

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
        $dumpfile("alu_coverage_output/alu_iter3.vcd");
        $dumpvars(0, alu_tb_iter3);

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

        // Test 17
        a  = 8'd127;
        b  = 8'd1;
        op = 4'd0;
        #10;

        // Test 18
        a  = 8'd128;
        b  = 8'd1;
        op = 4'd1;
        #10;

        // Test 19
        a  = 8'd127;
        b  = 8'd255;
        op = 4'd1;
        #10;

        // Test 20
        a  = 8'd0;
        b  = 8'd255;
        op = 4'd2;
        #10;

        // Test 21
        a  = 8'd0;
        b  = 8'd0;
        op = 4'd3;
        #10;

        // Test 22
        a  = 8'd170;
        b  = 8'd170;
        op = 4'd4;
        #10;

        // Test 23
        a  = 8'd85;
        b  = 8'd170;
        op = 4'd4;
        #10;

        // Test 24
        a  = 8'd255;
        b  = 8'd0;
        op = 4'd5;
        #10;

        // Test 25
        a  = 8'd1;
        b  = 8'd7;
        op = 4'd6;
        #10;

        // Test 26
        a  = 8'd128;
        b  = 8'd7;
        op = 4'd7;
        #10;

        // Test 27
        a  = 8'd128;
        b  = 8'd1;
        op = 4'd8;
        #10;

        // Test 28
        a  = 8'd128;
        b  = 8'd128;
        op = 4'd0;
        #10;

        // Test 29
        a  = 8'd144;
        b  = 8'd5;
        op = 4'd0;
        #10;

        // Test 30
        a  = 8'd5;
        b  = 8'd144;
        op = 4'd0;
        #10;

        // Test 31
        a  = 8'd0;
        b  = 8'd5;
        op = 4'd1;
        #10;

        // Test 32
        a  = 8'd5;
        b  = 8'd0;
        op = 4'd1;
        #10;

        // Test 33
        a  = 8'd144;
        b  = 8'd133;
        op = 4'd1;
        #10;

        // Test 34
        a  = 8'd16;
        b  = 8'd5;
        op = 4'd1;
        #10;

        // Test 35
        a  = 8'd255;
        b  = 8'd0;
        op = 4'd2;
        #10;

        // Test 36
        a  = 8'd0;
        b  = 8'd0;
        op = 4'd4;
        #10;

        // Test 37
        a  = 8'd255;
        b  = 8'd0;
        op = 4'd4;
        #10;

        // Test 38
        a  = 8'd0;
        b  = 8'd3;
        op = 4'd5;
        #10;

        // Test 39
        a  = 8'd0;
        b  = 8'd3;
        op = 4'd6;
        #10;

        // Test 40
        a  = 8'd0;
        b  = 8'd3;
        op = 4'd7;
        #10;

        // Test 41
        a  = 8'd1;
        b  = 8'd128;
        op = 4'd0;
        #10;

        // Test 42
        a  = 8'd100;
        b  = 8'd50;
        op = 4'd0;
        #10;

        // Test 43
        a  = 8'd200;
        b  = 8'd100;
        op = 4'd0;
        #10;

        // Test 44
        a  = 8'd100;
        b  = 8'd50;
        op = 4'd1;
        #10;

        // Test 45
        a  = 8'd77;
        b  = 8'd77;
        op = 4'd1;
        #10;

        // Test 46
        a  = 8'd200;
        b  = 8'd10;
        op = 4'd1;
        #10;

        // Test 47
        a  = 8'd0;
        b  = 8'd255;
        op = 4'd4;
        #10;

        // Test 48
        a  = 8'd127;
        b  = 8'd7;
        op = 4'd8;
        #10;

        // Test 49
        a  = 8'd0;
        b  = 8'd3;
        op = 4'd8;
        #10;

        $display("Iteration 3 stimulus complete.");
        $finish;
    end

endmodule