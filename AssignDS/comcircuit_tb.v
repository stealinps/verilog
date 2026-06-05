`timescale 1ns / 1ps
module comcircuit_tb;
    reg A;
    reg B;
    reg C;
    wire X;
    comcircuit uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .X(X)
    );
    integer i;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        $display("Time\t A B C | X");
        $display("-------------------");
        $monitor("%0nt\t %b %b %b | %b", $time, A, B, C, X);
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
            #10;     
        end
        $finish;
    end
      
endmodule