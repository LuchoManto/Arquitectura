`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:54 11/17/2015 
// Design Name: 
// Module Name:    And_PCSrcD 
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
module And_PCSrcD(
	input wire BranchD,
	input wire EqualD,
	output reg PCSrcD
    );

always@(*)
begin
	PCSrcD <= BranchD && EqualD;
end

endmodule
