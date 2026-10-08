module tb_e10_shift_registers;
    reg clk;
    reg reset;
    reg serial_in;
    reg load;
    reg [3:0] parallel_in;
    wire siso_out;
    wire [3:0] sipo_out;
    wire piso_out;
    wire [3:0] pipo_out;

    e10_siso_shift_register siso(clk, reset, serial_in, siso_out);
    e10_sipo_shift_register sipo(clk, reset, serial_in, sipo_out);
    e10_piso_shift_register piso(clk, reset, load, parallel_in, piso_out);
    e10_pipo_register pipo(clk, reset, parallel_in, pipo_out);

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        reset = 1'b1; serial_in = 0; load = 0; parallel_in = 4'b1011;
        #12 reset = 1'b0;
        $display("time sin siso sipo piso pipo");
        $monitor("%0t   %b    %b   %b   %b   %b", $time, serial_in, siso_out, sipo_out, piso_out, pipo_out);
        load = 1'b1; #10 load = 1'b0;
        serial_in = 1'b1; #10;
        serial_in = 1'b0; #10;
        serial_in = 1'b1; #10;
        serial_in = 1'b1; #10;
        parallel_in = 4'b0101; #10;
        #20 $finish;
    end
endmodule
