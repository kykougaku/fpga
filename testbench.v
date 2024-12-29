`timescale 1ns/1ns

module testbench ();

	parameter t = 100;

	reg		PB;
	wire	LED;
	
	led u1 (
		.PB		(PB),
		.LED	(LED)
		);
	
	initial begin
		PB <= 1'b1;
		#(t *1000)
		PB <= 1'b0;
		#(t * 5000)
		PB <= 1'b1;		
		#(t * 7000)
		PB <= 1'b0;
		#(t * 3000);
		PB <= 1'b1;
	end

endmodule