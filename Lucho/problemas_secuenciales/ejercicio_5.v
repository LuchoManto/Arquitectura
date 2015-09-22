`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:01 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_5 
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
module ejercicio_5#(parameter N=32)(
	input wire [N-1:0]i_in,
	output reg [N-1:0]o_out,
	output reg [N-1:0]o_nout,
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
				 o_nout <= 1;
			 end
			 else if(i_se == 1)
			 begin
				 o_nout <= 0;
				 o_out <= 1;
			 end
			 else
			 begin
				 o_out <= i_in;
				 o_nout <= ~i_in;
		 end	 
	 
	 end
	 
 end
	 
	 
endmodule
