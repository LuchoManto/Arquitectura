`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:27 09/14/2015 
// Design Name: 
// Module Name:    ejercicio_4 
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

//4.	Desarrolle un modelo Verilog de un detector de picos que encuentre el valor máximo dentro de una secuencia de enteros
// sin signo de 10 bit. Un nuevo número arriba a la entrada con un flanco ascendente del reloj. El valor del máximo número
// ingresado deberá ser mostrado en los 8 de los leds de usuario presentes en el kit de desarrollo BASYS 2. Se deberá
// implementar una señal de “RESET” utilizando uno de los pulsadores dispuestos en el kit para el usuario. El valor máximo
// mostrado en los leds será borrado (todos los leds apagados) cuando llegue un reset. 
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_4(
	input wire [9:0]i_ent,
	input wire i_rs,
	output reg [7:0]o_res,
	
	input wire clk
    );
	 
	 reg [9:0]ff_ent;
	 reg [9:0]ff_aux = 0;
	 
	 always@(posedge clk)
	 begin
	 ff_ent <= i_ent;
	 end
	 
	 always@(posedge clk)
	 begin
	 if(ff_ent > ff_aux)
	 ff_aux <= ff_ent;
	 end
	 
	 always@(posedge clk)
	 begin
	 if(i_rs == 0)
	 o_res <= ff_aux;
	 else
	 begin
	 o_res <= 0;
	 ff_aux <= 0;
	 end
	 
	 end

endmodule
