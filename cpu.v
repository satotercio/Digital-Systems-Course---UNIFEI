/*
a) Qual a lat�ncia do sistema?
   A lat�ncia do sistema � de 5 pulsos de clock, pois devido a montagem estruturada em pipeline, 
as opera��es passam por uma fase por clock, e no caso s�o 5 fases: 
Instruction Fetch, Instruction Decode, Execute, Memory e Write-Back.

b) Qual o throughput do sistema?
   A partir do momento que o pipeline estiver cheio, o throughput ser� de 32 bits por clock.

c) Qual a m�xima frequ�ncia de opera��o do sistema, considerando a implementa��o na Altera Cyclone II 
EP2C20F484C7?
   De acordo com Timing Analyzer do Compilation Report do Quartus, o sistema implementado 
na Altera Cyclone II EP2C20F484C7, apresenta frequ�ncia m�xima de opera��o de 114.13Mhz.

d) Com a arquitetura implementada, a express�o X = (A+B) ? (C+D) � executada corretamente? Por qu�? O 
que pode ser feito para que a express�o seja calculada corretamente?
   A express�o pode sim ser executada corretamente, por�m n�o de forma direta, 
caso se tente executar de forma direta as opera��es de adi��o e subtra��o tentariam 
acessar valores que ainda n�o estavam prontos, para poder executar � importante inserir 
comandos para dar tempo desses valores ficarem prontos.

*/

module cpu(clk, rst, dout);
					
	input clk, rst;
	
	output[31:0] dout;
	wire[31:0]winstout;
	wire[31:0] output_controle;
	wire[9:0] wpc;
	wire[31:0] winst;
	wire[31:0] wextend;
	wire[31:0] wimm;
	wire[31:0] dataoutB;
	wire[31:0] dataoutA;
	wire mux1_ctrl;
	wire[31:0] mux1_out;
	wire [1:0] alu_ctrl;
	wire[31:0] alu_out;
	wire[31:0] wregB2_out;
	wire[31:0] wregD1_out;
	wire[31:0] wdmemory_out;
	wire wr, ce;
	wire[31:0] wregD2_out;
	wire mux2_ctrl;
	wire[31:0] mux2_out;
	wire[31:0] ctrl1_out;
	wire[31:0] ctrl2_out;
	wire[31:0]ctrl3_out;
	wire[4:0] datainreg, datainA, datainB;
	
	
	pc programcounter(clk,wpc,rst);
	
	instructionmemory instMem(clk, wpc, winst); 
	
	extend extender(winst[15:0], wextend);
	
	register32b regImm(clk, rst, wextend, wimm);
	
	mux mux1(dataoutB, wimm, mux1_ctrl, mux1_out);
	
	alu aluA(dataoutA, mux1_out, alu_ctrl, alu_out);
	
	register32b regB2(clk, rst, dataoutB, wregB2_out);
	
	register32b regD1(clk, rst, alu_out, wregD1_out);
	
	datamemory DMemory(clk, wregD1_out, wregB2_out, wdmemory_out, wr, ce);
	
	register32b regD2(clk, rst, wregD1_out, wregD2_out);
	
	mux mux2 (wregD2_out, wdmemory_out, mux2_ctrl, mux2_out);
	
	register32b ctrl1 (clk, rst, output_controle, ctrl1_out);
	
	register32b ctrl2 (clk, rst, ctrl1_out, ctrl2_out);
	
	register32b ctrl3 (clk, rst, ctrl2_out, ctrl3_out);
	
	registerfile RF(clk, rst, datainreg, mux2_out, datainA, datainB, dataoutA, dataoutB);
	
	controle control(winst, output_controle);
	
	assign datainreg = ctrl3_out[31:27];
	assign datainA = output_controle[26:22];
	assign datainB = output_controle[21:17];
	assign alu_ctrl = ctrl1_out[16:15];
	assign mux1_ctrl = ctrl1_out[14];
	assign mux2_ctrl = ctrl3_out[13];
	assign wr = ctrl2_out[12];
	assign ce = ctrl2_out[11];
	
	assign dout = mux2_out;
	
endmodule
