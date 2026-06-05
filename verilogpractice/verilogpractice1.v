module halfadder(input a,b,output sum,cout);
    xor (sum, a, b);
    and (cout, a, b);
endmodule

module fulladder (
    input  a, b, cin,
    output sum, cout
);
    wire s1,s2,s3;
    halfadder HA1(.a(a),.b(b),.sum(s1),.cout(s2));
    halfadder HA2(.a(s1),.b(cin),.sum(sum),.cout(s3));
    assign cout=s3|s2;
endmodule

module bit4adder(
    input  [3:0] x,    
    input  [3:0] y,    
    input        cin, 
    output [3:0] z,
    output       cout
);
    wire c1, c2, c3;

    fulladder FA0 (.a(x[0]), .b(y[0]), .cin(cin), .sum(z[0]), .cout(c1));
    fulladder FA1 (.a(x[1]), .b(y[1]), .cin(c1),  .sum(z[1]), .cout(c2));
    fulladder FA2 (.a(x[2]), .b(y[2]), .cin(c2),  .sum(z[2]), .cout(c3));
    fulladder FA3 (.a(x[3]), .b(y[3]), .cin(c3),  .sum(z[3]), .cout(cout));

endmodule

module bit8adder(
    input  [7:0] a,    
    input  [7:0] b,    
    input        cin,
    output [7:0] sum, 
    output       cout
);
    wire w1;
    bit4adder lower_bits (
        .x(a[3:0]), 
        .y(b[3:0]), 
        .cin(cin), 
        .z(sum[3:0]), 
        .cout(w1)
    );
    bit4adder upper_bits (
        .x(a[7:4]), 
        .y(b[7:4]), 
        .cin(w1), 
        .z(sum[7:4]), 
        .cout(cout)
    );

endmodule