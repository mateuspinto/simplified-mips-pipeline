module InstructionFetch(
    input bit clk,
    input bit reset,

    input bit hazard,

    //Coming Instruction Decode
    input bit outputBrachControlInput,
    input bit [31:0] pcBranchInput,
    input bit jumpInput,
    input bit [31:0] pcJumpInput,

    //Go to Instruction Decode
    output bit [31:0] instructionOutput,
    output bit [31:0] pc4Output
);

bit [31:0] pcOutputDemuxJump, pc4, pcOutput, pcInput;
assign pc4Output=pc4;

InstructionMemory instructionMemory (clk, reset, pcOutput, instructionOutput);
ProgramCounter programCounter (clk, reset, hazard, pcInput, pcOutput);

AdderProgramCounter adderProgramCounter (clk, reset, pcOutput, pc4);
Mux2_1_32bits mux2_1_32bits0(jumpInput, pc4, pcJumpInput, pcOutputDemuxJump);
Mux2_1_32bits mux2_1_32bits1(outputBrachControlInput, pcOutputDemuxJump, pcBranchInput, pcInput);

endmodule 