`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:17 09/20/2015 
// Design Name: 
// Module Name:    ejercicio_8 
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

//8.	Describa en Verilog un circuito para un contador de módulo 12. Se deberá permitir cargar un valor umbral, con una
// resolución <= a 12 bits utilizando los switches dispuestos en la placa de desarrollo BASYS 2. Cuando el contador alcance
// (o supere) dicho umbral deberá encender un led (de los disponibles en el kit de desarrollo) que indique dicho evento.
// Al alcanzar su valor de cuenta máxima se deberá apagar dicho LED.
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_8(
	input wire [11:0]i_umbral,
	
	output reg o_out,
	
	input wire clock
	
    );
	 
	 reg [11:0]count_clk = 0;
	 
	 always@(posedge clock)
	 begin
		count_clk <= count_clk + 1;
		if(count_clk == i_umbral)
			o_out <= 1;
		if(count_clk == 0)
			o_out <= 0;
			
	 end
	 


endmodule
