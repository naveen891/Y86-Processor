module decode(input flag1,input [3:0] rA, input [3:0] rB, input [3:0] icode, output [63:0] valA, output [63:0] valB, output flag2);
 
reg [63:0] regf [15:0];
reg [63:0] valA;
reg [63:0] valB;
reg flag2;

initial begin
	regf[0]=64'd0;
	regf[1]=64'd1;
	regf[2]=64'd2;
	regf[3]=64'd3;
	regf[4]=64'd4;
	regf[5]=64'd5;
	regf[6]=64'd6;
	regf[7]=64'd7;
	regf[8]=64'd8;
	regf[9]=64'd9;
	regf[10]=64'd10;
	regf[11]=64'd11;
	regf[12]=64'd12;
	regf[13]=64'd13;
	regf[14]=64'd14;
	regf[15]=64'd15;
end

always @(posedge flag1) begin
flag2=0;
	case(icode)
		1:
		begin
			valA=0;
			valB=0;
		end
		2:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		3:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		4:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		5:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		6:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		7:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		8:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		9:
		begin
			valA=regf[rA];
			valB=regf[rB];
		end
		10:
		begin
			valA=regf[rA];
			valB=regf[4];
		end
		11:
		begin
			valA=regf[rA];
			valB=regf[4];
		end
	endcase
flag2=1;
end
endmodule
