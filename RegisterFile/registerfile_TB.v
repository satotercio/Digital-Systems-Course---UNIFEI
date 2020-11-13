`timescale 1ns/10ps

module registerfile_TB();
	
	reg clk, rst;
	reg[4:0] dataInReg;	
	reg[31:0] dataIn;		
	reg[4:0]dataInputA, dataInputB;
	wire[31:0] dataOutputA, dataOutputB;
	
	registerfile DUT(
		.clk(clk),
		.rst(rst),
		.dataInReg(dataInReg),
		.dataIn(dataIn),
		.dataInputA(dataInputA),
		.dataInputB(dataInputB),
		.dataOutputA(dataOutputA),
		.dataOutputB(dataOutputB)
	);
	
	initial begin
		clk = 0;
		rst = 0;
		dataIn = 0;
	end
	
		initial begin
		#10 dataInReg = 4;
		#10 dataIn = 7;
		#20 dataInputA = 6;
		
		#10 dataInReg = 5;
		#10 dataIn = 13;
		#20 dataInputB = 15;
	end
	
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		#200 $stop;
	end
		
	
endmodule

	