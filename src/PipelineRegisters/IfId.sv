module IfId(
    input bit clk,
    input bit reset,
    input bit stall,
    input bit flush,

    input bit [31:0] pcInput,
    input bit [31:0] instructionInput,
    
    output bit [31:0] pcOutput,
    output bit [31:0] instructionOutput
);

    always_ff @(posedge clk) begin 

        if (reset | flush) begin
            pcOutput <= 0;
            instructionOutput <= 0;
        end

        else if (stall) begin
            pcOutput <= pcOutput;
            instructionOutput <= instructionOutput;
        end

        else begin
            pcOutput <= pcInput;
            instructionOutput <= instructionInput;
        end

    end

endmodule