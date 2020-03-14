import socket
from threading import Thread
from zlib import compress
import d3dshot
import ctypes
from mss import mss
import time
from PIL import Image
import numpy as np

WIDTH = 1920
HEIGHT = 1080

WIDTH_RESIZE = 640
HEIGHT_RESIZE = 440

def capture_screen(conn,d):
   while True:
    img_1 = d.get_latest_frame()
    if True :
        #im = Image.fromarray(img_1)
        out = img_1.resize((WIDTH_RESIZE, HEIGHT_RESIZE))
        # Tweak the compression level here (0-9)
        img = out.tobytes()

        pixels = compress(img, 9)
        #pixels = img

        # Send the size of the pixels length
        size = len(pixels)
        size_len = (size.bit_length() + 7) // 8
        conn.send(bytes([size_len]))

        # Send the actual pixels length
        size_bytes = size.to_bytes(size_len, 'big')
        conn.send(size_bytes)
        print(size)

        # Send pixels
        conn.sendall(pixels)



def retreive_screenshot(conn):
    with mss() as sct:
        # The region to capture
        rect = {'top': 0, 'left': 0, 'width': WIDTH, 'height': HEIGHT}

        while 'recording':
            # Capture the screen
            img = sct.grab(rect)
            # Tweak the compression level here (0-9)
            pixels = img.rgb
            #pixels = compress(img.rgb, 9)

            # Send the size of the pixels length
            size = len(pixels)
            size_len = (size.bit_length() + 7) // 8
            conn.send(bytes([size_len]))

            # Send the actual pixels length
            size_bytes = size.to_bytes(size_len, 'big')
            conn.send(size_bytes)

            # Send pixels
            conn.sendall(pixels)


def main(host='0.0.0.0', port=5000):
    #thread = Thread(target=capture_screen)
    #thread.start()
   # d = d3dshot.create(capture_output="numpy", frame_buffer_size=100)
    d = d3dshot.create(capture_output="pil", frame_buffer_size=100)
    #sock = socket()
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind((host, port))
    try:
        sock.listen(5)
        print('Server started.')
        d.capture()
        while 'connected':
            conn, addr = sock.accept()
            print('Client connected IP:', addr)
            #thread = Thread(target=retreive_screenshot, args=(conn,))
            thread = Thread(target=capture_screen, args=(conn,d))
            thread.start()
    finally:
        sock.close()
        d.stop()


if __name__ == '__main__':
    main()