module CFG(
	/* FSB address input */
	input [23:18] A,
	/* Gated address output */
	inout GA23,
	inout GA22,
	inout GA21,
	inout GA20,
	/* Write gate during slowdown config */
	output SlowdownIOWriteGate,
	/* RAM address inputs */
	input [11:10] RA,
	input RowA10,
	/* RAM address outputs */
	output RA11_BA19,
	output RA10,
	inout nBG_BA18,
	/* Wait state jumper inputs */
	input DBG0_nROMWS,
	input DBG1_nRAMWS,
	input DBG4_nIOWS,
	/* Wait state config outputs */
	output ROMWS,
	output RAMWS,
	output IOWS);
	
	assign GA23 = A_FSB[23];




	assign GA22 = A_FSB[22];
	assign GA21 = 1'bZ;
	assign GA20 = 1'bZ;

	assign SlowdownIOWriteGate = 0;

	output RA11_BA19 = RA[11];
	output RA10 = RA[10];
	assign nBG_BA18 = 1'bZ;

	assign ROMWS = 0;
	assign RAMWS = 0;
	assign IOWS = 0;

endmodule
