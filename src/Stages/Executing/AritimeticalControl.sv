import MIPSConstants::*;

module AritimeticalControl(
    input bit reset,
    input bit [3:0] aluOp,
    input bit [5:0] func,
    output bit [3:0] aluControl
);

always_comb begin

    if (reset) begin
        aluControl <= ALU_ZERO;
    end

    else begin

        case(aluOp)

            ARCTRL_FUNC: begin // For R instructions

                case(func)
                FUNC_ADD: begin
                    aluControl <= ALU_ADD;
                end

                FUNC_SUB: begin
                    aluControl <= ALU_SUB;
                end

                FUNC_AND: begin
                    aluControl <= ALU_AND;
                end

                FUNC_OR: begin
                    aluControl <= ALU_OR;
                end

                FUNC_XOR: begin
                    aluControl <= ALU_XOR;
                end

                FUNC_SLT: begin
                    aluControl <= ALU_SLT;
                end

                FUNC_SLLV: begin
                    aluControl <= ALU_SLL;
        
                end

                FUNC_SRLV: begin
                    aluControl <= ALU_SRL;
                end

                FUNC_SRAV: begin
                    aluControl <= ALU_SRA;
        
                end

                default: begin 
                    aluControl <= ALU_ZERO;
                end

                endcase

            end // End of the R type functions

            ARCTRL_ADD: begin
                aluControl <= ALU_ADD;
    
            end

            ARCTRL_SUB: begin
                aluControl <= ALU_SUB;
    
            end

            ARCTRL_LU: begin
                aluControl <= ALU_LUI;
    
            end

            ARCTRL_AND: begin
                aluControl <= ALU_AND;
    
            end

            ARCTRL_OR: begin
                aluControl <= ALU_OR;
    
            end

            ARCTRL_XOR: begin
                aluControl <= ALU_XOR;
    
            end

            ARCTRL_SLT: begin
                aluControl <= ALU_SLT;
    
            end
            
            default: begin 
                    aluControl <= ALU_ZERO;
            end

        endcase
    end
end

endmodule