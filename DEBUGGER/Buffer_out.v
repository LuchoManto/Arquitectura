`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:28 11/23/2015 
// Design Name: 
// Module Name:    Buffer_out 
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
module Buffer_out#(parameter N = 1184)( // 148 bytes
	// PC
	input wire [8:0]PCF,
	
	// Instruccion
	input wire [31:0]InstrD,
	
	// señales de control
	input wire [1:0]MemReadD,
	input wire RegWriteD,
	input wire MemtoRegD,
	input wire [3:0]MemWriteD,
	input wire [3:0]ALUControlID,
	input wire [1:0]ALUSrcD,
	input wire RegDstD,
	input wire BranchD, 
	
	//banco de registros
	input wire [31:0]out0,
	input wire [31:0]out1,
	input wire [31:0]out2,
	input wire [31:0]out3,
	input wire [31:0]out4,
	input wire [31:0]out5,
	input wire [31:0]out6,
	input wire [31:0]out7,
	input wire [31:0]out8,
	input wire [31:0]out9,
	input wire [31:0]out10,
	input wire [31:0]out11,
	input wire [31:0]out12,
	input wire [31:0]out13,
	input wire [31:0]out14,
	input wire [31:0]out15,
	input wire [31:0]out16,
	input wire [31:0]out17,
	input wire [31:0]out18,
	input wire [31:0]out19,
	input wire [31:0]out20,
	input wire [31:0]out21,
	input wire [31:0]out22,
	input wire [31:0]out23,
	input wire [31:0]out24,
	input wire [31:0]out25,
	input wire [31:0]out26,
	input wire [31:0]out27,
	input wire [31:0]out28,
	input wire [31:0]out29,
	input wire [31:0]out30,
	input wire [31:0]out31,
	
	// señales de salida de la unidad de riesgos
	input wire StallF,
	input wire StallD,
	input wire [1:0]ForwardAD,
	input wire [1:0]ForwardBD,
	input wire FlushE,
	input wire [1:0]ForwardAE,
	input wire [1:0]ForwardBE,
	
	// salida
	
	output reg [N-1:0]buffer_envio
	
 );
	 
	 always@(*)
	 begin
			// PC
			buffer_envio[7:0] <= PCF; // 32 bits

			//instruccion
			buffer_envio[39:8] <= InstrD; // 32 bits

			//señales de control

			buffer_envio[47:40] <= {{6{2'b0}}, MemReadD}; // 8bits
			buffer_envio[55:48] <= {{7{2'b0}}, RegWriteD}; // 8bits
			buffer_envio[63:56] <= {{7{2'b0}}, MemtoRegD}; // 8bits
			buffer_envio[71:64] <= {{4{2'b0}}, MemWriteD}; // 8bits
			buffer_envio[79:72] <= {{4{2'b0}}, ALUControlID}; // 8bits
			buffer_envio[87:80] <= {{6{2'b0}}, ALUSrcD}; // 8bits
			buffer_envio[95:88] <= {{7{2'b0}}, RegDstD}; // 8bits
			buffer_envio[103:96] <= {{7{2'b0}}, BranchD}; // 8bits


			//registros
			buffer_envio[135:104] <= out0; // 32 bits
			buffer_envio[167:136] <= out1; // 32 bits
			buffer_envio[199:168] <= out2; // 32 bits
			buffer_envio[231:200] <= out3; // 32 bits
			buffer_envio[263:232] <= out4; // 32 bits
			buffer_envio[295:264] <= out5; // 32 bits
			buffer_envio[327:296] <= out6; // 32 bits
			buffer_envio[359:328] <= out7; // 32 bits
			buffer_envio[391:360] <= out8; // 32 bits
			buffer_envio[423:392] <= out9; // 32 bits
			buffer_envio[455:424] <= out10; // 32 bits
			buffer_envio[487:456] <= out11; // 32 bits
			buffer_envio[519:488] <= out12; // 32 bits
			buffer_envio[551:520] <= out13; // 32 bits
			buffer_envio[583:552] <= out14; // 32 bits
			buffer_envio[615:584] <= out15; // 32 bits
			buffer_envio[647:616] <= out16; // 32 bits
			buffer_envio[679:648] <= out17; // 32 bits
			buffer_envio[711:680] <= out18; // 32 bits
			buffer_envio[743:712] <= out19; // 32 bits
			buffer_envio[775:744] <= out20; // 32 bits
			buffer_envio[807:776] <= out21; // 32 bits
			buffer_envio[839:808] <= out22; // 32 bits
			buffer_envio[871:840] <= out23; // 32 bits
			buffer_envio[903:872] <= out24; // 32 bits
			buffer_envio[935:904] <= out25; // 32 bits
			buffer_envio[967:936] <= out26; // 32 bits
			buffer_envio[999:968] <= out27; // 32 bits
			buffer_envio[1031:1000] <= out28; // 32 bits
			buffer_envio[1063:1032] <= out29; // 32 bits
			buffer_envio[1095:1064] <= out30; // 32 bits
			buffer_envio[1127:1096] <= out31; // 32 bits


			// señales de la unidad de riesgo	
			buffer_envio[1135:1128] <= {{7{2'b0}}, StallF}; // 8 bits
			buffer_envio[1143:1136] <= {{7{2'b0}}, StallD}; // 8 bits
			buffer_envio[1151:1144] <= {{6{2'b0}}, ForwardAD}; // 8 bits
			buffer_envio[1159:1152] <= {{6{2'b0}}, ForwardBD}; // 8 bits
			buffer_envio[1167:1160] <= {{7{2'b0}}, FlushE}; // 8 bits
			buffer_envio[1175:1168] <= {{6{2'b0}}, ForwardAE}; // 8 bits
			buffer_envio[1183:1176] <= {{6{2'b0}}, ForwardBE}; // 8 bits
		end


endmodule
