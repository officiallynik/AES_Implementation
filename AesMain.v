module AesMain(din, key, dout);

    input [127:0] din;
    input [127:0] key;
    output[127:0] dout;
    
    wire [127:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;
    
    wire [127:0] kout1, kout2, kout3, kout4, kout5, kout6, kout7, kout8, kout9;
	 
	assign out0 = din^key;
	 
    Round r1(.rc(4'b0000), .data(out0), .kin(key), .kout(kout1), .rndout(out1));
    Round r2(.rc(4'b0001), .data(out1), .kin(kout1), .kout(kout2), .rndout(out2));
    Round r3(.rc(4'b0010), .data(out2), .kin(kout2), .kout(kout3), .rndout(out3));
    Round r4(.rc(4'b0011), .data(out3), .kin(kout3), .kout(kout4), .rndout(out4));
    Round r5(.rc(4'b0100), .data(out4), .kin(kout4), .kout(kout5), .rndout(out5));
    Round r6(.rc(4'b0101), .data(out5), .kin(kout5), .kout(kout6), .rndout(out6));
    Round r7(.rc(4'b0110), .data(out6), .kin(kout6), .kout(kout7), .rndout(out7));
    Round r8(.rc(4'b0111), .data(out7), .kin(kout7), .kout(kout8), .rndout(out8));
    Round r9(.rc(4'b1000), .data(out8), .kin(kout8), .kout(kout9), .rndout(out9));

    Round_final r10(.rc(4'b1001), .rin(out9), .kin(kout9), .fout(dout));
    
endmodule