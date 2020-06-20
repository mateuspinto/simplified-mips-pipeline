module ExMem(
    input bit clk,
    input bit reset,
    input bit stall,
    input bit flush,

    input bit mem_to_reg_input,
    input bit reg_write_input,
    input bit mem_write_input,
    input bit mem_read_input,
    input bit [31:0] alu_result_input,
    input bit [31:0] mem_write_data_input,
    input bit [4:0] reg_write_address_input,

    output bit mem_to_reg_output,
    output bit reg_write_output,
    output bit mem_write_output,
    output bit mem_read_output,
    output bit [31:0] alu_result_output,
    output bit [31:0] mem_write_data_output,
    output bit [4:0] reg_write_address_output
);

    always_ff @(posedge clk) begin

        if(reset | flush) begin
            mem_to_reg_output <= 0;
            reg_write_output <= 0;
            mem_write_output <= 0;
            mem_read_output <= 0;
            alu_result_output <= 0;
            mem_write_data_output <= 0;
            reg_write_address_output <= 0;
        end

        else if (stall) begin
            mem_to_reg_output <= mem_to_reg_output;
            reg_write_output <= reg_write_output;
            mem_write_output <= mem_write_output;
            mem_read_output <= mem_read_output;
            alu_result_output <= alu_result_output;
            mem_write_data_output <= mem_write_data_output;
            reg_write_address_output <= reg_write_address_output;
        end

        else begin
            mem_to_reg_output <= mem_to_reg_input;
            reg_write_output <= reg_write_input;
            mem_write_output <= mem_write_input;
            mem_read_output <= mem_read_input;
            alu_result_output <= alu_result_input;
            mem_write_data_output <= mem_write_data_input;
            reg_write_address_output <= reg_write_address_input;
        end    

    end

endmodule