//used to convert state to next state in all 10 rounds

module SubBytes(stateIn, stateOut);

input [127:0] stateIn;
output [127:0] stateOut;

SBox s0(.in(stateIn[103:96]), .out(stateOut[103:96]));
SBox s1(.in(stateIn[111:104]), .out(stateOut[111:104]));
SBox s2(.in(stateIn[119:112]), .out(stateOut[119:112]));
SBox s3(.in(stateIn[127:120]), .out(stateOut[127:120]));

SBox s4(.in(stateIn[71:64]), .out(stateOut[71:64]));
SBox s5(.in(stateIn[79:72]), .out(stateOut[79:72]));
SBox s6(.in(stateIn[87:80]), .out(stateOut[87:80]));
SBox s7(.in(stateIn[95:88]), .out(stateOut[95:88]));

SBox s8(.in(stateIn[39:32]), .out(stateOut[39:32]));
SBox s9(.in(stateIn[47:40]), .out(stateOut[47:40]));
SBox s10(.in(stateIn[55:48]), .out(stateOut[55:48]));
SBox s11(.in(stateIn[63:56]), .out(stateOut[63:56]));

SBox s12(.in(stateIn[7:0]), .out(stateOut[7:0]));
SBox s13(.in(stateIn[15:8]), .out(stateOut[15:8]));
SBox s14(.in(stateIn[23:16]), .out(stateOut[23:16]));
SBox s15(.in(stateIn[31:24]), .out(stateOut[31:24]));
	  
endmodule