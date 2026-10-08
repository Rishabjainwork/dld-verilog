module e1_half_adder(
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module e1_full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

module e1_half_subtractor(
    input a,
    input b,
    output diff,
    output borrow
);
    assign diff = a ^ b;
    assign borrow = (~a) & b;
endmodule

module e1_full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    assign diff = a ^ b ^ bin;
    assign borrow = ((~a) & b) | ((~(a ^ b)) & bin);
endmodule
