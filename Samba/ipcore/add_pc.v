`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:14 11/07/2015 
// Design Name: 
// Module Name:    add_pc 
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
module add_pc(
	input wire pc,
	input wire clk,
	output reg [31:0] o_pc
    );


always @(posedge clk)
begin 
	o_pc <= pc + 4; 
end

endmodule
