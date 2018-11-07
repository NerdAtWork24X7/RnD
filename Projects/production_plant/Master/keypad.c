#include<reg51.h>
#include"types.h"
#include"lcd.h"
#include"rtc.h"

extern void reset(void);
extern void start_sys(void);

extern u8 td_flag=0;

sbit r0=P1^0; sbit c0=P1^4;
sbit r1=P1^1; sbit c1=P1^5;
sbit r2=P1^2; sbit c2=P1^6;
sbit r3=P1^3; sbit c3=P1^7;
extern u8 flag;
extern u8 td_flag;

code u8 keypad_bit[4][4]={{'1','2','3','A'},{'4','5','6','B'},{'7','8','9','C'},{'O','0','M','E'}};
bit colscan(void)
{
	return(c0&c1&c2&c3);
}

void init_rows(void)
{
	r0=r1=r2=r3=0;
}

void init_cols(void)
{
	c0=c1=c2=c3=1;
}

u8 keyscan()
{
	u8 row,col;
	init_cols();
	init_rows();
	while(colscan());

	r0=0;r1=r2=r3=1;
	if(!colscan())
	 {	row=0;	goto col_check; }

	r1=0;r0=r2=r3=1;
	if(!colscan())
	 {	row=1;	goto col_check; }

	r2=0;r0=r1=r3=1;
	if(!colscan())
	 {	row=2;	goto col_check; }

	r3=0;r0=r2=r1=1;
	if(!colscan())
	 {	row=3;	goto col_check; }

col_check:
	if(c0==0)  col=0;
	else if(c1==0) col=1;
	else if(c2==0) col=2;
	else if(c3==0) col=3;

	return keypad_bit[row][col];

}


u8* get_value()
{
	u8 i=0,key=0,no[6]={0};
	while(1)
	{
	  
	  key=keyscan();
	  if(key>='0' && key<='9' && i<td_flag)		  //Get the value
	 	{
		   no[i]=key;
		   lcd_cmd(0xC0);
		   lcd_str(no);
		   while(!colscan());
		   i++;
	 	}
		else if(key=='E')		  //Check wether Enter is pressed
		 {
		 	while(!colscan());
			if(no[0]!=0)	    //check weather value is enter or not
			 {
				no[++i]='\0';	     //for reversing the string
				flag=1;
		  		return no;
			 }
		 }
		else if(key=='M')		  //Check weather OFF is pressed
		{
		   while(!colscan()); 
		   edit_time();
		   start_sys();
		}
		else if(key=='O')
		 start_sys();
	  }
}

u8 get_disp()
{
	u8 key=0;
	do
	 {
	   key=keyscan();
	   if(key=='A' || key=='B' || key=='C')	  //Check the Display
	     {
		   lcd_cmd(0xC0);
		   lcd_char(key);
		   while(!colscan());
		 }
		else if(key=='M') 			//Check whether OFF is pressed
		 {
		   while(!colscan()); 
		   reset ();
		 }
		 else if(key=='O')
		 	start_sys();
	  }while(keyscan()!='E');
	    while(!colscan());
		return key;  
} 
	
/*u8* get_time()
{
	u8 i=0,key=0,no[2]={0};
	while(1)
	{
	  key=keyscan();
	  if(key>='0' && key<='9' && i<2)		  //Get the value
	 	{
		   no[i]=key;
		   lcd_cmd(0xC0);
		   lcd_str(no);
		   while(!colscan());
		   i++;
	 	}
		else if(key=='E')		  //Check wether Enter is pressed
		 {
		 	while(!colscan());
			no[++i]='\0';	     //for reversing the string
			flag=1;
		    return no;
		 }
		else if(key=='M')		  //Check weather OFF is pressed
		{
		   while(!colscan());
		   edit_time();
		   start_sys(); 
		  
		}
		else if(key=='O')
		 start_sys();
	  }
}  */





