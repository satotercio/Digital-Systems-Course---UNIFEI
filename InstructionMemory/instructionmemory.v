module instructionmemory(clk, address, dataOutput);

	input[9:0] address;
	input clk;
	output reg[31:0] dataOutput;
	
	reg[31:0]mem[0:1023]; 
	
	initial begin
	
		//Resultado da sequencia de operacoes a seguir sera incorreto ja que nao houve o 
		//tempo de espera para que seus valores fossem devidamente carregados no
		//register file. Assim eles nao se encontravam carregados para que as
		//operacoes fossem realizadas no clock em que os comandos para estas foram
		//enviados.
		
		//GRUPO 5
		mem[0] = 32'b000110_00000_00111_0000_0000_0000_0000; //Load A no S0
		mem[1] = 32'b000110_00001_00111_0000_0000_0000_0001; //Load B no S1
		mem[2] = 32'b000110_00010_00111_0000_0000_0000_0010; //Load C no S2
		mem[3] = 32'b000110_00011_00111_0000_0000_0000_0011; //Load D no S3
		mem[4] = 32'b000101_00100_00000_00001_01010_100000; //Adicao de A com B e salva em S4
		mem[5] = 32'b000101_00101_00010_00011_01010_100000; //Adicao de C com D e salva em S5
		mem[6] = 32'b000101_00110_00100_00101_01010_100010;// Subtracao (A+B)-(C+D) = resultado final e salva em S6
	
		//Consome 4 ciclos de clock para iniciar a operacao que dara certo
		mem[7] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[8] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[9] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[10] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		
		//Recarrega os valores no register file
		mem[11] = 32'b000110_00000_00111_0000_0000_0000_0000; //Load A no S0
		mem[12] = 32'b000110_00001_00111_0000_0000_0000_0001; //Load B no S1
		mem[13] = 32'b000110_00010_00111_0000_0000_0000_0010; //Load C no S2
		mem[14] = 32'b000110_00011_00111_0000_0000_0000_0011; //Load D no S3
		
		//Gasta 4 ciclos de clock  para que o valor ja carregado no register file seja usado
		mem[15] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[16] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[17] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[18] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		
		//Operacoes de adicao (A+B) e (C+D)
		mem[19] = 32'b000101_00100_00000_00001_01010_100000; //Adiciona A com B e salva em S4
		mem[20] = 32'b000101_00101_00010_00011_01010_100000; //Adiciona C com D e salva em S5
		
		//Gasta 4 ciclos de clock  para que o valor ja carregado no register file seja usado
		mem[21] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[22] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[23] = 32'b000110_01111_01110_0000_0000_0000_1010; //NOP (Load 0 em t7)
		mem[24] = 32'b000110_01111_01110_0000_0000_0000_1010;//NOP (Load 0 em t7)
		
		//Operacao final de subtracao
		mem[25] = 32'b000101_00110_00100_00101_01010_100010;// Subtracao (A+B)-(C+D) = Resultado final e salva em S6
		
	end
	
	always @ (posedge clk)
	begin	
			dataOutput <= mem[address];
	end
	
endmodule
