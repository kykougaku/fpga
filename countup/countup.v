module countup(

      ///////// Clocks /////////
      input              ADC_CLK_10,
      input              MAX10_CLK1_50,
      input              MAX10_CLK2_50,

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,

      ///////// Clock Generator I2C /////////
      output             CLK_I2C_SCL,
      inout              CLK_I2C_SDA,

      ///////// GSENSOR /////////
      output             GSENSOR_SCLK,
      inout              GSENSOR_SDO,
      inout              GSENSOR_SDI,
      input    [ 2: 1]   GSENSOR_INT,
      output             GSENSOR_CS_N,

      ///////// GPIO /////////
      inout    [35: 0]   GPIO,

      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire reset_n;
wire sys_clk;


//=======================================================
//  Structural coding
//=======================================================

assign reset_n = 1'b1;

reg [25:0] cout;

wire ick1;

assign ick1 = (cout==26'd49999999) ? 1'b1 : 1'b0;

always @ (posedge MAX10_CLK1_50) begin
      if (ick1) begin
            cout <= 26'd0;
      end else begin
            cout <= cout + 26'd1;
      end
end			

reg [4:0] sec;

always @ (posedge MAX10_CLK1_50) begin
      if (ick1) begin
            if(sec == 4'd9) begin
                  sec <= 4'd0;
            end else begin
                  sec <= sec + 4'd1;
            end
      end
end


SEG7_LUT	SEG7_LUT_ch (
	.oSEG(HEX5),
	.iDIG(SW[2:0])
);

SEG7_LUT	SEG7_LUT_v_3 (
	.oSEG(HEX0),
	.iDIG(sec[3:0])
);


endmodule
