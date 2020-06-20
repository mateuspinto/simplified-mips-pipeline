module ProgramCounter (
    input  bit        clk,
    input  bit        reset,
    input  bit        hazard,
    input  bit [31:0] programCounterInput,
    output bit [31:0] programCounterOutput
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            programCounterOutput <= 0;
        end

        else if (hazard) begin
            programCounterOutput <= programCounterOutput;
        end

        else begin
            programCounterOutput <= programCounterInput;
		end
    end

endmodule