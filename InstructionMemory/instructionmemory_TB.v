`timescale 1ns/10ps
module instructionmemory_TB();
	
	reg clk;
	reg[9:0] address;
	wire[31:0] dataOutput;
	
	instructionmemory DUT(
		.clk(clk),
		.address(address),
		.dataOutput(dataOutput)
	);
	
	initial begin
		clk = 0;
		address = 0;
	end
	
	always begin
		#20 address = address + 1;
	end
	
	always begin
		#10 clk = ~clk;
	end

	initial begin
		#500 $stop;
	end
	
endmodule
