module TB_Aes();

reg [127:0]a,b;
wire [127:0]out;


reg [127:0] amem [0:9];
reg [127:0] bmem [0:9];
reg [127:0] ymem [0:9];

reg [127:0]out1;

integer i;

initial
begin
$readmemh("C:/Users/Nikhil/Desktop/AES/Input.txt", amem);
$readmemh("C:/Users/Nikhil/Desktop/AES/Key.txt", bmem);
$readmemh("C:/Users/Nikhil/Desktop/AES/Output.txt", ymem);
end

AesMain m0(.din(a), .key(b), .dout(out));

initial
begin

	for(i=0; i<10; i=i+1)
	begin
		#10 a=amem[i]; b=bmem[i]; out1=ymem[i];

		if(out!=out1)
		begin
			$display("Encryption Error....");
		end
	end

end

endmodule