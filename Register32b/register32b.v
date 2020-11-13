module register32b(clk, rst,D, Q); // Pode ser considerando um flip-flop D

	input clk, rst;
	input[31:0] D;
	output reg [31:0] Q;
	
	always @ (posedge clk)
	begin
		if(rst)begin
			Q <= 0;
		end
		else begin
			Q <= D;
		end
	end
	
endmodule