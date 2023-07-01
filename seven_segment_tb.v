`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:10:34 06/30/2023
// Design Name:   seven_segment
// Module Name:   C:/Windows/System32/vending_machine/seven_segment_tb.v
// Project Name:  vending_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_segment
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_segment_tb;

	// Inputs
	reg clk;
	reg [3:0] number;

	// Instantiate the Unit Under Test (UUT)
	seven_segment uut (
		.clk(clk), 
		.number(number)
	);
	always #25 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		number = 12;

		// Wait 100 ns for global reset to finish

        
		// Add stimulus here

	end
      
endmodule

