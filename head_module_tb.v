`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   23:41:25 06/29/2023
// Design Name:   head_module
// Module Name:   C:/Windows/System32/vending_machine/head_module_tb.v
// Project Name:  vending_machine
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: head_module
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module head_module_tb;

	// Inputs
	reg clk;
	reg costumer_mode;
	reg owner_money_mode;
	reg owner_supply_mode;
	reg [2:0] product;
	reg [3:0] costumer_money;
	reg [3:0] quantitiy;

	// Outputs
	wire [6:0]seg1;
	wire [6:0]seg2;

	// Instantiate the Unit Under Test (UUT)
	head_module uut (
    .clk(clk),
    .costumer_mode(costumer_mode),
    .owner_money_mode(owner_money_mode),
    .owner_supply_mode(owner_supply_mode),
    .product(product),
    .costumer_money(costumer_money),
    .quantitiy(quantitiy),
    .seg1(seg1),
    .seg2(seg2)
    );
	always #25 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		costumer_mode = 0;
		owner_money_mode = 0;
		owner_supply_mode = 0;
		product = 3'b010;
		costumer_money = 4'b1100;
		quantitiy = 4'b0100;
		#60
		costumer_mode = 1;
		#50
		costumer_mode = 0;
		owner_money_mode = 1;
		#50
		owner_money_mode =0;
		owner_supply_mode =1;
		product = 3'b000;
		quantitiy = 4'b0010;
		#50
		owner_supply_mode =0;

	end

endmodule
