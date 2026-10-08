module tb_e4_datapath_elements;
    reg [3:0] add_a;
    reg [3:0] add_b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    reg [1:0] mul_a;
    reg [1:0] mul_b;
    wire [3:0] product;
    integer i;

    e4_four_bit_adder adder(add_a, add_b, cin, sum, cout);
    e4_two_bit_multiplier multiplier(mul_a, mul_b, product);

    initial begin
        cin = 1'b0;
        $display("4-bit adder");
        add_a = 4'd3; add_b = 4'd4; #10; $display("%d + %d = %d cout=%b", add_a, add_b, sum, cout);
        add_a = 4'd9; add_b = 4'd6; #10; $display("%d + %d = %d cout=%b", add_a, add_b, sum, cout);
        add_a = 4'd15; add_b = 4'd1; #10; $display("%d + %d = %d cout=%b", add_a, add_b, sum, cout);

        $display("2-bit multiplier");
        for (i = 0; i < 16; i = i + 1) begin
            {mul_a, mul_b} = i[3:0];
            #10;
            $display("%d * %d = %d", mul_a, mul_b, product);
        end
        $finish;
    end
endmodule
