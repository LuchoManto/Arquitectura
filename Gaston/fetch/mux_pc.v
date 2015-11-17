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
	input wire [8:0]PCPlus4F,
	input wire [8:0]PCBranchD,
	input wire PCSrcD,
	output reg [8:0] PC1
    );

always @(*)
begin
      if(PCSrcD)
			PC1 <= PCBranchD;
      else
         PC1 <= PCPlus4F;
end
endmodule
