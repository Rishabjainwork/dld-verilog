module e11_ripple_counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(negedge clk or posedge reset) begin
        if (reset)
            count[0] <= 1'b0;
        else
            count[0] <= ~count[0];
    end

    always @(negedge count[0] or posedge reset) begin
        if (reset)
            count[1] <= 1'b0;
        else
            count[1] <= ~count[1];
    end

    always @(negedge count[1] or posedge reset) begin
        if (reset)
            count[2] <= 1'b0;
        else
            count[2] <= ~count[2];
    end

    always @(negedge count[2] or posedge reset) begin
        if (reset)
            count[3] <= 1'b0;
        else
            count[3] <= ~count[3];
    end
endmodule

module e11_sync_up_counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end
endmodule

module e11_up_down_counter(
    input clk,
    input reset,
    input up,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (up)
            count <= count + 1'b1;
        else
            count <= count - 1'b1;
    end
endmodule

module e11_ring_counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0001;
        else
            count <= {count[2:0], count[3]};
    end
endmodule

module e11_johnson_counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= {count[2:0], ~count[3]};
    end
endmodule
