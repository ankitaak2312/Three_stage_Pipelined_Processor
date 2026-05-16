`include "define.v"

module memory(clk, rst, wen, addr, data_in, fileid, data_out);

input clk, rst, wen, fileid;
input [`ISIZE-1:0] addr;
input [`DSIZE-1:0] data_in;
output [`DSIZE-1:0] data_out;

reg [`DSIZE-1:0] mem [0:31];

// Hardcode instructions directly
initial begin
    mem[0]  = 32'h00000000; // NOP
    mem[1]  = 32'h05031000; // SUB $2,$8,$3
    mem[2]  = 32'h00430800; // ADD $1,$2,$3
    mem[3]  = 32'h0901F000; // AND $30,$8,$1
    mem[4]  = 32'h1502F800; // MUL $31,$8,$2
    mem[5]  = 32'h03fA5000; // ADD $10,$31,$26
    mem[6]  = 32'h18E40001; // ADDI $4,$7,1
    mem[7]  = 32'h00000000; // NOP
    mem[8]  = 32'h00000000; // NOP
end

assign data_out = mem[addr];

always @(posedge clk) begin
    if(wen)
        mem[addr] <= data_in;
end

endmodule