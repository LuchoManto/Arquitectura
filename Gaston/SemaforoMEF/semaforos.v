`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:00 09/28/2015 
// Design Name: 
// Module Name:    semaforos 
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
module semaforos(
	input clk,
	input reset,
	input on_off,
	output reg [2:0] sel_luz
    );

//Declaracion de estados
localparam [2:0] VERDE= 3'b000,
						AMARRILLO = 3'b001,
						ROJO = 3'b010,
						OFF_A = 3'b011,
						ONALL = 3'b100;


endmodule
