
module memory_tb;
reg [3:0]icode;
reg [63:0] valE;
reg [63:0] valA;	
reg flag3;

wire  [63:0] valM;
wire dmem_error;
wire flag4;

memory nav(flag3,icode,ValE,ValA,ValM,dmem_error,flag4);
initial begin
        $dumpfile("memory_tb.vcd");
    	$dumpvars(0,memory_tb);
        flag3=1;
        icode=64'd6;
        valA=64'd4;
        valE=64'd8;
end
always @(*) begin
        $display("icode=%d valA=%d valE=%d valM=%d3",icode,valA,valE,valM);
end
endmodule


