`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:13 06/29/2023 
// Design Name: 
// Module Name:    owner_supply 
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
module owner_supply (
    input clk,mode,
    input [3:0]machine_supply,quantitiy,
    output reg[3:0]new_supply,
    output reg redlight
);
always @(posedge clk) begin
	if(mode)begin
		 if((quantitiy + machine_supply)> 4'b1111)begin
			  new_supply = machine_supply;
			  redlight = 1;
		 end
		 else begin
			  new_supply = machine_supply + quantitiy;
			  redlight = 0;
		 end
         //$display("owner new supply internal %b ",new_supply);
	end
end
    
endmodule
