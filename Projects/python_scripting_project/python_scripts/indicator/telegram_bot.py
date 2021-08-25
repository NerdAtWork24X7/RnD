import requests
from datetime import datetime, timedelta
import time
import pytz
from os import environ

#Define all the constants
time_interval = 20  # (in seconds) Specify the frequency of code execution
PINCODE = "801503"
msg = "Blank"
tele_auth_token = "1814914883:AAFQ3vOnFaP2ZU3qQ2OXfshyOZHblzMmw2Q" # Authentication token provided by Telegram bot
tel_group_id = "sahildatabase"      # Telegram group name
IST = pytz.timezone('Asia/Kolkata')           # Indian Standard Time - Timezone
slot_found =  False                                   # Intial slot found status
header = {'User-Agent': 'Chrome/84.0.4147.105 Safari/537.36'}



def send_msg_on_telegram(msg):
  telegram_api_url = f"https://api.telegram.org/bot{tele_auth_token}/sendMessage?chat_id=@{tel_group_id}&text={msg}"
  tel_resp = requests.get(telegram_api_url)
  if tel_resp.status_code == 200:
    print("Notification has been sent on Telegram")
  else:
    print("Could not send Message")

