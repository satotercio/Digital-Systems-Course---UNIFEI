module extend(offset, out);
	
	input [15:0] offset;
	output[31:0] out;
	
	assign out = {16'b0,offset}; //concatena 16 zeros aos 16 bits do offset
	
endmodule