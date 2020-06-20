module InstructionMemory(
    input  bit        clk,
    input  bit        reset,
    input  bit [31:0] address,
    output bit [31:0] instruction
);

    bit [31:0] instructionMemory [255:0];

    assign instruction = instructionMemory[address[31:2]];

    always_ff @(posedge clk) begin
        if(reset) begin
        	$readmemb("instruction.txt",instructionMemory);
        end
    end
    
endmodule