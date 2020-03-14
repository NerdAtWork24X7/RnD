#include "APP.h"


char AT[]="AT";   // To initialize mode
char noecho[]="ATE0";   // To stop echo
char mode_text[]="AT+CMGF=1";   // to set text mode
char char_mode[]="AT+CSCS=\"GSM\"";   // to set character mode
char param[]="AT+CSMP=17,167,0,0";   // set the parameter of character
char mobile_no[]="AT+CMGS=\"+92090078601\"";   //use to set receinpent number and mesg
char terminator=0x1A;     // chartacter form of control + z terminator character
char mesg[]="welcome to microcontrollerslab.com";   // mesg we want to send

// Reception
char RcvdMsg[60] = "";
char IncData;
int x =  0;
int RcvdCheck = 0;
int RcvdConf = 0;
int index = 0;
int RcvdEnd = 0;
char MsgMob[15];
char MsgTxt[10];
int MsgLength = 0;



void send_to_modem(char *s)   //function to write anything serially
{
  while(*s)
  Soft_UART_Write(*s++);
  Soft_UART_Write(0X0D);
}

void send_to_modem1(char *s)
{
  while(*s)
  Soft_UART_Write(*s++);
}

void send_sms()
{
  send_to_modem(mobile_no);
  delay_ms(2000);
  send_to_modem1(mesg);
  delay_ms(100);
  Soft_UART_Write(terminator);
  delay_ms(1000);
}



/* Receive message */


void init_gsm()
{
  send_to_modem(AT);
  delay_ms(2000);
  send_to_modem(noecho);
  delay_ms(2000);
  send_to_modem(mode_text);
  delay_ms(2000);
}

void RecSMS() // Receiving the SMS and extracting the Sender Mobile number &amp; Message Text
{

   // Delay_ms(2000);
   // Soft_UART_Write("ATE0rn");
   // Delay_ms(1000);
   // Soft_UART_Write("ATrn");
   // Delay_ms(1000);
   // Soft_UART_Write("AT+CMGF=1rn");
   // Delay_ms(1000);
    
    Soft_UART_Write("AT+CNMI=1,2,0,0,0rn");
    Delay_ms(1000);
    
    IncData = Soft_UART_Read();
    //UART1_Write_Text(IncData);
    if(IncData == '+'){RcvdCheck = 1;}
    if((IncData == 'C') && (RcvdCheck == 1)){RcvdCheck = 2;}
    if((IncData == 'M') && (RcvdCheck == 2)){RcvdCheck = 3;}
    if((IncData == 'T') && (RcvdCheck == 3)){RcvdCheck = 4;}
    if(RcvdCheck == 4){index = 0;RcvdConf = 1; RcvdCheck = 0;}

    if(RcvdConf == 1)
    {
        if(IncData == 'n'){RcvdEnd++;}
        if(RcvdEnd == 3){RcvdEnd = 0;}
        RcvdMsg[index] = IncData;

        index++;
        if(RcvdEnd == 2){RcvdConf = 0;MsgLength = index-2;index = 0;}
        if(RcvdConf == 0)
        {
            //PortD.F3 = 1;
            //UART1_Write_Text("Mobile Number is: ");
            for(x = 4;x < 17;x++)
            {
                MsgMob[x-4] = RcvdMsg[x];
                //UART1_Write(MsgMob[x-4]);
            }

           // UART1_Write_Text("Message Text: ");
            for(x = 46;x < MsgLength;x++)
            {
                MsgTxt[x-46] = RcvdMsg[x];
                //UART1_Write(MsgTxt[x-46]);
            }
            if(MsgTxt[0] == 'A'){ PortD.F0 = 1;}//L1ON();}
            if(MsgTxt[0] == 'B'){ PortD.F0 = 0;}//L1OF();}
            if(MsgTxt[0] == 'C'){ PortD.F1 = 1;}//L2ON();}
            if(MsgTxt[0] == 'D'){ PortD.F1 = 0;}//L2OF();}
            if(MsgTxt[0] == 'E'){ PortD.F2 = 1;}//L3ON();}
            if(MsgTxt[0] == 'F'){ PortD.F2 = 0;}//L3OF();}
            if(MsgTxt[0] == 'G'){ PortD.F3 = 1;}//L4ON();}
            if(MsgTxt[0] == 'H'){ PortD.F3 = 0;}//L4OF();}
            ClearBuffers();
        }
    }
}


void ClearBuffers()
{
    strcpy(RcvdMsg,"");
    RcvdCheck = 0;
    RcvdConf = 0;
    index = 0;
    RcvdEnd = 0;
    strcpy(MsgMob,"");
    strcpy(MsgTxt,"");
    MsgLength = 0;
}