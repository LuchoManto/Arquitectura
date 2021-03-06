# -*- encoding: utf-8 -*-
import time

# Funciones
def dec_bin(numero, digitos=5):
    if numero >= 0:
        binario = "{0:b}".format(numero)
        longitud_actual = len(binario)
        if longitud_actual < digitos:
            binario = (digitos - longitud_actual) * "0" + binario
    else:
        max_value = (2**digitos)
        new_numero = max_value + numero #el numero es negativo entonces se le resta
        binario = "{0:b}".format(new_numero)
        longitud_actual = len(binario)
        if longitud_actual < digitos:
            binario = (digitos - longitud_actual) * "1" + binario

    return binario


def bin_hex(numero, digitos=8):
    hexa = hex(int(numero, 2))
    hexa = hexa[2:]
    longitud_actual = len(hexa)
    if longitud_actual < digitos:
        hexa = (digitos - longitud_actual) * "0" + hexa
    return hexa.strip("L")


def parse_end(instruccion):
    instruccion_binaria = "1" * 6 + "0" *26
    return instruccion_binaria


def parse_r(instruccion, operandos):
    subtipo = lista_instrucciones[instruccion][2]
    codigo_operacion = lista_instrucciones[instruccion][0]

    instruccion_binaria = "0" * 6

    if subtipo == SUBTIPO_1:
        instruccion_binaria += "0" * 5
        instruccion_binaria += dec_bin(int(operandos[1]))
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += dec_bin(int(operandos[2]))
    elif subtipo == SUBTIPO_2:
        instruccion_binaria += dec_bin(int(operandos[2]))
        instruccion_binaria += dec_bin(int(operandos[1]))
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += "0" * 5
    elif subtipo == SUBTIPO_3:
        instruccion_binaria += dec_bin(int(operandos[1]))
        instruccion_binaria += dec_bin(int(operandos[2]))
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += "0" * 5

    instruccion_binaria += codigo_operacion

    return instruccion_binaria


def parse_i(instruccion, operandos):
    subtipo = lista_instrucciones[instruccion][2]
    codigo_operacion = lista_instrucciones[instruccion][0]

    instruccion_binaria = codigo_operacion

    if subtipo == SUBTIPO_1:
        # Quito los parentesis y lo pongo como un tercer argumento
        operandos[1] = operandos[1].replace("(", " ")
        operandos[1] = operandos[1].replace(")", "")
        operandos.append(operandos[1].split()[1]) #operando base
        operandos[1] = operandos[1][0] #new offset

        instruccion_binaria += dec_bin(int(operandos[2]))
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += dec_bin(int(operandos[1]), digitos=16)
    elif subtipo == SUBTIPO_2 or subtipo == SUBTIPO_3:
        instruccion_binaria += dec_bin(int(operandos[1]))
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += dec_bin(int(operandos[2]), digitos=16)
    elif subtipo == SUBTIPO_4:
        instruccion_binaria += "0" * 5
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += dec_bin(int(operandos[1]), digitos=16)
    elif subtipo == SUBTIPO_5:
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += dec_bin(int(operandos[1]))
        instruccion_binaria += dec_bin(int(operandos[2]), digitos=16)
    elif subtipo == SUBTIPO_6:
        instruccion_binaria += dec_bin(int(operandos[0]), digitos=26)

    return instruccion_binaria


def parse_j(instruccion, operandos):
    subtipo = lista_instrucciones[instruccion][2]
    codigo_operacion = lista_instrucciones[instruccion][0]

    instruccion_binaria = "0" * 6

    if subtipo == SUBTIPO_1:
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += "0" * 15
    elif subtipo == SUBTIPO_2:
        instruccion_binaria += dec_bin(int(operandos[0]))
        instruccion_binaria += "0" * 5

        #Veo si hay mas de un operando (es decir, existe "rd")
        if len(operandos) > 1:
            instruccion_binaria += dec_bin(int(operandos[1]))
        else:
            instruccion_binaria += "0" * 5

    instruccion_binaria += codigo_operacion

    return instruccion_binaria


def eliminar_comentarios(linea):
    linea = linea.split(";")
    instruccion = linea[0]
    return instruccion


def parse_instruccion(linea):
    linea = linea.replace(",", " ")
    data = linea.split()
    instruccion = data[0]
    operandos = data[1:]
    return instruccion, operandos


TIPO_R = 0
TIPO_I = 1
TIPO_J = 2
TIPO_END = 9

SUBTIPO_1 = 3
SUBTIPO_2 = 4
SUBTIPO_3 = 5
SUBTIPO_4 = 6
SUBTIPO_5 = 7
SUBTIPO_6 = 8

# Diccionarios
lista_instrucciones = {
 
    "END":  ["111111", TIPO_END, SUBTIPO_1],
    # Tipo R
    "SLL":  ["000000", TIPO_R, SUBTIPO_1],
    "SRL":  ["000010", TIPO_R, SUBTIPO_1],
    "SRA":  ["000011", TIPO_R, SUBTIPO_1],
    "SRLV": ["000110", TIPO_R, SUBTIPO_2],
    "SRAV": ["000111", TIPO_R, SUBTIPO_2],
    "ADD":  ["100000", TIPO_R, SUBTIPO_3],
    "SLLV": ["000100", TIPO_R, SUBTIPO_2],
    "SUB":  ["100010", TIPO_R, SUBTIPO_3],
    "AND":  ["100100", TIPO_R, SUBTIPO_3],
    "OR":   ["100101", TIPO_R, SUBTIPO_3],
    "XOR":  ["100110", TIPO_R, SUBTIPO_3],
    "NOR":  ["100111", TIPO_R, SUBTIPO_3],
    "SLT":  ["101010", TIPO_R, SUBTIPO_3],

    # Tipo I
    "LB":   ["100000", TIPO_I, SUBTIPO_1],
    "LH":   ["100001", TIPO_I, SUBTIPO_1],
    "LW":   ["100011", TIPO_I, SUBTIPO_1],
    "LWU":  ["100111", TIPO_I, SUBTIPO_1],
    "LBU":  ["100100", TIPO_I, SUBTIPO_1],
    "LHU":  ["100101", TIPO_I, SUBTIPO_1],
    "SB":   ["101000", TIPO_I, SUBTIPO_1],
    "SH":   ["101001", TIPO_I, SUBTIPO_1],
    "SW":   ["101011", TIPO_I, SUBTIPO_1],
    "ADDI": ["001000", TIPO_I, SUBTIPO_2],
    "ANDI": ["001100", TIPO_I, SUBTIPO_2],
    "ORI":  ["001101", TIPO_I, SUBTIPO_3],
    "XORI": ["001110", TIPO_I, SUBTIPO_2],
    "LUI":  ["001111", TIPO_I, SUBTIPO_4],
    "SLTI": ["001010", TIPO_I, SUBTIPO_3],
    "BEQ":  ["000100", TIPO_I, SUBTIPO_5],
    "BNE":  ["000101", TIPO_I, SUBTIPO_5],
    "J":    ["000010", TIPO_I, SUBTIPO_6],
    "JAL":  ["000011", TIPO_I, SUBTIPO_6],

    # Tipo J
    "JR":   ["001000", TIPO_J, SUBTIPO_1],
    "JALR": ["001001", TIPO_J, SUBTIPO_2],
}


def parsear_instrucciones():
    # Logica
    test_file = open("instrucciones.txt", "r")
    assembler = test_file.readlines()

    lista_instrucciones_hexa = []
    lista_bin = []
    for linea in assembler:
        linea = linea.strip()
        linea = eliminar_comentarios(linea)

        if linea:
            instruccion, operandos = parse_instruccion(linea)

            #print("ASM:", instruccion, ", ".join(operandos))

            if lista_instrucciones[instruccion][1] == TIPO_END:
                instruccion_binaria = parse_end(instruccion)
            elif lista_instrucciones[instruccion][1] == TIPO_I:
                instruccion_binaria = parse_i(instruccion, operandos)
            elif lista_instrucciones[instruccion][1] == TIPO_J:
                instruccion_binaria = parse_j(instruccion, operandos)
            elif lista_instrucciones[instruccion][1] == TIPO_R:
                instruccion_binaria = parse_r(instruccion, operandos)

            #print("BIN:", instruccion_binaria)

            instruccion_hexa = bin_hex(instruccion_binaria)
            lista_bin.append(instruccion_binaria)
            lista_instrucciones_hexa.append(instruccion_hexa)
            #print("HEX:", instruccion_hexa)
            #print()

    #print(lista_instrucciones_hexa)
    return lista_instrucciones_hexa,lista_bin

def crear_coe(lista,lista_binaria):
    CABECERA = """*******************************************************************
******  Archivo .COE para Arquitectura de Computadoras 2015  ******
*******************************************************************
;Archivo .COE generado automaticamente desde un archivo ASM.
;Fecha de generación del archivo: """
    CABECERA += time.ctime() + "\n"

    MEMORY_INITIALIZATION_RADIX = "memory_initialization_radix"
    MEMORY_INITIALIZATION_RADIX_VALUE = "16"

    MEMORY_INITIALIZATION_VECTOR = "memory_initialization_vector"


    #texto_archivo = CABECERA
    texto_archivo = ""
    texto_archivo += MEMORY_INITIALIZATION_RADIX + "="
    texto_archivo += MEMORY_INITIALIZATION_RADIX_VALUE + ";" + "\n"
    texto_archivo += MEMORY_INITIALIZATION_VECTOR + "=" + "\n"


    #archivo_binario = CABECERA
    archivo_binario = ""
    archivo_binario += MEMORY_INITIALIZATION_RADIX + "="
    archivo_binario += "2;\n"
    archivo_binario += MEMORY_INITIALIZATION_VECTOR + "=" + "\n"

    for item in lista_binaria:
        archivo_binario += item + ",\n"

    for item in lista:
        texto_archivo += item + ",\n"

    texto_archivo = texto_archivo[:-2] + ";"
    archivo_binario = archivo_binario[:-2] + ";"

    return texto_archivo,archivo_binario



lista_hexa,lista_bin = parsear_instrucciones()
texto_coe,texto_coe_bin = crear_coe(lista_hexa,lista_bin)

#print dec_bin(-32,16)

archivo = open("salida_hexa.coe", "w")
archivo_bin = open("salida_bin.coe", "w")
archivo.write(texto_coe)
archivo_bin.write(texto_coe_bin)
archivo.close()
archivo_bin.close()
