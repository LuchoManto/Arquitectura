`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:45 11/07/2015 
// Design Name: 
// Module Name:    Intsructio_Memory 
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
module fetch
	(
		input wire clk,
		input wire pcsrc,
		output reg ir
    );

//reg [0:31] pc;

wire ir1;
//el IPCORE TIENE QUE SER RAM
ip_core ip_core (
  .clka(clk), // input clka
  .addra(pc), // input [31 : 0] addra
  .douta(ir_out) // output [31 : 0] douta
);	

add_pc add_pc(
	.pc(pc),
	.clk(clk),
	.o_pc(outpc)
);
	
mux_pc mux(
		.clk(clk),
		.pc(outpc),
		.pc_alu(outpc_alu),
		.pcsrc(pcsrc),
		.o_pc1(pc)
);

always @(posedge clk)
begin
	ir <= ir_out;
end

endmodule
