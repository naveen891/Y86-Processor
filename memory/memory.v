module memory(input flag3,input [3:0]icode,input [63:0]ValE,input  [63:0]ValA, output  [63:0]ValM,output dmem_error,output flag4);

reg dmem_error;
reg iv;
reg flag4;
reg ime;
reg  [63:0]ValM;
//input signed [63:0]ValA;
reg mem_read;
reg [63:0]M[0:1023];
reg [63:0] valP;
reg [63:0]S[0:1023];
reg [63:0] res;
reg mem_write;




initial begin
    //reg iv=0;
	S[0]=200;
	S[1]=210;
	S[2]=220;
	S[3]=230;
    //reg ime=0;
	M[0]=100;
	M[1]=110;
	M[2]=120;
	M[3]=130;
	M[8]=3;
   	ValM=0;
	//reg mem_read=0;
	dmem_error=0;
	//reg mem_write=0;
end

always @(posedge flag3) begin
	flag4=0;
	case(icode)
		4: begin
			if(ValE>1023) 
			begin
				dmem_error=1;
			end
			else
			begin
				M[ValE]=ValA;
				//mem_write=1;
			end
		end
		5: begin
			if(ValE>1023)
			begin	
				dmem_error=1;
			end
			else
			begin
				ValM=M[ValE];
				//mem_read=1;
			end
		end
		10: begin
			if(ValE>1023)
			begin
				dmem_error=1;
			end
			else
			begin
				S[ValE]=ValA;
				//mem_write=1;
			end
		end
		11: begin
			if(ValA>1023) 
			begin
				dmem_error=1;
			end
			else
			begin
				ValM=S[ValA];
				//mem_read=1;
			end
		end
	endcase
	flag4=1;
    //$display("memory");
end
endmodule
