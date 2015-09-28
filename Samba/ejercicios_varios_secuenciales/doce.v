`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:52 09/14/2015 
// Design Name: 
// Module Name:    doce 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
12.	Agregue la capacidad de almacenar el máximo y mínimo periodo medido de la señal externa hasta el momento.
 Para mostrar dichos valores deberá utilizar uno y solo un pulsador de los disponibles en los kits de desarrollo BASYS 2. 
 El pulsador funcionara de la siguiente manera:
a.	Por default muestra el periodo instantáneo de la señal externa.
b.	Al pulsarlo 1 vez muestra el máximo periodo medido.
c.	Al pulsarlo por segunda vez muestra el mínimo periodo medido hasta el momento.
d.	Al pulsarlo por tercera vez vuelve a mostrar el periodo instantáneo de la señal externa y el ciclo de pulsaciones comienza nuevamente

*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module doce	# (parameter N_BITS = 8)
	(
	input i_cuadrada, clk, reset, pulsador,
	output reg o_leds
    );

	reg [N_BITS-1:0] contador;
	reg valor_anterior; //para almacenar un flanco
	reg [N_BITS-1:0] minimo, maximo;
	reg [1:0] pulsador_valor, pulsador_valor_anterior; // el delay que se tiene por oprimir el pulsador es muy grande, por lo tanto contaria muchas veces si no se utliza un comparador
	
	
	
	always @ (posedge clk)
	begin
		valor_anterior <= i_cuadrada;
		pulsador_valor_anterior <= pulsador_valor;
		
		if (reset)
			begin
				contador <= {N_BITS{1'b0}};
				minimo <= {N_BITS{1'b1}};
				maximo <= {N_BITS{1'b0}};
				pulsador_valor <= 2'b00;
			end
			
		else
		begin
			
			if (pulsador_valor_anterior == 1 &&  pulsador_valor == 0) //flanco de bajada (apretar y soltar)
				begin
					pulsador_valor = pulsador_valor +1;
					if (pulsador_valor > 3)
						pulsador_valor <= 0;
				end

			if (valor_anterior == 0 &&  i_cuadrada == 1) // esto es por el flanco
				begin
							
					if(contador < minimo)
						minimo <= contador;
					if(contador > maximo)
						maximo <= contador;
										
					case (pulsador_valor)
						2'b00 : o_leds <= contador;
						2'b01 : o_leds <= maximo;
						2'b00 : o_leds <= minimo;
						default : o_leds <= contador;
					endcase	
							
					contador <= 0;
				end
			else
				contador <= contador +1;
		end
	end
endmodule