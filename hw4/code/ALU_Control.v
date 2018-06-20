module ALU_Control
(
	funct_i,
	ALUOp_i,
	ALUCtrl_o
);

input	[5:0]	funct_i;
input	[1:0]	ALUOp_i;
output	[2:0]	ALUCtrl_o;
reg		[2:0]	ALUCtrl_o;

always @(funct_i or ALUOp_i) begin
	if (ALUOp_i == 2'b10) begin
		case(funct_i)
			6'b100100:	ALUCtrl_o = 3'b000;		//And
			6'b100101:	ALUCtrl_o = 3'b001;		//Or
			6'b100000:	ALUCtrl_o = 3'b010;		//Add
			6'b100010:	ALUCtrl_o = 3'b110;		//Sub
			6'b011000:	ALUCtrl_o = 3'b011;		//Mul
		endcase
	end
	else if (ALUOp_i == 2'b00) begin
		ALUCtrl_o = 3'b010;
	end
end

endmodule
