#include"i2c_slave.h"
#include"glcd.h"
#include"types.h"

extern unsigned short rxbuff[2];
extern const code char logo[1024];
extern const unsigned char layout[];


void init_lcd()
{
  uint8_t i,temp[4];
  display_on();
  set_start_line(0);
//  picture(&logo[0]);
//  for(i=20;i>0;i--)
//    delay(6500);
  clr_lcd();
  picture(layout);
 //lcd_puts1 (start col,page,string);
  lcd_puts2(0,0,"555659");             //Equipment code
  lcd_notify_const(120,0,5);             //Battery indication
  delay_ms(50);  lcd_notify_const(120,0,4);
  delay_ms(50);  lcd_notify_const(120,0,3);
  delay_ms(50);  lcd_notify_const(120,0,2);
  delay_ms(50);  lcd_notify_const(120,0,1);
  delay_ms(50);  lcd_notify_const(120,0,0);

  lcd_puts2(100,0,"45%");
  lcd_notify_const(90,0,10);             //Network
  lcd_notify_const(80,0,11);             //Start
  lcd_notify_const(80,0,12);             //Stop
  lcd_notify_const(70,0,13);             //Hooter
  lcd_notify_const(60,0,14);            //Light OFF
  lcd_notify_const(60,0,15);            //Light ON

  lcd_notify_const(15,2,17);            //UP  OFF
  lcd_notify_const(5,3,21);             //LEFT  OFF
  lcd_notify_const(15,4,19);            //DOWN   OFF
  lcd_notify_const(25,3,23);           //RIGHT  OFF
  


  
  
  
  
  lcd_notify_const(105,2,16);         //UP PRESSED
  lcd_notify_const(95,3,20);          //LEFT PRESSED
  lcd_notify_const(105,4,18);            //DOWN PRESSED
  lcd_notify_const(115,3,22);           //RIGHT PPRESSED

  lcd_puts2(95,6,"LOAD");lcd_puts2(85,7,"45000KG");
  

}

void main()
{
  Init();
  Init_lcd();

 
 while(1)
  {

  }
}