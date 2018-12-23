#include "APP_OPSM.h"

volatile uint8 guc_choice=0;
//volatile uint16 guc_cycle[13];
volatile uint16 guc_deb[TOTAL_COND]={0};
volatile uint16 guc_sec=0;
volatile uint8 guc_buzz_state=0;
volatile uint16 demo_time=0;
volatile uint8 UART_counter=0;
volatile uint8 diag_choice=0;
volatile Diag_data_t Diag_data_var = {0};


void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
        #if DEBUG == 1
        if(UART_counter >= 20)
        {
          Soft_UART_Break();
          UART_counter = 0;
        }
        UART_counter++;
        #endif
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
    else if(COND2){ CHCK_COND(2); }
    else if(COND3){ CHCK_COND(3); }
    else if(COND4){ CHCK_COND(4); }
    else if(COND5){ CHCK_COND(5); }
    else if(COND6){ CHCK_COND(6); }
    else if(COND7){ CHCK_COND(7); }
    else if(COND8){ CHCK_COND(8); }
    else if(COND9){ CHCK_COND(9); }
    else if(COND10){ CHCK_COND(10); }
    else if(COND11){ CHCK_COND(11); }
    else if(COND12){ CHCK_COND(12); }
    else {guc_choice = 14;}
}

void reset_all()
{
    guc_buzz_state=0;
    P_IND = 0;
    RELAY_SOL = 0;
    BUZZER = 0;
}

void wait_cond()
{
    if(guc_choice == 1){ while(COND1); }
    else if(guc_choice == 2){ while(COND2); }
    else if(guc_choice == 3){ while(COND3); }
    else if(guc_choice == 4){ while(COND4); }
    else if(guc_choice == 5){ while(COND5); }
    else if(guc_choice == 6){ while(COND6); }
    else if(guc_choice == 7){ while(COND7); }
    else if(guc_choice == 8){ while(COND8); }
    else if(guc_choice == 9){ while(COND9); }
    else if(guc_choice == 10){ while(COND10); }
    else if(guc_choice == 11){ while(COND11); }
    else if(guc_choice == 12){ while(COND12); }
    reset_all();

}



void exe_cond()
{
  if(guc_choice == 1 || guc_choice == 6 || guc_choice == 9
    || guc_choice == 10){guc_buzz_state=1;}
  else { guc_buzz_state=0;}

  if(guc_choice == 8 || guc_choice == 11 || guc_choice == 12)
    {P_IND = 1;}
  else { P_IND = 0;}

 #if START_REL == 1
  if(guc_choice == 1 || guc_choice == 5 || guc_choice == 9
    || guc_choice == 13){RELAY_STR = 0;}
  else {RELAY_STR = 1;}
 #endif
  
  if(guc_choice == 10)
   {
       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;
   }
  else if(guc_choice == 12)
   {
       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;
   }
  else { RELAY_SOL = 0;}

  wait_cond();
}


void sys_init()
{
  //uint8 i;
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
  
  PORTA = 0x00;
  LATA = 0x00;
  ANSELA = 0x00;
  TRISA = 0x20;
  
  PORTC = 0x00;
  ANSELC = 0x00;
  LATC = 0x00;
  TRISC = 0x07;

  BUZZER = 0;
  RELAY_SOL = 0;
  
//  Check_Demo();
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
  #if PWM_EN == 1
  TMR2_Initialize();
  PWM3_Initialize();
  #endif
 // for(i=0;i<6;i++) guc_cycle[i]=0;

  #if DEBUG == 1
  Soft_UART_Init(&PORTA, 1, 0, 9600, 0);
  #endif

  GIE_bit = 1;     /* Enable INTs  */
  
  #if START_REL == 1
  RELAY_STR = 1;
  #endif
}

#if DEBUG == 1
void process_uart()
{
  Diag_data_var.diag_data = 0;
  if(ENGINE_SENSE) Diag_data_var.Diag_data_bit.diag_engine_sense = 1;
  if(HAND_BRAKE)  Diag_data_var.Diag_data_bit.diag_hand_brake = 1;
  if(PTO)         Diag_data_var.Diag_data_bit.diag_pto = 1;
  if(SEAT_SWITCH) Diag_data_var.Diag_data_bit.diag_seat_switch = 1;
  if(P_IND)       Diag_data_var.Diag_data_bit.diag_p_ind = 1;
  if(RELAY_SOL)   Diag_data_var.Diag_data_bit.diag_Relay_Sol = 1;
  if(BUZZER)      Diag_data_var.Diag_data_bit.diag_buzzer = 1;
  if(RELAY_STR)   Diag_data_var.Diag_data_bit.diag_relay_str = 1;
}
#endif

void main()
{
  sys_init();
  demo_time = 0;

  while(1)
   {
      check_cond();                 /*Check the condition*/
      if(guc_choice > 0)
      {
        diag_choice = guc_choice;
        exe_cond();
      }
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