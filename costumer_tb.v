`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:50:05 06/30/2023
// Design Name:   costumer
// Module Name:   C:/Windows/System32/vending_machine/costumer_tb.v
// Project Name:  vending_machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: costumer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module costumer_tb;

	// Inputs
	reg clk;
	reg mode;
	reg [3:0] costumer_money;
	reg [3:0] machine_supply;
	reg [3:0] product_price;
	reg [3:0] quantitiy;
	reg [10:0] machine_money;

	// Outputs
	wire [3:0] remaining_money;
	wire [3:0] new_supply;
	wire [10:0] new_machine_money;
	wire redlight;

	// Instantiate the Unit Under Test (UUT)
	costumer uut (
		.clk(clk), 
		.mode(mode), 
		.costumer_money(costumer_money), 
		.machine_supply(machine_supply), 
		.product_price(product_price), 
		.quantitiy(quantitiy), 
		.machine_money(machine_money), 
		.remaining_money(remaining_money), 
		.new_supply(new_supply), 
		.new_machine_money(new_machine_money), 
		.redlight(redlight)
	);
	always #25 clk = ~clk ;
	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 1;
		costumer_money = 4'b1000;
		machine_supply = 4'b0101;
		product_price = 4'b0010;
		quantitiy = 4'b0010;
		machine_money = 0;
		#60
		costumer_money = 4'b0000;
		machine_supply = 4'b0001;
		product_price = 4'b 10001;


	end
      
endmodule

