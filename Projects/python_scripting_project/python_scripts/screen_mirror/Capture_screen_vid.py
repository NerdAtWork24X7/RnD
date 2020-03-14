import numpy as np
import numpy
import sys
import cv2
from PIL import ImageGrab
from zlib import compress
import time

import blosc
import pickle

def compress(arr,Path):
    #c = blosc.compress_ptr(arr.__array_interface__['data'][0], arr.size, arr.dtype.itemsize, clevel=3,cname='lz4',shuffle=blosc.SHUFFLE)
    c = blosc.compress_ptr(arr.__array_interface__['data'][0], arr.size, arr.dtype.itemsize, clevel=3,cname='zstd',shuffle=blosc.SHUFFLE)
    f=open(Path,"wb")
    pickle.dump((arr.shape, arr.dtype),f)
    f.write(c)
    f.close()
    return c,arr.shape, arr.dtype

def decompress(Path):
    f=open(Path,"rb")
    shape,dtype=pickle.load(f)
    c=f.read()
    #array allocation takes most of the time
    arr=np.empty(shape,dtype)
    blosc.decompress_ptr(c, arr.__array_interface__['data'][0])
    return arr

#Pass a preallocated array if you have many similar images
def decompress_pre(Path,arr):
    f=open(Path,"rb")
    shape,dtype=pickle.load(f)
    c=f.read()
    #array allocation takes most of the time
    blosc.decompress_ptr(c, arr.__array_interface__['data'][0])
    return arr



numpy.set_printoptions(threshold=sys.maxsize)

no = 1

fourcc = cv2.VideoWriter_fourcc('X','V','I','D') #you can use other codecs as well.
vid = cv2.VideoWriter('record.avi', fourcc, 8, (500,490))
while(True):
    img = ImageGrab.grab(bbox=(100, 10, 1920, 1080)) #x, y, w, h
    img_np = np.array(img)
    #frame = cv2.cvtColor(img_np, cv2.COLOR_BGR2GRAY)
    vid.write(img_np)
    cv2.imshow("frame", img_np)
    cv2.imwrite("img_smap.png",img_np)
    #pixels = compress(img_np, 9)

    # Code for printing to a file
    #sample = open('samplefile.txt', 'w')
   # print(pixels,file = sample)
    #sample.close()
    no = 2

    key = cv2.waitKey(1)
    if key == 27:
        break

vid.release()
cv2.destroyAllWindows()