`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:27 11/17/2015 
// Design Name: 
// Module Name:    Left_Shift2 
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
module Left_Shift2(
	input wire [31:0]in,
	output reg [31:0]out
);
	 	 
always@(*)
begin
	out <= in << 2;
end

endmodule