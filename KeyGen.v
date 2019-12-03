module KeyGen(rc, kin, kout);
    
    input [3:0] rc;
    input [127:0] kin;
    output [127:0] kout;
   
    wire [31:0] w0, w1, w2, w3, tem;
          
    assign w0 = kin[31:0];
    assign w1 = kin[63:32];
    assign w2 = kin[95:64];
    assign w3 = kin[127:96];
    
    assign kout[31:0]   = w3 ^ tem ^ rcon(rc) ^ w2 ^ w1 ^ w0;
    assign kout[63:32]  = w3 ^ tem ^ rcon(rc) ^ w2 ^ w1;
    assign kout[95:64]  = w3 ^ tem ^ rcon(rc) ^ w2;   
    assign kout[127:96] = w3 ^ tem ^ rcon(rc);

    SBox a1(.in(w0[23:16]), .out(tem[31:24]));
    SBox a2(.in(w0[15:8]), .out(tem[23:16]));
    SBox a3(.in(w0[7:0]), .out(tem[15:8]));
    SBox a4(.in(w0[31:24]), .out(tem[7:0]));

    function [31:0]	rcon;

      input	[3:0]	rc;
      case(rc)	
         4'h0: rcon=32'h01_00_00_00;
         4'h1: rcon=32'h02_00_00_00;
         4'h2: rcon=32'h04_00_00_00;
         4'h3: rcon=32'h08_00_00_00;
         4'h4: rcon=32'h10_00_00_00;
         4'h5: rcon=32'h20_00_00_00;
         4'h6: rcon=32'h40_00_00_00;
         4'h7: rcon=32'h80_00_00_00;
         4'h8: rcon=32'h1b_00_00_00;
         4'h9: rcon=32'h36_00_00_00;
         default: rcon=32'h00_00_00_00;
       endcase

    endfunction

endmodule
