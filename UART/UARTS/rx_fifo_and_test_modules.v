`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:52 11/06/2015 
// Design Name: 
// Module Name:    rx_fifo_and_test_modules 
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
module rx_fifo_and_test_modules
#
( 
	parameter BAUD_RATE = 9600,
	parameter CLOCK =50000000
)
(
   input wire i_rx,
	input wire clk,
	input wire tx_full,
	output reg [7:0]w_data,
	output reg wr
    );

//wire de baud_rate
wire baud_gen_baud;
						
//wires de rx a fifo
wire [7:0] rx_d_out;
wire rx_rx_done;

//wires de fifo a test
wire [7:0] fifo_r_data;
wire fifo_rx_empty;

//wires de test a fifo
wire test_rd;
wire [7:0] test_w_data;
wire test_wr;


baud_gen
#(
	.BAUD_RATE(BAUD_RATE),
	.CLOCK(CLOCK)
) 
baudrate (
	.clk(clk),
	.baud(baud_gen_baud)
);

rx receptor(
	.senial(i_rx),
	.clk(clk),
	.baud(baud_gen_baud),
	.d_out(rx_d_out),
	.rx_done(rx_rx_done)
);

fifo_de_rx fiforx(
	.d_out(rx_d_out),
	.rx_done(rx_rx_done),
	.rd(test_rd),
	.clk(clk),
	.r_data(fifo_r_data),
	.rx_empty(fifo_rx_empty)
);

modulo_test tester(
	.r_data(fifo_r_data),
	.clk(clk),
	.rx_empty(fifo_rx_empty),
	.tx_full(tx_full),
	.w_data(test_w_data),
	.rd(test_rd),
	.wr(test_wr)
);

always@(posedge clk)
begin
	w_data <= test_w_data;
	wr <= test_wr;
end



endmodule
