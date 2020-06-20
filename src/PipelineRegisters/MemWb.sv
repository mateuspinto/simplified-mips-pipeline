module MemWb(
    input bit clk,
    input bit reset,
    input bit stall,
    input bit flush,

    input bit memToRegInput,
    input bit regWriteInput,
    input bit [31:0] dataMemoryInput,
    input bit [31:0] aluResultInput,
    input bit [4:0] regWriteAddressInput,

    output bit memToRegOutput,
    output bit regWriteOutput,
    output bit [31:0] dataMemoryOutput,
    output bit [31:0] aluResultOutput,
    output bit [4:0] regWriteAddressOutput
);

    always_ff @(posedge clk) begin

        if (reset | flush) begin
            memToRegOutput <= 0;
            regWriteOutput <= 0;
            dataMemoryOutput <= 0;
            aluResultOutput <= 0;
            regWriteAddressOutput <= 0;
        end

        else if (stall) begin
            memToRegOutput <= memToRegOutput;
            regWriteOutput <= regWriteOutput;
            dataMemoryOutput <= dataMemoryOutput;
            aluResultOutput <= aluResultOutput;
            regWriteAddressOutput <= regWriteAddressOutput;
        end

        else begin
            memToRegOutput <= memToRegInput;
            regWriteOutput <= regWriteInput;
            dataMemoryOutput <= dataMemoryInput;
            aluResultOutput <= aluResultInput;
            regWriteAddressOutput <= regWriteAddressInput;
        end

    end

endmodule