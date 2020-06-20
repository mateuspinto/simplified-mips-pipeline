module AdderProgramCounter(
    input bit clk,
    input bit reset,
    input bit [31:0] pcInput,
    output bit [31:0] pcOutput
);

always_comb begin

    if(reset) begin
        pcOutput <= 0;
    end

    else begin
        pcOutput <= pcInput + 4;
    end
    
end

endmodule