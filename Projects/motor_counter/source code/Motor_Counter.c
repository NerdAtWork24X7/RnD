#include "glcd.h"
#include "types.h"
#include "i2c.h"

#define
/************Gloabal Variables*********************/
const code uint8_t stop[]="STOP",start[]="START",pause[]="PAUSE";
uint8_t sec,p_sec,mins,p_mins,hrs,p_hrs,day,date,p_date,month,p_month,year,p_year;
extern const code char logo[];




void init_mcu()
{
  unsigned char i;
  TRISA=0x00;
  TRISB=0x01;
  TRISC=0x00;
  ANSEL = 0;                        // Configure AN pins as digital I/O
  ANSELH = 0;
}

void init_lcd()
{
  uint8_t i,temp[4];
  display_on();
  set_start_line(0);
  picture(&logo[0]);
  for(i=20;i>0;i--)
    delay(6500);
  clr_lcd();
 //lcd_puts1 (start col,page,string);
  lcd_puts1(0,0,"*****SV-CORP****");
  lcd_puts2(0,1,"DATE:-"); lcd_puts2(42,1,":"); lcd_puts2(59,1,":"); lcd_puts2(65,1,"20");
  lcd_puts2(0,2,"TIME:-"); lcd_puts2(42,2,":"); lcd_puts2(59,2,":");
  
  lcd_puts2(0,4,"MOTOR:-");  lcd_puts2(37,4,"00");
  lcd_puts2(64,4,"ROT:-");  lcd_puts2(91,4,"00");
  lcd_puts2(0,5,"COMP:-");  lcd_puts2(32,5,"00");
  lcd_puts2(64,5,"REM:-"); lcd_puts2(91,5,"00");
  lcd_puts2(0,7,"STATUS:-"); lcd_puts2_const(42,7,stop);
  
}

void main()
{
     unsigned char i;
     init_mcu();
     init_lcd();
     while(1)
      {
         Check_time();
       }

}