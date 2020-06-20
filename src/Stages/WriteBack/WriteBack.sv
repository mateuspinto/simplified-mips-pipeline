module WriteBack(
    input bit memToReg,
    input bit [31:0] aluOutput,
    input bit [31:0] memoryOutput,
    output bit [31:0] registerDatabaseInput
);

Mux2_1_32bits muxWriteBack (memToReg, aluOutput, memoryOutput, registerDatabaseInput);


endmodule