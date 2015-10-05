`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:21:02 10/04/2015 
// Design Name: 
// Module Name:    problema2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		Agregar la posibilidad de reset/set a la salida del multiplexor utilizando una señal llamada ‘rs’. 
//		El funcionamiento de la misma será: si rs = ‘0’ la salida ‘y’ será ‘0’ independientemente de la entrada. 
//		De igual modo si rs = ‘1’ la salida ‘y’ será ‘1’.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module problema2
#(parameter N=7)
(
	input [N:0] a,
	input [N:0] b,
	input [N:0] c,
	input [N:0] d,
	input [1:0] selector,
	input rs,
	input set,
	output reg [N:0] salida
);


always@(*)
begin
	if(rs == 0)
	begin
		if(set == 1)
		begin
			salida = (2**(N+1))-1;
		end
		else
		begin
			case(selector)
				2'b00:	salida=a;
				2'b01:	salida=b;
				2'b10:	salida=c;
				2'b11:	salida=d;
				default:	salida=0;
			endcase
		end
	end
	else
	begin
		salida=0;
	end
end


endmodule



