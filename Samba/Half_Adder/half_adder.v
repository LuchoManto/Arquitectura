`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:49 08/21/2015 
// Design Name: 
// Module Name:    half_adder 
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
module half_adder(
	input wire i_a,
	input wire i_b,
	output reg o_y,
	output reg carry
    );
always @(*)
begin 
	o_y = i_a ^ i_b;
	if ((i_a & i_b) == 1)
		carry = 1;
	else 
		carry = 0;
end
		

endmodule
