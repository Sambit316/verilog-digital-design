`timescale 1ns/1ps
module tb_full_adder;
    reg a, b, cin;
    wire sum, cout;
    integer i;

    full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
            if ({cout, sum} !== ({1'b0, a} + {1'b0, b} + {1'b0, cin})) begin
                $display("FAIL: a=%b b=%b cin=%b sum=%b cout=%b", a,b,cin,sum,cout);
                $finish;
            end
        end
        $display("PASS: all full-adder cases");
        $finish;
    end
endmodule
