`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:17 11/17/2015 
// Design Name: 
// Module Name:    mux_3 
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
module mux_ForwardAE(
	input wire [31:0]RD1,
	input wire [31:0]ResultW,
	input wire [31:0]ALUOutM,
	input wire [1:0]ForwardAE,
	output reg [31:0]SrcAE
);
	 
	 always@(*)
	 begin
		 case(ForwardAE)
			 2'b 00: SrcAE <= RD1;
			 2'b 01: SrcAE <= ResultW;
			 2'b 10: SrcAE <= ALUOutM;
			 2'b 11: SrcAE <= SrcAE;
		 endcase
	 end


endmodule
