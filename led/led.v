module led
(
	input	 PB,
	output LED
);


	assign LED = ~PB;


endmodule