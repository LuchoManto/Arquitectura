`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:52 09/27/2015 
// Design Name: 
// Module Name:    ejercicio_13 
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
module ejercicio_13(
	input wire i_signal,
	input wire i_boton,
	input wire [3:0]valor_pwm,
	
	output reg o_pwm,
	
	input wire clock;
    );
	
	reg [31:0]cont_clk;
	reg [31:0]cont_pwm;
	reg [31:0]periodo;
	reg [31:0]resolucion; //dependera del periodo y sirve para calcular el ciclo de trabajo. es periodo/16
	
	always@(posedge clock)
	begin
		cont_clk <= cont_clk + 1;  //incremento contador de clock
	end
	
	always@(posedge i_signal)
	begin
		cont_clk <= 0;
		periodo <= cont_clk;   // en cada flanco positivo de la señal, guardo el periodo de la misma
	end
	
	always@(posedge clock)
	begin
		cont_pwm <= cont_pwm + 1;   // incremento el contador del pwm
		
		if(cont_pwm == periodo)  // si el contador del pwm es igual al periodo, se llego al periodo de la señal
		begin
			cont_pwm <= 0; // se vuelve a 0 el contador para que el periodo de la señal de salida sea el mismo que el de la entrada
			o_pwm <= 1; // se comienza el ciclo de trabajo
		end
		
		if(cont_pwm == ciclo_dt) // cuando llega al ciclo de trabajo calculado, se baja la señal
		begin
		o_pwm <= 0
		end
		
	end
	
	
	always@(posedge clock)
	begin
		if(i_boton == 1)
		ciclo_dt = periodo / valor_pwm; // se carga el valor del ciclo de trabajo segun el valor de 16 bits ingresado en los botones
		// el valor actual del periodo dividido 16 da 
	
	
endmodule
