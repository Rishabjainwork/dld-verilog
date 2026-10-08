module tb_e9_nbit_units;
    parameter N = 4;
    reg [N-1:0] a;
    reg [N-1:0] b;
    reg cin;
    wire [N-1:0] sum;
    wire cout;
    wire [(2*N)-1:0] product;
    wire [N-1:0] gray;
    wire [N-1:0] binary;
    integer i;

    e9_nbit_adder #(.N(N)) adder(a, b, cin, sum, cout);
    e9_nbit_multiplier #(.N(N)) multiplier(a, b, product);
    e9_binary_to_gray #(.N(N)) b2g(a, gray);
    e9_gray_to_binary #(.N(N)) g2b(gray, binary);

    initial begin
        cin = 1'b0;
        $display("N-bit adder, multiplier, and converters");
        for (i = 0; i < 6; i = i + 1) begin
            a = i[3:0];
            b = i + 3;
            #10;
            $display("a=%d b=%d sum=%d cout=%b product=%d gray(a)=%b binary=%b",
                     a, b, sum, cout, product, gray, binary);
        end
        $finish;
    end
endmodule
