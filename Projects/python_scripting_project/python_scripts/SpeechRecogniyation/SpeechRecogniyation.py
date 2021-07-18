import os
from time import sleep
#from pynput import keyboard
import pyttsx3 as tts
import speech_recognition as sr
import re
from SimConnect import *
from word2number import w2n
import keyboard
import pygame

import webbrowser as web


WAKE = "m"
Reply = ""

MIC_BUTTON = 3



print("# VoiceControl_Fs2020"
      "This is Voice Control uses google voice to convert speech to text and then send the command to Flight Simulator 2020\n "
      "This was just a weekend project . if you are willing to contribute you can update the script.\n"
      "\n"
      "Precondtion:\n"
      "Flight simulator shall be running before running the exe\n"
      "Exe shall have access to microphone\n"
      "\n"
      "Press T and say the command\n"
      "\n"
      "Dependency\n"
      "Python 3.6\n"
      "package\n"
      "   -- keyboard\n"
      "   -- speech_recognition\n"
      "   -- re\n"
      "   -- SimConnect \n"
      "   -- word2number \n"
      "     SimConnect.dll\n"
      "Developer -- Sahil Vartak\n")

request_location = [
    'ALTITUDE',
    'LATITUDE',
    'LONGITUDE',
    'KOHLSMAN',
]

request_airspeed = [
    'AIRSPEED_TRUE',
    'AIRSPEED_INDICATE',
    'AIRSPEED_TRUE CALIBRATE',
    'AIRSPEED_BARBER POLE',
    'AIRSPEED_MACH',
]

request_compass = [
    'WISKEY_COMPASS_INDICATION_DEGREES',
    'PARTIAL_PANEL_COMPASS',
    'ADF_CARD',  # ADF compass rose setting
    'MAGNETIC_COMPASS',  # Compass reading
    'INDUCTOR_COMPASS_PERCENT_DEVIATION',  # Inductor compass deviation reading
    'INDUCTOR_COMPASS_HEADING_REF',  # Inductor compass heading
]

request_vertical_speed = [
    'VELOCITY_BODY_Y',  # True vertical speed, relative to aircraft axis
    'RELATIVE_WIND_VELOCITY_BODY_Y',  # Vertical speed relative to wind
    'VERTICAL_SPEED',  # Vertical speed indication
    'GPS_WP_VERTICAL_SPEED',  # Vertical speed to waypoint
]

request_fuel = [
    'FUEL_TANK_CENTER_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_CENTER2_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_CENTER3_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_LEFT_MAIN_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_LEFT_AUX_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_LEFT_TIP_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_RIGHT_MAIN_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_RIGHT_AUX_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_RIGHT_TIP_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_EXTERNAL1_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_EXTERNAL2_LEVEL',  # Percent of maximum capacity
    'FUEL_TANK_CENTER_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_CENTER2_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_CENTER3_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_LEFT_MAIN_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_LEFT_AUX_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_LEFT_TIP_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_RIGHT_MAIN_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_RIGHT_AUX_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_RIGHT_TIP_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_EXTERNAL1_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_EXTERNAL2_CAPACITY',  # Maximum capacity in volume
    'FUEL_LEFT_CAPACITY',  # Maximum capacity in volume
    'FUEL_RIGHT_CAPACITY',  # Maximum capacity in volume
    'FUEL_TANK_CENTER_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_CENTER2_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_CENTER3_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_LEFT_MAIN_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_LEFT_AUX_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_LEFT_TIP_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_RIGHT_MAIN_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_RIGHT_AUX_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_RIGHT_TIP_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_EXTERNAL1_QUANTITY',  # Current quantity in volume
    'FUEL_TANK_EXTERNAL2_QUANTITY',  # Current quantity in volume
    'FUEL_LEFT_QUANTITY',  # Current quantity in volume
    'FUEL_RIGHT_QUANTITY',  # Current quantity in volume
    'FUEL_TOTAL_QUANTITY',  # Current quantity in volume
    'FUEL_WEIGHT_PER_GALLON',  # Fuel weight per gallon
    'FUEL_TOTAL_CAPACITY',  # Total capacity of the aircraft
    'FUEL_SELECTED_QUANTITY_PERCENT',  # Percent or capacity for selected tank
    'FUEL_SELECTED_QUANTITY',  # Quantity of selected tank
    'FUEL_TOTAL_QUANTITY_WEIGHT',  # Current total fuel weight of the aircraft
    'NUM_FUEL_SELECTORS',  # Number of selectors on the aircraft
    'UNLIMITED_FUEL',  # Unlimited fuel flag
    'ESTIMATED_FUEL_FLOW',  # Estimated fuel flow at cruise
]

request_flaps = [
    'FLAPS_HANDLE_PERCENT',  # Percent flap handle extended
    'FLAPS_HANDLE_INDEX',  # Index of current flap position
    'FLAPS_NUM_HANDLE_POSITIONS',  # Number of flap positions
    'TRAILING_EDGE_FLAPS_LEFT_PERCENT',  # Percent left trailing edge flap extended
    'TRAILING_EDGE_FLAPS_RIGHT_PERCENT',  # Percent right trailing edge flap extended
    'TRAILING_EDGE_FLAPS_LEFT_ANGLE',  # Angle left trailing edge flap extended. Use TRAILING EDGE FLAPS LEFT PERCENT to set a value.
    'TRAILING_EDGE_FLAPS_RIGHT_ANGLE',  # Angle right trailing edge flap extended. Use TRAILING EDGE FLAPS RIGHT PERCENT to set a value.
    'LEADING_EDGE_FLAPS_LEFT_PERCENT',  # Percent left leading edge flap extended
    'LEADING_EDGE_FLAPS_RIGHT_PERCENT',  # Percent right leading edge flap extended
    'LEADING_EDGE_FLAPS_LEFT_ANGLE',  # Angle left leading edge flap extended. Use LEADING EDGE FLAPS LEFT PERCENT to set a value.
    'LEADING_EDGE_FLAPS_RIGHT_ANGLE',  # Angle right leading edge flap extended. Use LEADING EDGE FLAPS RIGHT PERCENT to set a value.
    'FLAPS_AVAILABLE',  # True if flaps available
    'FLAP_DAMAGE_BY_SPEED',  # True if flagps are damaged by excessive speed
    'FLAP_SPEED_EXCEEDED',  # True if safe speed limit for flaps exceeded
]

request_throttle = [
    'AUTOPILOT_THROTTLE_ARM',  # Autothrottle armed
    'AUTOPILOT_TAKEOFF_POWER_ACTIVE',  # Takeoff / Go Around power mode active
    'AUTOTHROTTLE_ACTIVE',  # Auto-throttle active
    'FULL_THROTTLE_THRUST_TO_WEIGHT_RATIO',  # Full throttle thrust to weight ratio
    'THROTTLE_LOWER_LIMIT',
    'GENERAL_ENG_THROTTLE_LEVER_POSITION:index',  # Percent of max throttle position
    'AUTOPILOT_THROTTLE_ARM',  # Autothrottle armed
    'AUTOTHROTTLE_ACTIVE',  # Auto-throttle active
    'FULL_THROTTLE_THRUST_TO_WEIGHT_RATIO',  # Full throttle thrust to weight ratio
]

request_gear = [
    'IS_GEAR_RETRACTABLE',  # True if gear can be retracted
    'IS_GEAR_SKIS',  # True if landing gear is skis
    'IS_GEAR_FLOATS',  # True if landing gear is floats
    'IS_GEAR_SKIDS',  # True if landing gear is skids
    'IS_GEAR_WHEELS',  # True if landing gear is wheels
    'GEAR_HANDLE_POSITION',  # True if gear handle is applied
    'GEAR_HYDRAULIC_PRESSURE',  # Gear hydraulic pressure
    'TAILWHEEL_LOCK_ON',  # True if tailwheel lock applied
    'GEAR_CENTER_POSITION',  # Percent center gear extended
    'GEAR_LEFT_POSITION',  # Percent left gear extended
    'GEAR_RIGHT_POSITION',  # Percent right gear extended
    'GEAR_TAIL_POSITION',  # Percent tail gear extended
    'GEAR_AUX_POSITION',  # Percent auxiliary gear extended
    'GEAR_TOTAL_PCT_EXTENDED',  # Percent total gear extended
    'AUTO_BRAKE_SWITCH_CB',  # Auto brake switch position
    'WATER_RUDDER_HANDLE_POSITION',
    'WATER_LEFT_RUDDER_EXTENDED',  # Percent extended
    'WATER_RIGHT_RUDDER_EXTENDED',  # Percent extended
    'GEAR_CENTER_STEER_ANGLE',  # Center wheel angle, negative to the left, positive to the right.
    'GEAR_LEFT_STEER_ANGLE',  # Left wheel angle, negative to the left, positive to the right.
    'GEAR_RIGHT_STEER_ANGLE',  # Right wheel angle, negative to the left, positive to the right.
    'GEAR_AUX_STEER_ANGLE',  # Aux wheel angle, negative to the left, positive to the right. The aux wheel is the fourth set of gear, sometimes used on helicopters.
    'WATER_LEFT_RUDDER_STEER_ANGLE',  # Water left rudder angle, negative to the left, positive to the right.
    'WATER_RIGHT_RUDDER_STEER_ANGLE',  # Water right rudder angle, negative to the left, positive to the right.
    'GEAR_CENTER_STEER_ANGLE_PCT',  # Center steer angle as a percentage
    'GEAR_LEFT_STEER_ANGLE_PCT',  # Left steer angle as a percentage
    'GEAR_RIGHT_STEER_ANGLE_PCT',  # Right steer angle as a percentage
    'GEAR_AUX_STEER_ANGLE_PCT',  # Aux steer angle as a percentage
    'WATER_LEFT_RUDDER_STEER_ANGLE_PCT',  # Water left rudder angle as a percentage
    'WATER_RIGHT_RUDDER_STEER_ANGLE_PCT',  # Water right rudder as a percentage
    'CENTER_WHEEL_RPM',  # Center landing gear rpm
    'LEFT_WHEEL_RPM',  # Left landing gear rpm
    'RIGHT_WHEEL_RPM',  # Right landing gear rpm
    'AUX_WHEEL_RPM',  # Rpm of fourth set of gear wheels.
    'CENTER_WHEEL_ROTATION_ANGLE',  # Center wheel rotation angle
    'LEFT_WHEEL_ROTATION_ANGLE',  # Left wheel rotation angle
    'RIGHT_WHEEL_ROTATION_ANGLE',  # Right wheel rotation angle
    'AUX_WHEEL_ROTATION_ANGLE',  # Aux wheel rotation angle
    'GEAR_EMERGENCY_HANDLE_POSITION',  # True if gear emergency handle applied
    'ANTISKID_BRAKES_ACTIVE',  # True if antiskid brakes active
    'RETRACT_FLOAT_SWITCH',  # True if retract float switch on
    'RETRACT_LEFT_FLOAT_EXTENDED',  # If aircraft has retractable floats.
    'RETRACT_RIGHT_FLOAT_EXTENDED',  # If aircraft has retractable floats.
    'STEER_INPUT_CONTROL',  # Position of steering tiller
    'GEAR_DAMAGE_BY_SPEED',  # True if gear has been damaged by excessive speed
    'GEAR_SPEED_EXCEEDED',  # True if safe speed limit for gear exceeded
    'NOSEWHEEL_LOCK_ON',  # True if the nosewheel lock is engaged.
]

request_trim = [
    'ROTOR_LATERAL_TRIM_PCT',  # Trim percent
    'ELEVATOR_TRIM_POSITION',  # Elevator trim deflection
    'ELEVATOR_TRIM_INDICATOR',
    'ELEVATOR_TRIM_PCT',  # Percent elevator trim
    'AILERON_TRIM',  # Angle deflection
    'AILERON_TRIM_PCT',  # The trim position of the ailerons. Zero is fully retracted.
    'RUDDER_TRIM_PCT',  # The trim position of the rudder. Zero is no trim.
    'RUDDER_TRIM',  # Angle deflection
]

request_autopilot = [
    'AUTOPILOT_MASTER',
    'AUTOPILOT_AVAILABLE',
    'AUTOPILOT_NAV_SELECTED',
    'AUTOPILOT_WING_LEVELER',
    'AUTOPILOT_NAV1_LOCK',
    'AUTOPILOT_HEADING_LOCK',
    'AUTOPILOT_HEADING_LOCK_DIR',
    'AUTOPILOT_ALTITUDE_LOCK',
    'AUTOPILOT_ALTITUDE_LOCK_VAR',
    'AUTOPILOT_ATTITUDE_HOLD',
    'AUTOPILOT_GLIDESLOPE_HOLD',
    'AUTOPILOT_PITCH_HOLD_REF',
    'AUTOPILOT_APPROACH_HOLD',
    'AUTOPILOT_BACKCOURSE_HOLD',
    'AUTOPILOT_VERTICAL_HOLD_VAR',
    'AUTOPILOT_PITCH_HOLD',
    'AUTOPILOT_FLIGHT_DIRECTOR_ACTIVE',
    'AUTOPILOT_FLIGHT_DIRECTOR_PITCH',
    'AUTOPILOT_FLIGHT_DIRECTOR_BANK',
    'AUTOPILOT_AIRSPEED_HOLD',
    'AUTOPILOT_AIRSPEED_HOLD_VAR',
    'AUTOPILOT_MACH_HOLD',
    'AUTOPILOT_MACH_HOLD_VAR',
    'AUTOPILOT_YAW_DAMPER',
    'AUTOPILOT_RPM_HOLD_VAR',
    'AUTOPILOT_THROTTLE_ARM',
    'AUTOPILOT_TAKEOFF_POWER ACTIVE',
    'AUTOTHROTTLE_ACTIVE',
    'AUTOPILOT_VERTICAL_HOLD',
    'AUTOPILOT_RPM_HOLD',
    'AUTOPILOT_MAX_BANK',
    'FLY_BY_WIRE_ELAC_SWITCH',
    'FLY_BY_WIRE_FAC_SWITCH',
    'FLY_BY_WIRE_SEC_SWITCH',
    'FLY_BY_WIRE_ELAC_FAILED',
    'FLY_BY_WIRE_FAC_FAILED',
    'FLY_BY_WIRE_SEC_FAILED'
]

request_cabin = [
    'CABIN_SEATBELTS_ALERT_SWITCH',
    'CABIN_NO_SMOKING_ALERT_SWITCH'
]




pushtoTalk = ["t","T"]
key_release = 5
on_list_Dict = ["on","engage","start","up","hold"]
off_list_Dict = ["off","release","stop","clear","down"]
Set_list_Dict = ["set","search"]

Flaps_list_Dict = ["fraps","flaps","laps"]

Throtle_Dict = ["power","throttle","turtle","title","total","thrust","trust","protocol","trash","correct"]
Pilot_Dict = ["pilot","pivot","pirate"]
Squak_Dict = ["quark","squawk","transporter","square","transponder","squad","quoc","swap"]
Battery_Dict = ["battery"]

Gear_Dict = ["gear","ear"]
Lights_Dict = ["light","lie","lights"]

Heading_Dict = ["heading","heating"]
AirSpeed_Dict = ["airspeed","speed"]
Com_Dict = ["communication","radio"]
Approach_Dict = ["approach","cocroach","roach"]
Localiser_Dict = ["localizer","localiza","localiser"]
Altitude_Dict = ["attitude","altitude","level"]
Vertical_Dict = ["vertical"]
Parking_Dict = ["parking brake"]

APU_Dict = ["apu","apo"]
Spoiler_Dict = ["spoiler","spoil"]
FlightDirector_Dict = ["director","direct"]
AntiSkid_Dict = ["anti skidding","anti-skidding","skid","antiskating","brake","break"]
Nav_Dic = ["nav","com","radio"]
AntiICE_Dict = ["anti-ice", "ice","anti-icing"]

debug = "OFF"


engine = tts.init()
def sayit(text):
    engine.say(text)
    engine.runAndWait()

simconnect_path = os.getcwd() + "/SimConnect.dll"

if debug == "OFF":
  # Create SimConnect link
  while True:
    try:
        sm = SimConnect(library_path=simconnect_path)
        break
    except:
        print("Could not find MSFS running. Please launch MSFS.")
        sleep(5)

    # Note the default _time is 2000 to be refreshed every 2 seconds
  aq = AircraftRequests(sm, _time=1000)
    # Use _time=ms where ms is the time in milliseconds to cache the data.
    # Setting ms to 0 will disable data caching and always pull new data from the sim.
    # There is still a timeout of 4 tries with a 10ms delay between checks.
    # If no data is received in 40ms the value will be set to None
    # Each request can be fine tuned by setting the time param.

    # To find and set timeout of cached data to 200ms:
    #altitude = aq.find("PLANE_ALTITUDE")
    #altitude.time = 200

    # Set the aircraft's current altitude
    #aq.set("PLANE_ALTITUDE", altitude)

  ae = AircraftEvents(sm)



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
	
'''
def on_press(key):
    global key_release
    global pushtoTalk
    if str(key)[1] in pushtoTalk:
      key_release = 0


def on_release(key):
    global key_release
    global pushtoTalk
    print('{0} release'.format(key))
    if str(key)[1] in pushtoTalk :
        key_release = 1
    #if key == Key.esc:
        # Stop listener
    #    return False
'''




def SendCommand(command):
    if debug == "OFF":
      event_to_trigger = ae.find(command)
      event_to_trigger()
    return 1

def SendCommand_arguments(command,Value):
    if debug == "OFF":
      event_to_trigger = ae.find(command)
      event_to_trigger(Value)
    return 1

def getData(command):
    status = 0
    if debug == "OFF":
      status =  int(aq.get(command))
    return status


def checkStateBefore(saytext,Data_get_Cmd,Data_set_cmd,ON_OFF):
    sayit(saytext)
    status = 1
    if (getData(Data_get_Cmd) == ON_OFF):
        status = SendCommand(Data_set_cmd)
    return status


def Set_ON_Commands(text):

    status = 0

    if text.__contains__("auto") or text.__contains__("skid"):
      if any(ext in text for ext in Pilot_Dict):
          status = SendCommand("AUTOPILOT_ON")
          sayit("Auto Pilot ON")

      elif any(ext in text for ext in Throtle_Dict):
          status = checkStateBefore("Auto Throttle ON","AUTOTHROTTLE_ACTIVE","AUTO_THROTTLE_ARM",0)

      elif any(ext in text for ext in AntiSkid_Dict):
          status = checkStateBefore("Auto Brake ON", "ANTISKID_BRAKES_ACTIVE", "ANTISKID_BRAKES_TOGGLE",0)

    elif any(ext in text for ext in FlightDirector_Dict):
        status = checkStateBefore("Flight Director ON", "AUTOPILOT_FLIGHT_DIRECTOR_ACTIVE", "TOGGLE_FLIGHT_DIRECTOR",0)

    elif any(ext in text for ext in Gear_Dict):
        status = SendCommand("GEAR_UP")
        sayit("Gear UP")

    elif any(ext in text for ext in Approach_Dict):
        status = SendCommand("AP_APR_HOLD_ON")
        sayit("Approach On")

    elif any(ext in text for ext in Localiser_Dict):
        status = SendCommand("AP_LOC_HOLD_ON")
        sayit("Localizer On")

    elif any(ext in text for ext in APU_Dict):
        status = SendCommand("APU_STARTER")
        sayit("APU On")

    elif any(ext in text for ext in AntiICE_Dict):
        status = SendCommand("ANTI_ICE_ON")
        sayit("Anti ICE On")

    elif any(ext in text for ext in Parking_Dict):
        status = checkStateBefore("Parking brake On", "BRAKE_PARKING_INDICATOR", "PARKING_BRAKES", 0)

    elif any(ext in text for ext in Lights_Dict):
        status = checkStateBefore("All Lights On", "LIGHT_LANDING", "ALL_LIGHTS_TOGGLE", 0)


    elif any(ext in text for ext in Battery_Dict):
        status = checkStateBefore("Master Battery On", "ELECTRICAL_MASTER_BATTERY", "TOGGLE_MASTER_BATTERY", 0)

    return status


def Set_OFF_Commands(text):

    status = 0

    if text.__contains__("auto") or text.__contains__("skid"):
      if any(ext in text for ext in Pilot_Dict):
          status = SendCommand("AUTOPILOT_OFF")
          sayit("Auto Pilot OFF")

      elif any(ext in text for ext in Throtle_Dict):
          status = checkStateBefore("Auto Throttle OFF", "AUTOTHROTTLE_ACTIVE", "AUTO_THROTTLE_ARM", 1)

      elif any(ext in text for ext in AntiSkid_Dict):
          status = checkStateBefore("Auto Brake OFF", "ANTISKID_BRAKES_ACTIVE", "ANTISKID_BRAKES_TOGGLE", 1)

    elif any(ext in text for ext in FlightDirector_Dict):
        status = checkStateBefore("Flight Director OFF", "AUTOPILOT_FLIGHT_DIRECTOR_ACTIVE", "TOGGLE_FLIGHT_DIRECTOR", 1)

    elif any(ext in text for ext in Gear_Dict):
        status = SendCommand("GEAR_DOWN")
        sayit("Gear Down")

    elif any(ext in text for ext in Approach_Dict):
        status = SendCommand("AP_APR_HOLD_OFF")
        sayit("Approach  OFF")

    elif any(ext in text for ext in Localiser_Dict):
        status = SendCommand("AP_LOC_HOLD_OFF")
        sayit("Localizer OFF")

    elif any(ext in text for ext in APU_Dict):
        status = SendCommand("APU_OFF_SWITCH")
        sayit("APU OFF")

    elif any(ext in text for ext in AntiICE_Dict):
        status = SendCommand("ANTI_ICE_OFF")
        sayit("APU OFF")

    elif any(ext in text for ext in Parking_Dict):
        status = checkStateBefore("Parking brake OFF", "BRAKE_PARKING_INDICATOR", "PARKING_BRAKES", 1)

    elif any(ext in text for ext in Lights_Dict):
        status = checkStateBefore("Lights OFF", "LIGHT_LANDING", "ALL_LIGHTS_TOGGLE", 1)

    elif any(ext in text for ext in Battery_Dict):
        status = checkStateBefore("Master Battery OFF", "ELECTRICAL_MASTER_BATTERY", "TOGGLE_MASTER_BATTERY", 1)

    return status


def SetValues(text,text_raw):

    status = 0

    Value = re.findall(r'\d+', text)
    ValueInt = -1
    if not Value:
        try:
            ValueInt = int(w2n.word_to_num(text_raw))
        except:
            print(Value)
            pass
    else:
        ValueInt = int(Value[0])
    print(ValueInt)
    if ValueInt > -1:
      if any(ext in text for ext in Throtle_Dict):
        arg_Value = ValueInt * 164
        status = SendCommand_arguments("THROTTLE_SET",arg_Value)
        sayit("Setting Throttle to" + str(ValueInt))

      elif any(ext in text for ext in Flaps_list_Dict):
        arg_Value = ValueInt * 4000
        status = SendCommand_arguments("FLAPS_SET",arg_Value)
        sayit("Setting Flaps to" + str(ValueInt))

      elif any(ext in text for ext in Heading_Dict):
        arg_Value = ValueInt
        status = SendCommand_arguments("HEADING_BUG_SET",arg_Value)
        sayit("Setting Heading to" + str(ValueInt))

      elif any(ext in text for ext in AirSpeed_Dict):
        arg_Value = ValueInt
        if any(ext in text for ext in Vertical_Dict):
          status = SendCommand_arguments("AP_VS_VAR_SET_ENGLISH",arg_Value)
          sayit("Setting Vertical speed to" + str(ValueInt))
        else:
          status = SendCommand_arguments("AP_SPD_VAR_SET",arg_Value)
          sayit("Setting Airspeed to" + str(ValueInt))

      elif any(ext in text for ext in Squak_Dict):
        arg_Value = int(Value[0], 16)
        status = SendCommand_arguments("XPNDR_SET",arg_Value)
        sayit("Setting transponder to" + Value[0])

      elif any(ext in text for ext in Altitude_Dict):
        arg_Value = ValueInt
        status = SendCommand_arguments("AP_ALT_VAR_SET_ENGLISH",arg_Value)
        sayit("Setting Flight level to" + str(ValueInt))

      elif any(ext in text for ext in Spoiler_Dict):
        SendCommand("SPOILERS_ARM_OFF")
        arg_Value = ValueInt * 164
        status = SendCommand_arguments("SPOILERS_SET",arg_Value)
        sayit("Setting Spoilers to" + str(ValueInt))

      elif any(ext in text for ext in Nav_Dic):
          freq_hz = ValueInt
          freq_hz = str(int(freq_hz))
          freq_hz_bcd = 0
          for figure, digit in enumerate(reversed(freq_hz)):
              freq_hz_bcd += int(digit) * (16 ** (figure))
          status = SendCommand_arguments("NAV1_RADIO_SET",freq_hz_bcd)
          sayit("Nav Radio to" + str(ValueInt))

    return status




def Miscelanous(text):
    if any(ext in text for ext in Spoiler_Dict) and text.__contains__("arm"):
        SendCommand("SPOILERS_ARM_ON")
        sayit(" Spoliers ARMED")

def Positive_Climb(initial_flight_level):
    status = 0
    curent_FligheLevel = getData("PLANE_ALTITUDE")
    if (curent_FligheLevel > initial_flight_level):
        sayit("Positive Climb")
        status = 1
    return status

def main():
    global key_release
    # Collect events until released
    '''
    with Listener(
            on_press=on_press,
            on_release=on_release) as listener:
        listener.join()

    listener = keyboard.Listener(
        on_press=on_press,
        on_release=on_release)
    listener.start()
    '''
    initial_flight_level = getData("PLANE_ALTITUDE") + 50
    Takeoff_done = 0
    while 1:
        #altitude = aq.get("MAGVAR")
        #print(altitude)
        #event_to_trigger = ae.find("KOHLSMAN")  # Toggles autopilot on or off
        #event_to_trigger(1000)

        if Takeoff_done == 0:
          Takeoff_done = Positive_Climb(initial_flight_level)

        status = 0
        '''
        events = gamepad.read()
        for event in events:
            print(event.ev_type, event.code, event.state)
            
        if keyboard.is_pressed(pushtoTalk):
        '''
        pygame.init()
        joystick = pygame.joystick.Joystick(0)
        joystick.init()

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True

            if event.type == pygame.JOYBUTTONDOWN:
                button = joystick.get_button(MIC_BUTTON)
                if button == 1:
                    print("listening Captain")
                    text_raw = get_audio()
                    text = text_raw
                    #text = text_raw.replace(" ","")
                    text = text.lower()

                    if any(ext in text for ext in on_list_Dict):
                        status = Set_ON_Commands(text)

                    elif any(ext in text for ext in off_list_Dict):
                        status = Set_OFF_Commands(text)

                    else:
                        status = SetValues(text, text_raw)
                        status = Miscelanous(text)

                    if status == 0:
                        sayit("Sir Say again")


if __name__ == "__main__":
    main()