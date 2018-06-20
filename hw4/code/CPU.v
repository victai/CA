module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire	[31:0]	inst_addr, inst;
wire	[31:0]	pc;
wire	[31:0]	MUX_ALUSrc_data1, MUX_ALUSrc_data2;
wire	[4:0]	RDaddr;
wire	[1:0]	ALUOp;
wire			MUX_RegDst_select_i, MUX_ALUSrc_select_i, RegWrite;
wire	[31:0]	RDdata, ALU_data1, ALU_data2;
wire	[2:0]	ALUCtrl;

Control Control(
    .Op_i       (inst[31:26]),
    .RegDst_o   (MUX_RegDst_select_i),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (MUX_ALUSrc_select_i),
    .RegWrite_o (RegWrite)
);

Adder Add_PC(
    .data1_in   (inst_addr),
    .data2_in   (32'd4),
    .data_o     (pc)
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (pc),
    .pc_o       (inst_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (inst_addr), 
    .instr_o    (inst)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (inst[25:21]),
    .RTaddr_i   (inst[20:16]),
    .RDaddr_i   (RDaddr), 
    .RDdata_i   (RDdata),
    .RegWrite_i (RegWrite), 
    .RSdata_o   (ALU_data1), 
    .RTdata_o   (MUX_ALUSrc_data1) 
);

MUX5 MUX_RegDst(	// to rt or rd
    .data1_i    (inst[20:16]),
    .data2_i    (inst[15:11]),
    .select_i   (MUX_RegDst_select_i),
    .data_o     (RDaddr)
);

MUX32 MUX_ALUSrc(	// from register or immediate
    .data1_i    (MUX_ALUSrc_data1),
    .data2_i    (MUX_ALUSrc_data2),
    .select_i   (MUX_ALUSrc_select_i),
    .data_o     (ALU_data2)
);

Sign_Extend Sign_Extend(
    .data_i     (inst[15:0]),
    .data_o     (MUX_ALUSrc_data2)
);

ALU ALU(
    .data1_i    (ALU_data1),
    .data2_i    (ALU_data2),
    .ALUCtrl_i  (ALUCtrl),
    .data_o     (RDdata),
    .Zero_o     ()
);

ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALUCtrl)
);

endmodule

