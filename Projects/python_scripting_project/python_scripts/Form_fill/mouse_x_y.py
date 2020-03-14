import pymouse
import pyautogui
import time


mouse = pymouse.PyMouse()

while True:
    print(mouse.position())
    if pyautogui.locateOnScreen('CApture1.png') != None:
        print("found")

    time.sleep(1)