import speech_recognition as sr
import keyboard
import inputs
import pygame

import webbrowser as web

'''
WAKE = "m"
Reply = ""

print(inputs.devices.all_devices)
gamepad = inputs.devices.all_devices[2]


def get_audio():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        audio = r.listen(source)
        said = ""
        try:
            said = r.recognize_google(audio)
            print(said)
        except Exception as e:
            print("Exception: " + str(e))

    return said.lower()

while(1):
    # Check if b was pressed
    events = gamepad.read()
    for event in events:
        print(event.ev_type, event.code, event.state)
    if keyboard.is_pressed('b'):
        print('b Key was pressed')
        get_audio()

'''

WAKE = "m"
Reply = ""

MIC_BUTTON = 3

pygame.init()
joystick = pygame.joystick.Joystick(0)
joystick.init()

# Get the name from the OS for the controller/joystick
name = joystick.get_name()
print(name)
buttons = joystick.get_numbuttons()

def get_audio():
    r = sr.Recognizer()
    print("Speak")
    with sr.Microphone() as source:
        audio = r.listen(source)
        said = ""
        try:
            said = r.recognize_google(audio)
            print(said)
        except Exception as e:
            print("Exception: " + str(e))

    return said.lower()

done = False
while not done:
    # EVENT PROCESSING STEP
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True

        if event.type == pygame.JOYBUTTONDOWN:
            button = joystick.get_button(MIC_BUTTON)
            if button == 1:
                print("Mic button pressed.")
                get_audio()



