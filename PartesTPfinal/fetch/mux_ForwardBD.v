`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:24 11/17/2015 
// Design Name: 
// Module Name:    mux_ForwardBD 
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
module mux_ForwardBD(
	input wire [31:0]RD2,
	input wire [31:0]ALUOutM,
	input wire [31:0]ALUOut,
	input wire [1:0]ForwardBD,
	output reg [31:0] out
    );

always @(*)
begin
/*
      if(ForwardBD)
			out <= ALUOutM;
      else
         out <= RD2;
*/
		case(ForwardBD)
			2'b00:								
			begin
				out <= RD2;
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
