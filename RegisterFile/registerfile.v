module registerfile(clk, rst, dataInReg, dataIn, dataInputA, dataInputB, dataOutputA, dataOutputB);
	
	input clk, rst;
	input[4:0] dataInReg;	
	input[31:0] dataIn;		
	input[4:0]dataInputA, dataInputB;
	output reg[31:0] dataOutputA, dataOutputB;
	
	reg[31:0] s0, s1, s2, s3, s4, s5, s6, s7; // saved registers
	reg[31:0] t0, t1, t2, t3, t4, t5, t6, t7; // temporary registers
	
	initial begin
		s0 <= 0;
		s1 <= 0;
		s2 <= 0;
		s3 <= 0;
		s4 <= 0;
		s5 <= 0;
		s6 <= 0;
		s7 <= 0;
		t0 <= 0;
		t1 <= 0;
		t2 <= 0;
		t3 <= 0;
		t4 <= 0;
		t5 <= 0;
		t6 <= 0;
		t7 <= 0;
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if(rst)
			begin
			s0 <= 0;
			s1 <= 0;
			s2 <= 0;
			s3 <= 0;
			s4 <= 0;
			s5 <= 0;
			s6 <= 0;
			s7 <= 0;
			t0 <= 0;
			t1 <= 0;
			t2 <= 0;
			t3 <= 0;
			t4 <= 0;
			t5 <= 0;
			t6 <= 0;
			t7 <= 0;
			end
		else
		begin
			case(dataInReg)
				0:s0 <= dataIn;
				1:s1 <= dataIn;
				2:s2 <= dataIn;
				3:s3 <= dataIn;
				4:s4 <= dataIn;
				5:s5 <= dataIn;
				6:s6 <= dataIn;
				7:s7 <= dataIn;
				8:t0 <= dataIn;
				9:t1 <= dataIn;
				10:t2 <= dataIn;
				11:t3 <= dataIn;
				12:t4 <= dataIn;
				13:t5 <= dataIn;
				14:t6 <= dataIn;
				15:t7 <= dataIn;
			endcase
			case(dataInputA)
				0:dataOutputA <= s0;
				1:dataOutputA <= s1;
				2:dataOutputA <= s2;
				3:dataOutputA <= s3;
				4:dataOutputA <= s4;
				5:dataOutputA <= s5;
				6:dataOutputA <= s6;
				7:dataOutputA <= s7;
				8:dataOutputA <= t0;
				9:dataOutputA <= t1;
				10:dataOutputA <= t2;
				11:dataOutputA <= t3;
				12:dataOutputA <= t4;
				13:dataOutputA <= t5;
				14:dataOutputA <= t6;
				15:dataOutputA <= t7;
			endcase
			case(dataInputB)
				0:dataOutputB <= s0;
				1:dataOutputB <= s1;
				2:dataOutputB <= s2;
				3:dataOutputB <= s3;
				4:dataOutputB <= s4;
				5:dataOutputB <= s5;
				6:dataOutputB <= s6;
				7:dataOutputB <= s7;
				8:dataOutputB <= t0;
				9:dataOutputB <= t1;
				10:dataOutputB <= t2;
				11:dataOutputB <= t3;
				12:dataOutputB <= t4;
				13:dataOutputB <= t5;
				14:dataOutputB <= t6;
				15:dataOutputB <= t7;
			endcase	
		end
	end
	
	
endmodule
	