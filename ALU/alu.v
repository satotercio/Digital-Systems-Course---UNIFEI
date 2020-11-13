module alu(inA, inB, ctrl, out);
				
	input [31:0]inA, inB;
	input [1:0]ctrl;
	output reg [31:0] out;
					
	always @ (inA or inB or ctrl) begin
		case(ctrl)
			2'b00: out <= inA + inB;
			2'b01: out <= inA - inB;
			2'b10: out <= inA & inB;
			2'b11: out <= inA | inB;
		endcase
	end
	
endmodule
