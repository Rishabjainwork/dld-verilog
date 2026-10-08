module e8_encoder4to2(
    input [3:0] in,
    output [1:0] out,
    output valid
);
    assign out[1] = in[2] | in[3];
    assign out[0] = in[1] | in[3];
    assign valid = |in;
endmodule

module e8_decoder2to4(
    input [1:0] in,
    input enable,
    output [3:0] out
);
    assign out = enable ? (4'b0001 << in) : 4'b0000;
endmodule

module e8_priority_encoder8to3(
    input [7:0] in,
    output reg [2:0] out,
    output reg valid
);
    always @(*) begin
        valid = 1'b1;
        casex (in)
            8'b1xxxxxxx: out = 3'd7;
            8'b01xxxxxx: out = 3'd6;
            8'b001xxxxx: out = 3'd5;
            8'b0001xxxx: out = 3'd4;
            8'b00001xxx: out = 3'd3;
            8'b000001xx: out = 3'd2;
            8'b0000001x: out = 3'd1;
            8'b00000001: out = 3'd0;
            default: begin
                out = 3'd0;
                valid = 1'b0;
            end
        endcase
    end
endmodule
