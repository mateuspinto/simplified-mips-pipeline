import MIPSConstants::*;

module BranchControl(
    input bit reset,

    input bit [1:0] branchInput,
    input bit zeroTestInput,

    output bit branchControlOutput
);

always_comb begin

    if(reset)begin
        branchControlOutput <= 0;
    end

    else begin
        case(branchInput)

            BRANCH_OFF: begin
                branchControlOutput <= 0;
            end

            BRANCH_BEQ: begin
                branchControlOutput<=zeroTestInput;
            end

            BRANCH_BNE: begin
                branchControlOutput<=~zeroTestInput;
            end

            default: begin
                branchControlOutput <= 0;
            end

        endcase
    end
end

endmodule