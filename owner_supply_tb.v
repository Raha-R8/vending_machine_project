`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:05:48 06/30/2023
// Design Name:   owner_supply
// Module Name:   C:/Windows/System32/vending_machine/owner_supply_tb.v
// Project Name:  vending_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: owner_supply
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module owner_supply_tb;

	// Inputs
	reg clk;
	reg mode;
	reg [3:0] machine_supply;
	reg [3:0] quantitiy;

	// Outputs
	wire [3:0] new_supply;
	wire redlight;

	// Instantiate the Unit Under Test (UUT)
	owner_supply uut (
		.clk(clk), 
		.mode(mode), 
		.machine_supply(machine_supply), 
		.quantitiy(quantitiy), 
		.new_supply(new_supply), 
		.redlight(redlight)
	);
	always #25 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 1;
		machine_supply = 4'b1100;
		quantitiy = 4'b0001;

	
        
		// Add stimulus here

	end
      
endmodule

