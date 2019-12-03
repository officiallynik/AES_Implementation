//after changing the state using ShiftRow Module we use MixCol method

module MixColumn(stateR, stateM);

input [127:0] stateR;
output [127:0] stateM;

mixCol m0(stateR[7:0], stateR[31:24], stateR[23:16], stateR[15:8], stateM[7:0]);
mixCol m1(stateR[39:32], stateR[63:56], stateR[55:48], stateR[47:40], stateM[39:32]);
mixCol m2(stateR[71:64], stateR[95:88], stateR[87:80], stateR[79:72], stateM[71:64]);
mixCol m3(stateR[103:96], stateR[127:120], stateR[119:112], stateR[111:104], stateM[103:96]);

mixCol m4(stateR[15:8], stateR[7:0], stateR[31:24], stateR[23:16], stateM[15:8]);
mixCol m5(stateR[47:40], stateR[39:32], stateR[63:56], stateR[55:48], stateM[47:40]);
mixCol m6(stateR[79:72], stateR[71:64], stateR[95:88], stateR[87:80], stateM[79:72]);
mixCol m7(stateR[111:104], stateR[103:96], stateR[127:120], stateR[119:112], stateM[111:104]);

mixCol m8(stateR[23:16], stateR[15:8], stateR[7:0], stateR[31:24], stateM[23:16]);
mixCol m9(stateR[55:48], stateR[47:40], stateR[39:32], stateR[63:56], stateM[55:48]);
mixCol m10(stateR[87:80], stateR[79:72], stateR[71:64], stateR[95:88], stateM[87:80]);
mixCol m11(stateR[119:112], stateR[111:104], stateR[103:96], stateR[127:120], stateM[119:112]);

mixCol m12(stateR[31:24], stateR[23:16], stateR[15:8], stateR[7:0], stateM[31:24]);
mixCol m13(stateR[63:56], stateR[55:48], stateR[47:40], stateR[39:32], stateM[63:56]);
mixCol m14(stateR[95:88], stateR[87:80], stateR[79:72], stateR[71:64], stateM[95:88]);
mixCol m15(stateR[127:120], stateR[119:112], stateR[111:104], stateR[103:96], stateM[127:120]);

endmodule


//mix module which uses the mixColumn matrix derivedinpn theory to change state

module mixCol(inp1, inp2, inp3, inp4, mix);

input [7:0]inp1, inp2, inp3, inp4;
output [7:0]mix;

assign mix[0] = inp1[7] ^ inp2[7] ^ inp2[0] ^ inp3[0] ^ inp4[0];
assign mix[1] = inp1[0] ^ inp1[7] ^ inp2[0] ^ inp2[1] ^ inp2[7] ^ inp3[1] ^ inp4[1];
assign mix[2] = inp1[1] ^ inp2[1] ^ inp2[2] ^ inp3[2] ^ inp4[2];
assign mix[3] = inp1[2] ^ inp1[7] ^ inp2[2] ^ inp2[3] ^ inp2[7] ^ inp3[3] ^ inp4[3];
assign mix[4] = inp1[3] ^ inp1[7] ^ inp2[3] ^ inp2[4] ^ inp2[7] ^ inp3[4] ^ inp4[4];
assign mix[5] = inp1[4] ^ inp2[4] ^ inp2[5] ^ inp3[5] ^ inp4[5];
assign mix[6] = inp1[5] ^ inp2[5] ^ inp2[6] ^ inp3[6] ^ inp4[6];
assign mix[7] = inp1[6] ^ inp2[6] ^ inp2[7] ^ inp3[7] ^ inp4[7];
            
endmodule