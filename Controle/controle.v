module controle(instruction, output_controle);
	
	input [31:0] instruction;
	output [31:0] output_controle;
	
	reg wr, ce;
	reg mux1_ctrl, mux2_ctrl;
	reg [1:0] alu_control;
	reg [5:0] op;
	reg [4:0] rs,rt,rd;
	reg [5:0] code;
	
	
	always @(instruction) 
	begin
		op = instruction[31:26];
		rs = instruction[25:21];
		rt = instruction[20:16];
		code = instruction[5:0];
		
		case(op)
			5:  //ALU
				begin
				case(code)
					32: alu_control = 0; // adicao
					34: alu_control = 1; // subtracao
					36: alu_control = 2; // and
					37: alu_control = 3; // or
				endcase
				rd = instruction[15:11];
				mux1_ctrl = 0;
				mux2_ctrl = 0;
				wr = 0;
				ce = 0;
				end
			6: //load
				begin
				mux1_ctrl = 1;
				alu_control = 0;
				mux2_ctrl = 1;
				wr = 0;
				ce = 1;
				rd = rt;
				end
			7: //store
				begin
				mux1_ctrl = 1;
				alu_control = 0;
				mux2_ctrl = 1;
				wr = 1;
				ce = 1;
				rd = rt;
				end
		endcase
		
	end
	
		assign output_controle	= {rs, rt, rd, alu_control, mux1_ctrl, mux2_ctrl, wr, ce, 11'b0};
		
endmodule