`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:06 08/10/2015 
// Design Name: 
// Module Name:    segundoprograma 
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
module segundoprograma(
	input wire a, b, c,
	output reg y
    );

always @*
begin
	y = a;
	y = y & b;
	y = y & c;
end

endmodule
