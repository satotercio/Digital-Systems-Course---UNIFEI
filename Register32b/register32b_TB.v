`timescale 1ns/10ps
module register32b_TB();
	
	reg clk, rst;
	reg [31:0]D;
	wire [31:0]Q;
	
	register32b DUT(
		.clk(clk),
		.rst(rst),
		.D(D),
		.Q(Q)
	);
	
	initial begin
		clk = 0;
		rst = 0;
		D = 0;
	end
	
	always begin
		#10 D = D + 1;
	end
	
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		#500 $stop;
	end
	
endmodule;