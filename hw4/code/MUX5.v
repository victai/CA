module MUX5		// to rt or rd
(
	data1_i,
	data2_i,
	select_i,
	data_o
);

input	[4:0]	data1_i, data2_i;
input	select_i;
output	[4:0]	data_o;
reg		[4:0]	data_o;

always @(*) begin
	if (select_i == 0) begin
		data_o = data1_i;
	end
	else if (select_i == 1) begin
		data_o = data2_i;
	end
end

endmodule
