`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    01:11:38 06/29/2023
// Design Name:
// Module Name:    owner_money
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
//this module is for when owner wants to collect money from the machine

module owner_money (
    input clk,mode,
    input [10:0]machine_money,
    output reg[10:0]owner_money,
	  output reg [10:0]new_machine_money,
    output reg redlight
);
    //machine money will be transferred to the owners money if there is any money in the machine
    //if not , the owner's money will be set to 0 meaning that no money would transfer to the owners account and redlight will change to 1 (indicates error has occurred)

    always @(posedge clk) begin
		 if(mode)begin
			  if(machine_money == 11'b00000000000)begin
					owner_money = 11'b00000000000;
					new_machine_money = machine_money;
					redlight = 1;
			  end
			  else begin
					owner_money = machine_money;
					new_machine_money = 11'b00000000000;
					redlight = 0;
			  end
             // $display("owner new machine money internal%b ",new_machine_money);
		 end
    end
endmodule
