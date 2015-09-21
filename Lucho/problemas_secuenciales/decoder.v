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
	 
	 always@(*)
	 begin
	 
		 case(entrada)
				0:  salida = 8'b00000001;
				1:  salida = 8'b00000010;
				2:  salida = 8'b00000100;
				3:  salida = 8'b00001000;
				4:  salida = 8'b00010000;
				5:  salida = 8'b00100000;
				6:  salida = 8'b01000000;
				7:  salida = 8'b10000000;
		 endcase
	 end

endmodule
