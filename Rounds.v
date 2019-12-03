//first 9 Rounds
module Round(rc, data, kin, kout, rndout);

input [3:0]rc;
input [127:0]data;
input [127:0]kin;
output [127:0]kout;
output [127:0]rndout;

wire [127:0] sb, sr, mcl;

KeyGen t0(.rc(rc), .kin(kin), .kout(kout));
SubBytes t1(.stateIn(data), .stateOut(sb));
ShiftRows t2(.stateB(sb), .stateR(sr));
MixColumn t3(.stateR(sr), .stateM(mcl));
assign rndout= kout^mcl;

endmodule

//final Round
module Round_final(rc, rin, kin, fout);

input [3:0]rc;
input [127:0]rin;
input [127:0]kin;
output [127:0]fout;

wire [127:0] sb, sr, mcl, kout;

KeyGen t0(.rc(rc), .kin(kin), .kout(kout));
SubBytes t1(.stateIn(rin), .stateOut(sb));
ShiftRows t2(.stateB(sb), .stateR(sr));
assign fout= kout^sr;

endmodule