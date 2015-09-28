`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:50 09/24/2015 
// Design Name: 
// Module Name:    Ej5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
1.	Escriba un modelo Verilog de un flip-flop con:
	a.	Una señal de "Clock-enable" síncrona con lógica negativa
	b.	2 entradas, una de reset y otra de preset asincrónicas y con lógica positiva.
	c.	Y ambas salidas Q y ~Q (not Q).
	
	Tabla de verdad deseada:
	R=RESET S=SET CE=CLOCK_ENABLED Q Estado guardado
	
	|	 	ENTRADAS	|	SALIDAS	|
	|C_E	|	S	|	R	|	Q	|	~Q	|
	|-----|-----|-----|-----|-----|
	|	0	|	0	|	0	|	Q	|	~Q	|	HOLD
	|	0	|	0	|	1	|	0	|	1	|	RESET
	|	0	|	1	|	0	|	1	|	0	|	SET
	|	0	|	1	|	1	|	invalido	|	SALIDA NO DETERMINADA
	|	1	|	X	|	X	|	Q	|	~Q	|
   
	
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module Ej5
(
	input wire set,
	input wire reset,
	input wire clock_en,
	output reg result,
	output reg not_result,
	input wire clk
);



always@(posedge clk)
begin
	if(clock_en == 0)
	begin
		if(set == 1)
		begin
			result <= 1;
			not_result <= 0;
		end
		else
		begin
			if(reset == 1)
			begin
				result <= 0;
				not_result <= 1;
			end
			else
			begin
				result <= result;
				not_result <= not_result;
			end		
		end
	end
	else
	begin
		result <= result;
		not_result <= not_result;
	end
end

endmodule
