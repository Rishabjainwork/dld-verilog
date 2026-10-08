module tb_e5_flipflops;
    reg clk;
    reg reset;
    reg s;
    reg r;
    reg d;
    reg j;
    reg k;
    reg t;
    reg enable;
    wire sr_q;
    wire d_q;
    wire jk_q;
    wire t_q;
    wire latch_q;
    wire latch_qbar;

    e5_sr_flip_flop srff(clk, reset, s, r, sr_q);
    e5_d_flip_flop dff(clk, reset, d, d_q);
    e5_jk_flip_flop jkff(clk, reset, j, k, jk_q);
    e5_t_flip_flop tff(clk, reset, t, t_q);
    e5_d_latch_using_gates gate_latch(d, enable, latch_q, latch_qbar);

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        reset = 1'b1; s = 0; r = 0; d = 0; j = 0; k = 0; t = 0; enable = 0;
        #12 reset = 1'b0;
        $display("time sr d jk t latch");
        $monitor("%0t   %b  %b  %b  %b   %b", $time, sr_q, d_q, jk_q, t_q, latch_q);

        #8  s = 1; r = 0; d = 1; j = 1; k = 0; t = 1; enable = 1;
        #10 s = 0; r = 0; d = 0; j = 0; k = 1; t = 1;
        #10 s = 0; r = 1; d = 1; j = 1; k = 1; t = 0;
        #10 enable = 0; d = 0; j = 0; k = 0;
        #20 $finish;
    end
endmodule
