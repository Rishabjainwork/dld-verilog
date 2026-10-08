module tb_e2_code_converters;
    reg [3:0] bcd;
    wire [3:0] gray;
    wire [3:0] decoded_bcd;
    wire [3:0] excess3;
    integer i;

    e2_bcd_to_gray bg(bcd, gray);
    e2_gray_to_bcd gb(gray, decoded_bcd);
    e2_bcd_to_excess3 be(bcd, excess3);

    initial begin
        $display("BCD  Gray  Gray-to-BCD  Excess-3");
        for (i = 0; i <= 9; i = i + 1) begin
            bcd = i[3:0];
            #10;
            $display("%04b  %04b     %04b       %04b", bcd, gray, decoded_bcd, excess3);
        end
        $finish;
    end
endmodule
