`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:41 10/15/2015 
// Design Name: 
// Module Name:    UARTFIFORX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
	FIFO UART, parameter DB databits of UART,
	parameter size, cantidad de buffers en FIFO. 
	
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/

module UARTFIFORX
#(
	parameter DB=8,
	parameter size=1
)
(
	input wire [DB-1:0] d_out,
	input wire rx_done,
	input wire rd,
	output reg [DB-1:0] r_data,
	output reg rx_empty,
	input wire clk
);

//Declaro estados
localparam [1:0] IDLE = 2'b00,
					  POP = 2'b01,
					  
					  	
//Stack FIFO.
reg [size-1:0] stack [DB-1:0];



endmodule
