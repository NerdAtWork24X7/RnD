#include<reg51.h>
#include"uart.h"
#include"7seg.h"
#include"types.h"
#include<string.h>
#include<stdio.h>

void main()
{					   
	 u8 res[6]={'0','0','0','0','0','0'},no[6]={'0','0','0','0','0','0'};	 
	 u8 i=0,dat;
	 init_uart();
	 while(1)
	  {
	      while(RI)
		   {
		     dat=uart_rx();
			 if(dat>='0' && dat<='9')
			  {   
			  	 no[i]=dat;
				 i++;
			  }
			 else
			  {
			  	i=0;
			   switch(dat)
			    {
			      case 'A': memset(res,'0',5);strcpy(res,no); break; 
				  case 'F': memset(res,'0',5);break;
				  case 'S': init_seg(); break;
				}
				 memset(no,'0',5);
			  }
			}
		     disp_seven_seg((res[4]-48),(res[3]-48),(res[2]-48),(res[1]-48),(res[0]-48));
	  }
}
		    
		  
			 