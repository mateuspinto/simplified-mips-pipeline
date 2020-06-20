module DatapathForward(
	input bit [4:0] IDEX_src1, IDEX_src2,
	input bit       EXMEM_RegWrite,
	input bit [4:0] EXMEM_dest,
	input bit       MEMWB_RegWrite,
	input bit [4:0] MEMWB_dest,

	output bit [1:0] fwdA, fwdB
);

	always_comb begin
		if (EXMEM_RegWrite && EXMEM_dest != 0 && EXMEM_dest == IDEX_src1)
			fwdA <= 1;
		else if (MEMWB_RegWrite && MEMWB_dest != 0 && MEMWB_dest == IDEX_src1)
			fwdA <= 2;
		else
			fwdA <= 0; 

		if (EXMEM_RegWrite && EXMEM_dest != 0 && EXMEM_dest == IDEX_src2)
			fwdB <= 1;
		else if (MEMWB_RegWrite && MEMWB_dest != 0 && MEMWB_dest == IDEX_src2)
			fwdB <= 2;
		else
			fwdB <= 0;
	end

endmodule