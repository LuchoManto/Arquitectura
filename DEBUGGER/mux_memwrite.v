`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:56:34 11/26/2015 
// Design Name: 
// Module Name:    mux_memwrite 
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
module mux_mem_write_in(
	input wire [3:0]MemWriteM,
	input wire mem_write_in,
	output reg [3:0] MemWriteM1
    );

always @(*)
begin
      if(mem_write_in)
			MemWriteM1 <= 0;
      else
         MemWriteM1 <= MemWriteM;
end
endmodule