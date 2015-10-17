`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:50 10/17/2015 
// Design Name: 
// Module Name:    baudrate_gen 
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
module baudrate_gen(  // generador de ticks para un baudrate de 19200
		input wire clock,
		output reg baud
    );
	 
	 reg count[7:0];
	 
	 always@(posedge clock)
	 begin
	 count <= count + 1;
	 
	 if(count == 163)
	 baud <= 1;
	 else
	 baud <= 0;
	 
	 end


endmodule
