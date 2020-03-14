#include "types.h"
#include "Flasher.h"
#include "tmr0.h"
#include "adc.h"

volatile sint8 s8_100ms = 0;
volatile sint8 s8_200ms = 0;
volatile uint8 u8_offset = 0;
volatile uint8 u8_FlashRate = 0;
volatile uint16 u16_warn_ind_adc[10] = {0};
volatile uint16 u16_power_adc[10] = {0};
volatile uint8 switch_choice = 0;
volatile uint16 u16_avg_warn_ind_adc = 0;
volatile uint16 u16_avg_power_adc = 0;
volatile uint8 u8_avg_warn_ind_voltage = 0;
volatile uint8 u8_avg_power_voltage = 0;
volatile sint8 s8_Load_diff_voltage = 0;

void TMR0_Initialize(void)
{
  OPTION_REG = (uint8)((OPTION_REG & 0xC0) | (0xD7 & 0x3F));
  TMR0 = TMR0_RELOAD_VALUE;  /* TMR0 248;*/
  TMR0IF_bit = 0;        /*Clear Interrupt flag before enabling the interrupt*/
  TMR0IE_bit = 1;        /* Enabling TMR0 interrupt */
}

void Check_ADC()
{
  uint8 i=0;

 if(WARN_IND == 0)
  {
     u16_warn_ind_adc[s8_100ms] =  ADC_GetConversion(ADC_CH_SHUNT);
     u16_power_adc[s8_100ms] =  ADC_GetConversion(ADC_CH_POWER);

    if(s8_100ms >= 9)
    {

      u16_avg_warn_ind_adc = 0;
      u16_avg_power_adc = 0;
      for(i=0;i<10;i++)
      {
        u16_avg_warn_ind_adc += u16_warn_ind_adc[i];
        u16_avg_power_adc += u16_power_adc[i];
      }
      u16_avg_warn_ind_adc/=10;
      u16_avg_power_adc/=10;
      u8_avg_warn_ind_voltage = (50 * u16_avg_warn_ind_adc)/1023;
      u8_avg_power_voltage = (50 * u16_avg_power_adc)/1023;
      s8_Load_diff_voltage = (sint8)u8_avg_power_voltage - (sint8)u8_avg_warn_ind_voltage;

      if(s8_Load_diff_voltage > -4 && s8_Load_diff_voltage <= 2) switch_choice=1;
      else if(s8_Load_diff_voltage > 2 && s8_Load_diff_voltage <=7) switch_choice=2; /* 21W Load */
      else if(s8_Load_diff_voltage > 7 && s8_Load_diff_voltage <=12) switch_choice=3; /* 42W Load */
      else if(s8_Load_diff_voltage > 12) switch_choice=4; /* 84W,105W,126W,147W,168W Load */
      else  switch_choice=5;
      s8_100ms = -1;
    }
    s8_100ms++;
  }
}

void Execute_Flash()
{
  switch(switch_choice)
  {
    case 1: (WARN_IND == 0)?(WARN_IND = 1):(WARN_IND = 0);
            TRAIL_1 = 0; TRAIL_2 = 0;break;

    case 2: if(u8_FlashRate > 1)
            {
              (WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
               TRAIL_1 = 0; TRAIL_2 = 0;
               u8_FlashRate = 0 ;
            }
            u8_FlashRate++;
            break;
    case 3: if(u8_FlashRate > 1)
            {
              (WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
               (TRAIL_1 == 0)? (TRAIL_1 = 1):(TRAIL_1 = 0);
                TRAIL_2 = 0;
               u8_FlashRate = 0 ;
            }
            u8_FlashRate++;
            break;

    case 4: if(u8_FlashRate > 1)
            {
              (WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
              (TRAIL_1 == 0)? (TRAIL_1 = 1):(TRAIL_1 = 0);
              (TRAIL_2 == 0)? (TRAIL_2 = 1):(TRAIL_2 = 0);
              u8_FlashRate = 0;
            }
            u8_FlashRate++;
            break;
    default: WARN_IND = 0; TRAIL_1 = 0; TRAIL_2 = 0;break;
    
  }
}

void TMR0_ISR(void)
{
  TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/

  Check_ADC();
  if(s8_200ms >= 19)
  {
    Execute_Flash();
    Soft_UART_Write((uint8)(switch_choice));
    Soft_UART_Write(0xFF);
    s8_200ms = -1;
  }
  s8_200ms++;
  TMR0IF_bit = 0;           /*Clear the TMR0 interrupt flag8*/
  
}