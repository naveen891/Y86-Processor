module execute(input flag2,input [3:0] icode,input [3:0] ifun,input [63:0] valC, input [63:0] valA, input [63:0] valB, output [63:0] valE, output cnd, output flag3);

//reg [3:0] icode,ifun;
reg [63:0] valE;
reg cnd;
reg flag3;

reg cc[2:0];
initial begin
	cc[0]=0; //ZF
	cc[1]=0; //SF
	cc[2]=0; //OF
	//icode=6;ifun=0;rA=4; rB=3;
end

always @(posedge flag2) begin
	flag3=0;
	case(icode)
		2:
			case(ifun)
				0:
				begin
					cnd=1;
				end
				1:
				begin
					if(cc[1]==1 || cc[0]==1)
						cnd=1;
					else
						cnd=0;
				end
				2:
				begin
					if(cc[1]==1 && cc[0]==1)
						cnd=1;
					else
						cnd=0;
				end
				3:
				begin
					if(cc[0]==1)
						cnd=1;
					else
						cnd=0;
				end
				4:
				begin
					if(cc[0]==0)
						cnd=1;
					else
						cnd=0;
				end
				5:
				begin
					if(cc[0]==1 || cc[1]==0)
						cnd=1;
					else
						cnd=0;
				end
				6:
				begin
					if(cc[0]==0 || cc[1]==0)
						cnd=1;
					else
						cnd=0;
				end
			endcase
			/*valE=0+valA;
			if(valE==0)
				cc[0]=1;
			else
				cc[1]=1;
		end*/
	       4:
	       begin
		       valE=valB+valC;

		       if(valC<0 && valB<0 && valE>0)
		       begin
			       cc[2]=1;
		       end
		       if(valC>=0 && valB>=0 && valE<0)
		       begin
			       cc[2]=1;
		       end
		       if(valE<0)
		       begin
			       cc[1]=1;
		       end
		       if(valE==0)
		       begin
			       cc[0]=1;
		       end
	       end
	       5:
	       begin
		       valE=valB+valC;

		       if(valC<0 && valB<0 && valE>0)
		       begin
			       cc[2]=1;
		       end
		       if(valC>=0 && valB>=0 && valE<0)
		       begin
			       cc[2]=1;
		       end
		       if(valE<0)
		       begin
			       cc[1]=1;
		       end
		       if(valE==0)
		       begin
			       cc[0]=1;
		       end
	       end
	       6:
	       begin
		       cc[0]= 0;
		       cc[1]=0;
		       cc[2]=0;
		       case(ifun)
			       0:
			       begin
				       valE=valA+valB;
				       $display("valE=%d",valE);
				       if(valA<0 && valB<0 && valE>0)
				       begin
					       cc[2]=1;
				       end
				       if(valA>=0 && valB>=0 && valE<0)
				       begin
					       cc[2]=1;
				       end
				       if(valE<0)
				       begin
					       cc[1]=1;
				       end
				       if(valE==0)
				       begin
					       cc[0]=1;
				       end
			       end
			       1:
			       begin
				       valE=valB-valA;
				       if((valA>0 && valB<0 && valE>0) || (valA<0 && valB>0 && valE<0))
				       begin
					       cc[2]=1;
				       end
				       if(valE<0)
				       begin
					       cc[1]=1;
				       end
				       if(valE==0)
				       begin
					       cc[0]=1;
				       end
			       end
			       2:
			       begin
				       valE=valA & valB;
                        $display("valE=%d",valE);
				       if(valE==0)
				       begin
					       cc[0]=1;
				       end
			       end
			       3: 
			       begin
				       valE=valA^valB;
				       if(valE==0)
				       begin
					       cc[0]=1;
				       end
			       end
		       endcase
	       end
	       7:
	       begin
		       case(ifun)
			       0:
			       begin
				       cnd=1;
			       end
			       1:
			       begin
				       if(cc[1]==1 || cc[0]==1)
					       cnd=1;
				       else
					       cnd=0;
			       end
			       2:
			       begin
				       if(cc[1]==1 && cc[0]==1)
					       cnd=1;
				       else
					       cnd=0;
			       end
			       3:
			       begin
				       if(cc[0]==1)
					       cnd=1;
				       else
					       cnd=0;
			       end
			       4:
			       begin
				       if(cc[0]==0)
					       cnd=1;
				       else
					       cnd=0;
			       end
			       5:
			       begin
				       if(cc[0]==1 || cc[1]==0)
					       cnd=1;
				       else
					       cnd=0;
			       end
			       6:
			       begin
				       if(cc[0]==0 || cc[1]==0)
					       cnd=1;
				       else
					       cnd=0;
			       end
		       endcase
	       end
        8:
            begin
                valE=valB-8;
            end
        9:
            begin
                valE=valB+8;
            end     
        10:
            begin
                valE=valB-8;
            end
        11:
            begin
                valE=valB+8;
            end
       endcase
       flag3=1;
      // $display("valE=%d",valE);
	end

	endmodule
