import os
import time
import sys
import struct
import flask
import socket
from base64 import b64encode

import numpy as np
import imutil

app = flask.Flask(__name__)

@app.route('/')
def index():
    return app.send_static_file('index.html')


@app.route('/<path:path>')
def get_static(path):
    return flask.send_from_directory('static', path)


@app.route('/stream')
def stream_live():
    def generate():
        while True:
            images = [imutil.decode_jpg('agent_{:02d}.jpg'.format(i)) for i in range(4)]
            imutil.show(np.array(images), filename='splitview.jpg', resize_to=(512,512))
            splitview = open('splitview.jpg', 'rb').read()
            print('Sending jpg length {}'.format(len(splitview)))
            yield jpg_to_dataurl(splitview)
            time.sleep(.1)
    return flask.Response(generate(), mimetype='text/event-stream')

def latest_image_for_agent(agent_id):
    filename = 'agent_{:02d}.jpg'.format(agent_id)
    jpg_data = open(filename, 'rb').read()
    return jpg_data

def jpg_to_dataurl(jpg_data):
    data_string = b64encode(jpg_data).decode('utf-8')
    return 'data:image/jpeg;base64,{}\n\n'.format(data_string)


if __name__ == '__main__':
    # Ports 5800 and 5900 are open on the ENGR network
    app.run('0.0.0.0', 5800)
