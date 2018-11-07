#include"types.h"
#include"lcd.h"

extern uint8_t temp[15];

/*******************LCD module connections*******************/
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


/**************************Init Lcd******************************/
void init_lcd()
{
  Lcd_Init();                // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
  Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
  Lcd_Out(1,1,"ADC=");
}


/************Bring data from ROM to RAM****************************************/
void Constant_to_temp(const uint8_t* source)
{
   uint8_t i;
   for(i=0;i<15;i++) temp[i]=0;  //Clearing Temp
   for(i=0;source[i];i++)
       temp[i]=source[i];

   temp[i]='\0';
   return;
}