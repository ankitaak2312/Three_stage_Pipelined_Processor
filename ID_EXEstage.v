`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 16:12:28
// Design Name: 
// Module Name: ID_EXEstage
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ID_EXE_stage(
    input clk,
    input rst,
    input [31:0] rdata1_in,
    input [31:0] rdata2_in,
    input [31:0] imm_in,
    input [4:0] waddr_in,
    input [2:0] aluop_in,
    input alusrc_in,
    input wen_in,
    output reg [31:0] rdata1_out,
    output reg [31:0] rdata2_out,
    output reg [31:0] imm_out,
    output reg [4:0] waddr_out,
    output reg [2:0] aluop_out,
    output reg alusrc_out,
    output reg wen_out
);

always @(posedge clk) begin
    if (rst) begin
        rdata1_out <= 0;
        rdata2_out <= 0;
        imm_out <= 0;
        waddr_out <= 0;
        aluop_out <= 0;
        alusrc_out <= 0;
        wen_out <= 0;
    end else begin
        rdata1_out <= rdata1_in;
        rdata2_out <= rdata2_in;
        imm_out <= imm_in;
        waddr_out <= waddr_in;
        aluop_out <= aluop_in;
        alusrc_out <= alusrc_in;
        wen_out <= wen_in;
    end
end

endmodule
