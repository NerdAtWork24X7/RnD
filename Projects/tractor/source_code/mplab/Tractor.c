#include"types.h"
#include"config.h"
#include"tmr0.h"
#include"tmr2.h"
#include"pic.h"
#include"memory.h"


#define SEAT_SWITCH  PORTCbits.RC0
#define PTO          PORTCbits.RC1
#define HAND_BRAKE   PORTCbits.RC2
#define GEAR         PORTCbits.RC3
#define RELAY        PORTCbits.RC4

#define COND1 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(GEAR))
#define COND2 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!GEAR))
#define COND3 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(GEAR))
#define COND4 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!GEAR))
#define COND5 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(GEAR))
#define COND6 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!GEAR))

#define DEMO_ADDR    0x10u

uint8 test,Demo=0;
uint8 guc_choice=1;
volatile uint8 guc_sec=0;
volatile uint8 cnt,critcal_cond=0,guc_buzz_state=0;

void interrupt ISR() 
{
   if(INTCONbits.TMR0IE == 1 && INTCONbits.TMR0IF == 1)  /* interrupt handler*/
    {
        TMR0_ISR();
    }
    else         /*Unhandled Interrupt*/
    {
    }
}

void check_cond()
{
  if(COND1) guc_choice=1;
  else if(COND2) guc_choice=2;
  else if(COND3) guc_choice=3;
  else if(COND4) guc_choice=3;
  else if(COND5) guc_choice=5;
  else if(COND6) guc_choice=5;
}

void exe_cond()
{
  guc_sec=0;
  switch(guc_choice)
    {
      case 1: while(guc_sec<2)
              {
                if(COND2) 
                  break;
              }
              guc_buzz_state=1;
              while(COND1);
              guc_buzz_state=0;
              break;
      case 2: guc_buzz_state=1;
              while(COND2);
              guc_buzz_state=0;
              break;
      case 3: while(guc_sec<3)
              {
                if(COND2) 
                  break;
              }
              guc_buzz_state=1;
              guc_sec=0;
              while(guc_sec<5)
              {
                if(COND2) 
                  break;
              }
              guc_buzz_state=0;guc_sec=0;
              RELAY = 1; 
              while(guc_sec<5)
              {
                if(COND2) 
                  break;
              }  
              RELAY = 0;
              break;
      case 5: while(guc_sec<3)
              {
                if(COND2) 
                  break;
              }
              guc_buzz_state=1;guc_sec=0;
              while(guc_sec<7)
              {
                if(COND2) 
                   break;
              }  
              guc_buzz_state=0;
              break;

      default: guc_choice=0;
               guc_buzz_state=0;
               break;
    }
}

void init_PWM()
{
    uint16 dutyValue=57;
    CCPR3L = 0x0E;
    CCPR3H = 0x00;
    CCPTMRS0bits.C3TSEL = 0x0;
    CCPR3L = (uint8)((dutyValue & 0x03FC)>>2) ;
}


void Check_Demo()
{ 
    
    WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
    Demo=DATAEE_ReadByte(DEMO_ADDR);
    if(Demo==0xFF)
    {
        Demo=0;
    }
    if(Demo>250) { while(1); }
    else 
    {
        Demo++;
       DATAEE_WriteByte(DEMO_ADDR,Demo); 
    }   
}


void sys_init()
{
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */  
  Check_Demo();
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  ANSELA=0x00;
  ANSELC=0x00;
  TRISA=0x00;
  TRISC=0x0F;
  TMR0_Initialize();
  TMR2_Initialize();
  init_PWM();
  ei();
}

void main()
{
  sys_init();

  while(1)
   {
      check_cond();                 /*Check the condition*/
      if(guc_choice>0)
        exe_cond();               /*Execute the condtion*/
      guc_choice=0;                 /*Clear the condition*/
   }

}

