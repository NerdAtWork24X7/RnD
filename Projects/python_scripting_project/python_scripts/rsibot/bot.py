import websocket, json, pprint, talib, numpy
import config
from binance.client import Client
from binance.enums import *
import time
import sys
from datetime import datetime

# Coin = str(sys.argv[1])
Coin = "etcusdt"
# Coin = "btcusdt"

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
TRADE_QUANTITY = float(config_dict[Coin]["TRADE_QUANTITY"])  # dollar use to buy or sell one transaction
Buy_Percentage = float(config_dict[Coin]["Buy_Percentage"])  # buy if price drops below min %

SOCKET = "wss://stream.binance.com:9443/ws/" + Coin + "@kline_1m"

connectionstatus = 0
RSI_Reset_Counter = True
in_position = 0  # count the position which can be opened

closes = []
opens = []

client = Client(config.API_KEY, config.API_SECRET, tld='com')


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


def Profit_File_Update(min_price, close, type,Final_Qty):
  global Coin, TRADE_QUANTITY,in_position

  # datetime object containing current date and time
  now = datetime.now()
  # dd/mm/YY H:M:S
  dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
  if in_position <= 1:
    actual_trade_qty = TRADE_QUANTITY
  else:
    actual_trade_qty = TRADE_QUANTITY
  Profit_fd = open("Profit_list_" + Coin, "a+")
  Profit_str = "Trade type = " + type + "  Open = " + str(min_price) + "  Closed = " + str(close) + " Profit = " + str(
    round((float(Final_Qty) - float(actual_trade_qty)),2)) + "    " + dt_string +"\n"
  Profit_fd.write(Profit_str)
  Profit_fd.close()


def order(side, quantity, symbol, price ,order_type=ORDER_TYPE_MARKET):
  try:
    print("sending order")
    # order = client.create_order(symbol=symbol, side=side, type=order_type, quantity=quantity)
    #order = client.create_order(symbol=symbol, side=side, type=order_type, quoteOrderQty=quantity)
    # print(order)
    print(
      "Side = " + str(side) + "  Quantity = " + str(quantity) + "  Symbol = " + str(symbol) + "  Order_type = " + str(
        order_type) + "  Price = " + str(price))
  except Exception as e:
    print("an exception occured - {}".format(e))
    return False

  return True


def on_open(ws):
  global connectionstatus
  connectionstatus = 1
  print('opened connection')


def on_close(ws):
  global connectionstatus
  connectionstatus = 0
  print('closed connection')


def buy(close_price, Order_list, Order_Type):
  global RSI_Reset_Counter, in_position, TRADE_SYMBOL, TRADE_QUANTITY
  if Order_Type == "Initial Buy price":
    actual_trade_qty = TRADE_QUANTITY
  else:
    actual_trade_qty = TRADE_QUANTITY
  print("SIDE_BUY" + "  " + str(float(actual_trade_qty)) + "  " + str(TRADE_SYMBOL)  + "  " +  str(close_price))
  order_succeeded = order(SIDE_BUY, float(actual_trade_qty), TRADE_SYMBOL,close_price)
  if order_succeeded:
    # add entry in list
    Order_list.append(str(close_price))
    # write list back to file
    Order_File_Update(Order_list)
    in_position += 1
    RSI_Reset_Counter = False
    print(Order_Type)


def sell(min_price, close_price, Order_list, Order_Type):
  global in_position, TRADE_SYMBOL, TRADE_QUANTITY
  if in_position <= 1:
    actual_trade_qty = TRADE_QUANTITY
    Final_Qty = round((float((close_price * actual_trade_qty) / min_price) - float(0.1)), 2)
  else:
    actual_trade_qty = TRADE_QUANTITY
    Final_Qty = round(float((close_price * actual_trade_qty) / min_price), 2)
  if Final_Qty > actual_trade_qty:
    print("SIDE_SELL" + "  " + str(Final_Qty) + "  " + str(TRADE_SYMBOL)  + "  " +  str(close_price))
    order_succeeded = order(SIDE_SELL, float(Final_Qty), TRADE_SYMBOL,close_price)
    if order_succeeded:
      # Remove entry from list
      Order_list.remove(str(min_price))
      # write list back to file
      Order_File_Update(Order_list)
      # Update profit file
      Profit_File_Update(min_price, close_price, Order_Type,Final_Qty)
      in_position -= 1
      print(Order_Type)


def on_message(ws, message):
  global opens, closes, in_position, RSI_Reset_Counter
  global start_price, Max_Buy_price, Max_Transaction, Buy_Threshold, Profit_Percentage, RSI_PERIOD, RSI_OVERBOUGHT
  global RSI_OVERSOLD, TRADE_SYMBOL, TRADE_QUANTITY, Buy_Percentage

  # print('received message')
  json_message = json.loads(message)
  #pprint.pprint(json_message)
  candle = json_message['k']
  is_candle_closed = candle['x']
  close_price = float(candle['c'])
  # open_price = float(candle['o'])

  if is_candle_closed:

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
    TRADE_QUANTITY = float(config_dict[Coin]["TRADE_QUANTITY"])  # dollar use to buy or sell one transaction
    Buy_Percentage = float(config_dict[Coin]["Buy_Percentage"])  # buy if price drops below min %

    if (len(closes) < RSI_PERIOD) or (in_position == 0):
      print("closed at {}".format(close_price))
    closes.append(float(close_price))
    # print("closes")
    # print(closes)
    '''
    print("candle open at {}".format(open_price))
    opens.append(float(open_price))
    # print("closes")
    print(opens)
    '''

    # Initial buy
    if (in_position == 0) and (float(close_price) < float(start_price)):
      Order_list = []
      buy(close_price, Order_list, "Initial Buy price")

    # Calculate RSI
    if (len(closes) > RSI_PERIOD) & (in_position > 0):
      np_closes = numpy.array(closes)
      rsi = talib.RSI(np_closes, RSI_PERIOD)
      # print("all rsis calculated so far")
      # print(rsi)
      last_rsi = rsi[-1]
      print("closed at {}".format(close_price) + "   rsi is {}".format(last_rsi))

      # Sell
      if last_rsi > RSI_OVERBOUGHT:
        if in_position > 0:
          print("Overbought! Sell! Sell! Sell!")
          # put binance sell logic here
          # Read Order File
          Order_list = Order_File_Read()
          new_list = [float(i) for i in Order_list]
          min_price = float(min(new_list))
          Req_Percent = float(min_price + ((min_price * float(Profit_Percentage)) / 100))
          if (float(close_price) > float(min_price)) & (float(close_price) > float(Req_Percent)):
            sell(min_price, close_price, Order_list, "Overbought RSI")
        else:
          print("It is overbought, but we don't own any. Nothing to do.")

      # Limit buy untill uper threshold is reached
      if RSI_Reset_Counter == False:
        RSI_OVERSOLD_Threshold = 20
        if float(last_rsi) > ((float(RSI_OVERSOLD) + float(RSI_OVERSOLD_Threshold))):
          RSI_Reset_Counter = True

      if (float(last_rsi) < float(RSI_OVERSOLD)) & (RSI_Reset_Counter == True):
        if in_position < Max_Transaction:
          print("Oversold! Buy! Buy! Buy!")
          # put binance buy order logic here
          Order_list = Order_File_Read()
          new_list = [float(i) for i in Order_list]
          min_price = float(min(new_list)) - float(Buy_Threshold)
          if ((float(close_price) < float(min_price)) & (float(close_price) < float(Max_Buy_price))):
            buy(close_price, Order_list, "Oversold RSI")
        else:
          print("It is oversold, but you already own it, nothing to do.")

    if in_position > 0:  # if we have open position
      Order_list = Order_File_Read()
      new_list = [float(i) for i in Order_list]
      min_price = float(min(new_list))
      # Take profit Check if current price > Buy price + X%
      Req_Percent = float(min_price + ((min_price * float(Profit_Percentage)) / 100))
      if float(close_price) > float(Req_Percent):
        sell(min_price, close_price, Order_list, "CP > SP +" + str(Profit_Percentage) + "%")

      # Buy
    if (in_position > 0):
      if (in_position < Max_Transaction):
        # put binance buy order logic here
        Order_list = Order_File_Read()
        new_list = [float(i) for i in Order_list]
        min_price = float(min(new_list))
        Profit_Per = Profit_Percentage
        if in_position > 1:
         Profit_Per = Profit_Percentage + 4
        Req_Percent = float(min_price - ((min_price * float(Profit_Per)) / 100))
        if ((float(close_price) < float(Req_Percent)) & (float(close_price) < float(Max_Buy_price))):
          buy(close_price, Order_list, "CP < BP -" + str(Profit_Per) + "%")
      else:
        print("Max transaction Reached, but you already own it, nothing to do.")


#websocket.enableTrace(True)
in_position = Check_OrderList()
print("Position = " + str(in_position))
while True:
  if connectionstatus == 0:
    time.sleep(5)
    ws = websocket.WebSocketApp(SOCKET, on_open=on_open, on_close=on_close, on_message=on_message)
    ws.run_forever(ping_interval=70, ping_timeout=10)
    connectionstatus = 0
