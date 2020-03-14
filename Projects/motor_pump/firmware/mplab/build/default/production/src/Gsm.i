# 1 "src/Gsm.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "E:\\Program Files (x86)\\Microchip\\xc8\\v2.10\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "src/Gsm.c" 2
# 1 "src/APP.h" 1
# 17 "src/APP.h"
extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
extern void Uart_Send(void);
# 1 "src/Gsm.c" 2



char AT[]="AT";
char noecho[]="ATE0";
char mode_text[]="AT+CMGF=1";
char char_mode[]="AT+CSCS=\"GSM\"";
char param[]="AT+CSMP=17,167,0,0";
char mobile_no[]="AT+CMGS=\"+92090078601\"";
char terminator=0x1A;
char mesg[]="welcome to microcontrollerslab.com";


char RcvdMsg[60] = "";
char IncData;
int x = 0;
int RcvdCheck = 0;
int RcvdConf = 0;
int index = 0;
int RcvdEnd = 0;
char MsgMob[15];
char MsgTxt[10];
int MsgLength = 0;



void send_to_modem(char *s)
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






void init_gsm()
{
  send_to_modem(AT);
  delay_ms(2000);
  send_to_modem(noecho);
  delay_ms(2000);
  send_to_modem(mode_text);
  delay_ms(2000);
}

void RecSMS()
{
# 76 "src/Gsm.c"
    Soft_UART_Write("AT+CNMI=1,2,0,0,0rn");
    Delay_ms(1000);

    IncData = Soft_UART_Read();

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


            for(x = 4;x < 17;x++)
            {
                MsgMob[x-4] = RcvdMsg[x];

            }


            for(x = 46;x < MsgLength;x++)
            {
                MsgTxt[x-46] = RcvdMsg[x];

            }
            if(MsgTxt[0] == 'A'){ PortD.F0 = 1;}
            if(MsgTxt[0] == 'B'){ PortD.F0 = 0;}
            if(MsgTxt[0] == 'C'){ PortD.F1 = 1;}
            if(MsgTxt[0] == 'D'){ PortD.F1 = 0;}
            if(MsgTxt[0] == 'E'){ PortD.F2 = 1;}
            if(MsgTxt[0] == 'F'){ PortD.F2 = 0;}
            if(MsgTxt[0] == 'G'){ PortD.F3 = 1;}
            if(MsgTxt[0] == 'H'){ PortD.F3 = 0;}
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
