`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:37 08/20/2015 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder(
	input wire i_a,
	input wire i_b,
	input wire i_cin,
	output reg o_res,
	output reg o_cout
    );
	 
	wire ab;
	
	assign ab = i_a ^ i_b;
	
	always @(i_a,i_b,i_cin)
	begin
	

	o_res = ab ^ i_cin;
	
	if(i_a & i_b || i_a & i_cin || i_b & i_cin)
	begin
	o_cout = 1;
	end
	else
	o_cout = 0;
	end

endmodule
