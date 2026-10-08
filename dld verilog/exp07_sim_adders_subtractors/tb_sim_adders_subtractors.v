module tb_e7_sim_adders_subtractors;
    reg a;
    reg b;
    reg cin;
    wire ha_sum;
    wire ha_carry;
    wire fa_sum;
    wire fa_carry;
    wire hs_diff;
    wire hs_borrow;
    wire fs_diff;
    wire fs_borrow;
    integer i;

    e7_half_adder_structural ha(a, b, ha_sum, ha_carry);
    e7_full_adder_structural fa(a, b, cin, fa_sum, fa_carry);
    e7_half_subtractor_structural hs(a, b, hs_diff, hs_borrow);
    e7_full_subtractor_structural fs(a, b, cin, fs_diff, fs_borrow);

    initial begin
        $display("Structural simulation of adders and subtractors");
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
            $display("%b %b %b | HA=%b%b FA=%b%b HS=%b%b FS=%b%b",
                     a, b, cin, ha_sum, ha_carry, fa_sum, fa_carry,
                     hs_diff, hs_borrow, fs_diff, fs_borrow);
        end
        $finish;
    end
endmodule
