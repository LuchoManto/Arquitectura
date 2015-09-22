`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:25:43 09/21/2015 
// Design Name: 
// Module Name:    decoder 
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
module decoder (
			input wire [2:0]entrada,
			output reg [7:0]salida
		);

   always @(*)
         case (entrada)
            3'b000  : salida <= 8'b00000001;
            3'b001  : salida <= 8'b00000010;
            3'b010  : salida <= 8'b00000100;
            3'b011  : salida <= 8'b00001000;
            3'b100  : salida <= 8'b00010000;
            3'b101  : salida <= 8'b00100000;
            3'b110  : salida <= 8'b01000000;
            3'b111  : salida <= 8'b10000000;
            default : salida <= 8'b00000000;
         endcase

endmodule
