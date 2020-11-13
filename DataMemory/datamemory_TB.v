`timescale 1ns/10ps

module datamemory_TB;
	reg clk;
	reg[5:0] address;
	reg[31:0] dataIn;
	wire[31:0] dataOut;
	reg we;
	reg ce;
	
	datamemory DUT (
		.clk (clk),
		.address (address),
		.dataIn (dataIn),
		.dataOut (dataOut),
		.we (we),
		.ce (ce)
	);
	
	initial begin
		clk = 0;
		ce = 0;
		#15 ce = 1;
		we = 1;
		address = 9'b0000_01010;
		dataIn = 15;
	end
	
	always begin 
		#10 clk = ~clk;
	end
	
	initial begin 
		#50 we = 0;
		#50 address = 0;
		#50 address = 1;
		#50 address = 2;
		#50 address = 3;
		#50 address = 4;
		#50 address = 10;
	end
	
	initial begin 
		#1000 $stop;
	end

endmodule
