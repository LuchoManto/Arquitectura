`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:02 08/20/2015 
// Design Name: 
// Module Name:    halfAdder 
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
module halfAdder(
	input wire i_a,
	input wire i_b,
	output reg o_res,
	output reg o_carry
    );
	
	always @(i_a,i_b)
	begin
	
	o_res = i_a ^ i_b;
	if(i_a & i_b)
	begin
	o_carry = 1;
	end
	else
	o_carry = 0;
	end

endmodule
