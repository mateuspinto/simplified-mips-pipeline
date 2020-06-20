module MemoryDatabase(
    input bit clk,
    input bit reset,
    input bit memWrite,
    input bit [31:0] address,
    input bit [31:0] writeData,
    output bit [31:0] readData
);


bit [31:0] memory [1023:0];
assign readData = memory[address[11:2]];

always_ff @(negedge clk) begin
    if (memWrite) begin
        memory[address[31:2]] <= writeData;
    end
end

endmodule