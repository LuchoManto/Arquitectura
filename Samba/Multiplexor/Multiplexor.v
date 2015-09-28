`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:29 08/21/2015 
// Design Name: 
// Module Name:    Multiplexor 
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
module Multiplexor( 
	input wire i_a, 
	input wire i_b, 
	input wire i_c, 
	input wire i_d,
	input wire [0:1] i_con,
	output reg o_a
    );

 always @(i_con)
 begin
 
 case (i_con)
 'b00: o_a = i_a;
 'b01: o_a = i_b;
 'b10: o_a = i_c;
 'b11: o_a = i_d;
 endcase

end
 
endmodule
