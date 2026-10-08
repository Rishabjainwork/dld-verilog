module e9_nbit_adder #(
    parameter N = 4
)(
    input [N-1:0] a,
    input [N-1:0] b,
    input cin,
    output [N-1:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module e9_nbit_multiplier #(
    parameter N = 4
)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [(2*N)-1:0] product
);
    assign product = a * b;
endmodule

module e9_binary_to_gray #(
    parameter N = 4
)(
    input [N-1:0] binary,
    output [N-1:0] gray
);
    assign gray = binary ^ (binary >> 1);
endmodule

module e9_gray_to_binary #(
    parameter N = 4
)(
    input [N-1:0] gray,
    output reg [N-1:0] binary
);
    integer i;

    always @(*) begin
        binary[N-1] = gray[N-1];
        for (i = N - 2; i >= 0; i = i - 1)
            binary[i] = binary[i + 1] ^ gray[i];
    end
endmodule
