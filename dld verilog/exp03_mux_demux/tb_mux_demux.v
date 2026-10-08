module tb_e3_mux_demux;
    reg [3:0] data;
    reg din;
    reg s0;
    reg s1;
    reg a;
    reg b;
    reg c;
    wire mux_y;
    wire y0;
    wire y1;
    wire y2;
    wire y3;
    wire f;
    integer i;

    e3_mux4to1_gate mux(data[0], data[1], data[2], data[3], s0, s1, mux_y);
    e3_demux1to4_gate demux(din, s0, s1, y0, y1, y2, y3);
    e3_boolean_using_mux boolean_mux(a, b, c, f);

    initial begin
        data = 4'b1010;
        din = 1'b1;
        $display("MUX and DEMUX");
        for (i = 0; i < 4; i = i + 1) begin
            {s1, s0} = i[1:0];
            #10;
            $display("sel=%b%b mux=%b demux=%b%b%b%b", s1, s0, mux_y, y3, y2, y1, y0);
        end

        $display("F(A,B,C)=sum m(1,2,6,7) using MUX");
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i[2:0];
            #10;
            $display("A=%b B=%b C=%b F=%b", a, b, c, f);
        end
        $finish;
    end
endmodule
