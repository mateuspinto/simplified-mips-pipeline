module Memory(
    input bit clk,
    input bit reset,

    input bit memToRegInput,
    input bit regWriteInput,
    input bit memWriteInput,
    input bit memReadInput,

    input bit [31:0] aluResultInput,

    input bit [31:0] memWriteDataInput,

    input bit [4:0] regWriteAddressInput,

    output bit memToRegOutput,
    output bit regWriteOutput,

    output bit [31:0] dataMemoryOutput,

    output bit [31:0] aluResultOutput,

    output bit [4:0] regWriteAddressOutput

);

assign aluResultOutput=aluResultInput;
assign memToRegOutput=memToRegInput;
assign regWriteOutput=regWriteInput;
assign regWriteAddressOutput=regWriteAddressInput;

MemoryDatabase memoryDatabase(clk, reset, memWriteInput, aluResultInput, memWriteDataInput, dataMemoryOutput);

endmodule

