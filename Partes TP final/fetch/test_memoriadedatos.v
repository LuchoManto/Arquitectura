`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:11:12 11/20/2015
// Design Name:   memoria_de_datos
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Partes TP final/fetch/test_memoriadedatos.v
// Project Name:  ipcore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memoria_de_datos
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_memoriadedatos;

	// Inputs
	reg clka;
	reg ena;
	reg [3:0] wea;
	reg [11:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	memoria_de_datos uut (
		.clka(clka), 
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);
	
	always #1
		clka = ~clka;

	initial begin
		// Initialize Inputs
		clka = 0;
		ena = 1;
		wea = 'b1001;
		addra = 1;
		dina = 'hFFFFFFFF;

		// Wait 100 ns for global reset to finish
		#2;
		$finish;

	end
      
endmodule

