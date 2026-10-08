module e3_mux4to1_gate(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
    output y
);
    wire ns0;
    wire ns1;
    wire a0;
    wire a1;
    wire a2;
    wire a3;

    not (ns0, s0);
    not (ns1, s1);
    and (a0, i0, ns1, ns0);
    and (a1, i1, ns1, s0);
    and (a2, i2, s1, ns0);
    and (a3, i3, s1, s0);
    or (y, a0, a1, a2, a3);
endmodule

module e3_demux1to4_gate(
    input din,
    input s0,
    input s1,
    output y0,
    output y1,
    output y2,
    output y3
);
    wire ns0;
    wire ns1;

    not (ns0, s0);
    not (ns1, s1);
    and (y0, din, ns1, ns0);
    and (y1, din, ns1, s0);
    and (y2, din, s1, ns0);
    and (y3, din, s1, s0);
endmodule

module e3_boolean_using_mux(
    input a,
    input b,
    input c,
    output f
);
    wire nc;

    not (nc, c);
    e3_mux4to1_gate mux(
        .i0(c),
        .i1(nc),
        .i2(1'b0),
        .i3(1'b1),
        .s0(b),
        .s1(a),
        .y(f)
    );
endmodule
