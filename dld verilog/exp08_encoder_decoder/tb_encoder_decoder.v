module tb_e8_encoder_decoder;
    reg [3:0] encoder_in;
    reg [1:0] decoder_in;
    reg enable;
    reg [7:0] priority_in;
    wire [1:0] encoder_out;
    wire encoder_valid;
    wire [3:0] decoder_out;
    wire [2:0] priority_out;
    wire priority_valid;
    integer i;

    e8_encoder4to2 enc(encoder_in, encoder_out, encoder_valid);
    e8_decoder2to4 dec(decoder_in, enable, decoder_out);
    e8_priority_encoder8to3 penc(priority_in, priority_out, priority_valid);

    initial begin
        enable = 1'b1;
        $display("4-to-2 encoder and 2-to-4 decoder");
        for (i = 0; i < 4; i = i + 1) begin
            encoder_in = 4'b0001 << i;
            decoder_in = i[1:0];
            #10;
            $display("enc_in=%b enc_out=%b valid=%b | dec_in=%b dec_out=%b",
                     encoder_in, encoder_out, encoder_valid, decoder_in, decoder_out);
        end

        $display("8-to-3 priority encoder");
        priority_in = 8'b00000000; #10; $display("in=%b out=%b valid=%b", priority_in, priority_out, priority_valid);
        priority_in = 8'b00010010; #10; $display("in=%b out=%b valid=%b", priority_in, priority_out, priority_valid);
        priority_in = 8'b10000001; #10; $display("in=%b out=%b valid=%b", priority_in, priority_out, priority_valid);
        $finish;
    end
endmodule
