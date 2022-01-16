`timescale 1ns/1ps
`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "memory.v"
`include "pc.v"

module processor;

	wire [3:0] icode; 
	wire [3:0] ifun;
	wire [63:0] pc;
	wire [3:0] rA;
	wire [3:0] rB;
	wire  [63:0] valC;
	wire  [63:0] valP;
	wire iv;
	wire ime;
	wire flag1;
	wire  [63:0] valA;
	wire  [63:0] valB;
	wire flag2;
	wire  [63:0] valE;
	wire Cnd;
	//wire [2:0] cc;
	wire flag3;
	wire  [63:0] valM;
	wire dmem_error;
	wire flag4;
	reg clk;

	fetch p9 (icode,ifun, rA, rB, pc, valP, valC, iv, ime,flag1);

	decode p10 (flag1,rA, rB, icode, valA, valB, flag2);

	execute p13 (flag2,icode,ifun,valC, valA, valB, valE, cnd, flag3);
	
	memory p14 (flag3,icode,valE,valA, valM, dmem_error, flag4);
	
	pc p15 (clk,icode, cnd, valC, valM, valP, pc);


	initial begin

		$dumpfile("processor.vcd");
        $dumpvars(0,processor);

        clk = 0;

	end

	always begin
	 	#5 clk = ~clk;
	 	if(icode == 0)
	 	begin
	 		$finish;
	 	end
	 end


endmodule
