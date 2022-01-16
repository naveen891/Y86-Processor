`timescale 1ns/1ps

module fetch_tb;

reg [63:0] pc;
wire [3:0] icode;
wire [3:0] ifun;
wire [3:0] rA;
wire [3:0] rB; 
wire [63:0] valp; 
wire iv;
wire ime;
wire [63:0] valc;

fetch uut (icode, ifun,  rA, rB,  pc,  valp, valc,  iv,  ime,flag1);
initial begin

	pc=0;
	$dumpfile("fetch_tb.vcd");
    	$dumpvars(0,fetch_tb);

	//$display("icode=%d ifun=%d rA=%d rB=%d valc=%d",icode,ifun,rA,rB,valc);
end
always @(pc) begin
	        $display("icode=%d ifun=%d rA=%d rB=%d valc=%d",icode,ifun,rA,rB,valc);

end
endmodule


