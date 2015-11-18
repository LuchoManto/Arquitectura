`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:43 11/17/2015 
// Design Name: 
// Module Name:    Sumador_EID 
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
module Sumador_EID(
	input wire [8:0] input1,
	input wire [8:0] PCPlus4D,
	output reg [8:0] PCBranchD
);

always@(*)
begin
	PCBranchD <= input1 + PCPlus4D;
end


endmodule
