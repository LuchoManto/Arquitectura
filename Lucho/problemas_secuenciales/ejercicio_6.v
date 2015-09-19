`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:58 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_6 
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
module ejercicio_6(
	output reg o_ctrl,
	
	input wire clock
    );
	 
	 reg [4:0]cont_clk;
	 
	 
	 always@(posedge clock)
	 begin
		cont_clk <= cont_clk + 1;
		
		if(cont_clk)
	 
	 
	 
	 


endmodule
