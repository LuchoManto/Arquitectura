`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:24 11/07/2015 
// Design Name: 
// Module Name:    modulo_test 
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
module modulo_test
(
	input wire [7:0]r_data,
	input wire clk,
	input wire rx_empty,
	input wire tx_full,
	output reg [7:0]w_data,
	output reg rd,
	output reg wr
);

	
//Estados
localparam [2:0] START = 2'b00,
					  IDLE = 2'b01,
					  RECIBO = 2'b10,
					  ESPERO = 2'b11;
					  
					  
					  
//Variables internas
reg [7:0] buffer = 1;
reg [2:0] current_state = 3'b00;
reg [2:0] next_state = 3'b00;

//Variables para el pipe.
reg inicio = 0;
reg activo = 0;

//Cables para el pipe

// PC
wire [8:0]PCF;
//Instruccion
wire [31:0]InstrD;

// señales de control
wire [1:0]MemReadD;
wire RegWriteD;
wire MemtoRegD;
wire [3:0]MemWriteD;
wire [3:0]ALUControlID;
wire [1:0]ALUSrcD;
wire RegDstD;
wire BranchD; 

//banco de registros
wire [31:0]out0;
wire [31:0]out1;
wire [31:0]out2;
wire [31:0]out3;
wire [31:0]out4;
wire [31:0]out5;
wire [31:0]out6;
wire [31:0]out7;
wire [31:0]out8;
wire [31:0]out9;
wire [31:0]out10;
wire [31:0]out11;
wire [31:0]out12;
wire [31:0]out13;
wire [31:0]out14;
wire [31:0]out15;
wire [31:0]out16;
wire [31:0]out17;
wire [31:0]out18;
wire [31:0]out19;
wire [31:0]out20;
wire [31:0]out21;
wire [31:0]out22;
wire [31:0]out23;
wire [31:0]out24;
wire [31:0]out25;
wire [31:0]out26;
wire [31:0]out27;
wire [31:0]out28;
wire [31:0]out29;
wire [31:0]out30;
wire [31:0]out31;

// señales de salida de la unidad de riesgos
wire StallF;
wire StallD;
wire [1:0]ForwardAD;
wire [1:0]ForwardBD;
wire FlushE;
wire [1:0]ForwardAE;
wire [1:0]ForwardBE;

wire finalW;



Pipe pipeline
(
	.clk(clk),
	.inicio(inicio),
	.activo(activo),
	.PCF(PCF),
	.InstrD(InstrD),
	.MemReadD(MemReadD),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.ALUControlID(ALUControlID),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.BranchD(BranchD), 
	.out0(out0),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.out4(out4),
	.out5(out5),
	.out6(out6),
	.out7(out7),
	.out8(out8),
	.out9(out9),
	.out10(out10),
	.out11(out11),
	.out12(out12),
	.out13(out13),
	.out14(out14),
	.out15(out15),
	.out16(out16),
	.out17(out17),
	.out18(out18),
	.out19(out19),
	.out20(out20),
	.out21(out21),
	.out22(out22),
	.out23(out23),
	.out24(out24),
	.out25(out25),
	.out26(out26),
	.out27(out27),
	.out28(out28),
	.out29(out29),
	.out30(out30),
	.out31(out31),
	.StallF(StallF),
	.StallD(StallD),
	.ForwardAD(ForwardAD),
	.ForwardBD(ForwardBD),
	.FlushE(FlushE),
	.ForwardAE(ForwardAE),
	.ForwardBE(ForwardBE),
	.finalW(finalW)
);

Buffer_out #(1184) superbuffer
(
	.PCF(PCF),
	.InstrD(InstrD),
	.MemReadD(MemReadD),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.ALUControlID(ALUControlID),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.BranchD(BranchD), 
	.out0(out0),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.out4(out4),
	.out5(out5),
	.out6(out6),
	.out7(out7),
	.out8(out8),
	.out9(out9),
	.out10(out10),
	.out11(out11),
	.out12(out12),
	.out13(out13),
	.out14(out14),
	.out15(out15),
	.out16(out16),
	.out17(out17),
	.out18(out18),
	.out19(out19),
	.out20(out20),
	.out21(out21),
	.out22(out22),
	.out23(out23),
	.out24(out24),
	.out25(out25),
	.out26(out26),
	.out27(out27),
	.out28(out28),
	.out29(out29),
	.out30(out30),
	.out31(out31),
	.StallF(StallF),
	.StallD(StallD),
	.ForwardAD(ForwardAD),
	.ForwardBD(ForwardBD),
	.FlushE(FlushE),
	.ForwardAE(ForwardAE),
	.ForwardBE(ForwardBE),
	.buffer_envio(buffer_envio)
);



always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		START:
			begin
				w_data=buffer;
				rd = 0;
				wr = 0;
				next_state = IDLE;
			end
		IDLE: // estado inicial. Idle
				begin
					if(rx_empty == 0)
					begin
						rd=1;
						next_state = RECIBO;
					end
					else
					begin
						rd=0;
						next_state = IDLE;
					end
				end
		RECIBO: 
				begin
					//Espero que rx empty vuelva a 1
					if(rx_empty == 1)
					begin
						if(tx_full==0)
						begin
							w_data = r_data;
							wr = 1;
							rd = 0;
							next_state = ESPERO;
						end
						else
						begin
							next_state = RECIBO;
						end
					end
				end
		ESPERO: 
				begin
					if(tx_full == 1)
					begin
						wr = 0;
						next_state = IDLE;
					end
					else
					begin
						next_state = ESPERO;
					end
				end
	endcase
end//always de logica de salida
	


endmodule



