module tb_e6_mod_counters;
    reg clk;
    reg reset;
    wire [2:0] mod6_count;
    wire [3:0] mod10_count;

    e6_mod_n_counter #(.MOD_VALUE(6), .WIDTH(3)) mod6(clk, reset, mod6_count);
    e6_mod_n_counter #(.MOD_VALUE(10), .WIDTH(4)) mod10(clk, reset, mod10_count);

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        reset = 1'b1;
        #12 reset = 1'b0;
        $display("time mod6 mod10");
        $monitor("%0t    %d    %d", $time, mod6_count, mod10_count);
        #130 $finish;
    end
endmodule
