`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:15 10/15/2015 
// Design Name: 
// Module Name:    Tx 
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
module transmitter(
   input wire clk,
	input wire [7:0]d_in,
	input wire tx_start,
	output reg tx_done,
	output reg tx
);

initial
begin
	tx_done = 1;
	tx = 1;
end

//Declaro los estados que voy a tener.
localparam [2:0] 	IDLE 	 = 3'b000,
						START  = 3'b001,
						ESPERO = 3'b010,
						ENVIO  = 3'b011,
						STOP	 = 3'b100;


//Declaro las variables necesarias internas.
reg [2:0] current_state = 3'b000;
reg [2:0] next_state = 3'b000;
reg [7:0] bus_tx=0;
reg [3:0] n=0;
reg [3:0] s=0; 


//Registro de estado, cambio segun el clock (aca va a ir conectado
// el s_tick).
always @(posedge clk)
begin
	current_state <= next_state;
end


//declaro ahora la logica de salida de cada estado
always @ (posedge clk)
begin
	case(current_state)
		IDLE:
			begin
				tx_done = 1;
				tx = 1;
			end
		START:
			begin 
				bus_tx = d_in;
				tx_done = 0;
				tx = 0;
				n = 0;
				s = 0;
			end
		ESPERO:
			begin
				s = s + 1;
			end
		ENVIO:
			begin
				tx = bus_tx [n];
				n = n + 1;
				s = 0;
			end	
		STOP:
			begin
				tx = 1;
				n = n + 1;
				s = 0;
			end
	endcase
end


//Logica para el cambio de estado.
always @*
begin
	next_state = IDLE;
	case (current_state)
		IDLE:
		begin
			if (tx_start == 1)
				next_state = START;
			else
				next_state = IDLE;
		end
		START: 
		begin
			next_state = ESPERO;
		end
		ESPERO:
		begin
			if (s == 15)
			begin
				if(n<8)
					next_state = ENVIO;
				if(n==8)
					next_state = STOP;
				//if(n==9)
					//next_state = IDLE;
			end
			else
			begin
				next_state = ESPERO;
			end
		end
		ENVIO:
		begin
			next_state = ESPERO;
		end
		STOP:
		begin
			//next_state = ESPERO;
			next_state = IDLE;
		end
	endcase
end

endmodule
