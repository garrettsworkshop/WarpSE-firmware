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
	
	assign GA23 = 1'bZ;
	wire GA22Gate = 
		(A[23:20]==4'h6) ||
		(A[23:20]==4'h7 &&  A[19:16]!=4'hF) ||
		(A[23:20]==4'h5 && !A[19]);
	assign GA22 = GA22Gate ? 1'b0 : A[23];
	assign GA21 = 1'bZ;
	assign GA20 = 1'bZ;

	assign SlowdownIOWriteGate = 1;

	output RA11_BA19 = 1'b1;
	output RA10 = RowA10;
	assign nBG_BA18 = 1'b1;

	assign ROMWS = !DBG0_nROMWS;
	assign RAMWS = !DBG1_nRAMWS;
	assign IOWS  = !DBG4_nIOWS;

endmodule
