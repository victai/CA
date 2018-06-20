module ALU
(
	data1_i,
	data2_i,
	ALUCtrl_i,
	data_o,
	Zero_o
);

input	[31:0]	data1_i, data2_i;
input	[2:0]	ALUCtrl_i;
output	[31:0]	data_o;
output	Zero_o;
reg		[31:0]	data_o;
reg		Zero_o;

always @(*) begin
	Zero_o = 0;
	if (ALUCtrl_i == 3'b000) begin
		data_o = data1_i & data2_i;
	end
	else if (ALUCtrl_i == 3'b001) begin
		data_o = data1_i | data2_i;
	end
	else if (ALUCtrl_i == 3'b010) begin
		data_o = data1_i + data2_i;
	end
	else if (ALUCtrl_i == 3'b110) begin
		data_o = data1_i - data2_i;
	end
	else if (ALUCtrl_i == 3'b011) begin
		data_o = data1_i * data2_i;
	end
	else begin
		data_o = Zero_o;
	end
end

endmodule
