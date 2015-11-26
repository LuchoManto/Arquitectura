__author__ = 'Gaston'

import serial
import serial.tools.list_ports
import time
import threading
import struct
from helpers.config import *

Serialport = serial.Serial()
serial_data_aux = ''

# port="COM5",
#         baudrate=9600,
#         parity=serial.PARITY_ODD,
#         stopbits=serial.STOPBITS_ONE,
#         bytesize=serial.EIGHTBITS

datos = {
    'PCF':'',
    'InstrD':'',
    'MemReadD':'',
    'RegWriteD':'',
    'MemtoRegD':'',
    'MemWriteD':'',
    'ALUControlID':'',
    'ALUSrcD':'',
    'RegDstD':'',
    'BranchD':'',
    'out0':'',
    'out1':'',
    'out2':'',
    'out3':'',
    'out4':'',
    'out5':'',
    'out6':'',
    'out7':'',
    'out8':'',
    'out9':'',
    'out10':'',
    'out11':'',
    'out12':'',
    'out13':'',
    'out14':'',
    'out15':'',
    'out16':'',
    'out17':'',
    'out18':'',
    'out19':'',
    'out20':'',
    'out21':'',
    'out22':'',
    'out23':'',
    'out24':'',
    'out25':'',
    'out26':'',
    'out27':'',
    'out28':'',
    'out29':'',
    'out30':'',
    'out31':'',
    'StallF':'',
    'StallD':'',
    'ForwardAD':'',
    'ForwardBD':'',
    'FlushE':'',
    'ForwardAE':'',
    'ForwardBE':'',
    'Mem1':'',
    'Mem2':'',
    'Mem3':'',
    'Mem4':''
}

def read_serial(logger=None):
    try:
        global serial_data_aux
        while True:
            serial_data = Serialport.readline()
            # serial_data = serial_data.split()[0]
            if(len(serial_data) == 166):
                guardardatos(serial_data)
                logger.info('Respuesta: ' + str(serial_data))
                logger.info(str(datos))
                # llego la respuesta de todo

            if(len(serial_data) == 2):
                if(serial_data[0] == 'E'):
                    logger.info('Respuesta: ' + str(serial_data))
                    logger.info('Comando no reconocido por la FPGA')
                if(serial_data[0] == 'R'):
                    logger.info('Respuesta: ' + str(serial_data))
                    logger.info('Se reinicio el Pipe MENOS la memoria')
                if(serial_data[0] != 'R' and serial_data[0] != 'E'):
                    serial_data_aux = serial_data_aux + str(serial_data)
                    if(len(serial_data_aux) == 166):
                        guardardatos(serial_data_aux)
                        logger.info('Respuesta: ' + str(serial_data_aux))
                        logger.info(str(datos))
                        serial_data_aux = ''

            if(len(serial_data) != 2 and len(serial_data) != 166):
                serial_data_aux = serial_data_aux + str(serial_data)
                if(len(serial_data_aux) == 166):
                    guardardatos(serial_data_aux)
                    logger.info('Respuesta: ' + str(serial_data_aux))
                    logger.info(str(datos))
                    serial_data_aux = ''
                    # llego la respuesta de todo

            #logger.info('Respuesta: ' + str(serial_data))
            #log_response(str(serial_data))
    except Exception as ex:
        logger.info('Se cerro la conexion con el puerto: ' + Serialport.port)
        pass


def connect(logger, puerto='COM8'):
    try:
        Serialport.close()
    except Exception:
        pass

    try:
        logger.info("Trantando de abrir puerto " + puerto)
        Serialport.port = puerto
        Serialport.baudrate = 9600
        Serialport.parity = serial.PARITY_NONE
        Serialport.stopbits = serial.STOPBITS_ONE
        Serialport.bytesize = serial.EIGHTBITS
        Serialport.open()
        logger.info("Puerto " + puerto + " abierto correctamente")
        t = threading.Thread(target=read_serial, args=[logger])
        t.start()

    except Exception:
        logger.info("Ocurrio un problema al abrir " + puerto)
        pass


def desconectar_com(logger):
    try:
        puerto = Serialport.port
        Serialport.close()
        logger.info("Conexion con el puerto: " + puerto + " cerrada")
    except Exception:
        logger.info("Ocurrio un error al desconectar")
        pass


def send_serial(dato, logger = False):
    try:
        Serialport.write(dato)
    except Exception:
        logger.info("Ocurrio un error al enviar: " + dato)
        pass
    return


def get_com():
    puertos = []
    ports = list(serial.tools.list_ports.comports())
    for p in ports:
        puertos.append(p[0])

    return puertos

def guardardatos(serial_data):
    datos['PCF'] = ord(serial_data[0:1])
    #h = ( bin(int(h, 16))[2:] ).zfill(h_size)
    datos['InstrD'] = serial_data[1:5][::-1].encode('hex')
    datos['MemReadD'] = ord(serial_data[5:6])
    datos['RegWriteD'] = ord(serial_data[6:7])
    datos['MemtoRegD'] = ord(serial_data[7:8])
    datos['MemWriteD'] = ord(serial_data[8:9])
    datos['ALUControlID'] = ord(serial_data[9:10])
    datos['ALUSrcD'] = ord(serial_data[10:11])
    datos['RegDstD'] = ord(serial_data[11:12])
    datos['BranchD'] = ord(serial_data [12:13])
    datos['out0'] = bytestoint(serial_data[13:17])
    datos['out1'] = bytestoint(serial_data[17:21])
    datos['out2'] = bytestoint(serial_data[21:25])
    datos['out3'] = bytestoint(serial_data[25:29])
    datos['out4'] = bytestoint(serial_data[29:33])
    datos['out5'] = bytestoint(serial_data[33:37])
    datos['out6'] = bytestoint(serial_data[37:41])
    datos['out7'] = bytestoint(serial_data[41:45])
    datos['out8'] = bytestoint(serial_data[45:49])
    datos['out9'] = bytestoint(serial_data[49:53])
    datos['out10'] = bytestoint(serial_data[53:57])
    datos['out11'] = bytestoint(serial_data[57:61])
    datos['out12'] = bytestoint(serial_data[61:65])
    datos['out13'] = bytestoint(serial_data[65:69])
    datos['out14'] = bytestoint(serial_data[69:73])
    datos['out15'] = bytestoint(serial_data[73:77])
    datos['out16'] = bytestoint(serial_data[77:81])
    datos['out17'] = bytestoint(serial_data[81:85])
    datos['out18'] = bytestoint(serial_data[85:89])
    datos['out19'] = bytestoint(serial_data[89:93])
    datos['out20'] = bytestoint(serial_data[93:97])
    datos['out21'] = bytestoint(serial_data[97:101])
    datos['out22'] = bytestoint(serial_data[101:105])
    datos['out23'] = bytestoint(serial_data[105:109])
    datos['out24'] = bytestoint(serial_data[109:113])
    datos['out25'] = bytestoint(serial_data[113:117])
    datos['out26'] = bytestoint(serial_data[117:121])
    datos['out27'] = bytestoint(serial_data[121:125])
    datos['out28'] = bytestoint(serial_data[125:129])
    datos['out29'] = bytestoint(serial_data[129:133])
    datos['out30'] = bytestoint(serial_data[133:137])
    datos['out31'] = bytestoint(serial_data[137:141])
    datos['StallF'] = ord(serial_data[141:142])
    datos['StallD'] = ord(serial_data[142:143])
    datos['ForwardAD'] = ord(serial_data[143:144])
    datos['ForwardBD'] = ord(serial_data[144:145])
    datos['FlushE'] = ord(serial_data[145:146])
    datos['ForwardAE'] = ord(serial_data[146:147])
    datos['ForwardBE'] = ord(serial_data[147:148])
    datos['Mem1'] = bytestoint(serial_data[148:152])
    datos['Mem2'] = bytestoint(serial_data[152:156])
    datos['Mem3'] = bytestoint(serial_data[156:160])
    datos['Mem4'] = bytestoint(serial_data[160:164])
    return

def bytestoint(dato):
    if(len(dato) == 4):
        return struct.unpack('i', dato)[0]