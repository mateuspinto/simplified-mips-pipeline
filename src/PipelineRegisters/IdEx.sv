module IdEx(
    input bit clk,
    input bit reset,
    input bit stall,
    input bit flush,

    input bit [31:0] pc_4_input,
    input bit mem_to_reg_input,
    input bit reg_write_input,
    input bit mem_write_input,
    input bit mem_read_input,
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

    output bit [31:0] pc4Output,
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
    output bit [31:0] dataRsOutput,
    output bit [31:0] dataRtOutput,
    output bit [5:0] funcOutput
);

    always_ff @(posedge clk) begin 

        if(reset | flush)begin
            pc4Output <= 0;
            memToRegOutput <= 0;
            regWriteOutput <= 0;
            memWriteOutput <= 0;
            memReadOutput <= 0;
            aluOpOutput <= 0;
            aluSrcOutput <= 0;
            regDstOutput <= 0;
            branchOutput <= 0;
            immediateExtendedOutput <= 0;
            addressRsOutput <= 0;
            addressRtOutput <= 0;
            addressRdOutput <= 0;
            dataRsOutput <= 0;
            dataRtOutput <= 0;
            funcOutput <= 0;
        end

        else if (stall) begin
            pc4Output <= pc4Output;
            memToRegOutput <= memToRegOutput;
            regWriteOutput <= regWriteOutput;
            memWriteOutput <= memWriteOutput;
            memReadOutput <= memReadOutput;
            aluOpOutput <= aluOpOutput;
            aluSrcOutput <= aluSrcOutput;
            regDstOutput <= regDstOutput;
            branchOutput <= branchOutput;
            immediateExtendedOutput <= immediateExtendedOutput;
            addressRsOutput <= addressRsOutput;
            addressRtOutput <= addressRtOutput;
            addressRdOutput <= addressRdOutput;
            dataRsOutput <= dataRsOutput;
            dataRtOutput <= dataRtOutput;
            funcOutput <= funcOutput;
        end

        else begin
            pc4Output <= pc_4_input;
            memToRegOutput <= mem_to_reg_input;
            regWriteOutput <= reg_write_input;
            memWriteOutput <= mem_write_input;
            memReadOutput <= mem_read_input;
            aluOpOutput <= aluOpInput;
            aluSrcOutput <= aluSrcInput;
            regDstOutput <= regDstInput;
            branchOutput <= branchInput;
            immediateExtendedOutput <= immediateExtendedInput;
            addressRsOutput <= addressRsInput;
            addressRtOutput <= addressRtInput;
            addressRdOutput <= addressRdInput;
            dataRsOutput <= dataRsInput;
            dataRtOutput <= dataRtInput;
            funcOutput <= funcInput;
        end
        
    end

endmodule