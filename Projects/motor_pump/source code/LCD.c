#include"types.h"
#include"button.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"PWM.h"
#include"EEPROM.h"


/*******************LCD module connections*******************/
sbit LCD_RS at RA0_bit;
sbit LCD_EN at RA2_bit;
sbit LCD_D4 at RA4_bit;
sbit LCD_D5 at RA5_bit;
sbit LCD_D6 at RA7_bit;
sbit LCD_D7 at RA6_bit;

sbit LCD_RS_Direction at TRISA0_bit;
sbit LCD_EN_Direction at TRISA2_bit;
sbit LCD_D4_Direction at TRISA4_bit;
sbit LCD_D5_Direction at TRISA5_bit;
sbit LCD_D6_Direction at TRISA7_bit;
sbit LCD_D7_Direction at TRISA6_bit;

extern u8 sec,mins,hrs,day,date,month,year;   // Global date/time variables
extern s8 pattern;
extern u8 pre_intensity[7],cur_intensity[7];
extern u8 temp[15];
const u8 patt[7][16]={"0.Preset 0","1.Preset 1","2.Preset 2","3.Preset 3","4.Set 1","5.Set 2","6.Set 3"};



/*********************Display Main Screen*************************/
void Display_Time() 
{
   u8 dat[4];
   ByteToStr(hrs,dat);
   Lcd_Out(1,6,dat+1);
   if(dat[1]==' ') Lcd_Chr(1,6,'0');
   memset(dat,0,2);
   ByteToStr(mins,dat);
   Lcd_Out(1,9,dat+1);
   if(dat[1]==' ') Lcd_Chr(1,9,'0');
}

/**************************Init Lcd******************************/
void init_lcd()
{
  Lcd_Init();                // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
  Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
  Lcd_Chr(1,8,':');
  Constant_to_temp(patt[pattern]+2);  Lcd_out(2,1,temp);


}

/***************Config Time*****************************/
void config_Time(u8 tim,u8 addr)
{
  u8 max=0,dat[4]={0};
  const u8 disp_txt[][20]={"Enter Hours","Enter Mins","Enter Date","Enter month","Enter year"};
  Lcd_Cmd(_LCD_CLEAR);
  if(addr==0x02)  { max=23; Constant_to_temp(disp_txt[0]); Lcd_Out(1,1,temp);}
  else if(addr==0x01){ max=59; Constant_to_temp(disp_txt[1]); Lcd_Out(1,1,temp);}
  else if(addr==0x04){ max=30; Constant_to_temp(disp_txt[2]);Lcd_Out(1,1,temp);}
  else if(addr==0x05){ max=12; Constant_to_temp(disp_txt[3]); Lcd_Out(1,1,temp);}
  else if(addr==0x06){ max=99; Constant_to_temp(disp_txt[4]);Lcd_Out(1,1,temp); }

  while(!ENTER);
  do
   {
     memset(dat,'0',2);
     ByteToStr(tim,dat);
     Lcd_Out(2,1,dat+1);
     if(!UP)
      {
         tim++; if(tim>max) tim=0;
         while(!UP);
      }
     else if(!DOWN)
      {
        tim--; if(tim>max) tim=max;
        while(!DOWN);
      }
     else if(!MENU) break;
   }while(ENTER);
   while(!MENU);
  write_I2C(0xD0,addr,((tim/10)<<4)|tim%10);
}




/***************Config Pattern***************************/
void config_patt()
{
   const u8 tim[26][13]={"1.0am-1am","2.1am-2am","3.2am-3am","4.3am-4am",
                       "5.4am-5am","6.5am-6am","7.6am-7am","8.7am-8am",
                       "9.8am-9am","10.9am-10am","11.10am-11am","12.11am-12am",
                       "13.12am-1pm","14.1pm-2pm","15.2pm-3pm","16.3pm-4pm",
                       "17.4pm-5pm","18.5pm-6pm","19.6pm-7pm","20.7pm-8pm",
                       "21.8pm-9pm","22.9pm-10pm","23.10pm-11pm","24.11pm-12pm","25.Exit"};
   const u8 disp_txt[][20]={"Cannot modify","Default Preset"};
  s8 i=0,exit=0;
  if(pattern==0)
  { 
    Lcd_Cmd(_LCD_CLEAR); 
    Constant_to_temp(disp_txt[0]);  Lcd_Out(1,1,temp);
    Constant_to_temp(disp_txt[1]);   Lcd_Out(2,1,temp);
    delay_ms(500); 
    return;    
   }
  
  else if(pattern==1 || pattern==2 || pattern==3)
  {
    while(exit==0)
      {
        Lcd_Cmd(_LCD_CLEAR);
        Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
        Constant_to_temp(tim[i]); Lcd_Out(2,1,temp);
        Lcd_Chr(1,16,'^');
        Lcd_Chr(2,16,'v');
        while(UP&&DOWN&&ENTER&&MENU);  //wait
        if(!UP){ i++; while(!UP); }//wait till button is released
        else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
        else if(!ENTER)
        {
          if(i==24) { exit=1;}
          else { save_data(i);}
        }
        else if(!MENU) break;
        if(i<0) i=24;
        if(i>24) i=0;
      }
    while(!MENU);
   }
   
    else if(pattern==4 || pattern==5 || pattern==6) save_data(0);
}


/*******************Menu Function************************/
void menu_fnc(void)
{
     s8 i=1,exit=0;
     const u8 disp_menu[]={"MENU"};
     const u8 menu[4][16]={"1.Time","2.Preset","3.Edit Preset","4.Exit"};
     while(!MENU);
     while(exit==0)
      {
        Lcd_Cmd(_LCD_CLEAR);
        Constant_to_temp(disp_menu); Lcd_Out(1,6,temp);
        Constant_to_temp(menu[i-1]); Lcd_Out(2,1,temp);
        Lcd_Chr(1,16,'^');
        Lcd_Chr(2,16,'v');
        while(UP&&DOWN&&ENTER&&MENU);  //wait
        
        if(!UP) { i++; while(!UP); }//wait till button is release
        else if(!DOWN){ i--; while(!DOWN); }  //wait till button is realeased
        else if(!MENU) break;
        if(i<1) i=4;
        if(i>4) i=1;
        if(!ENTER)
          {
            switch(i)
              {
                case 1: config_Time(hrs=Bcd2Dec(read_I2C(0xD0,0x02)),0x02);
                        config_Time(mins=Bcd2Dec(read_I2C(0xD0,0x01)),0x01);
                        config_Time(date=Bcd2Dec(read_I2C(0xD0,0x04)),0x04);
                        config_Time(month=Bcd2Dec(read_I2C(0xD0,0x05)),0x05);
                        config_Time(year=Bcd2Dec(read_I2C(0xD0,0x06)),0x06);
                        break;
                case 2: sel_patt(); while(!MENU || !ENTER);
                        break;
                case 3: config_patt(); while(!MENU || !ENTER);
                        break;
                case 4: exit=1;
                        break;
              }
          }
          
      }
      while(!MENU);
}


/************Bring data from ROM to RAM****************************************/
void Constant_to_temp(const u8* source)
{
   u8 i;
   for(i=0;i<15;i++) temp[i]=0;  //Clearing Temp
   for(i=0;source[i];i++)
       temp[i]=source[i];
       
   temp[i]='\0';
   return;
}