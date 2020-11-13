module pc(clk, pc_count, rst);

	input clk, rst;
	output reg [9:0] pc_count = 0; // 10 bits, pois a memoria de instrucao tem esse tamanho
	
	always @(posedge clk)
	begin 
		if(rst) begin
			pc_count = 0;
		end
		else
		begin
			pc_count = pc_count + 1;
		end
	end 
	
endmodule 