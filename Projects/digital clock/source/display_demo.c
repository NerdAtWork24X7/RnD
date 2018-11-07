#include "types.h"
#include "matrix_disp_driving.h"



#define START_1SEG 1
#define START_2SEG 9
#define START_3SEG 17
#define START_4SEG 25
#define START_5SEG 33
#define START_6SEG 41

extern uint8_t a,VIDEO_MEM_1[8][6];
const uint8_t hello_text[] = "hello";
uint8_t text[205]="HELLO";    //205
extern const  uint8_t font5x7[];

void display_run()
{
        uint8_t i;
        //function to plot points through videopamì ??
        clear_videoMem_1();
        print_disp_memory_1();
        for(a=1;a<9;a++)
        {
          for(i=1;i<49;i++)
            {
                set_bode_to_videoMem(i,a);
                print_disp_memory_1();
                delay_us(100);
            }
        }
       clear_videoMem_1();
}




void display_demo1()
{
      uint16_t i,j,k;
      sint8_t l;
    
    clear_videoMem_1();
    
    while(1)
    {

        for(i=1;i<9;i++)
       {
         set_char_5x7_on_XY(0,0,'1');
         set_char_5x7_on_XY(4,0,'2');
         set_char_5x7_on_XY(11,0,':');
         set_char_5x7_on_XY(15,0,'2');
         set_char_5x7_on_XY(21,0,'3');
         set_char_5x7_on_XY(28,0,':');
         set_char_5x7_on_XY(32,0,'3');
         set_char_5x7_on_XY(38,i,'4');
         set_char_5x7_on_XY(38,i-8,'5');
         print_disp_memory_1();
         delay_ms(50);
         clear_videoMem_1();
       }
       delay_ms(2000);

    }

     while(1)
     {
      for(l=-80;l<48;l++)
       { print_string(1,l,0,"SAHIL VARTAK");
         delay_ms(1);
       }
      }

}
  /*      display_run();
        RUNNING_TEXT(48,20,"X-pos change time: 50ms");
        delay_ms(1000);
    //    snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
        RUNNING_TEXT(48,50,text);

        display_run();
        RUNNING_TEXT(48,20,"X-pos change time: 20ms");
        delay_ms(1000);
    //    snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
        RUNNING_TEXT(48,20,text);

        display_run();
        RUNNING_TEXT(48,20,"X-pos change time: 10ms");
        delay_ms(1000);
  //      snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
        RUNNING_TEXT(48,10,text);

        display_run();
        RUNNING_TEXT(48,20,"X-pos change time: 5ms");
        delay_ms(1000);
     //   snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
        RUNNING_TEXT(48,5,text);

        display_run();
        RUNNING_TEXT(48,20,"X-pos change time: 1ms");
        delay_ms(1000);
      //  snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
        RUNNING_TEXT(48,1,text);      */





       /*
                for(i=0; i<6;i++)
                {
                        shift_out_data_to_unit(i,0x0f,0x01);
                        delay_ms(10);
                        shift_out_data_to_unit(i,0x0f,0x00);
                        delay_ms(10);
                }




               for(k=0;k<7;k++)
                {
                 for(i=0; i<7;i++)   //no of units
                  {
                    for(j=0;j<7;j++)
                     {
                       shift_out_data_to_unit(1,0x01+j,font5x7[(('0' - 0x20) * 8) + j]>>1);  //(no of unit,address,data)
                       shift_out_data_to_unit(2,0x01+j,font5x7[(('1' - 0x20) * 8) + j]>>1);  //(no of unit,address,data)
                     }
                  }
                  delay_ms(100);
                }
}                              */
                  /*
                        shift_out_data_to_unit(i,0x01,0x70>>1);
                        shift_out_data_to_unit(i,0x02,0x88>>1);
                        shift_out_data_to_unit(i,0x03,0x88>>1);
                        shift_out_data_to_unit(i,0x04,0x88>>1);
                        shift_out_data_to_unit(i,0x05,0xf8>>1);
                        shift_out_data_to_unit(i,0x06,0x88>>1);
                        shift_out_data_to_unit(i,0x07,0x88>>1);
                        shift_out_data_to_unit(i,0x08,0x00>>1);
                        0x70,0x88,0x08,0x68,0xA8,0xA8,0x70,6
                        delay_ms(50);
                }

delay_ms(500);
}

  /*              for(i=0; i<6;i++)
                {
                        shift_out_data_to_unit(i,0x0f,0x01);
                        delay_ms(10);
                        shift_out_data_to_unit(i,0x0f,0x00);
                        delay_ms(10);
                }

                for(i=0; i<6;i++)
                {


                        shift_out_data_to_unit(i,0x01,0x80);
                        shift_out_data_to_unit(i,0x02,0x80);
                        shift_out_data_to_unit(i,0x03,0xB0);
                        shift_out_data_to_unit(i,0x04,0xC8);
                        shift_out_data_to_unit(i,0x05,0x88);
                        shift_out_data_to_unit(i,0x06,0x88);
                        shift_out_data_to_unit(i,0x07,0xF0);
                        shift_out_data_to_unit(i,0x08,0x00);

                        delay_ms(50);
                }

delay_ms(500);


                for(i=0; i<6;i++)
                {
                        shift_out_data_to_unit(i,0x0f,0x01);
                        delay_ms(10);
                        shift_out_data_to_unit(i,0x0f,0x00);
                        delay_ms(10);
                }

                for(i=0; i<6;i++)
                {


                        shift_out_data_to_unit(i,0x01,0x00);
                        shift_out_data_to_unit(i,0x02,0x00);
                        shift_out_data_to_unit(i,0x03,0x70);
                        shift_out_data_to_unit(i,0x04,0x88);
                        shift_out_data_to_unit(i,0x05,0x80);
                        shift_out_data_to_unit(i,0x06,0x88);
                        shift_out_data_to_unit(i,0x07,0x70);
                        shift_out_data_to_unit(i,0x08,0x00);

                        delay_ms(50);
                }

                delay_ms(500);

//shift_out_data_to_unit(0,0x0f,1);
//delay_ms(500);
//shift_out_data_to_unit(0,0x0f,0);
//delay_ms(500);

//LOAD_OUT_HI
//LOAD_OUT_LO

                        //shift_out_data_to_unit(0,0x01,0x70);

                        //shift_out_byte(0xff);

}


/*
                PORTH.OUT |= (1<<0);//0b00000001;
                delay_ms(5);

                PORTH.OUT &= ~(1<<0);//0b00000000;
                delay_ms(5);

                        //if(!(PORTE.IN & PIN5_bm)) {         // if FLIP pressed
                counter++;                      // increment the counter
                LcdClear();                     // clear the display
                Lcd("counter:");                // display the text
                Lcd2;                           // przejœcie do drugiej linii
                LcdDec(counter);                // display the number
                //delay_ms(100);                 // wait 100ms
        */