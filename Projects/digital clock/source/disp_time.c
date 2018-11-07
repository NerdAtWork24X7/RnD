#include "types.h"
#include "matrix_disp_driving.h"
#include "I2C.h"

#define START_1SEG 1
#define START_2SEG 9
#define START_3SEG 17
#define START_4SEG 25
#define START_5SEG 33
#define START_6SEG 41

extern uint8_t VIDEO_MEM_1[8][6];
extern const  uint8_t font5x7[];
extern uint8_t sec,p_sec,mins,p_mins,hrs,p_hrs,day,date,p_date,month,p_month,year,p_year,bufferLong[8];

volatile sint8_t len;
/*******************initialize LED Display*************************************/
void init_LED_display()
{
        //set decoding
        shift_out_data_to_unit(0,0x09,0x00);        //no decode digits
        shift_out_data_to_unit(1,0x09,0x00);        //no decode digits
        shift_out_data_to_unit(2,0x09,0x00);        //no decode digits
        shift_out_data_to_unit(3,0x09,0x00);        //no decode digits
        shift_out_data_to_unit(4,0x09,0x00);        //no decode digits
        shift_out_data_to_unit(5,0x09,0x00);        //no decode digits

        //scan all digits
        shift_out_data_to_unit(0,0x0b,0x07);        //no decode digits
        shift_out_data_to_unit(1,0x0b,0x07);        //no decode digits
        shift_out_data_to_unit(2,0x0b,0x07);        //no decode digits
        shift_out_data_to_unit(3,0x0b,0x07);        //no decode digits
        shift_out_data_to_unit(4,0x0b,0x07);        //no decode digits
        shift_out_data_to_unit(5,0x0b,0x07);        //no decode digits

        //normal operation
        shift_out_data_to_unit(0,0x0C,0x01);
        shift_out_data_to_unit(1,0x0C,0x01);
        shift_out_data_to_unit(2,0x0C,0x01);
        shift_out_data_to_unit(3,0x0C,0x01);
        shift_out_data_to_unit(4,0x0C,0x01);
        shift_out_data_to_unit(5,0x0C,0x01);

        //set max intensity
        shift_out_data_to_unit(0,0x0a,0x0f);        //15
        shift_out_data_to_unit(1,0x0a,0x0f);        //15
        shift_out_data_to_unit(2,0x0a,0x0f);        //15
        shift_out_data_to_unit(3,0x0a,0x0f);        //15
        shift_out_data_to_unit(4,0x0a,0x0f);        //15
        shift_out_data_to_unit(5,0x0a,0x0f);        //15

        clear_videoMem_1();
        print_disp_memory_1();
        
        //disp TEST ON
        shift_out_data_to_unit(0,15,1);
        shift_out_data_to_unit(1,15,1);
        shift_out_data_to_unit(2,15,1);
        shift_out_data_to_unit(3,15,1);
        shift_out_data_to_unit(4,15,1);
        shift_out_data_to_unit(5,15,1);

        delay_ms(1000);
        shift_out_data_to_unit(0,15,0);
        shift_out_data_to_unit(1,15,0);
        shift_out_data_to_unit(2,15,0);
        shift_out_data_to_unit(3,15,0);
        shift_out_data_to_unit(4,15,0);
        shift_out_data_to_unit(5,15,0);
        delay_ms(1000);

}


/**********************Display_test******************************************/
void display_test()
{
        uint8_t i,j;
        clear_videoMem_1();
        print_disp_memory_1();
        for(i=1;i<9;i++)
        {
          for(j=1;j<49;j++)
            {
                set_bode_to_videoMem(j,i);
                print_disp_memory_1();
                delay_us(100);
            }
        }
       clear_videoMem_1();
}


/**************************Display Time****************************************/
void display_time()
{
      sint8_t row=0,col=0,temp=0;

      len=2;
      clear_videoMem_1();
      temp=(hrs>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);      len+=bufferLong[7];
      temp=(hrs&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7]+1;
                              set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;
      
      temp=(mins>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7];
      temp=(mins&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7]+1;
                               set_char_5x7_on_XY(len,0,':');      len+=bufferLong[7]+1;
      
      temp=(sec>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);      len+=bufferLong[7];
      temp=(sec&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);                            //set_char_5x7_on_XY(38,i-8,'5');
      
      print_disp_memory_1();

    }



void display_date()
{
    uint8_t date_buff[10];
    sint8_t i;
    

    date_buff[0]=(date>>4&0x0f)+48;
    date_buff[1]=(date&0x0f)+48;
    date_buff[2]=':';
    date_buff[3]=(month>>4&0x0f)+48;
    date_buff[4]=(month&0x0f)+48;
    date_buff[5]=':';
    date_buff[6]=(year>>4&0x0f)+48;
    date_buff[7]=(year&0x0f)+48;
    date_buff[8]='\0';
    
    clear_videoMem_1();
    
    for(i=48;i>-48;i--)
     {
        print_string(1,i,0,date_buff); if(i==5) {delay_ms(1000);}
        delay_ms(1);
     }

}

void Roll_time()
{
      sint8_t i,j,prev=0,next=0,len=0;
      p_hrs=hrs,p_mins=mins,p_sec=sec;
      check_time();
      for(i=0;i<9;i++)
       {
          len=2;
          clear_videoMem_1();

          next=(hrs>>4&0x0f)+48; prev=(p_hrs>>4&0x0f)+48;
          if(prev==next){set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next); }
          len+=bufferLong[7];

          next=(hrs&0x0f)+48; prev=(p_hrs&0x0f)+48;
          if(prev==next){ set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
          len+=bufferLong[7];

          set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;

          next=(mins>>4&0x0f)+48;  prev=(p_mins>>4&0x0f)+48;
          if(prev==next){set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
          len+=bufferLong[7];

          next=(mins&0x0f)+48; prev=(p_mins&0x0f)+48;
          if(prev==next){ set_char_5x7_on_XY(len,0,next);}
          else { set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
          len+=bufferLong[7];
          
          set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;

          next=(sec>>4&0x0f)+48; prev=(p_sec>>4&0x0f)+48;
          if(prev==next){set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
           len+=bufferLong[7];

          next=(sec&0x0f)+48; prev=(p_sec&0x0f)+48;
          if(prev==next){ set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
          len+=bufferLong[7];

          print_disp_memory_1();

       }


}

void demo_disp()
{
  volatile sint8_t i,j,prev=0,next=0;
      
      for(j=1;j<99;j++)
      {
        for(i=0;i<9;i++)
         {
           len=2;
           clear_videoMem_1();

     //     next=(j/10)+48; prev=((j-1)/10)+48;
     //     if(prev==next){set_char_5x7_on_XY(len,0,next);}
     //     else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next); }
     //     len+=bufferLong[7];

          next=(j%10)+48; prev=((j-1)%10)+48;
          if(prev==next){ set_char_5x7_on_XY(len,0,next);}
          else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
          len+=bufferLong[7];
          print_disp_memory_1();

       }
       delay_ms(1000);
    }
}