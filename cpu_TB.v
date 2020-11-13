`timescale 1ns/10ps
module cpu_TB();

reg clk;
reg rst;
wire[31:0] dout;
			

cpu DUT(clk, rst, dout);

initial begin
rst = 1;
clk =0;
#50 rst = 0;
end

always begin
#30 clk = ~clk;
end

initial begin
#4000 $stop;
end

endmodule