module fetch (output [3:0] icode,output [3:0] ifun, output [3:0] rA, output [3:0] rB, input [63:0] pc, output [63:0] valP, output [63:0] valC, output iv, output ime,output flag1);

reg [3:0] icode;
reg [3:0] ifun;
reg [3:0] rA;
reg [3:0] rB; 
reg [63:0] valP; 
reg iv;
reg ime;
reg [63:0] valC;
reg [7:0] memad[20:0];
reg flag1;


initial begin
	iv=0;
	ime=0;
	valC = 0;
	$readmemh("input.txt",memad);
end

always @(pc) begin
flag1=0;
	icode = memad[pc][7:4];
	ifun = memad[pc][3:0];
	//$display("icode=%0d ifun=%0d",icode, ifun);
	if(icode>11)
		iv=1;
	if(pc>123456)
	begin
		ime=1;
	end
	else if(iv!=1 && ime!=1)
	begin
	case(icode)
		1:
        begin
			valP=pc+1;
        end
		2:
		begin
			valP=pc+2;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
		end
		3:
		begin
			valP=pc+10;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
			valC[7:0]=memad[pc+2][7:0];
			valC[15:8]=memad[pc+2][7:0];
			valC[23:16]=memad[pc+3][7:0];
			valC[31:24]=memad[pc+4][7:0];
			valC[39:32]=memad[pc+5][7:0];
			valC[47:40]=memad[pc+6][7:0];
			valC[55:48]=memad[pc+7][7:0];
			valC[63:56]=memad[pc+8][7:0];

		end
		4:
		begin
			valP=pc+10;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
			valC[7:0]=memad[pc+2][7:0];
			valC[15:8]=memad[pc+2][7:0];
			valC[23:16]=memad[pc+3][7:0];
			valC[31:24]=memad[pc+4][7:0];
			valC[39:32]=memad[pc+5][7:0];
			valC[47:40]=memad[pc+6][7:0];
			valC[55:48]=memad[pc+7][7:0];
			valC[63:56]=memad[pc+8][7:0];
		end
		5:
		begin
			valP=pc+10;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
			valC[7:0]=memad[pc+2][7:0];
			valC[15:8]=memad[pc+2][7:0];
			valC[23:16]=memad[pc+3][7:0];
			valC[31:24]=memad[pc+4][7:0];
			valC[39:32]=memad[pc+5][7:0];
			valC[47:40]=memad[pc+6][7:0];
			valC[55:48]=memad[pc+7][7:0];
			valC[63:56]=memad[pc+8][7:0];
		end
		6:
		begin 
		valP=pc+2;
		rA=memad[pc+1][7:4];
		rB=memad[pc+1][3:0];
		end
		7:
		begin
			valP=pc+2;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
		end
		8:
		begin
			valP=pc+2;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
		end
		9:
		begin
			valP=pc+2;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
		end
		10:
		begin
			valP=pc+4;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
			valC[7:0]=memad[pc+2][7:0];
		end
		11:
		begin
			valP=pc+4;
			rA=memad[pc+1][7:4];
			rB=memad[pc+1][3:0];
			valC[7:0]=memad[pc+2][7:0];
		end
	endcase
	flag1=1;
 //$display("icode=%d ifun=%d rA=%d rB=%d valc=%d",icode,ifun,rA,rB,valC);
	end
end
endmodule
