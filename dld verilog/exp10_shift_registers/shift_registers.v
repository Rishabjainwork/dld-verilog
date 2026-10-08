module e10_siso_shift_register #(
    parameter N = 4
)(
    input clk,
    input reset,
    input serial_in,
    output serial_out
);
    reg [N-1:0] q;

    assign serial_out = q[N-1];

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= {N{1'b0}};
        else
            q <= {q[N-2:0], serial_in};
    end
endmodule

module e10_sipo_shift_register #(
    parameter N = 4
)(
    input clk,
    input reset,
    input serial_in,
    output reg [N-1:0] parallel_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= {N{1'b0}};
        else
            parallel_out <= {parallel_out[N-2:0], serial_in};
    end
endmodule

module e10_piso_shift_register #(
    parameter N = 4
)(
    input clk,
    input reset,
    input load,
    input [N-1:0] parallel_in,
    output serial_out
);
    reg [N-1:0] q;

    assign serial_out = q[N-1];

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= {N{1'b0}};
        else if (load)
            q <= parallel_in;
        else
            q <= {q[N-2:0], 1'b0};
    end
endmodule

module e10_pipo_register #(
    parameter N = 4
)(
    input clk,
    input reset,
    input [N-1:0] parallel_in,
    output reg [N-1:0] parallel_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= {N{1'b0}};
        else
            parallel_out <= parallel_in;
    end
endmodule
