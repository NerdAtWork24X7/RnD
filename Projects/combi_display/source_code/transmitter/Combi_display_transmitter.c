#include"types.h"
#include"I2C.h"
extern void keyscan();
uint8_t channel[6];

void init_uc()
{
  TRISA=0x00;
  TRISB=0x00;
  TRISC=0xF0;
  ANSEL=0x00;
  ANSELH=0x00;
}

void send_data_lcd()
{
  write_I2C(0xD2,CHANNEL_0,channel[0]);
  write_I2C(0xD2,CHANNEL_1,channel[1]);
  write_I2C(0xD2,CHANNEL_2,channel[2]);
  write_I2C(0xD2,CHANNEL_3,channel[3]);
  write_I2C(0xD2,CHANNEL_4,channel[4]);
  write_I2C(0xD2,CHANNEL_5,channel[5]);
  write_I2C(0xD2,RSSI,0x84);
  write_I2C(0xD2,WEIGHT,0x12);
}
main()
{
       init_uc();

        while(1)
        {
          keyscan();
          PORTA=channel[0];
          PORTB=channel[1];
          send_data_lcd();

        }
}