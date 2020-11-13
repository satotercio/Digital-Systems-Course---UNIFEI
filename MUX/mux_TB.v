`timescale 1ns/10ps
module mux_TB();
	
	reg [31:0]inputA; 
	reg [31:0]inputB;
	reg select;
	wire [31:0]outMux;
	
	mux DUT(
		.inputA(inputA),
		.inputB(inputB),
		.select(select),
		.outMux(outMux)
	);
				
	initial begin
		select = 0;
		inputA = 14;
		inputB = 31;
		#20 inputA = 23;
		#20 inputB = 27;
	end

  	always begin
		#10 select = ~select; //semmelhante ao clock
	end 	
	
	initial begin
		#150 $stop;
	end
	
endmodule
	