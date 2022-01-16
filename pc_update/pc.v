
module pc(input clk,input[3:0] icode, input cnd, input [63:0] valC, input [63:0] valM, input [63:0] valP, output [63:0] pc);

reg [63:0] pc;

initial begin
	pc=0;
end

always @(posedge clk) begin
	case(icode)
		1:
		begin
			pc=valP;
		end
		2:
		begin
			pc=valP;
		end
		3:
		begin
			pc=valP;
		end
		4:
		begin
			pc=valP;
		end
		5:
		begin
			pc=valP;
		end
		6:
		begin
			pc=valP;
		end
		7:
		begin
			if(cnd==1)
				pc=valC;
			else
				pc=valP;
		end
		8:
		begin
			pc=valP;
		end
		9:
		begin
			pc=valP;
		end
		10:
		begin
			pc=valP;
		end
		11:
		begin
			pc=valP;
		end
	endcase
//$display("icode=%0d Cnd=%0d valC=%0d valM=%0d valP=%0d pc=%0d",icode, cnd, valC, valM, valP, pc);

end
endmodule
