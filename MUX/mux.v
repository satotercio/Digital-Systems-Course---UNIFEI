module mux(inputA, inputB, select, outMux);

	input [31:0]inputA, inputB;
	input select;
	output [31:0]outMux;
	
	assign outMux = select ? inputB : inputA;
	
endmodule
