`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:02 11/20/2015 
// Design Name: 
// Module Name:    mask_MemReadM 
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
module mask_MemReadM(
	input wire [31:0]ReadDataM,
	input wire [1:0]MemReadM, //Read ALL 0, Read Byte 1, Read half 2
	output reg [31:0]ReadData
);


always @(*)
begin
      case(MemReadM)
			2'b00:	
			begin
				ReadData <= ReadDataM;
			end
			2'b01:	
			begin
				ReadData <= ReadDataM & 32'hFF;	
			end
			2'b10:	
			begin
				ReadData <= ReadDataM & 32'hFFFF;
			end
			2'b11:	
			begin
				ReadData <= ReadDataM;
			end
		endcase
end
endmodule