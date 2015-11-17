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
	input wire [8:0]pc,
	input wire [8:0]pc_alu,
	input wire pcsrc,
	output reg [8:0] o_pc1
    );

always @(*)
begin
      if (pcsrc)
			o_pc1 <= pc_alu;
      else
         o_pc1 <= pc;
end
endmodule
