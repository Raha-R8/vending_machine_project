`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:09:09 06/30/2023 
// Design Name: 
// Module Name:    seven_segment 
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
module seven_segment (
    input clk,
    input [3:0] number,
    output reg [6:0] seg1,
    output reg [6:0] seg2
);
always@(negedge clk)begin
    if(number > 4'b1001)begin
        seg1 = 7'b0110000;
        case (number)
        10 : seg2 = 7'b1111110;
        11 : seg2 = 7'b0110000;
        12 : seg2 = 7'b1101101;
        13 : seg2 = 7'b1111001;
        14 : seg2 = 7'b0010011;
        15 : seg2 = 7'b1011011;
        16 : seg2 = 7'b1011111;
        17 : seg2 = 7'b1110000;
        18 : seg2 = 7'b1111111;
        19 : seg2 = 7'b1111011;
        endcase
    end
    else begin
        seg1 = 7'b1111110;
        case(number)
        0 : seg2 = 7'b1111110;
        1 : seg2 = 7'b0110000;
        2 : seg2 = 7'b1101101;
        3 : seg2 = 7'b1111001;
        4 : seg2 = 7'b0010011;
        5 : seg2 = 7'b1011011;
        6 : seg2 = 7'b1011111;
        7 : seg2 = 7'b1110000;
        8 : seg2 = 7'b1111111;
        9 : seg2 = 7'b1111011;
        endcase
    end
	 $display("%b",seg1);
	 $display("%b",seg2);
end
    
endmodule
