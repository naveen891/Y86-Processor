
module pc_tb;

reg [3:0] icode;
reg cnd;
reg [63:0] valC;
reg [63:0] valM;
reg [63:0] valP;

wire [63:0] pc;

pc nav(icode, cnd, valC, valM, valP, pc);
initial begin
	$dumpfile("pc_tb.vcd");
    	$dumpvars(0,pc_tb);
	icode=4;
	valC=50;
	cnd=0;
	valP=0;
	valM=12;

end
endmodule
