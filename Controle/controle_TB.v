`timescale 1ns/10ps
module controle_TB();
	
	reg[31:0] instruction;
	wire[31:0] output_controle;
	
	controle DUT(
		.instruction(instruction),
		.output_controle(output_controle)
	);
	
	initial begin
		instruction = 32'b000110_00000_00111_0000_0000_0000_0000; //load A 
		#100 instruction = 32'b000110_00001_00111_0000_0000_0000_0001; // load B
		#100 instruction = 32'b000101_00100_00000_00001_01010_100000; // add 
		#100 instruction = 32'b000101_00101_00010_00011_01010_100000; // sub 
	end
	
	initial begin
		#1000 $stop;
	end
	
endmodule