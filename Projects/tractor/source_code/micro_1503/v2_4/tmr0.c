#include "APP_OPSM.h"


volatile uint8 timer0ReloadVal,guc_togg_half=1;
volatile uint16 one_sec,guc_min=0;


void TMR0_Initialize(void)
{   
    /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
    OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    TMR0 = 0xF8;              /* TMR0 248;*/
    timer0ReloadVal= 0xF8;     /* Load the TMR value to reload variable */
    TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
    TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
}

void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
}

void TMR0_ISR(void)
{
    #if DEBUG == 1
    void *data_ptr;
    #endif
    TMR0_Reload();
    TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
    if(one_sec>1048)           /*Timer for 1 sec*/
     {
       one_sec=0;
       guc_sec++;
       #if DEBUG == 1
       Process_Uart();
       if(diag_choice != prev_diag_choice)
       {
        data_ptr = &Diag_data_var;
        Soft_UART_Write(*((uint8*)data_ptr));
        Soft_UART_Write(diag_choice);
        prev_diag_choice = diag_choice;
       }
       #endif
       
       #if(DEMO == 1)
         guc_min++;
         if(guc_min>60)
          {
            guc_min=0;
            demo_time++;
          }
       #endif

        if(guc_buzz_state==1)
         {
           guc_togg_half ^= 1;
           TMR0_CallBack_Half_Sec();
         }
         else
          {
            #if(PWM_EN == 1)
            GIE_bit = 0;              /* Disable INTs  */
            while(BUZZER == 1);
            PWM3CON = PWM_OFF;        /*Diable PWM */
            while(BUZZER == 1)
              BUZZER = 0;
            GIE_bit = 1;              /* Enable INTs  */
            #else
             BUZZER = 0;
            #endif
          }
     }
    one_sec++;
}

void TMR0_CallBack_Half_Sec(void)
{

    if(guc_togg_half==1)
    {   
      #if(PWM_EN == 1)
      PWM3CON = PWM_ON;  /*Enable PWM */
      #else
      BUZZER=1;
      #endif
    }

    if(guc_togg_half==0)
     { 
        #if(PWM_EN == 1)
        GIE_bit = 0;               /* Disable INTs  */
        while(BUZZER == 1);
        PWM3CON = PWM_OFF;        /*Diable PWM */
        while(BUZZER == 1)
           BUZZER = 0;
        GIE_bit = 1;              /* Enable INTs  */
        #else
         BUZZER = 0;
        #endif
     }
}