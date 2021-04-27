import base64
import os
import tempfile

def display(data):
    with tempfile.NamedTemporaryFile(suffix='.png') as image:
        image.write(base64.decodebytes(data['image/png'].encode()))
        os.system(f'kitty +kitten icat {image.name}')

c.ZMQTerminalInteractiveShell.image_handler = 'callable'
c.ZMQTerminalInteractiveShell.callable_image_handler = display
