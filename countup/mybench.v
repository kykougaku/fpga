`timescale 1ns/1ns
// timescale one step time/ rounding time

module mybench;
    reg clk;

    reg  key;

    reg [ 9: 0] sw;

    wire [ 9: 0] led;

    wire [ 7: 0] hex0;
    wire [ 7: 0] hex1;
    wire [ 7: 0] hex2;
    wire [ 7: 0] hex3;
    wire [ 7: 0] hex4;
    wire [ 7: 0] hex5;

    wire  dram_clk;
    wire  dram_cke;
    wire [12: 0] dram_addr;
    wire  dram_ba;
    wire [15: 0] dram_dq;
    wire  dram_ldqm;
    wire  dram_udqm;
    wire  dram_cs_n;
    wire  dram_we_n;
    wire  dram_cas_n;
    wire  dram_ras_n;

    wire  vga_hs;
    wire  vga_vs;
    wire [ 3: 0] vga_r;
    wire [ 3: 0] vga_g;
    wire [ 3: 0] vga_b;

    wire  clk_i2c_scl;
    wire  clk_i2c_sda;

    wire  gsensor_sclk;
    wire  gsensor_sdo;
    wire  gsensor_sdi;
    wire [ 2: 1] gsensor_int;
    wire  gsensor_cs_n;

    wire [35: 0] gpio;

    wire [15: 0] arduino_io;
    wire  arduino_reset_n;


    countup mycountup(
        .ADC_CLK_10(clk),
        .MAX10_CLK1_50(clk),
        .MAX10_CLK2_50(clk),
        .KEY(key),
        .SW(sw),
        .LEDR(led),
        .HEX0(hex0),
        .HEX1(hex1),
        .HEX2(hex2),
        .HEX3(hex3),
        .HEX4(hex4),
        .HEX5(hex5),
        .DRAM_CLK(dram_clk),
        .DRAM_CKE(dram_cke),
        .DRAM_ADDR(dram_addr),
        .DRAM_BA(dram_ba),
        .DRAM_DQ(dram_dq),
        .DRAM_LDQM(dram_ldqm),
        .DRAM_UDQM(dram_udqm),
        .DRAM_CS_N(dram_cs_n),
        .DRAM_WE_N(dram_we_n),
        .DRAM_CAS_N(dram_cas_n),
        .DRAM_RAS_N(dram_ras_n),
        .VGA_HS(vga_hs),
        .VGA_VS(vga_vs),
        .VGA_R(vga_r),
        .VGA_G(vga_g),
        .VGA_B(vga_b),
        .CLK_I2C_SCL(clk_i2c_scl),
        .CLK_I2C_SDA(clk_i2c_sda),
        .GSENSOR_SCLK(gsensor_sclk),
        .GSENSOR_SDO(gsensor_sdo),
        .GSENSOR_SDI(gsensor_sdi),
        .GSENSOR_INT(gsensor_int),
        .GSENSOR_CS_N(gsensor_cs_n),
        .GPIO(gpio),
        .ARDUINO_IO(arduino_io),
        .ARDUINO_RESET_N(arduino_reset_n)
    );

    always #1 clk = ~clk;

    initial begin
        clk = 0;

        sw = 0;
        #100
        sw = 1;
        #1000
        sw = 2;
        #10000
        sw = 3;
        #2000000000
        sw = 4;

        $finish;
    end
    initial begin
        $monitor(
            $stime,
            "hex0(%d) hex5(%d)",
            hex0,
            hex5
        );
    end

endmodule