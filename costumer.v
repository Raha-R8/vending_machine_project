`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    01:10:40 06/29/2023
// Design Name:
// Module Name:    costumer
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
//this module is for costumer mode and works with posedge clock
//the display blocks were used to debug (further explanation on debug is in documentation)
module costumer (
    input clk,mode,
    input [3:0]costumer_money,machine_supply,product_price,quantitiy,
	  input[10:0]machine_money,
    output reg [3:0]remaining_money,new_supply,
	  output reg [10:0]new_machine_money,
    output reg redlight
);
//integer check;
always @(posedge clk) begin
	if(mode)begin
		/*$timeformat(-9, 2, " ns", 20);
		$display("STATEMENT 1 :: time is %0t",$time);
		$display("****************************costumer internal input : machine supply %b ",machine_supply);
		$display("*****************************costumer internal : quantity  %b ",quantitiy);
		$display("******************************costumer internal : product price %b ",product_price);
		 $display("******************************costumer internal : machine money %b ",machine_money);*/

     //the costumer money , machine supply and machine money are updated if enough money and supply is available
     //if not; there will be no change in inputs and the outputs will be the same as input and redlight will change to 1 (indicates error has occurred)

     if(costumer_money >= (product_price * quantitiy) && machine_supply >= quantitiy )begin
			  remaining_money <= costumer_money - (product_price * quantitiy);
			  new_supply <= machine_supply - quantitiy;
			  new_machine_money <= machine_money + (product_price * quantitiy);
			  redlight = 0;
		 end
		 else begin
			  remaining_money <= costumer_money;
			  new_supply <= machine_supply;
			  new_machine_money <= machine_money;
			  redlight = 1;
		 end
       /*$display("costumer internal ramaining money%b ",remaining_money);
        $display("costumer new supply internal output %b ",new_supply);
        $display("costumer newmachine money internal %b ",new_machine_money);*/
	end
end
endmodule
