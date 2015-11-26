__author__ = 'Gaston'

import bottle
import threading
import json

from bottle import debug as bottle_debug, static_file, view, response
from bottle import Bottle
from helpers.start import *
from serials.serials import *

bottle.TEMPLATE_PATH.insert(0, os.path.join(os.getcwd(), 'ui/views'))

app = Bottle()
logger = create_logger()
connect(logger)


# Function to run the UI. host='localhost'
def run_ui(debug=False, host='0.0.0.0', port=50505, browser=True):
    """
    :param debug:  to run bottle in mode debug, default False.
    :param host: where to run the app, default localhost.
    :param port: port of the app, default None.
    :param browser: open browser when run, default True.
    :return:
    """

    # If not specified search for a free port.
    if not port:
        port = get_free_port()
    # Open browser.
    if browser:
        th = threading.Thread()
        th.run = lambda: open_browser(port)
        th.start()
    bottle_debug(debug)
    app.run(host=host, port=port)

    return


# Route for the home.
@app.get('/')
@view('home')
def home():
    return


# Route for the electrostatic field sensor.
@app.get('/fpga')
@view('fpga')
def module():
    return


# Post send by serial
@app.post('/send_serial/<value>')
def send_serials(value):
    """
    Post cuando se envia valor de string por serial.
    :param value: valor a enviar por serial
    """
    logger.info('Enviando: ' + str(value))
    log_send(str(value))
    send_serial(value, logger=logger)
    return

# Ruta para obtener los valores de senales
@app.get('/getdatos')
def send_datos():
    response.content_type = 'application/json'
    datos = get_datos()
    # datos = {'out27': 0, 'out26': 0, 'out25': 0, 'out24': 0, 'out23': 0, 'out22': 0, 'out21': 0, 'out20': 0, 'out29': 0, 'out28': 0, 'ForwardAE': 0, 'ALUSrcD': 1, 'out30': 0, 'out31': 0, 'RegWriteD': 0, 'ForwardAD': 0, 'InstrD': 'a5ed0000', 'MemWriteD': 3, 'BranchD': 0, 'ForwardBD': 0, 'ForwardBE': 0, 'FlushE': 0, 'PCF': 1, 'MemtoRegD': 0, 'MemReadD': 0, 'StallD': 0, 'StallF': 0, 'ALUControlID': 0, 'out18': 0, 'out19': 0, 'out12': 0, 'out13': -65533, 'out10': 0, 'out11': 0, 'out16': 0, 'out17': 0, 'out14': -251, 'out15': 80, 'out0': 2, 'out1': 2, 'out2': 2, 'out3': 5, 'out4': 2, 'out5': 5, 'out6': 1, 'out7': 2, 'out8': 3, 'out9': 0, 'RegDstD': 0, 'Mem4': 0, 'Mem1': -251, 'Mem3': 0, 'Mem2': 0}
    return json.dumps(datos)

# Ruta para obtener un json con los COMS
@app.get('/getcoms')
def get_coms():
    response.content_type = 'application/json'
    coms = get_com()
    return json.dumps(coms)

# Post conectar serial
@app.post('/conectar_serial/<port>')
def connect_port(port):
    connect(logger, puerto=port)
    return

# Post desconectar com
@app.post('/desconectar_com')
def connect_port():
    desconectar_com(logger)
    return


# Route to get the dynamic log.
@app.get('/logger')
@view('logger')
def show_logger():
    return dict()


# Route to fill the log.
@app.get('/raw_log')
@app.get('/raw_log/<offset>')
def show_raw_log(offset='0'):
    return logger.handlers[0].stream.getvalue()[int(offset):]


# Route to search the images in the write folder.
@app.route('/images/<filename>')
def serve_images(filename):
    return static_file(filename, root='ui/images')


# Route to search for the css files.
@app.route('/css/<filename>')
def serve_css_static(filename):
    return static_file(filename, root='ui/css')

# Route to search for the css externs files.
@app.route('/css/externs/<filename>')
def serve_css_static(filename):
    return static_file(filename, root='ui/css/externs')