#include"types.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"PWM.h"

#define CHECK_VALID_TIME if(sec>60||mins>60||hrs>24){sec=0;mins=0;hrs=0;}

u8 prev_hrs=0,prev_min=0,hrs=0,mins=0,sec=0,day=0,date=0,month=0,year=0;
s8 pattern=0;
u8 pre_intensity[7]={0},cur_intensity[7]={0};
u8 temp[20];


void main()
{
    ANSEL = 0x00;                        // Configure AN pins as digital I/O
    ANSELH=0x00;
    I2C1_Init(100000);
    TRISA=0x00;                 //configure port as o/p
    TRISB=0xFF;                       //Configure port B i/p
    delay_ms(1000);
    pattern=read_I2C(0xA0,0x0210);   //read the pattern no from EEPROM
    write_I2C(0xD0,0x00,0x00);
    if(pattern>6 || pattern<0) pattern=0;
    Init_PWM();
    Check_time();
    CHECK_VALID_TIME
    init_lcd();
    Display_Time();
    set_Intensity();
    prev_hrs=hrs;prev_min=mins;
    while(1)
    {
     if(!MENU)
      {
       menu_fnc();
       write_I2C(0xA0,0x0210,pattern);    //Writing the pattern to EEPROM
       Check_time();
       CHECK_VALID_TIME
       init_lcd();
       Display_Time();
       set_Intensity();
      }
    if(prev_min!=mins){init_lcd(); Display_Time();}          // Prepare and display on LCD
    if(prev_hrs!=hrs){init_lcd(); Display_Time(); set_Intensity(); }
    Check_time();
    CHECK_VALID_TIME
   }
}