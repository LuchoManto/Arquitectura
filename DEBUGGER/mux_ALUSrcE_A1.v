`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:18:12 11/20/2015 
// Design Name: 
// Module Name:    mux_ALUSrcE_A 
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
module mux_ALUSrcE_A(
	input wire [31:0]SrcAE,
	input wire [31:0]WriteDataE,
	input wire [31:0]SignImmE,
	input wire [1:0]ALUSrcE,
	output reg [31:0]SrcAE1
);
	 
	 always@(*)
	 begin
			/*
			if(ALUSrcE == 2'b10)
			begin
				SrcAE1 <= WriteDataE;
			end
			else
			begin
				SrcAE1 <= SrcAE;
			end
			*/
		case(ALUSrcE)
			2'b10:								
			begin
				SrcAE1 <= WriteDataE;
			end
			2'b11:								
			begin
				SrcAE1 <= SignImmE;
			end
			default:
				SrcAE1 <= SrcAE;
		endcase
	 end


endmodule