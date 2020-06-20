module Mux2_1_5bits(
    input bit control,
    input bit [4:0] input0,
    input bit [4:0] input1,
    output bit [4:0] output0
);

    always_comb begin
        case(control)

            0: begin
                output0 <= input0;
            end

            1: begin
                output0 <= input1;
            end

        endcase
        
    end

endmodule

module ShiftLeft_2_32bits(
    input bit [31:0] input0,
    output bit [31:0] output0
);

    always_comb begin
        output0 <= input0 << 2;
    end

endmodule

module ShiftLeft_2_26_28_bits(
    input bit [25:0] input0,
    output bit [27:0] output0
);

    always_comb begin
        output0[27:2] <= input0;
        output0[1:0] <= 0;
    end

endmodule

module Adder_32bits(
    input bit [31:0] input0,
    input bit [31:0] input1,
    output bit [31:0] output0
);

    always_comb begin
        output0 <= input0 + input1;
    end

endmodule

module Mux2_1_32bits(
    input bit control,
    input bit [31:0] input0,
    input bit [31:0] input1,
    output bit [31:0] output0
);

    always_comb begin
        case(control)

            0: begin
                output0 <= input0;
            end

            1: begin
                output0 <= input1;
            end

        endcase
        
    end

endmodule

module SignalExtender16_32bits(
    input bit [15:0] preExtended,
    output bit [31:00] postExtended
);

    always_comb begin

        case(preExtended[15])

            1: begin
                postExtended[31:16] <= '{default:1};
                postExtended[15:0] <= preExtended;
            end

            0: begin
                postExtended[31:16] <= '{default:0};
                postExtended[15:0] <= preExtended;
            end

        endcase

    end

endmodule

module Mux3_1_32bits(
    input bit [1:0] control,
    input bit [31:0] input0,
    input bit [31:0] input1,
    input bit [31:0] input2,
    output bit [31:0] output0
);

    always_comb begin
        case(control)

            0: begin
                output0 <= input0;
            end

            1: begin
                output0 <= input1;
            end

            2: begin
                output0 <= input2;
            end

            default: begin
                output0 <= 0;
            end

        endcase
        
    end

endmodule