`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 16:14:46
// Design Name: 
// Module Name: test_bench_3_stage_pipeline
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

module test_bench_3_stage_pipeline;

reg clk;
reg rst;

wire [31:0] aluout;

pipelined_3stage uut (
    .clk(clk), 
    .rst(rst), 
    .aluout(aluout)
);


always #10 clk = ~clk;


initial begin
    clk = 0;
    rst = 1;

    #50;      
    rst = 0;   

    #500;       

    $finish;
end

endmodule

