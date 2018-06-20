module Control
(
	Op_i,
	RegDst_o,
	ALUOp_o,
	ALUSrc_o,
	RegWrite_o,
);

input	[5:0]	Op_i;
output	[1:0]	ALUOp_o;
reg		[1:0]	ALUOp_o;
output	RegDst_o, ALUSrc_o, RegWrite_o;
reg 	RegDst_o, ALUSrc_o, RegWrite_o;

always @(Op_i) begin
	if(Op_i == 6'b000000) begin
		RegDst_o = 1;
		ALUOp_o = 2'b10;
		ALUSrc_o = 0;
		RegWrite_o = 1;
	end
	else if(Op_i == 6'b001000) begin
		RegDst_o = 0;
		ALUOp_o = 2'b00;
		ALUSrc_o = 1;
		RegWrite_o = 1;
	end
end

endmodule
