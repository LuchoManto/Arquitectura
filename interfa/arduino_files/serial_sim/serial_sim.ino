char cadena_in[255];  //Voy armando la cadena
byte index=0;             //Voy anotando donde se posiciona el proximo char.
char cadena_out[255];  //Voy armando la cadena enviada
byte index_out=0;             //Voy anotando donde se posiciona el proximo char.


void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {

  //Recibo la cadena de la respuesta
  if (Serial1.available()) {
    
    char char_in = Serial1.read();  // Leo un char del serial.
    
    // Si no llegue al limite de la cadena de entrada.
    if(index < 254)
    {
      cadena_in[index] = char_in;     //Guardo el char recibido en una cadena.
      index++;                                   // Incremento el indice para el proximo char.
    }
    
    // Si llego al fin de linea imprimo lo recibido.
    if( char_in == '\n')
    {
        cadena_in[ index ] = '\0';     // Inserto fin de linea.
        Serial.print("'Recibido: ");
        Serial.println(cadena_in);
        index = 0;                            // Vuelvo el index a 0
    }
   }

  //Por este serial vendra la cadena que voy a enviar..
  if (Serial.available()) {
    
    char char_out = Serial.read();

     // Si no llegue al limite de la cadena de salida.
    if(index_out < 254)
    {
      cadena_out[index_out] = char_out;     //Guardo el char recibido en una cadena.
      index_out++;                                   // Incremento el indice para el proximo char.
    }
    
    // Si llego al fin de linea imprimo lo escrito.
    if( char_out == '\n')
    {
        cadena_out[ index_out ] = '\0';     // Inserto fin de linea.
        Serial.print("'Enviado: ");
        Serial.println(cadena_out);
        index_out = 0;                            // Vuelvo el index a 0
    }
    Serial1.write(char_out);
  }
  
}
