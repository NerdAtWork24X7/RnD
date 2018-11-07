#include"types.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"socket.h"

u8 pattern=0,prev_hrs=0,prev_min=0,prev_sec=0,hrs=0,mins=0,sec=0,day=0,date=0,month=0,year=0;
u8 pre_mode[7]={0},cur_mode[7]={0};
u8 temp[20];


void main()
{
    ANSEL = 0x00;                        // Configure AN pins as digital I/O
    ANSELH=0x00;
    TRISA=0x00;                 //configure port as o/p
    TRISB=0x0F;                       //Configure port B i/p
    TRISC=0x00;
    Soft_I2C_Init();
    pattern=read_I2C(0xA0,0x0210);   //read the pattern no from EEPROM
    if(pattern>6) pattern==0;
    Check_time();
    init_lcd();
    Display_Time();
    set_Intensity();
    prev_hrs=hrs;prev_min=mins;prev_sec=sec;
    while(1)
         {

             if(!MENU)
              {
                menu_fnc();
                write_I2C(0xA0,0x0210,pattern);    //Writing the pattern to EEPROM
                Check_time();
                init_lcd();
                Display_Time();
                set_Intensity();
              }
                if(prev_min!=mins){init_lcd(); Display_Time();}          // Prepare and display on LCD
                if(prev_hrs!=hrs){init_lcd(); Display_Time();}
                if(prev_sec!=sec){set_Intensity(); }
                Check_time();

         }
}