module tb_e11_counters;
    reg clk;
    reg reset;
    reg up;
    wire [3:0] ripple_count;
    wire [3:0] sync_count;
    wire [3:0] up_down_count;
    wire [3:0] ring_count;
    wire [3:0] johnson_count;

    e11_ripple_counter ripple(clk, reset, ripple_count);
    e11_sync_up_counter sync_up(clk, reset, sync_count);
    e11_up_down_counter up_down(clk, reset, up, up_down_count);
    e11_ring_counter ring(clk, reset, ring_count);
    e11_johnson_counter johnson(clk, reset, johnson_count);

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        reset = 1'b1;
        up = 1'b1;
        #12 reset = 1'b0;
        $display("time ripple sync updown ring johnson");
        $monitor("%0t   %b  %b  %b   %b  %b",
                 $time, ripple_count, sync_count, up_down_count, ring_count, johnson_count);
        #80 up = 1'b0;
        #80 $finish;
    end
endmodule
