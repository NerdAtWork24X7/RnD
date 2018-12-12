import sys
import time
from socket import socket, AF_INET, SOCK_DGRAM

SERVER_IP   = '192.168.1.17'
PORT_NUMBER = 5000
SIZE = 1024
print ("Test client sending packets to IP {0}, via port {1}\n".format(SERVER_IP, PORT_NUMBER))

mySocket = socket( AF_INET, SOCK_DGRAM )
mySocket.connect((SERVER_IP,PORT_NUMBER))
myMessage = "Hello Sahil!"
myMessage1 = ""
i = 0
while True:
    myMessage = str(i) + ")  Hello Sahil!"
    print(myMessage + "Client")
    #mySocket.sendto(myMessage.encode('utf-8'),(SERVER_IP,PORT_NUMBER))
    mySocket.send(myMessage.encode('utf-8'))
    i = i + 1
    time.sleep(5)

mySocket.sendto(myMessage1.encode('utf-8'),(SERVER_IP,PORT_NUMBER))

sys.exit()