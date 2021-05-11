import xlrd
from datetime import datetime

wb = xlrd.open_workbook('Highlows.xls')
sheet = wb.sheet_by_index(0)

for i in range(sheet.nrows):
  #print(sheet.cell_value(i, 0))
  if("/USDT" == sheet.cell_value(i, 0)):
    Coin = sheet.cell_value(i-1, 0)
    High = sheet.cell_value(i+5, 0)
    low  = sheet.cell_value(i+6, 0)
    print(str(Coin).lower() + "usdt")
    #print(str(Coin) + "    " +  str(High) + "    " + str(low))
    '''
    print("  \"" + str(Coin).lower() + "usdt\":")
    print("    {")
    print("      \"start_price\": " + str(low) +",")
    print("      \"Max_Buy_price\": " + str(High) +",")
    print("      \"Max_Transaction\": 4,")
    print("      \"Buy_Threshold\": 0,")
    print("      \"Profit_Percentage\": 5,")
    print("      \"RSI_PERIOD\": 14,")
    print("      \"RSI_OVERBOUGHT\": 90,")
    print("      \"RSI_OVERSOLD\": 10,")
    print("      \"TRADE_SYMBOL\": \"" + str(Coin) + "USD\",")
    print("      \"TRADE_QUANTITY\": 25,")
    print("      \"Buy_Percentage\": 5")
    print("    },")
    '''
# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print("date and time =", dt_string)