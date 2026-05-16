`timescale 1ns / 1ps
`include "define.v"

module pipelined_3stage(
    input clk,				
    input rst,
    output [`DSIZE-1:0] aluout
    
);
wire [`ISIZE-1:0] nextPC, currPC;
wire [`ISIZE-1:0] inst_fetched;
wire [`ISIZE-1:0] inst_ID;

wire wen_cntrl, alusrc_cntrl, regdst_cntrl;
wire [2:0] aluop_cntrl;

wire [`DSIZE-1:0] rdata1_ID, rdata2_ID;
wire [`DSIZE-1:0] imm_ID;
wire [`ASIZE-1:0] waddr_ID;


wire [`DSIZE-1:0] rdata1_EXE, rdata2_EXE, imm_EXE;
wire [2:0] aluop_EXE;
wire alusrc_EXE;
wire [`ASIZE-1:0] waddr_EXE;
wire [`DSIZE-1:0] alu_b;
wire wen_EXE;


assign nextPC = currPC + 1;

PC pc_inst(
    .clk(clk),
    .rst(rst),       
    .nextPC(nextPC),		 
    .currPC(currPC)
);


memory IMEM(
    .clk(clk),
    .rst(rst),
    .wen(1'b0),
    .addr(currPC),
    .data_in(32'b0),
    .fileid(1'b0),
    .data_out(inst_fetched)
);


IF_ID_stage if_id_reg(
    .clk(clk),
    .rst(rst),
    .inst_in(inst_fetched),
    .inst_out(inst_ID)
);


control ctrl_inst(
    .inst_cntrl(inst_ID[31:26]), 
    .wen_cntrl(wen_cntrl),
    .alusrc_cntrl(alusrc_cntrl),
    .regdst_cntrl(regdst_cntrl),
    .aluop_cntrl(aluop_cntrl)
);


assign waddr_ID = regdst_cntrl ? inst_ID[15:11] : inst_ID[20:16];

assign imm_ID = {{16{inst_ID[15]}}, inst_ID[15:0]};


regfile rf_inst(
    .clk(clk),
    .rst(rst),
    .wen(wen_EXE),   
    .raddr1(inst_ID[25:21]), 
    .raddr2(inst_ID[20:16]), 
    .waddr(waddr_EXE),
    .wdata(aluout),
    .rdata1(rdata1_ID),
    .rdata2(rdata2_ID)
);

ID_EXE_stage id_exe_reg(
    .clk(clk),
    .rst(rst),
    .rdata1_in(rdata1_ID),
    .rdata2_in(rdata2_ID),
    .imm_in(imm_ID),
    .aluop_in(aluop_cntrl),
    .alusrc_in(alusrc_cntrl),
    .waddr_in(waddr_ID),
    .wen_in(wen_cntrl),     
    .wen_out(wen_EXE),      
    .rdata1_out(rdata1_EXE),
    .rdata2_out(rdata2_EXE),
    .imm_out(imm_EXE),
    .aluop_out(aluop_EXE),
    .alusrc_out(alusrc_EXE),
    .waddr_out(waddr_EXE)
);


assign alu_b = alusrc_EXE ? imm_EXE : rdata2_EXE;


alu alu_inst(
    .a(rdata1_EXE),
    .b(alu_b),
    .op(aluop_EXE),
    .out(aluout)
);

endmodule