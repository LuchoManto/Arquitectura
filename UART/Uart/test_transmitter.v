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
module test_transmitter(

	// Inputs
	reg clk;
	reg [7:0] d_in;
	reg tx_start;

	// Outputs
	wire tx_done;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	UART_TX uut (
		.clk(clk), 
		.d_in(d_in), 
		.tx_start(tx_start), 
		.tx_done(tx_done), 
		.tx(tx)
	);

	//Funciones y variables para test
	reg[10*8:0] current_state_name;
	reg[10*8:0] expected_state_name;
	
	//Declaro estados
	localparam [2:0] 	IDLE 	 = 3'b000,
							START  = 3'b001,
							ESPERO = 3'b010,
							ENVIO  = 3'b011,
							STOP	 = 3'b100;
						  
	

	function check_state(input [3:0] state);
	begin
		case(state)
			IDLE:
				begin
					expected_state_name="IDLE";
				end
			START:
				begin
					expected_state_name="START";
				end
			ESPERO:
				begin
					expected_state_name="ESPERO";
				end
			ENVIO :
				begin
					expected_state_name="ENVIO";
				end
			STOP:
				begin
					expected_state_name="STOP";
				end
		endcase
		case(uut.current_state)
			IDLE:
				begin
					current_state_name="IDLE";
				end
			START:
				begin
					current_state_name="START";
				end
			ESPERO:
				begin
					current_state_name="ESPERO";
				end
			ENVIO :
				begin
					current_state_name="ENVIO";
				end
			STOP:
				begin
					current_state_name="STOP";
				end
		endcase
		
		$display("---------------------------------\n-expected_state: %s",expected_state_name,
		"\n -current_state: %s",current_state_name,
		"\n -bus_tx: ",uut.bus_tx,"\n -d_in(entrada): ",d_in,
		"\n -tx(salida): ",tx,"\n -tx_done: ",tx_done,"\n -n: ",uut.n,"\n -s: ",uut.s,
		"\n -tx_start: ",tx_start,"\n -time: ",$time,"\n---------------------------------\n");
		if(state != uut.current_state)
		begin
			$display("Error curret_state, state esperado es:",state,".Valor uut.current_state es:",uut.current_state,". Tiempo: ", $time);
			$finish;
		end
	end
	endfunction

	always #5
	begin
		clk = ~clk;
	end
	
	
	initial begin
		$display("Comienza la simulacion");
		$monitor("---------------------------------\n-current_state: %s",current_state_name,"\n -bus_tx: ",uut.bus_tx,"\n -d_in(entrada): ",d_in,
		"\n -tx(salida): ",tx,"\n -tx_done: ",tx_done,"\n -n: ",uut.n,
		"\n -tx_start: ",tx_start,"\n---------------------------------\n");
		
		// Initialize Inputs
		clk = 0;
		d_in = 8'b01010101;
		tx_start = 0;
		
		#10;
		check_state(IDLE);
		
		tx_start = 1;
		#10;
		check_state(START);
		
		tx_start = 0;
		while(uut.n<7)
		begin
			#10;
			check_state(ESPERO);
			
			#160;
			check_state(ENVIO);
		end
		
		#10;
		check_state(ESPERO);
		
		#160;
		check_state(STOP);
		
		#10;
		check_state(ESPERO);
		
		#160;
		check_state(IDLE);
		
		#160;
		check_state(IDLE);
		
		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

