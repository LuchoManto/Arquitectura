`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:03 08/21/2015 
// Design Name: 
// Module Name:    multiplexor_reset 
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
module Multiplexor_reset( 
	input wire i_a, 
	input wire i_b, 
	input wire i_c, 
	input wire i_d,
	input wire [0:1] i_con,
	output reg o_a,
	input wire rs
    );


 always @(*) //pongo el asterisco, asi el always cambia siempre que cambie una señal de entrada.
 begin

	if (rs)
		o_a = 0;
	else 
		begin 
		 case (i_con)
		 2'b00: o_a = i_a;
		 2'b01: o_a = i_b;
		 2'b10: o_a = i_c;
		 2'b11: o_a = i_d;
		endcase
		end
	end
//end
 
endmodule
