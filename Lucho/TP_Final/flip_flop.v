`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:42 10/31/2015 
// Design Name: 
// Module Name:    flip_flop 
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
module flip_flop#(parameter N=32)(
	input wire [N-1:0]i_in,
	output reg [N-1:0]o_out,
	input wire i_en,
	input wire i_rs,
	input wire i_se,
	
	input wire clock
    );
	 
 always@(posedge clock)
	 
	 begin
		 if(i_en == 0)
		 begin
			 
			 if(i_rs == 1)
			 begin
				 o_out <= 0;
			 end
			 else if(i_se == 1)
			 begin
				 o_out <= 1;
			 end
			 else
			 begin
				 o_out <= i_in;
		 end	 
	 
	 end
	 
 end
	 
	 
endmodule
