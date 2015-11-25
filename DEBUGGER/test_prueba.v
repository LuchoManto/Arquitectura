`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:58 11/08/2015
// Design Name:   prueba
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/UART/receptor/test_prueba.v
// Project Name:  receptor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prueba
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_prueba;

	// Inputs
	reg i_rx;
	reg clk;

	// Outputs
	wire [7:0] salida;
	wire tx;
	wire [3:0]outputs;

	// Instantiate the Unit Under Test (UUT)
	prueba uut (
		.i_rx(i_rx), 
		.clk(clk), 
		.tx(tx),
		.state(outputs)
	);

	always #1
	begin
		clk = ~clk;
	end
	task recibir_dato(input [7:0] dato);
	begin
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Comienza envio de dato: %b",dato," -Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		i_rx = 0;
		while(uut.receptor.current_state!=2)
			#1;
	
		
		$fdisplay(f,"\n Recibo bit start-------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		i_rx = dato[0];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[0]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		i_rx = dato[1];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[1]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		i_rx = dato[2];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[2]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
      //$finish;
		  
		i_rx = dato[3];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[3]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		i_rx = dato[4];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[4]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		i_rx = dato[5];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[5]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		i_rx = dato[6];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[6]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		i_rx = dato[7];
		
		while(uut.receptor.s!=15)
			#1;
		while(uut.receptor.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[7]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		i_rx = 1;
		
		while(uut.receptor.current_state!=0)
			#1;
			
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Finaliza envio de dato: %b",dato," Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
	end
	endtask

	integer f;
	initial begin
		f = $fopen("test_modules1_salida.txt", "w");
		$fdisplay("Comienza la simulacion");
		
		i_rx = 1;
		clk = 0;

		recibir_dato(8'b01110000);

		#100;
		$finish;
		/*
      recibir_dato(8'b10101010);

		#100;

		recibir_dato(8'b11110000);

		#100;		

		recibir_dato(8'b00001111);

		#100;	
		
		recibir_dato(8'b00000000);

		#100;	
		
		recibir_dato(8'b11111111);
		*/
		#10000;	
		
		
		$fdisplay(f,"Termina la simulacion. -Time: ",$time);
		$fclose(f);
		$finish;
	end
      
endmodule

