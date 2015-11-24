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
	parameter BAUD_RATE = 9_600,
	parameter CLOCK =100_000_000
)
(
   input wire i_rx,
	input wire clk,
	output reg tx
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

//wire salida de fifotx
wire [7:0] fifo_tx_d_in;
wire fifo_tx_tx_start;
wire fifo_tx_tx_full;

//wire salida de tx
wire tx_tx_done;
wire tx_o_tx;

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
	.tx_full(fifo_tx_tx_full),
	.w_data(test_w_data),
	.rd(test_rd),
	.wr(test_wr)
);

fifo_de_tx fifotx
(
	.w_data(test_w_data),
	.wr(test_wr),
	.tx_done(tx_tx_done),
	.clk(clk),
	.tx_full(fifo_tx_tx_full),
	.tx_start(fifo_tx_tx_start),
	.d_in(fifo_tx_d_in)
);

tx transmisor
(
	.tx_start(fifo_tx_tx_start),
	.d_in(fifo_tx_d_in),
	.clk(clk),
	.baud(baud_gen_baud),
	.tx(tx_o_tx),
	.tx_done(tx_tx_done)
);

always@(posedge clk)
begin
	tx <= tx_o_tx;
end

endmodule
