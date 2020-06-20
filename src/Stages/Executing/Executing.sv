module Executing(

    input bit clk,
    input bit reset,

    input bit [31:0] pc4Input,

    input bit memToRegInput,
    input bit regWriteInput,
    input bit memWriteInput,
    input bit memReadInput,

    input bit [3:0] aluOpInput,
    input bit aluSrcInput,
    input bit regDstInput,
    input bit [1:0] branchInput,

    input bit [31:0] immediateExtendedInput,

    input bit [25:21] addressRsInput,
    input bit [20:16] addressRtInput,
    input bit [15:11] addressRdInput,

    input bit [31:0] dataRsInput,
    input bit [31:0] dataRtInput,

    input bit [5:0] funcInput,

    input bit [1:0] forwardingMux0Input,
    input bit [1:0] forwardingMux1Input,

    input bit [31:0] regWriteDataWbInput,
    input bit [31:0] aluResultMemInput,

    output bit memToRegOutput,
    output bit regWriteOutput,
    output bit memWriteOutput,
    output bit memReadOutput,

    output bit [31:0] aluResultOutput,

    output bit [31:0] memWriteDataOutput,

    output bit [4:0] regWriteRegisterOutput,

    output bit branchControlOutput,

    output bit [31:0] pcBranchOutput
);

bit aluResultZeroOutput;
bit [3:0] aluControl;
bit [31:0] mux3_1_32bits0Output, mux3_1_32bits1Output, mux2_1_32bits0Output, shiftLeft_2_32bitsOutput;
 
assign memToRegOutput=memToRegInput;
assign regWriteOutput=regWriteInput;
assign memWriteOutput=memWriteInput;
assign memReadOutput=memReadInput;
assign memWriteDataOutput=mux3_1_32bits1Output;

Mux3_1_32bits mux3_1_32bits0 (forwardingMux0Input, dataRsInput, aluResultMemInput, regWriteDataWbInput, mux3_1_32bits0Output);
Mux3_1_32bits mux3_1_32bits1 (forwardingMux1Input, dataRtInput, aluResultMemInput, regWriteDataWbInput, mux3_1_32bits1Output);

Mux2_1_32bits mux2_1_32bits0 (aluSrcInput, mux3_1_32bits1Output, immediateExtendedInput, mux2_1_32bits0Output);

Mux2_1_5bits mux2_1_5bits0 (regDstInput, addressRtInput, addressRdInput, regWriteRegisterOutput);

AritimeticalControl aritimeticalControl (reset, aluOpInput, funcInput, aluControl);
Alu alu (reset, aluControl, mux3_1_32bits0Output, mux2_1_32bits0Output, aluResultOutput, aluResultZeroOutput);

ShiftLeft_2_32bits shiftLeft_2_32bits(immediateExtendedInput, shiftLeft_2_32bitsOutput);
Adder_32bits adder_32bits (shiftLeft_2_32bitsOutput, pc4Input, pcBranchOutput);

BranchControl branchControl (reset, branchInput, aluResultZeroOutput, branchControlOutput);


endmodule