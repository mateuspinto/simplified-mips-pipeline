module Testbench();

	bit clk, reset;

	bit aluSrc_signal_idEx_input, aluSrc_signal_idEx_output, branchControl_exMem_input, hazard_signal_hazard_output, jump_signal_ifId_input, memRead_signal_idEx_output, memRead_signal_exMem_input, memRead_signal_exMem_output, memRead_signal_idEx_input, memToReg_signal_exMem_input, memToReg_signal_exMem_output, memToReg_signal_memWb_input, memToReg_signal_memWb_output, memToReg_signal_idEx_input, memToReg_signal_idEx_output, memWrite_signal_exMem_input, memWrite_signal_exMem_output, memWrite_signal_idEx_input, memWrite_signal_idEx_output, regDst_signal_idEx_input, regDst_signal_idEx_output, regWrite_signal_exMem_input, regWrite_signal_exMem_output, regWrite_signal_memWb_input, regWrite_signal_memWb_output, regWrite_signal_idEx_input, regWrite_signal_idEx_output;

	bit [1:0] branch_signal_idEx_input, branch_signal_idEx_output, rs_forward_signal_forward_output, rt_forward_signal_forward_output;

	bit [3:0] aluOp_idEx_input, aluOp_idEx_output;

	bit [4:0] rd_address_idEx_input, rd_address_idEx_output, regWrite_address_memWb_input, regWrite_address_memWb_output, regWrite_address_exMem_output, regWrite_address_exMem_input, rs_address_idEx_input, rs_address_idEx_output, rt_address_idEx_input, rt_address_idEx_output;

	bit [5:0] func_idEx_input, func_idEx_output;

	bit [31:0] aluResult_exMem_input, aluResult_exMem_output, aluResult_memWb_input, aluResult_memWb_output, dataMemory_memWb_input, dataMemory_memWb_output, immediateExtended_data_idEx_input, immediateExtended_data_idEx_output, instruction_ifId_input, instruction_ifId_output, memWrite_data_exMem_input, memWrite_data_exMem_output, pcBranch_exMem_input, pcIncremented_idEx_input, pcIncremented_idEx_output, pcJump_signal_ifId_input, pc_ifId_input, pc_ifId_output, rs_data_idEx_input, rs_data_idEx_output, rt_data_idEx_input, rt_data_idEx_output, writeData_writeBack_output;

    always begin
		clk<= 1; #1;
		clk<=0; #1;
	end

    initial begin
		$dumpfile("mips.vcd");
      	$dumpvars(0, Testbench);
        reset<=1; #3;
		reset<=0; #1;
	end

	DatapathHazard datapathHazard (memRead_signal_idEx_output, rs_address_idEx_input, rt_address_idEx_input, regWrite_address_exMem_input, hazard_signal_hazard_output);
	DatapathForward datapathForward (rs_address_idEx_output, rt_address_idEx_output, regWrite_signal_exMem_output, regWrite_address_memWb_input, regWrite_signal_memWb_output, regWrite_address_memWb_output, rt_forward_signal_forward_output, rs_forward_signal_forward_output);

	InstructionFetch instructionFetch (clk, reset, hazard_signal_hazard_output, branchControl_exMem_input, pcBranch_exMem_input, jump_signal_ifId_input, pcJump_signal_ifId_input, instruction_ifId_input, pc_ifId_input);
	InstructionDecode instructionDecode (clk, reset, instruction_ifId_output, pc_ifId_output, regWrite_signal_memWb_output, regWrite_address_memWb_output, writeData_writeBack_output, pcIncremented_idEx_input, memToReg_signal_idEx_input, regWrite_signal_idEx_input, memWrite_signal_idEx_input, memRead_signal_idEx_input, aluOp_idEx_input, aluSrc_signal_idEx_input, regDst_signal_idEx_input, branch_signal_idEx_input, immediateExtended_data_idEx_input, rs_address_idEx_input, rt_address_idEx_input, rd_address_idEx_input, rs_data_idEx_input, rt_data_idEx_input, jump_signal_ifId_input, pcJump_signal_ifId_input, func_idEx_input);
	Executing executing (clk, reset, pcIncremented_idEx_output, memToReg_signal_idEx_output, regWrite_signal_idEx_output, memWrite_signal_idEx_output, memRead_signal_idEx_output, aluOp_idEx_output, aluSrc_signal_idEx_output, regDst_signal_idEx_output, branch_signal_idEx_output, immediateExtended_data_idEx_output, rs_address_idEx_output, rt_address_idEx_output, rd_address_idEx_output, rs_data_idEx_output, rt_data_idEx_output, func_idEx_output, rt_forward_signal_forward_output, rs_forward_signal_forward_output, writeData_writeBack_output, aluResult_exMem_output, memToReg_signal_exMem_input, regWrite_signal_exMem_input, memWrite_signal_exMem_input, memRead_signal_exMem_input, aluResult_exMem_input, memWrite_data_exMem_input, regWrite_address_exMem_input, branchControl_exMem_input, pcBranch_exMem_input);
	Memory memory (clk, reset, memToReg_signal_exMem_output, regWrite_signal_exMem_output, memWrite_signal_exMem_output, memRead_signal_exMem_output, aluResult_exMem_output, memWrite_data_exMem_output, regWrite_address_exMem_output, memToReg_signal_memWb_input, regWrite_signal_memWb_input, dataMemory_memWb_input, aluResult_memWb_input, regWrite_address_memWb_input);
	WriteBack writeBack (memToReg_signal_memWb_output, aluResult_memWb_output, dataMemory_memWb_output, writeData_writeBack_output);

	IfId ifId (clk, reset, (1'b0 | hazard_signal_hazard_output), (1'b0 | branchControl_exMem_input | jump_signal_ifId_input), pc_ifId_input, instruction_ifId_input, pc_ifId_output, instruction_ifId_output);
	IdEx idEx (clk, reset, 1'b0, (1'b0 | hazard_signal_hazard_output | branchControl_exMem_input), pcIncremented_idEx_input, memToReg_signal_idEx_input, regWrite_signal_idEx_input, memWrite_signal_idEx_input, memRead_signal_idEx_input, aluOp_idEx_input, aluSrc_signal_idEx_input, regDst_signal_idEx_input, branch_signal_idEx_input, immediateExtended_data_idEx_input, rs_address_idEx_input, rt_address_idEx_input, rd_address_idEx_input, rs_data_idEx_input, rt_data_idEx_input, func_idEx_input, pcIncremented_idEx_output, memToReg_signal_idEx_output, regWrite_signal_idEx_output, memWrite_signal_idEx_output, memRead_signal_idEx_output, aluOp_idEx_output, aluSrc_signal_idEx_output, regDst_signal_idEx_output, branch_signal_idEx_output, immediateExtended_data_idEx_output, rs_address_idEx_output, rt_address_idEx_output, rd_address_idEx_output, rs_data_idEx_output, rt_data_idEx_output, func_idEx_output);    
	ExMem exMem (clk, reset, 1'b0, 1'b0, memToReg_signal_exMem_input, regWrite_signal_exMem_input, memWrite_signal_exMem_input, memRead_signal_exMem_input, aluResult_exMem_input, memWrite_data_exMem_input, regWrite_address_exMem_input, memToReg_signal_exMem_output, regWrite_signal_exMem_output, memWrite_signal_exMem_output, memRead_signal_exMem_output, aluResult_exMem_output, memWrite_data_exMem_output, regWrite_address_exMem_output);
	MemWb memWb (clk, reset, 1'b0, 1'b0, memToReg_signal_memWb_input, regWrite_signal_memWb_input, dataMemory_memWb_input, aluResult_memWb_input, regWrite_address_memWb_input, memToReg_signal_memWb_output, regWrite_signal_memWb_output, dataMemory_memWb_output, aluResult_memWb_output, regWrite_address_memWb_output);

endmodule