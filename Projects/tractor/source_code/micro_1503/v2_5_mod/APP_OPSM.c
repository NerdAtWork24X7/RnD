#include "APP_OPSM.h"

volatile uint16 guc_sec=0;
volatile uint8 guc_buzz_state=0;
volatile uint16 PTO_cnt = 0;
volatile uint16 SS_cnt = 0;
volatile uint16 HB_cnt = 0;

volatile uint8 eng_sol = 0;
volatile uint8 eng_direct = 1;
volatile uint8 eng_time = 0;
volatile uint8 buz_time = 0;
volatile uint8 UART_Time = 0;

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
  BUZZER = 0;
  RELAY_SOL = 0;
  guc_buzz_state = 0;
}


/*
void Check_cond()
{
  guc_sec = 0; while(PTO & guc_sec<3);
  if(PTO)
  {
    guc_sec = 0 ; while((!SEAT_SWITCH) & guc_sec<3)
    if(!SEAT_SWITCH)
    {
      Uart_Send();
      while(PTO)
      {
         if(SEAT_SWITCH){ (RELAY_SOL = 0); }
         else
         {
           guc_sec = 0; while((!SEAT_SWITCH) & guc_sec<6);
           RELAY_SOL = 1; while(guc_sec<6);
         }
      }
    }
  }

  guc_sec = 0; while(!SEAT_SWITCH & guc_sec<3);
  if(!SEAT_SWITCH)
  {
    guc_sec = 0; while((!HAND_BRAKE) & guc_sec<3);
    if(!HAND_BRAKE)
    {
      guc_buzz_state = 1;
      Uart_Send();
      while(!SEAT_SWITCH)
      {
        if(HAND_BRAKE)
        {
          (guc_buzz_state = 0);
        }
        else
        {
          guc_sec = 0; while((HAND_BRAKE) & guc_sec<6); (guc_buzz_state = 1);
        }
        (PTO)?(RELAY_SOL = 1):(RELAY_SOL = 0);
      }
    }
  }
}
*/

void Uart_Send()
{
   Soft_UART_Write(' ');
   if(PTO)
    Soft_UART_Write('P');
   if(SEAT_SWITCH)
    Soft_UART_Write('S');
   if(HAND_BRAKE)
   Soft_UART_Write('H');
}

void Check_cond()
{
  if(UART_Time > 2) { Uart_Send(); UART_Time = 0;}
  if(PTO)
  {
    if(SEAT_SWITCH)
    {
      eng_sol = 0;
      RELAY_SOL = 0;
    }
    else
    {
      if(!eng_sol)
      {
        eng_sol = 1;
        (eng_direct)?(eng_time = 6):(eng_time = 0);
         eng_direct = 0;
      }
    }
  }
  else
  {
    eng_direct = 1;
    RELAY_SOL = 0;
    eng_sol = 0;
  }
  
  
  
  if(SEAT_SWITCH)
  {
    guc_buzz_state = 0;
    BUZZER = 0;
  }
  else 
  {
    if(HAND_BRAKE)
    {
      guc_buzz_state = 0;
      BUZZER = 0;
    }
    else
    {
      if(!guc_buzz_state)
      {
        guc_buzz_state = 1;
        buz_time = 0;
      }
    }
  }  
}


void sys_init()
{
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */

  PORTA = 0x00;
  LATA = 0x00;
  ANSELA = 0x00;
  TRISA = 0x20;

  PORTC = 0x00;
  ANSELC = 0x00;
  LATC = 0x00;
  TRISC = 0x07;

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
  Soft_UART_Write(' ');
  Soft_UART_Write('R');
  while(1)
   {
     //reset_all();
     Check_cond();
   }
}