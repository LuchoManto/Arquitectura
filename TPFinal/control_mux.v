`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:15 11/16/2015 
// Design Name: 
// Module Name:    control_mux 
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
module control_mux(
	input wire in1,
	input wire in2,
	output reg out,
	
	input wire control
    );
	 
	 always@(in1,in2,control)
	 begin
	 
	 if(control)
	 begin
	 out <= in1;
	 end
	 
	 else
	 begin
	 out <= in2;
	 end
	 
	 end


endmodule
