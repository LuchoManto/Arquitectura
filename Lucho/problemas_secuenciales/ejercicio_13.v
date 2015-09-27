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
//13.	Describa en Verilog e implemente en el kit BASYS 2 un PWM con resolución de 4 bits. Deberá modular el ancho de pulso
// de una onda cuadrada externa, la cual se introducirá a la placa a través de alguno de los pines disponibles para señales
// externas. Se Deberá determinar la máxima frecuencia de señal de entrada que su circuito puede modular.
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_13(
	input wire i_signal,
	input wire i_boton,
	input wire [3:0]valor_pwm,
	
	output reg o_pwm,
	
	input wire clock
    );
	
	reg [31:0]cont_clk;
//	reg [31:0]cont_pwm;
	reg [31:0]periodo;
	reg [31:0]resolucion; //dependera del periodo y sirve para calcular el ciclo de trabajo. es periodo/16
	reg [31:0]ciclo_dt;
	
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
//		cont_pwm <= cont_pwm + 1;   // incremento el contador del pwm
		
		resolucion <= periodo / 16; // se calcula el valor minimo para el pwm
		
		if(cont_clk == 0)  // si el contador del clock es 0, se llego al periodo de la señal
		begin
			o_pwm <= 1; // se comienza el ciclo de trabajo
		end
		
		if(cont_clk == ciclo_dt) // cuando llega al ciclo de trabajo calculado, se baja la señal
		begin
			o_pwm <= 0;
		end
		
	end
	
	
	always@(posedge clock)
	begin
		if(i_boton == 1)
			ciclo_dt = resolucion * valor_pwm; // se carga el valor del ciclo de trabajo segun el valor de 16 bits ingresado en los botones
		// la resolucion es el ciclo minimo de trabajo. si valor_pwm vale 1, el ciclo de trabajo es maximo, si vale 16, es minimo
	end
	
endmodule
