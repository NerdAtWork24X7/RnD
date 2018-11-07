#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm3.h"

#define COND1 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND2 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND3 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND4 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND5 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND6 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND7 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND8 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND9 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND10 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND11 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND12 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND13 ((SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))


#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#define DEMO_ADDR    0x40u

uint16 Demo=0;
uint8 test;
uint8 guc_choice=1,rel_lock=0;
volatile uint16 guc_cycle[13],guc_deb[14]={0},guc_sec=0;
volatile uint8 Eng_On = 0,cnt,critcal_cond=0,guc_buzz_state=0;
volatile uint16 demo_time=0;

void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }
    else                                   /*Unhandled Interrupt*/
    {
    }
}

void CHCK_COND(uint8 x)
{
   uint8 i;
   guc_deb[x]++;
   for(i=0;i<=13 && i!=x;i++){guc_deb[i] = 0;}
   if(guc_deb[x] > 10){ guc_choice = x; guc_deb[x] = 0;}
}


void check_cond()
{
    guc_choice = 0;
    if(COND1){ CHCK_COND(1); }
    if(COND2){ CHCK_COND(2); }
    if(COND3){ CHCK_COND(3); }
    if(COND4){ CHCK_COND(4); }
    if(COND5){ CHCK_COND(5); }
    if(COND6){ CHCK_COND(6); }
    if(COND7){ CHCK_COND(7); }
    if(COND8){ CHCK_COND(8); }
    if(COND9){ CHCK_COND(9); }
    if(COND10){ CHCK_COND(10); }
    if(COND11){ CHCK_COND(11); }
    if(COND12){ CHCK_COND(12); }
    if(COND13){ CHCK_COND(13); }
    asm CLRWDT ;

}

void exe_cond()
{
  if(guc_choice == 1 || guc_choice == 2 || guc_choice == 3
    || guc_choice == 4 ){guc_buzz_state=1;}
  else { guc_buzz_state=0;}

  if(guc_choice == 5 || guc_choice == 6 || guc_choice == 7 || guc_choice == 8
    || guc_choice == 9 || guc_choice == 10 || guc_choice == 11
    || guc_choice == 12 )
    {P_IND = 1;}
  else { P_IND = 0;}

 #if START_REL == 1
  if(guc_choice == 1 || guc_choice == 5 || guc_choice == 9
    || guc_choice == 13){ rel_lock = 0; RELAY_STR = 0;}
  else {RELAY_STR = 1;}
 #endif
  
  if(guc_choice == 2)
   {
//     if( rel_lock == 0)
     {
       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;rel_lock = 1;
       while(COND2)asm CLRWDT ;
       guc_buzz_state=0;
     }
   }
  else if(guc_choice == 6)
   {
//     if( rel_lock == 0)
     {
       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;rel_lock = 1;
       while(COND6)asm CLRWDT ;
       guc_buzz_state=0;
     }
   }
  else { RELAY_SOL = 0;}


}

/*
void Check_Demo()
{
    uint8 udemo,ldemo;
    
    WDTCON = 0x16;
    if(PORTC.RC5==0)
     {
       DATAEE_WriteByte(DEMO_ADDR,0xFF);
       DATAEE_WriteByte(DEMO_ADDR+1,0xFF);
       while(1);
     }
    udemo=DATAEE_ReadByte(DEMO_ADDR);
    ldemo=DATAEE_ReadByte(DEMO_ADDR+1);
    Demo=(((udemo<<8)&0xFF00)|ldemo);

    if(Demo==0xFFFF)
    {
        Demo=0;
    }
    if(Demo>800) { while(1); }
    else 
    {
        Demo++;
        ldemo = (uint8)(Demo & 0x00FF);
        udemo = (uint8)(((Demo>>8)&0x00FF));
        
        DATAEE_WriteByte(DEMO_ADDR,udemo);
        DATAEE_WriteByte((DEMO_ADDR+1),ldemo);
    }   
}      */


void sys_init()
{
  uint8 i;
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
  
  PORTA = 0x00;
  LATA = 0x00;
  ANSELA=0x00;
  TRISA=0x20;
  
  PORTC = 0x00;
  ANSELC=0x00;
  LATC = 0x00;
  TRISC=0x0F;

  BUZZER = 0;
  RELAY_SOL = 0;
//  my_delay();
//  Check_Demo();
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
//  TMR1_Initialize();
  #if PWM_EN == 1
  TMR2_Initialize();
  PWM3_Initialize();
  #endif
  for(i=0;i<6;i++) guc_cycle[i]=0;
  GIE_bit = 1;     /* Enable INTs  */
  
  #if START_REL == 1
  RELAY_STR = 1;
#endif
}

void main()
{
  uint16 flag;
  sys_init();
  demo_time = 0;

  while(1)
   {
      check_cond();                 /*Check the condition*/
      if(guc_choice > 0)
        exe_cond();
      guc_choice=0;                 /*Clear the condition*/
      #if(DEMO == 1)
      if(demo_time > 360)
       {
         while(1);
       }
      #endif
      asm CLRWDT ;
   }
}