`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:22:21 10/17/2015
// Design Name:   UART_FIFO_TX
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/FIFO-UART/TEST_FIFO_TX.v
// Project Name:  FIFO-UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_FIFO_TX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fifo_transmitter;

	// Inputs
	reg [7:0] w_data;
	reg tx_done;
	reg wr;
	reg clk;

	// Outputs
	wire [7:0] d_in;
	wire tx_full;
	wire tx_start;

	// Instantiate the Unit Under Test (UUT)
	UART_FIFO_TX uut (
		.w_data(w_data), 
		.tx_done(tx_done), 
		.wr(wr), 
		.d_in(d_in), 
		.tx_full(tx_full), 
		.tx_start(tx_start), 
		.clk(clk)
	);


	
	//Funciones y variables para test
	reg[10*8:0] current_state_name;
	
	
	//Declaro estados
	localparam [3:0] IDLE = 3'b000,
						  ENVIO_A_TX = 3'b001,
						  ESPERO_A_TX = 3'b010,
						  RECIBO_DE_CPU = 3'b011,
						  ESPERO_A_CPU = 3'b100;
						  
	

	function check_state(input [3:0] state);
	begin
		case(state)
			IDLE:
				begin
					current_state_name="IDLE";
				end
			ENVIO_A_TX:
				begin
					current_state_name="ENVIO_A_TX";
				end
			ESPERO_A_TX:
				begin
					current_state_name="ESPERO_A_TX";
				end
			RECIBO_DE_CPU :
				begin
					current_state_name="RECIBO_DE_CPU";
				end
			ESPERO_A_CPU:
				begin
					current_state_name="ESPERO_A_CPU";
				end
		endcase
		
		$display("---------------------------------\n-current_state: %s",current_state_name,"\n -w_data(entrada): ",w_data,
		"\n -stack: ",uut.stack,"\n -d_in(salida): ",d_in,"\n -tx_done: ",tx_done,"\n -wr: ",wr,
		"\n -tx_full: ",tx_full,"\n -tx_start: ",tx_start,"\n -time: ",$time,"\n---------------------------------\n");
		if(state != uut.current_state)
		begin
			$display("Error curret_state, state esperado es:",state,".Valor uut.current_state es:",uut.current_state,". Tiempo: ", $time);
			$finish;
		end
	end
	endfunction

	/*
	function get_state_name(input [3:0] state);
	begin
		case(state)
			IDLE:
				begin
					current_state_name="IDLE";
				end
			ENVIO_A_TX:
				begin
					current_state_name="ENVIO_A_TX";
				end
			ESPERO_A_TX:
				begin
					current_state_name="ESPERO_A_TX";
				end
			RECIBO_DE_CPU :
				begin
					current_state_name="RECIBO_DE_CPU";
				end
			ESPERO_A_CPU:
				begin
					current_state_name="ESPERO_A_CPU";
				end
		endcase
	end
	endfunction
	*/

	always #5
	begin
		clk = ~clk;
	end


	initial begin
		$display("Comienza la simulacion");
		$monitor("---------------------------------\n-current_state:",uut.current_state,"\n -w_data(entrada): ",w_data,
		"\n -stack: ",uut.stack,"\n -stack_empty: ",uut.stack_empty,"\n -d_in(salida): ",d_in,"\n -tx_done: ",tx_done,
		"\n -wr: ",wr,"\n -tx_full: ",tx_full,"\n -tx_start: ",tx_start,"\n---------------------------------\n");
		
		// Initialize Inputs
		w_data = 50;
		tx_done = 0;
		wr = 0;
		clk = 0;
		
		#20;
		
		tx_done = 1;
		#10;
		check_state(IDLE);
		
		wr = 1;
		#10;
		check_state(RECIBO_DE_CPU);
		
		#10;
		check_state(ESPERO_A_CPU);
		
		wr = 0;
		#10;
		check_state(IDLE);
		
		#10;
		check_state(ENVIO_A_TX);
		
		#10;
		check_state(ESPERO_A_TX);
		
		tx_done=0;
		#50;
		check_state(IDLE);

		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

