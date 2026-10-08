module e6_mod_n_counter #(
    parameter MOD_VALUE = 10,
    parameter WIDTH = 4
)(
    input clk,
    input reset,
    output reg [WIDTH-1:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= {WIDTH{1'b0}};
        else if (count == MOD_VALUE - 1)
            count <= {WIDTH{1'b0}};
        else
            count <= count + 1'b1;
    end
endmodule
