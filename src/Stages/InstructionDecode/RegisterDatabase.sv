module RegisterDatabase(
    input bit clk,
    input bit reset,
    input bit regWrite,
    input bit [25:21] readRegister1,
    input bit [20:16] readRegister2,
    input bit [15:11] writeRegister,
    input bit [31:0] writeData,
    output bit [31:0] readData1,
    output bit [31:0] readData2
);

bit [31:0] registers [31:0];

assign readData1 = registers[readRegister1];
assign readData2 = registers[readRegister2];

always_ff @(negedge clk) begin

    if(reset) begin
        registers[0] = 0;
    end

    else begin
        if (regWrite) begin
            if (writeRegister != 0) begin
                registers[writeRegister] <= writeData; 
            end
        end
    end
end

endmodule