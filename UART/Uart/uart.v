`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:39 10/17/2015 
// Design Name: 
// Module Name:    uart 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//   v10 clock
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart(
	output reg tx,
	input wire rx,
	input wire clock
 );

wire [7:0] d_out;
wire [7:0] r_data;	 
wire [7:0] w_data;
wire [7:0] d_in;	
wire tx2; 
	 
	 
baudrate_gen baudr (.clock(clock),
						.baud(baud)
						);
	 
receiver r ( .rx(rx),
				 .clk(baud),
				 .d_out(d_out),
				 .rx_done(rx_done)
 );
					 
transmitter t (	.clk(baud),
					.d_in(d_in),
					.tx_start(tx_start),
					.tx_done(tx_done),
					.tx(tx2)
);
						
fifo_receiver #(8) fifor (	.d_out(d_out),
								.rx_done(rx_done),
								.rd(rd),
								.r_data(r_data),
								.rx_empty(rx_empty),
								.clk(clock)
);

fifo_transmitter #(8) fifot (	.w_data(w_data),
										.tx_done(tx_done),
										.wr(wr),
										.d_in(d_in),
										.tx_full(tx_full),
										.tx_start(tx_start),
										.clk(clock)
);
								
replicador rep (	.r_data(r_data),
					.rd(rd),
					.rx_empty(rx_empty),
					.w_data(w_data),
					.wr(wr),
					.tx_full(tx_full),
					.clk(clock)
);

always@(posedge clock)
begin
	tx <= tx2;
end
		
		
endmodule
