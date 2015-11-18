`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:24 11/17/2015 
// Design Name: 
// Module Name:    mux_ForwardBD 
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
module mux_ForwardBD(
	input wire [31:0]RD2,
	input wire [31:0]ALUOutM,
	input wire ForwardBD,
	output reg [31:0] out
    );

always @(*)
begin
      if(ForwardBD)
			out <= ALUOutM;
      else
         out <= RD2;
end
endmodule
