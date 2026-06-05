module comcircuit(
    input A,
    input B,
    input C,
    output X
    );

    assign X = (A&B&C) ||(A&B&~C) ||(~A&B&C) ||(A&~B&C);

endmodule
