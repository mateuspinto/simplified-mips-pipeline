module DatapathHazard(
	input  bit       IDEX_MemRead,
	input  bit [4:0] IFID_rs,IFID_rt,
	input  bit [4:0] IDEX_dest,
	output bit       hazard
);

	assign hazard = IDEX_MemRead & (IDEX_dest != 0) & ((IDEX_dest == IFID_rs) | (IDEX_dest == IFID_rt));

endmodule