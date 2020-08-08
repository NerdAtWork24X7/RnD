#include "APP.h"

extern volatile uint16 one_sec;
extern volatile uint8 one_min,one_hour,one_day,guc_min;
volatile uint8 one_day_flag=0,one_min_flag=0,luc_stop_min_sw=0,luc_start_hr_sw=0,luc_reset=0;
volatile uint8 Start_Time_hour = 1,Stop_mins = 1; 

void interrupt()
{
   asm CLRWDT ;
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }

}

void reset_all()
{
  RELAY_SOL = 0;
  one_sec = 0;
  one_min = 0;
  one_hour = 59;
  one_day = 0 ;
  guc_min = 0;
  Start_Time_hour = 4;
  Stop_mins = 1; 
}

void Input_SW()
{
   
   if(!STOP_MIN_SW) 
   {
     luc_stop_min_sw++;
     luc_start_hr_sw = 0; luc_reset = 0;
   }
   if(!START_HR_SW) 
   {
     luc_start_hr_sw++;
     luc_stop_min_sw = 0; luc_reset = 0;
   }
   if(!RESET_SW) 
   {
     luc_reset++;
     luc_stop_min_sw = 0; luc_start_hr_sw = 0;
   }


   if(luc_stop_min_sw > DEBO_TIME)
   {
     Stop_mins++;
     if(Stop_mins>59) Stop_mins = 1;
     luc_stop_min_sw = 0;
     while(!STOP_MIN_SW);
   }
   
   
   if(luc_start_hr_sw > DEBO_TIME)
   {
      Start_Time_hour++;
      if(Start_Time_hour>23) Start_Time_hour = 1;
      luc_start_hr_sw = 0;
      while(!START_HR_SW);
   }
   
   
   if(luc_reset > DEBO_TIME)
   {
     reset_all();
     luc_reset = 0;
     while(!RESET_SW);
   }
   
   
    
}

void Uart_Send()
{
  char str[3] = {'0'};
  //hours   
  ByteToStr(one_day,str);
  Soft_UART_Write(str[1]);
  Soft_UART_Write(str[2]);
  Soft_UART_Write(':');
  
  //mins
  ByteToStr(one_hour,str);
  Soft_UART_Write(str[1]);
  Soft_UART_Write(str[2]);
  Soft_UART_Write(':');
  
  //secs
  ByteToStr(one_min,str);
  Soft_UART_Write(str[1]);
  Soft_UART_Write(str[2]);
  Soft_UART_Write(13);
  
  //start time
  ByteToStr(Start_Time_hour,str);
  Soft_UART_Write(str[1]);
  Soft_UART_Write(str[2]);
  Soft_UART_Write(':');

  //stop time
  ByteToStr(Stop_mins,str);
  Soft_UART_Write(str[1]);
  Soft_UART_Write(str[2]);
  
  Soft_UART_Write(13);
  Soft_UART_Write(13);
  
}

void Check_cond()
{
   if(one_min_flag == 1)
   {
     Uart_Send();
     one_min_flag = 0;
   }
   if(one_day_flag == 1)
   {
     if(!LDR_SW) RELAY_SOL = 1;
     else RELAY_SOL = 0;
     
     if(guc_min >= Stop_mins)
     {
       RELAY_SOL = 0;
       one_day_flag = 0;
     }
   }
}


void sys_init()
{
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */

  PORTA = 0x00;
  LATA = 0x00;
  ANSELA = 0x00;
  TRISA = 0x24;

  PORTC = 0x00;
  ANSELC = 0x00;
  LATC = 0x00;
  TRISC = 0x0F;

  reset_all();
  
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
  
  Soft_UART_Init(&PORTA, 1, 0, 9600, 0); // Initialize Soft UART at 14400 bps
  
  GIE_bit = 1;     /* Enable INTs  */

  #if START_REL == 1
  RELAY_STR = 1;
  #endif
}

void main()
{
  sys_init();
  Uart_Send();
  while(1)
  {
        Check_Cond();
        Input_SW();
  }
}