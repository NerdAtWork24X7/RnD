#include<reg51.h>
#include"keypad.h"
#include"lcd.h"
#include"delay.h"
#include"types.h"
#include"uart.h"
#include"EEPROM.h"
#include<string.h>

void start_sys(void);
u8 flag=0;
extern u8 td_flag;
void reset (void)
{
	lcd_cmd(0x01);	  	//Clear LCD
	lcd_cmd(0x08);	 	//Switch OFF LCD
	uart_tx('F');		//will send OFF signal to Slave
	((void (code *) (void)) 0x0000) ();	   //software reset

}

void rev_val(u8 *value)
{
	u8 temp,i,j;
	for(i=0,j=strlen(value)-1;j>i;i++,j--)
	 {
	 	temp=value[i];
		value[i]=value[j];
		value[j]=temp;
	 }
}

void start_sys()
{

	u8 disp,value[6]={0};
	td_flag=5;
 	while(1)
	{
		lcd_cmd(0x01);
		lcd_cmd(0x80);
		lcd_str("Enter the value");
		strcpy(value,get_value());
		rev_val(value);	
	   
		lcd_cmd(0x01);
		lcd_cmd(0x80);
		lcd_str("Enter display");
		disp=get_disp();
		uart_tx_s(value);   delay_1ms(3);
		uart_tx(disp);
		 
		if(flag==1)
	  	 {
	  		flag=0;
	    	write_EEPROM(value,disp);
	  	 }
	}
}
		
void system_init()
{
	  lcd_init();		   //initialiaze LCD
	  init_uart();		   //Initialize uart
	  uart_tx('S');
	  lcd_str("SV-CORP");
	  delay_1ms(3000);
	  lcd_cmd(0x01);
	  lcd_str("Intializing");
	  delay_1ms(2000);
	  read_EEPROM('A'); read_EEPROM('B'); read_EEPROM('C');
	  while(!colscan());
}		


void main()
{
	while(1)
	{
		if(keyscan()=='O')	 	//Check wether ON is pressed
		{
	  	  system_init();
	      start_sys();	   	    
    	}
	}
}
