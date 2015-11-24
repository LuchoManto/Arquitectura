`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:53 11/17/2015 
// Design Name: 
// Module Name:    mux_ForwardAD 
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
module mux_ForwardAD(
	input wire [31:0]RD1,
	input wire [31:0]ALUOutM,
	input wire [31:0]ALUOut,
	input wire [1:0]ForwardAD,
	output reg [31:0] out
    );

always @(*)
begin
		case(ForwardAD)
			2'b00:								
			begin
				out <= RD1;
			end
			2'b01:								
			begin
				out <= ALUOutM;
			end
			2'b10:								
			begin
				out <= ALUOut;
			end
		endcase
end
endmodule
