

module decode_tb;

reg [3:0] rA;
reg [3:0] rB;
reg [3:0] icode;
reg flag1;
wire flag2;

wire [63:0] valA;
wire [63:0] valB;

decode nav(flag1,rA,rB,icode,valA,valB,flag2);
initial begin
	$dumpfile("decode_tb.vcd");
    	$dumpvars(0,decode_tb);
	icode=6;
	rA=4;
	rB=2;
    flag1=1;
end
always @(valA) begin
	$display("icode=%d rA=%d rB=%d valA=%d valB=%d",icode,rA,rB,valA,valB);
end
endmodule
