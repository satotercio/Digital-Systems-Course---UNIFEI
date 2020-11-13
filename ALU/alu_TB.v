`timescale 1ns/1ps
module alu_TB();
	reg [31:0]inA,inB;
	reg [1:0] ctrl;
	wire [31:0] out;
	
	alu DUT(
		.inA(inA),
		.inB(inB),
		.ctrl(ctrl),
		.out(out)
	);			
				
	initial begin
	
		inA = 0;
		inB = 0;
		ctrl = 0;
		#30 inA = 1;
		inB = 1;
		#10 ctrl = 1;
		#20 ctrl = 2;
		#20 ctrl = 3;
	
	end
	
	initial begin
	
		#1000 $stop;
	end
	
endmodule