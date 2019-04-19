#include "APP_OPSM.h"

volatile uint8 guc_choice=0;
volatile uint16 guc_deb[TOTAL_COND]={0};
volatile uint16 guc_sec=0;
volatile uint8 guc_buzz_state=0;
volatile uint8 buz_fl = 0;

void interrupt()
{
   asm CLRWDT ;
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }

}

void CHCK_COND(uint8 x)
{
   uint8 i;
   guc_deb[x]++;
   for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
   if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
}


void check_cond()
{
    guc_choice = 0;
    if(COND1){ CHCK_COND(1); }
   // else if(COND2){ CHCK_COND(2); }
   // else if(COND3){ CHCK_COND(3); }
   // else if(COND4){ CHCK_COND(4); }
    else if(COND5){ CHCK_COND(5); }
    else if(COND6){ CHCK_COND(6); }
   // else if(COND7){ CHCK_COND(7); }
   // else if(COND8){ CHCK_COND(8); }
    else if(COND9){ CHCK_COND(9); }
   // else if(COND10){ CHCK_COND(10); }
   // else if(COND11){ CHCK_COND(11); }
   // else if(COND12){ CHCK_COND(12); }
    else if(COND13){ CHCK_COND(13); }
    else if(COND14){ CHCK_COND(14); }
   // else if(COND15){ CHCK_COND(15); }
   // else if(COND16){ CHCK_COND(16); }
    else {guc_choice = (TOTAL_COND);}
}

void reset_all()
{
   guc_togg_half = 0;
   guc_buzz_state = 0;
   RELAY_SOL = 0;
   BUZZER = 0;

#if P_IND_EN == 1
   P_IND = 0;
#endif

#if START_REL == 1
   RELAY_STR = 1;
#endif
}

void Chk_HB()
{
  volatile uint8 deb_cnt = 0,deb_buz = 0;
  while(deb_cnt < 200)
  {
     (HAND_BRAKE == 0)?(guc_buzz_state = 1):(guc_buzz_state = 0);
  
  /* (HAND_BRAKE == 0)?(deb_buz++):(deb_buz = 0);
    if(deb_buz > 126)
    {
      if((guc_buzz_state == 0) & (buz_fl)){guc_sec = 0; while(guc_sec<6);}
      guc_buzz_state = 1;deb_buz = 127; buz_fl = 1;
    }
    else{guc_buzz_state = 0;}
    */
    (COND16 == 0)? (deb_cnt++) : (deb_cnt=0);
  }
}

void exe_cond()
{
  buz_fl = 1;
  Soft_UART_Write((guc_choice+48));
  switch(guc_choice)
  {
    case 1: guc_sec = 0; while(guc_sec<6 & COND1);
            guc_buzz_state=1; while(COND1);
            break;

    case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<6 & COND5);
            if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
            {
              Chk_HB();
            }
            break;

    case 6: if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
            {
              RELAY_SOL = 1;
              Chk_HB();
            }
            break;

    case 9: guc_sec = 0; while(guc_sec < 6 & COND9);
            guc_buzz_state = 1; while(COND9);
            break;

    case 13: guc_sec = 0;while(guc_sec < 6  & COND13);
             if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
             {
               guc_sec = 0; guc_buzz_state = 1 ; buz_fl = 0;
               RELAY_SOL = 1; while(guc_sec < 6);
               Chk_HB();
             }
             break;

    case 14: guc_sec = 0;while(guc_sec < 6  & COND14);
             if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
             {
               guc_sec = 0;RELAY_SOL = 1;while(guc_sec < 6);
               Chk_HB();
             }
             break;

 /*
    case 13: guc_sec = 0; while(guc_sec < 5 & COND13);
            if(COND13)
            {
              guc_sec = 0;
              while(COND13){guc_buzz_state = 1; RELAY_SOL = 1;
              if(guc_sec > 5) { fl_br = 1;}}
              while(fl_br == 0 & guc_sec < 5) {RELAY_SOL = 1;}
            }
            break;

    case 14: guc_buzz_state = 0; guc_sec = 0; while(guc_sec<5 & COND14);
            if(COND14)
            {
              guc_sec = 0;
              while(COND14){RELAY_SOL = 1;
              if(guc_sec > 5) { fl_br = 1;}}
              while(fl_br == 0 & guc_sec < 5) {RELAY_SOL = 1;}
            }
            break;

    case 15: guc_buzz_state = 0; guc_sec = 0; while(guc_sec<5 & COND15);
            if(COND15)
            {
              guc_sec = 0;
              while(COND15){RELAY_SOL = 1;
              if(guc_sec > 5) { fl_br = 1;}}
              while(fl_br == 0 & guc_sec < 5) {RELAY_SOL = 1;}
            }
            break;

    case 16: guc_buzz_state=0; guc_sec=0; while(guc_sec<5 & COND16);
            if(COND16)
            {
              guc_sec = 0;
              while(COND16){RELAY_SOL = 1;
              if(guc_sec > 5) { fl_br = 1;}}
              while(fl_br == 0 & guc_sec < 5) {RELAY_SOL = 1;}
            }
            break;
    */
    default: break;
  }
  reset_all();
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
  Soft_UART_Write('R');
  while(1)
   {
      check_cond();                 /*Check the condition*/
      if((guc_choice > 0) & (guc_choice < TOTAL_COND))
      {
        exe_cond();
      }
      guc_choice=0;                 /*Clear the condition*/
   }
}