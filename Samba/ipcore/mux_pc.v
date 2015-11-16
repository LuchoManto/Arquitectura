`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:09 11/07/2015 
// Design Name: 
// Module Name:    mux_pc 
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
module mux_pc(
	input wire clk,
	input wire pc,
	input wire pc_alu,
	input wire pcsrc,
	output reg [31:0] o_pc1
    );

always @(posedge clk)
begin
      if (pcsrc)
         o_pc1 <= pc;
      else
         o_pc1 <= pc_alu;
end
endmodule
