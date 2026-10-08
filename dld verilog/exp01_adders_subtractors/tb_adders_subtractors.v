module tb_e1_adders_subtractors;
    reg a;
    reg b;
    reg cin;
    reg bin;
    wire ha_sum;
    wire ha_carry;
    wire fa_sum;
    wire fa_carry;
    wire hs_diff;
    wire hs_borrow;
    wire fs_diff;
    wire fs_borrow;
    integer i;

    e1_half_adder ha(a, b, ha_sum, ha_carry);
    e1_full_adder fa(a, b, cin, fa_sum, fa_carry);
    e1_half_subtractor hs(a, b, hs_diff, hs_borrow);
    e1_full_subtractor fs(a, b, bin, fs_diff, fs_borrow);

    initial begin
        $display("a b cin/bin | HA(s,c) FA(s,c) HS(d,br) FS(d,br)");
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            bin = cin;
            #10;
            $display("%b %b    %b    |   %b %b      %b %b      %b %b       %b %b",
                     a, b, cin, ha_sum, ha_carry, fa_sum, fa_carry,
                     hs_diff, hs_borrow, fs_diff, fs_borrow);
        end
        $finish;
    end
endmodule
