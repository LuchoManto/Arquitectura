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

module TEST_FIFO_TX;

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


	/*
		Funciones y variables para test
	*/
	reg[10*8:0] string;
	
	function check_state(input [3:0] state);
	begin
		$display("---------------------------------\n-current_state: %s",string,"\n -w_data(entrada): ",w_data,
		"\n -stack: ",uut.stack,"\n -d_in(salida): ",d_in,"\n -tx_done: ",tx_done,
		"\n -wr: ",wr,"\n -tx_full: ",tx_full,"\n -tx_start: ",tx_start,"\n---------------------------------\n");
		if(state != uut.current_state)
		begin
			$display("Error curret_state, state esperado es:",state,".Valor uut.current_state es:",uut.current_state,". Tiempo: ", $time);
			$finish;
		end
	end
	endfunction

	function get_state_name(input [3:0] state);
	begin
		case(state)
			3'b000:
				begin
					string="IDLE";
				end
			3'b001:
				begin
					string="ENVIO_A_TX";
				end
			3'b010:
				begin
					string="ESPERO_A_TX";
				end
			3'b011:
				begin
					string="RECIBO_DE_CPU";
				end
			3'b100:
				begin
					string="ESPERO_A_CPU";
				end
		endcase
	end
	endfunction


	always #5
	begin
		clk = ~clk;
		get_state_name(uut.current_state);
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
		
		wr = 1;
		#50;
		check_state(3'b100);
		
		wr = 0;
		#50;
		check_state(3'b000);
		
		tx_done=1;
		#50;
		check_state(3'b010);
		
		tx_done=0;
		#50;
		check_state(3'b000);


		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

