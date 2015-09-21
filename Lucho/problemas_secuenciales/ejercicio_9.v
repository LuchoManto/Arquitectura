`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:26 09/20/2015 
// Design Name: 
// Module Name:    ejercicio_9 
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
module ejercicio_9(

	input wire cont_enable,
	input wire cont_reset,
	input wire cont_set,
	
	output reg [7:0]cont_out,
	output reg [7:0]cont_nout,
	
	input wire clock

    );
	 
	 wire [2:0]deco_in = 0;
	 wire [2:0]ndeco_in = 0;
	 
	 wire [7:0]salida_deco;
	 wire [7:0]salida_ndeco;
	
	ejercicio_5 #(1) ff_0 (.i_in(ndeco_in[0]),
								  .o_out(deco_in[0]),
								  .o_nout(ndeco_in[0]),
								  .i_en(cont_enable),
								  .i_rs(cont_reset),
								  .i_se(cont_set),
								  .clock(clock)
								  );
								  
	ejercicio_5 #(1) ff_1 (.i_in(ndeco_in[1]),
								  .o_out(deco_in[1]),
								  .o_nout(ndeco_in[1]),
								  .i_en(cont_enable),
								  .i_rs(cont_reset),
								  .i_se(cont_set),
								  .clock(ndeco_in[0])
								  );
								  
	ejercicio_5 #(1) ff_2 (.i_in(ndeco_in[2]),
								  .o_out(deco_in[2]),
								  .o_nout(ndeco_in[2]),
								  .i_en(cont_enable),
								  .i_rs(cont_reset),
								  .i_se(cont_set),
								  .clock(ndeco_in[1])
								  );
								  
	decoder deco1 (.entrada(deco_in),
						.salida(salida_deco)
						);
															  
	decoder deco2 (.entrada(ndeco_in),
						.salida(salida_ndeco)
						);
						
	always@(posedge clock)
	begin
	
	cont_out <= salida_deco;
	cont_nout <= salida_ndeco;
	
	end
		


endmodule
