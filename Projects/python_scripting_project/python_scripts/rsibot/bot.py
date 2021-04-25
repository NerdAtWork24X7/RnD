import websocket, json, pprint, talib, numpy
import config
from binance.client import Client
from binance.enums import *
import time
import sys

Coin = str(sys.argv[1])
#Coin = "ethusdt"
#Coin = "btcusdt"

with open('config.json', 'r') as f:
  config_dict = json.load(f)

start_price = float(config_dict[Coin]["start_price"])
Max_Buy_price = float(config_dict[Coin]["Max_Buy_price"])
Max_Transaction = float(config_dict[Coin]["Max_Transaction"])  # Buying cannot exced this number
Buy_Threshold = float(config_dict[Coin]["Buy_Threshold"])  # Buying price = Current price - Threshold
Profit_Percentage = float(config_dict[Coin]["Profit_Percentage"])  # Take profit at 10% of buying price
RSI_PERIOD = float(config_dict[Coin]["RSI_PERIOD"])
RSI_OVERBOUGHT = float(config_dict[Coin]["RSI_OVERBOUGHT"])
RSI_OVERSOLD = float(config_dict[Coin]["RSI_OVERSOLD"])
TRADE_SYMBOL = str(config_dict[Coin]["TRADE_SYMBOL"])
TRADE_QUANTITY = float(config_dict[Coin]["TRADE_QUANTITY"]) #dollar use to buy or sell one transaction



'''
Coin = "btcusdt"
start_price = 2700.022
Max_Buy_price = 4000
Max_Transaction = 500  # Buying cannot exced this number
Buy_Threshold = 0  # Buying price = Current price - Threshold
Profit_Percentage = 10  # Take profit at 10% of buying price
RSI_PERIOD = 14
RSI_OVERBOUGHT = 70
RSI_OVERSOLD = 30
TRADE_SYMBOL = 'ETHUSD'
TRADE_QUANTITY = 25  #dollar use to buy or sell one transaction
'''

SOCKET = "wss://stream.binance.com:9443/ws/" + Coin +"@kline_1m"

connectionstatus = 0
RSI_Reset_Counter = True

closes = []
opens  = []
in_position = 0  # count the position which can be opened

client = Client(config.API_KEY, config.API_SECRET, tld='us')

def Check_OrderList():
  global Coin
  try:
    Order_fd = open("Order_list_" + Coin, "r+")
  except:
    Order_fd = open("Order_list_" + Coin, "w+")
  EntryPosition = len(Order_fd.readlines())
  Order_fd.close()
  return EntryPosition


def Order_File_Update(Order_file):
  global Coin
  Order_fd = open("Order_list_" + Coin, "w+")
  for ele in Order_file:
    Order_fd.write(str(ele) + '\n')
  Order_fd.close()


def Order_File_Read():
  global Coin
  Order_fd = open("Order_list_" + Coin, "r+")
  Order_file = [x[:-1] for x in Order_fd.readlines()]
  Order_fd.close()
  return Order_file


def Profit_File_Update(min_price, close, type):
  global Coin, TRADE_QUANTITY
  Profit_fd = open("Profit_list_" + Coin, "a+")
  Profit_str = "Trade type = " + type +"  Open = " + str(min_price) + "  Closed = " + str(close) + "  Profit = " + str((close - min_price)/TRADE_QUANTITY) + "\n"
  Profit_fd.write(Profit_str)
  Profit_fd.close()


def order(side, quantity, symbol, order_type=ORDER_TYPE_MARKET):
  try:
    print("sending order")
    #order = client.create_order(symbol=symbol, side=side, type=order_type, quantity=quantity)
    #order = client.create_order(symbol=symbol, side=side, type=order_type, quoteOrderQty=quantity)
    #print(order)
    print("Side = " + str(side) + "  Quantity = " + str(quantity) + "  Symbol = " + str(symbol) + "  Order_type = " + str(order_type) + "  Price = " )
  except Exception as e:
    print("an exception occured - {}".format(e))
    return False

  return True


def on_open(ws):
  global connectionstatus
  connectionstatus  = 1
  print('opened connection')


def on_close(ws):
    global connectionstatus
    connectionstatus = 0
    print('closed connection')


def on_message(ws, message):
  global opens ,closes, in_position , RSI_Reset_Counter
  # print('received message')
  json_message = json.loads(message)
  #pprint.pprint(json_message)

  candle = json_message['k']

  is_candle_closed = candle['x']
  close_price = float(candle['c'])
  #open_price = float(candle['o'])
  if is_candle_closed:
    print("candle closed at {}".format(close_price))
    closes.append(float(close_price))
    # print("closes")
    #print(closes)
    '''
    print("candle open at {}".format(open_price))
    opens.append(float(open_price))
    # print("closes")
    print(opens)
    '''
    # Initial buy
    if (in_position == 0) and (float(close_price) < float(start_price)):
      Order_list = []
      order_succeeded = order(SIDE_BUY, float(TRADE_QUANTITY), TRADE_SYMBOL)
      if order_succeeded:
        # add entry in list
        Order_list.append(str(close_price))
        # write list back to file
        Order_File_Update(Order_list)
        in_position += 1
        RSI_Reset_Counter = False
        print("current price < Buy price")

    # Take profit Check if current price > Buy price + X%
    if in_position > 0:  # if we have open position
      Order_list = Order_File_Read()
      min_price = float(min(Order_list))
      Req_Percent = float(min_price + ((min_price * float(Profit_Percentage)) / 100))
      if float(close_price) > float(Req_Percent):
        order_succeeded = order(SIDE_SELL, float(TRADE_QUANTITY), TRADE_SYMBOL)
        if order_succeeded:
          # Remove entry from list
          Order_list.remove(str(min_price))
          # write list back to file
          Order_File_Update(Order_list)
          # Update profit file
          Profit_File_Update(float(min_price), float(close_price), "Percentage")
          in_position -= 1
          print("current price > Buy price + X%")

    # Calculate RSI
    if (len(closes) > RSI_PERIOD) & (in_position > 0):
      np_closes = numpy.array(closes)
      rsi = talib.RSI(np_closes, RSI_PERIOD)
      #print("all rsis calculated so far")
      #print(rsi)
      last_rsi = rsi[-1]
      print("the current rsi is {}".format(last_rsi))

      #Sell
      if last_rsi > RSI_OVERBOUGHT:
        if in_position > 0:
          print("Overbought! Sell! Sell! Sell!")
          # put binance sell logic here
          # Read Order File
          Order_list = Order_File_Read()
          max_price = float(max(Order_list))
          Req_Percent = float(max_price + ((max_price * float(5)) / 100))
          if (float(close_price) > float(max_price)) & (float(close_price) > float(Req_Percent)):
            order_succeeded = order(SIDE_SELL, float(TRADE_QUANTITY), TRADE_SYMBOL)
            if order_succeeded:
              # Remove entry from list
              Order_list.remove(str(min_price))
              # write list back to file
              Order_File_Update(Order_list)
              # Update profit file
              Profit_File_Update(min_price, close_price,"Overbought")
              in_position -= 1
              print("current price > Buy price")
        else:
          print("It is overbought, but we don't own any. Nothing to do.")

      #Limit buy untill uper threshold is reached
      if RSI_Reset_Counter == False:
        RSI_OVERSOLD_Threshold = 10
        if float(last_rsi) > ((float(RSI_OVERSOLD) + float(RSI_OVERSOLD_Threshold))):
          RSI_Reset_Counter = True

      if (float(last_rsi) < float(RSI_OVERSOLD)) & (RSI_Reset_Counter == True):
        if in_position < Max_Transaction:
          print("Oversold! Buy! Buy! Buy!")
          # put binance buy order logic here
          Order_list = Order_File_Read()
          min_price = float(min(Order_list)) - float(Buy_Threshold)
          if ((float(close_price) < float(min_price)) & (float(close_price) < float(Max_Buy_price))):
            order_succeeded = order(SIDE_BUY, float(TRADE_QUANTITY), TRADE_SYMBOL)
            if order_succeeded:
              # add entry in list
              Order_list.append(str(close_price))
              # write list back to file
              Order_File_Update(Order_list)
              in_position += 1
              RSI_Reset_Counter = False
              print("current price < Buy price")
        else:
          print("It is oversold, but you already own it, nothing to do.")
          
#websocket.enableTrace(True)
in_position = Check_OrderList()
print("Position = " + str(in_position))
while True:
   if connectionstatus == 0:
        time.sleep(5)
        ws = websocket.WebSocketApp(SOCKET, on_open=on_open, on_close=on_close, on_message=on_message)
        ws.run_forever(ping_interval=70, ping_timeout=10)
        connectionstatus = 0
