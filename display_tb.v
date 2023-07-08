`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   04:58:28 06/30/2023
// Design Name:   display
// Module Name:   C:/Windows/System32/vending_machine/display_tb.v
// Project Name:  vending_machine
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module display_tb;

	// Inputs
	reg clk;
	reg [1:0]redlight;
	reg [10:0] number;

	// Outputs
	wire [6:0] seg1;
	wire [6:0] seg2;

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.clk(clk),
		.redlight(redlight),
		.number(number),
		.seg1(seg1),
		.seg2(seg2)
	);
	always #25 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		redlight = 1;
		number = 4'b0001;

		// Wait 100 ns for global reset to finish

		// Add stimulus here

	end

endmodule
