`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 16:09:03
// Design Name: 
// Module Name: PC
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
`include "define.v"

module PC(
    input clk,
    input rst,       
    input [`ISIZE - 1:0] nextPC,		 
    output reg [`ISIZE - 1:0] currPC
);

always @(posedge clk) begin
    if (rst)
        currPC <= 0;
    else
        currPC <= nextPC;
end

endmodule

