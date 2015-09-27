`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:19 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_11_12
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

//11.	Diseñe un circuito en Verilog que sea capaz de contar el periodo de una señal externa periódica y de onda cuadrada,
// con una resolución de 8 bits y mostrarlo en los 8 Leds de usuarios disponibles en la placa BASYS 2. 
//NOTA: Para realizar este ejercicio deberá utilizar un generador de señales.
//
//12.	Agregue la capacidad de almacenar el máximo y mínimo periodo medido de la señal externa hasta el momento.
// Para mostrar dichos valores deberá utilizar uno y solo un pulsador de los disponibles en los kits de desarrollo BASYS 2.
// El pulsador funcionara de la siguiente manera:
//a.	Por default muestra el periodo instantáneo de la señal externa.
//b.	Al pulsarlo 1 vez muestra el máximo periodo medido.
//c.	Al pulsarlo por segunda vez muestra el mínimo periodo medido hasta el momento.
//d.	Al pulsarlo por tercera vez vuelve a mostrar el periodo instantáneo de la señal externa y el ciclo de pulsaciones comienza nuevamente.

//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_11_12(
	input wire i_signal,
	output reg [7:0]o_salida,
	input wire i_boton;
	
	input wire clock
    );
	 
	reg [7:0]contador;
	reg [1:0]contador_boton;
	reg [7:0]periodo_actual;
	reg [7:0]periodo_min;
	reg [7:0]periodo_max;
	 
	 
	always@(posedge clock)
	begin
		contador <= contador + 1;
		
		if(i_boton == 1)
		begin
			contador_boton = contador_boton + 1;
		end
		
		case(contador_boton)
		2'b00: o_salida <= periodo_actual;
		2'b01: o_salida <= periodo_min;
		2'b10: o_salida <= periodo_max;
		default: o_salida <= periodo_actual;
		endcase
		
	end
		
		
	always@(posedge i_signal)
	begin
		contador <= 0;
		o_periodo_actual <= contador;
		
		if(periodo_actual > periodo_max)
			periodo_max <= periodo_actual;
			
		if(periodo_actual < periodo_min)
			periodo_min <= periodo_actual;
			
	end


endmodule
