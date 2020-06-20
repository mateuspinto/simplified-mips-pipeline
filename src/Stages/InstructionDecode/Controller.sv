import MIPSConstants::*;

module Controller(
                  input bit reset,
                  input bit [31:26] instruction,
                  output bit regDst,
                  output bit jump,
                  output bit [1:0] branch,
                  output bit memRead,
                  output bit memToReg,
                  output bit [3:0] arctrl,
                  output bit memWrite,
                  output bit aluSrc,
                  output bit regWrite
                  );

    always_comb begin

        if(reset) begin
            regDst <= 0;
            jump <= 0;
            branch <= BRANCH_OFF;
            memRead <= 0;
            memToReg <= 0;
            arctrl <= ARCTRL_ZERO;
            memWrite <= 0;
            aluSrc <= 0;
            regWrite <= 0;
        end

        else begin

            case(instruction)

                R: begin
                    regDst <= 1;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_FUNC;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 1;
                end

                ADDI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_ADD;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                ANDI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_AND;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                ORI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_OR;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                XORI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_XOR;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                SLTI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_SLT;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                LUI: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_LU;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                SW: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_ADD;
                    memWrite <= 1;
                    aluSrc <= 1;
                    regWrite <= 0;
                end

                LW: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 1;
                    memToReg <= 1;
                    arctrl <= ARCTRL_ADD;
                    memWrite <= 0;
                    aluSrc <= 1;
                    regWrite <= 1;
                end

                BEQ: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_BEQ;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_SUB;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end

                BNE: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_BNE;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_SUB;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end

                J: begin
                    regDst <= 0;
                    jump <= 1;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_ZERO;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end
                
                default: begin
                    regDst <= 0;
                    jump <= 0;
                    branch <= BRANCH_OFF;
                    memRead <= 0;
                    memToReg <= 0;
                    arctrl <= ARCTRL_ZERO;
                    memWrite <= 0;
                    aluSrc <= 0;
                    regWrite <= 0;
                end
            endcase

        end
    end

endmodule