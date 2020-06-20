module InstructionDecode(

    input bit clk,
    input bit reset,
    
    //Coming Instruction Fetch
    input bit [31:0] instructionInput,
    input bit [31:0] pc4Input,

    //Coming Write Back
    input bit regWriteInput,
    input bit [4:0] writeRegisterInput,
    input bit [31:0] writeDataInput,

    output bit [31:0] pc4Output,

    //From Controller 
    output bit memToRegOutput,
    output bit regWriteOutput,
    output bit memWriteOutput,
    output bit memReadOutput,
    output bit [3:0] aluOpOutput,
    output bit aluSrcOutput,
    output bit regDstOutput,
    output bit [1:0] branchOutput,

    output bit [31:0] immediateExtendedOutput,

    output bit [25:21] addressRsOutput,
    output bit [20:16] addressRtOutput,
    output bit [15:11] addressRdOutput,

    //From Register DB
    output bit [31:0] dataRsOutput,
    output bit [31:0] dataRtOutput,

    //To Instruction Fetch
    output bit jumpOutput,
    output bit [31:0] pcJumpOutput,

    output bit [5:0] funcOutput

);

bit [27:0] shiftLeft_2_26_28_bitsOutput;

assign pc4Output=pc4Input;
assign addressRsOutput=instructionInput[25:21];
assign addressRtOutput=instructionInput[20:16];
assign addressRdOutput=instructionInput[15:11];
assign pcJumpOutput={pc4Input[31:28], shiftLeft_2_26_28_bitsOutput};
assign funcOutput=instructionInput[5:0];

Controller controller (reset, instructionInput[31:26], regDstOutput, jumpOutput, branchOutput, memReadOutput, memToRegOutput, aluOpOutput, memWriteOutput, aluSrcOutput, regWriteOutput);
RegisterDatabase registerDatabase (clk, reset, regWriteInput, instructionInput[25:21], instructionInput[20:16], writeRegisterInput, writeDataInput, dataRsOutput, dataRtOutput);

//Immediate
SignalExtender16_32bits signalExtender16_32bitsBranch (instructionInput[15:0], immediateExtendedOutput);

//Jump
ShiftLeft_2_26_28_bits shiftLeft_2_26_28_bits (instructionInput[25:0], shiftLeft_2_26_28_bitsOutput);

endmodule