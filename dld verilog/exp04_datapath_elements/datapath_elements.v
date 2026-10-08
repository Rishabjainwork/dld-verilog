module e4_full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

module e4_four_bit_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire c1;
    wire c2;
    wire c3;

    e4_full_adder fa0(a[0], b[0], cin, sum[0], c1);
    e4_full_adder fa1(a[1], b[1], c1, sum[1], c2);
    e4_full_adder fa2(a[2], b[2], c2, sum[2], c3);
    e4_full_adder fa3(a[3], b[3], c3, sum[3], cout);
endmodule

module e4_two_bit_multiplier(
    input [1:0] a,
    input [1:0] b,
    output [3:0] product
);
    assign product[0] = a[0] & b[0];
    assign product[1] = (a[1] & b[0]) ^ (a[0] & b[1]);
    assign product[2] = (a[1] & b[1]) ^ ((a[1] & b[0]) & (a[0] & b[1]));
    assign product[3] = (a[1] & b[1]) & ((a[1] & b[0]) & (a[0] & b[1]));
endmodule
