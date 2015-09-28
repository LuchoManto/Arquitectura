`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:38 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio_3 
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
module Ejercicio_3
	#( parameter N = 32
		)
	(	input wire [N-1:0]i_a,
		output reg [N-1:0]o_a,
		input wire enable,
		input wire reset,
		input wire clk
	);

always @(posedge clk)
begin
if (enable == 1)
	if (reset == 1)
		o_a <= 0;
	else	
		o_a<=i_a;

end

endmodule
