module datamemory(clk,address, dataIn, dataOut, we, ce);
								
	input clk, ce, we;
	integer i;
	input[31:0] dataIn;
	input[5:0] address;
	output reg [31:0] dataOut;
	
	reg [31:0]mem[0:1023];
	
	initial 
	begin
		mem[0] = 1000; //A
		mem[1] = 5000; //B
		mem[2] = 2000; //C
		mem[3] = 3000; //D
		
		for(i=5;i<1023;i=i+1) 
		begin
			mem[i] = 0;
		end
	end
	
	always @(posedge clk)
	begin 
		if(ce == 1)
		begin
			if(we == 0)
			begin
				dataOut <= mem[address];
			end
			else 
			begin
				mem[address] <= dataIn;
			end
		end
		else 
		begin
			dataOut <= 0;
		end
	end
	
endmodule