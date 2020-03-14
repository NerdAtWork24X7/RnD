#include <xc.h>
#include "APP.h"

extern volatile uint8_t one_min;
volatile uint8_t ML_Status = 0,u_ip_r = 0,u_ip_g = 0,u_ip_b = 0;


void reset_all()
{
    OP_R = 0;
    OP_G = 0;
    OP_B = 0;
}

void Input_SW()
{
    if(IP_R) 
    {
      u_ip_r++;
      if(u_ip_r > DEBO_TIME)
      {
         ML_Status |= 0x01;
         u_ip_r = DEBO_TIME;
      }
      
    }
    else 
    {
      u_ip_r = 0;
      ML_Status &= 0xFE;
    }
    
    
    if(IP_G)
    {
      u_ip_g++;
      if(u_ip_g > DEBO_TIME)
      {
         ML_Status |= 0x02;
         u_ip_g = DEBO_TIME;
      }

    }
    else
    {
      u_ip_g = 0;
      ML_Status &= 0xFD;
    }
    
    
    if(IP_B)
    {
      u_ip_b++;
      if(u_ip_b > DEBO_TIME)
      {
         ML_Status |= 0x04;
         u_ip_b = DEBO_TIME;
      }

    }
    else
    {
      u_ip_b = 0;
      ML_Status &= 0xFB;
    }

    
}
