`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:04 11/17/2015 
// Design Name: 
// Module Name:    exec 
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
module exec(
	input wire [31:0]RD1,
	input wire [31:0]RD2,
	input wire [31:0]ResultW,
	input wire [31:0]ALUoutM,
	input wire [4:0]RtE,
	input wire [4:0]RdE,
	input wire RegDstE,
	input wire [31:0]SignImmE,
	input wire ALUSrcE,
	input wire [1:0]ForwardAE,
	input wire [1:0]ForwardBE,
	input wire ALUControlE,
	
	output reg [31:0]ALUOutM,
	output reg [31:0]WriteDataM,
	output reg [4:0]WriteRegM,
	
	input wire clk

		
    );
	 
	 wire [31:0]WriteDataE;
	 wire [31:0]SrcBE;
	 wire [31:0]SrcAE;
	 wire [31:0]ALUOutE;
	 
	 wire [31:0]temp_WriteDataM;
	 wire [31:0]temp_WriteRegM;
	 
	 // multiplexor con control de riesgos para señal de ForwardBE
	 mux_ForwardBE muxForwardBE ( .RD2(RD2),
											.ResultW(ResultW),
											.ALUOutM(ALUOutM),
											.ForwardBE(ForwardBE),
											.WriteDataE(WriteDataE)
										);

	 // multiplexor con control de riesgos para señal de ForwardAE
	 mux_ForwardAE muxForwardAE ( .RD1(RD1),
											.ResultW(ResultW),
											.ALUOutM(ALUOutM),
											.ForwardAE(ForwardBE),
											.SrcAE(SrcAE)
										);
	
	// multiplexor que determina el origen del registro a escribir
	 mux_RegDstE muxRegDstE ( 		.RtE(RtE),
											.RdE(RdE),
											.RegDstE(RegDstE),
											.WriteRegE(WriteRegE)
										);
										
	// multiplexor que determina el origen del segundo operando de la ALU
	 mux_ALUSrcE muxALUSrcE ( 		.WriteDataE(WriteDataE),
											.SignImmE(SignImmE),
											.ALUSrcE(ALUSrcE),
											.SrcBE(SrcBE)
										);
	
	 alu #(32) alu_inst (	.input1(SrcAE),
							.input2(SrcBE),
							.operation(ALUControlE),
							.result(ALUOutE)
							);
							
	latch_exec_out latch_out (		.ALUoutE(ALUoutE),
											.WriteDataE(WriteDataE),
											.WriteRegE(WriteRegE),
											.ALUoutM(ALUoutM),
											.WriteDataM(temp_WriteDataM),
											.WriteRegM(temp_WriteRegM),
											.clk(clk)
							);
							
	always@(*)
	begin
	
	WriteDataM <= temp_WriteDataM;
	WriteRegM <= temp_WriteRegM;
	
	end


endmodule
