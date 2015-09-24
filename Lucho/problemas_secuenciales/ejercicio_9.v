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
	
	output reg [7:0]cont_out,
	output reg [7:0]cont_nout,
	
	input wire cont_enable,
	input wire cont_reset,
	input wire D_in0,
	input wire D_in1,
	input wire D_in2,
	
	input wire clock

    );
	 
	 wire [2:0]deco_in;
//	 wire [2:0]ndeco_in;
	 
	 wire [7:0]salida_deco;
//	 wire [7:0]salida_ndeco;
	
	 wire cable0;
	 wire cable1;
	 wire cable2;
	 
	 assign cable0 = D_in0;
	 assign cable1 = D_in1;
	 assign cable2 = D_in2;
	
	ejercicio_3 #(1) ff_0 (.D(cable0),
								  .Q(deco_in[0]),
								  .notQ(cable0),
								  .enable(cont_enable),
								  .reset(cont_reset),
								  .clock(clock)
								  );
								  
	ejercicio_3 #(1) ff_1 (.D(cable1),
								  .Q(deco_in[1]),
								  .notQ(cable1),
								  .enable(cont_enable),
								  .reset(cont_reset),
								  .clock(cable0)
								  );
								  
	ejercicio_3 #(1) ff_2 (.D(cable2),
								  .Q(deco_in[2]),
								  .notQ(cable2),
								  .enable(cont_enable),
								  .reset(cont_reset),
								  .clock(cable1)
								  );
								  
	decoder deco1 (.entrada(deco_in),
						.salida(cont_out)
						);
															  
//	decoder deco2 (.entrada(ndeco_in),
//						.salida(salida_ndeco)
//						);
		


endmodule
