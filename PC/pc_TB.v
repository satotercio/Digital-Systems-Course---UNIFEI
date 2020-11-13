`timescale 1ns/10ps
module pc_TB();
	
	reg clk, rst;
	wire[9:0] pc_count;
	
	pc DUT(
		.clk(clk),
		.pc_count(pc_count),
		.rst(rst)
	);
	
	always begin 
		#5 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		rst = 0;
	end 
	
	initial begin
		#200 $stop;
	end
	
endmodule