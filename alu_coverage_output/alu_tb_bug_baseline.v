`timescale 1ns/1ps

module alu_tb_bug_baseline;

    reg  [7:0] a;
    reg  [7:0] b;
    reg  [3:0] op;

    wire [7:0] y;
    wire zero;
    wire negative;
    wire carry;
    wire overflow;

    integer failures = 0;

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
        // Test 1
        a  = 8'd0;
        b  = 8'd0;
        op = 4'd0;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 1: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 2
        a  = 8'd255;
        b  = 8'd1;
        op = 4'd0;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b1 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 2: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=1 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 3
        a  = 8'd127;
        b  = 8'd1;
        op = 4'd0;
        #10;

        if (
            y !== 8'd128 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b1
        ) begin
            $display("FAIL test 3: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=128 z=0 n=1 c=0 v=1",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 4
        a  = 8'd128;
        b  = 8'd1;
        op = 4'd1;
        #10;

        if (
            y !== 8'd127 ||
            zero !== 1'b0 ||
            negative !== 1'b0 ||
            carry !== 1'b1 ||
            overflow !== 1'b1
        ) begin
            $display("FAIL test 4: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=127 z=0 n=0 c=1 v=1",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 5
        a  = 8'd5;
        b  = 8'd10;
        op = 4'd1;
        #10;

        if (
            y !== 8'd251 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 5: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=251 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 6
        a  = 8'd170;
        b  = 8'd85;
        op = 4'd2;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 6: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 7
        a  = 8'd170;
        b  = 8'd85;
        op = 4'd3;
        #10;

        if (
            y !== 8'd255 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 7: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=255 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 8
        a  = 8'd255;
        b  = 8'd15;
        op = 4'd4;
        #10;

        if (
            y !== 8'd240 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 8: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=240 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 9
        a  = 8'd0;
        b  = 8'd77;
        op = 4'd5;
        #10;

        if (
            y !== 8'd255 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 9: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=255 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 10
        a  = 8'd129;
        b  = 8'd7;
        op = 4'd6;
        #10;

        if (
            y !== 8'd128 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 10: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=128 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 11
        a  = 8'd129;
        b  = 8'd1;
        op = 4'd7;
        #10;

        if (
            y !== 8'd64 ||
            zero !== 1'b0 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 11: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=64 z=0 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 12
        a  = 8'd128;
        b  = 8'd7;
        op = 4'd8;
        #10;

        if (
            y !== 8'd255 ||
            zero !== 1'b0 ||
            negative !== 1'b1 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 12: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=255 z=0 n=1 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 13
        a  = 8'd128;
        b  = 8'd127;
        op = 4'd9;
        #10;

        if (
            y !== 8'd1 ||
            zero !== 1'b0 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 13: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=1 z=0 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 14
        a  = 8'd127;
        b  = 8'd128;
        op = 4'd9;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 14: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 15
        a  = 8'd200;
        b  = 8'd100;
        op = 4'd10;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 15: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        // Test 16
        a  = 8'd85;
        b  = 8'd0;
        op = 4'd15;
        #10;

        if (
            y !== 8'd0 ||
            zero !== 1'b1 ||
            negative !== 1'b0 ||
            carry !== 1'b0 ||
            overflow !== 1'b0
        ) begin
            $display("FAIL test 16: a=%0d b=%0d op=%0d | got y=%0d z=%0d n=%0d c=%0d v=%0d | expected y=0 z=1 n=0 c=0 v=0",
                     a, b, op, y, zero, negative, carry, overflow);
            failures = failures + 1;
        end

        $display("TOTAL FAILURES: %0d", failures);
        $finish;
    end

endmodule