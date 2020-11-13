`timescale 1ns/10ps
module extend_TB();
	
	reg[15:0] offset;
	wire[31:0] out;
	
	extend DUT(
		.offset(offset),
		.out(out)
	);
	
	initial begin
		offset = 600;
		#50 offset = 13;
	end
	
	initial begin
		#500 $stop;
	end
	
endmodule
