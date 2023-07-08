`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    04:44:04 06/30/2023
// Design Name:
// Module Name:    display
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
module display (
    input clk,
    input [1:0]redlight,
    input [10:0] number,
    output reg [6:0] seg1,seg2
);
    /*if the number is greater than 15 it means that either the
    machine's account money or the owner's money has gotten bigger than
    15 wich is an error so int this case the number will be set to 0 and
    the error code 4 will be displayed in seg2
    if the number is smaller than 15 then the number will be displayed in
    hexadecimal format */
    always @(negedge clk) begin
        if((redlight!=0) || (number>4'b1111))
            if(number>4'b1111)begin
                seg1 = 7'b1111110;
                seg2 = 7'b0110111;
            end
            else begin
                case (redlight)
                1 : seg2 = 7'b0110000;
                2 : seg2 = 7'b1101101;
                3 : seg2 = 7'b1111001;
                endcase
            end
        else begin
             seg2 = 7'b1111110;
             case (number)
        0 : seg1 = 7'b1111110;
        1 : seg1 = 7'b0110000;
        2 : seg1 = 7'b1101101;
        3 : seg1 = 7'b1111001;
        4 : seg1 = 7'b0110111;
        5 : seg1 = 7'b1011011;
        6 : seg1 = 7'b1011111;
        7 : seg1 = 7'b1110000;
        8 : seg1 = 7'b1111111;
        9 : seg1 = 7'b1111011;
        10 : seg1 = 7'b1110111;
        11 : seg1 = 7'b1111111;
        12 : seg1 = 7'b1001110;
        13 : seg1 = 7'b1111110;
        14 : seg1 = 7'b1001111;
        15 : seg1 = 7'b1000111;
        endcase
        end
    end

endmodule
