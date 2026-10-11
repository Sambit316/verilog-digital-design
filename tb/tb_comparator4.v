`timescale 1ns/1ps
module tb_comparator4;
    reg [3:0] a, b;
    wire a_gt_b, a_eq_b, a_lt_b;
    integer i, j;

    comparator4 dut(.a(a), .b(b), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b));

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i; b = j; #1;
                if (a_gt_b !== (i > j) || a_eq_b !== (i == j) || a_lt_b !== (i < j)) begin
                    $display("FAIL: a=%0d b=%0d", i, j);
                    $finish;
                end
            end
        end
        $display("PASS: all comparator cases");
        $finish;
    end
endmodule
