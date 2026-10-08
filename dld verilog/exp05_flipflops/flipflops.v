module e5_sr_flip_flop(
    input clk,
    input reset,
    input s,
    input r,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= 1'bx;
            endcase
        end
    end
endmodule

module e5_d_flip_flop(
    input clk,
    input reset,
    input d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module e5_jk_flip_flop(
    input clk,
    input reset,
    input j,
    input k,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
            endcase
        end
    end
endmodule

module e5_t_flip_flop(
    input clk,
    input reset,
    input t,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q;
        else
            q <= q;
    end
endmodule

module e5_d_latch_using_gates(
    input d,
    input enable,
    output q,
    output qbar
);
    wire dbar;
    wire sbar;
    wire rbar;

    not (dbar, d);
    nand (sbar, d, enable);
    nand (rbar, dbar, enable);
    nand (q, sbar, qbar);
    nand (qbar, rbar, q);
endmodule
