`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:00:13 06/30/2023
// Design Name:   owner_money
// Module Name:   C:/Windows/System32/vending_machine/owner_money_tb.v
// Project Name:  vending_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: owner_money
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module owner_money_tb;

	// Inputs
	reg clk;
	reg mode;
	reg [10:0] machine_money;

	// Outputs
	wire [10:0] owner_money;
	wire [10:0] new_machine_money;
	wire redlight;

	// Instantiate the Unit Under Test (UUT)
	owner_money uut (
		.clk(clk), 
		.mode(mode), 
		.machine_money(machine_money), 
		.owner_money(owner_money), 
		.new_machine_money(new_machine_money), 
		.redlight(redlight)
	);
	always #25 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 1;
		machine_money = 11'b10000000000;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

