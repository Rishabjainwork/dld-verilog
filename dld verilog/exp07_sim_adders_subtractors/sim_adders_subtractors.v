module e7_half_adder_structural(
    input a,
    input b,
    output sum,
    output carry
);
    xor (sum, a, b);
    and (carry, a, b);
endmodule

module e7_full_adder_structural(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    wire s1;
    wire c1;
    wire c2;

    e7_half_adder_structural ha1(a, b, s1, c1);
    e7_half_adder_structural ha2(s1, cin, sum, c2);
    or (carry, c1, c2);
endmodule

module e7_half_subtractor_structural(
    input a,
    input b,
    output diff,
    output borrow
);
    wire nota;

    xor (diff, a, b);
    not (nota, a);
    and (borrow, nota, b);
endmodule

module e7_full_subtractor_structural(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    wire d1;
    wire b1;
    wire b2;

    e7_half_subtractor_structural hs1(a, b, d1, b1);
    e7_half_subtractor_structural hs2(d1, bin, diff, b2);
    or (borrow, b1, b2);
endmodule
