`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:10 11/06/2015 
// Design Name: 
// Module Name:    prueba 
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
module prueba
#
( 
	parameter BAUD_RATE = 9600,
	parameter CLOCK =100_000_000
)
(
   input wire i_rx,
	input wire clk,
	input wire reset,
	output reg [7:0]salida,
	output reg [3:0]salida1,
	output reg [3:0]salida2
);

//wire de baud_rate
wire baud_gen_baud;
wire baud_leds;

//wires de rx a fifo
wire [7:0] rx_d_out;
wire rx_rx_done;
wire [3:0]rx_salida1;
wire [3:0]rx_salida2;

baud
#(
	.COUNT(651)
) 
baudrate (
	.clock(clk),
	.baud_rate(baud_gen_baud)
);

rx 
receptor
(
	.senial(i_rx),
	.clk(clk),
	.baud(baud_gen_baud),
	.d_out(rx_d_out),
	.salida1(rx_salida1),
	.salida2(rx_salida2),
	.rx_done(rx_rx_done)
);

always@(posedge clk)
begin
	salida <= rx_d_out;
	salida1 <= rx_salida1;
	salida2 <= rx_salida2;
end

endmodule
