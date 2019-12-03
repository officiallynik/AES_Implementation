//After changing initial state using subbytes new state is again changed using shiftRow technique

module ShiftRows(stateB, stateR);

input [127:0] stateB;
output [127:0] stateR;

//state change for 4th row
assign stateR[127:120] = stateB[127:120];  
assign stateR[95:88] = stateB[95:88]; 
assign stateR[63:56] = stateB[63:56]; 
assign stateR[31:24] = stateB[31:24];

//state change for 3rd row   
assign  stateR[119:112] = stateB[87:80];
assign  stateR[87:80] = stateB[55:48];
assign  stateR[55:48] = stateB[23:16];
assign  stateR[23:16] = stateB[119:112];

//state change for 2nd row   
assign  stateR[111:104] = stateB[47:40];
assign  stateR[79:72] = stateB[15:8];
assign  stateR[47:40] = stateB[111:104];
assign  stateR[15:8] = stateB[79:72];

//state change for 1st row   
assign  stateR[103:96] = stateB[7:0];
assign  stateR[71:64] = stateB[103:96];
assign  stateR[39:32] = stateB[71:64];
assign  stateR[7:0] = stateB[39:32]; 

endmodule