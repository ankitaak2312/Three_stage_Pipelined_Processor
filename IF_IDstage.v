`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 16:11:03
// Design Name: 
// Module Name: IF_IDstage
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

module IF_ID_stage(
    input clk,
    input rst,
    input [31:0] inst_in,
    output reg [31:0] inst_out
);

always @(posedge clk) begin
    if (rst)
        inst_out <= 0;
    else
        inst_out <= inst_in;
end

endmodule