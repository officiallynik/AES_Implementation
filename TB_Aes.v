module TB_Aes();

reg [127:0]in,key;
wire [127:0]out;


reg [127:0] inmem [0:9];
reg [127:0] keymem [0:9];
reg [127:0] outmem [0:9];

reg [127:0]out1;

integer i;

initial
begin
$readmemh("C:/Users/Nikhil/Desktop/AES/Input.txt", inmem);
$readmemh("C:/Users/Nikhil/Desktop/AES/Key.txt", keymem);
$readmemh("C:/Users/Nikhil/Desktop/AES/Output.txt", outmem);
end

AesMain m0(.din(in), .key(key), .dout(out));

initial
begin

	for(i=0; i<10; i=i+1)
	begin
		#10 in=inmem[i]; key=keymem[i]; out1=outmem[i];
	end

end

endmodule