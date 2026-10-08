module e2_bcd_to_gray(
    input [3:0] bcd,
    output [3:0] gray
);
    assign gray[3] = bcd[3];
    assign gray[2] = bcd[3] ^ bcd[2];
    assign gray[1] = bcd[2] ^ bcd[1];
    assign gray[0] = bcd[1] ^ bcd[0];
endmodule

module e2_gray_to_bcd(
    input [3:0] gray,
    output [3:0] bcd
);
    assign bcd[3] = gray[3];
    assign bcd[2] = bcd[3] ^ gray[2];
    assign bcd[1] = bcd[2] ^ gray[1];
    assign bcd[0] = bcd[1] ^ gray[0];
endmodule

module e2_bcd_to_excess3(
    input [3:0] bcd,
    output [3:0] excess3
);
    assign excess3 = bcd + 4'd3;
endmodule
