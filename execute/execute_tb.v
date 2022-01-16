
module execute_tb;

reg [3:0] icode;
reg [3:0] ifun;
reg [3:0] rA;
reg [3:0] rB;
reg [63:0] valC,valA,valB;
reg flag2;

wire [63:0] valE;
wire cnd;
wire flag3;

execute nav(flag2,icode, ifun, valC, valA, valB, valE, cnd,flag3);
initial begin
	$dumpfile("execute_tb.vcd");
    	$dumpvars(0,execute_tb);
        flag2=1;
        icode=6;
        ifun=0;
        rA=4;
        rB=2;
	    valA=4;
	    valB=2;
	    valC=0;
end

always @(*) begin
        $display("icode=%d ifun=%d valC=%d valA=%d valB=%d valE=%d cnd=%d",icode,ifun,valC,valA,valB,valE,cnd);
end

endmodule

