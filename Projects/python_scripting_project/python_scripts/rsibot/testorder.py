import websocket, json, pprint, talib, numpy
import config
from binance.client import Client
from binance.enums import *
import math



client = Client(config.API_KEY, config.API_SECRET, tld='com')

#exchange_info = client.get_exchange_info()
#for s in exchange_info['symbols']:
#    print(s['symbol'])

#order = client.create_order(symbol="ADAUSDT", side=SIDE_SELL, type=ORDER_TYPE_MARKET, quoteOrderQty=10)
#print(order)
asset_name = str("ADAUSDT".replace("USDT",""))
order_info = client.get_asset_balance(asset=asset_name)
print(order_info['free'])

