`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:01 11/24/2015 
// Design Name: 
// Module Name:    mux_mem_in 
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
module mux_mem_in(
	input wire [11:0]add_in,
	input wire [11:0]ALUOutM,
	input wire mem_in,
	output reg [11:0] add_mem
    );

always @(*)
begin
      if(mem_in)
			add_mem <= add_in;
      else
         add_mem <= ALUOutM;
end
endmodule