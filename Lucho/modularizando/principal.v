`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:14 09/07/2015 
// Design Name: 
// Module Name:    principal 
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
module principal(
	input wire a,
	input wire b,
	input wire c,
	output reg res,
	
	input wire clock
    );
	 
	 wire o_and1;
	 wire o_and2;
	 wire o_or;
	 
	 mand mand_1(
		.i_x(a),
		.i_y(b),
		.o_z(o_and1)
		);
		
		
	 mand mand_2(
		.i_x(o_and1),
		.i_y(c),
		.o_z(o_and2)
		);
		
	 mand mor_1(
		.i_x(o_and2),
		.i_y(c),
		.o_z(o_or1)
		);
		
		always@(posedge clock)
		begin
		res <= o_or1;
		end


endmodule
