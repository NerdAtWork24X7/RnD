#include"types.h"
#include"button.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"socket.h"
#include "EEPROM.h"

extern u8 sec,mins,hrs,day,date,month,year;   // Global date/time variables
extern s8 pattern;
extern u8 pre_mode[7],cur_mode[7];
extern u8 temp[20];
extern const u8 patt[4][16];

u8 val[4];
s8 inten[7];
/***************Select Pattern***************************/
void sel_patt()
{
  s8 i=0;
  u8 exit;
  const u8 disp_patt[]="pattern";
  while(!ENTER);
  while(ENTER)
      {
        Lcd_Cmd(_LCD_CLEAR);
        Constant_to_temp(disp_patt) ;Lcd_Out(1,6,temp);
        Constant_to_temp(patt[i]);  Lcd_Out(2,1,temp);
        Lcd_Chr(1,16,'^');
        Lcd_Chr(2,16,'v');
        while(UP&&DOWN&&ENTER&&MENU);  //wait
        if(!UP){ i++; while(!UP); }//wait till button is released
        else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
        else if(!MENU) return;
        if(i<0) i=6;
        if(i>6) i=0;
      }
        pattern=i;
}
/*************Select socket******************************/
void sel_socket(u8 tim)
{
     u8 i=0,exit=0;
     const u8 disp_txt[9]={"Socket"};
     Lcd_Cmd(_LCD_CLEAR);
     while(!MENU ||!ENTER);
     while(exit==0)
      {
        Lcd_Cmd(_LCD_CLEAR);
        Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
        lcd_chr(2,1,i+49);lcd_chr(2,2,'.');                                //no of socket
        Constant_to_temp(disp_txt); Lcd_Out(2,3,temp);
        lcd_chr(2,9,i+49);
        Lcd_Chr(1,16,'^');                                                 //no of socket
        Lcd_Chr(2,16,'v');
        while(UP&&DOWN&&ENTER&&MENU);  //wait
        if(!UP){ i++; while(!UP); }//wait till button is released
        else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
        else if(!ENTER)
         {
           save_data(i,tim);
         }
        else if(!MENU) return;
        if(i<0) i=4;
        if(i>4) i=0;
      }
    while(!MENU || !ENTER);


}


/****************Save pattern****************************/
void save_data(u8 soc_no,u8 tim)
{
   u8 flag=0,i=0,exit=0;
   const u8 disp_txt[][20]={"0.Off","1.Conti mode","2.Pulse mode","3.Feed mode","4.Exit"};
   u16 addr;
   
   while(!ENTER || !MENU);
   if(pattern==1) addr=0x0000;
   else if(pattern==2) addr=0x00A9;
   else if(pattern==3) addr=0x0152;
   else if(pattern==4) addr=0x01FB;
   else if(pattern==5) addr=0x0202;
   else if(pattern==6) addr=0x0209;
  
  /********read the preset****************/
    if(pattern<=3)
      inten[soc_no]=read_I2C(0xA0,(addr+(7*tim)+soc_no));  //for pattern0,1,2,3
       else
         inten[soc_no]=read_I2C(0XA0,(addr+soc_no));          //for pattern4,5,6

     if(inten[soc_no]>4 || inten[soc_no]<0) inten[soc_no]=0;                     //Check for valid option
     i=inten[soc_no];
   
   while(exit==0)
      {
        Lcd_Cmd(_LCD_CLEAR);
        Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
        Constant_to_temp(disp_txt[i]); Lcd_Out(2,1,temp);
        Lcd_Chr(1,16,'^');
        Lcd_Chr(2,16,'v');
        while(UP&&DOWN&&ENTER&&MENU);  //wait
        if(!UP){ i++; while(!UP); }//wait till button is released
        else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
        else if(!ENTER){flag=1; break;}
        else if(!MENU) return;
        if(i<0) i=4;
        if(i>4) i=0;
      }
    while(!MENU || !ENTER);
      

        if(pattern<=3)
           write_I2C(0xA0,(addr+(7*tim)+soc_no),i);
        else
         write_I2C(0xA0,(addr+soc_no),i);          //for pattern4,5,6

}