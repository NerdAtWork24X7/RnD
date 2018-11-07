#include "types.h"

#define LOAD_OUT_LO RC0_bit=0;
#define LOAD_OUT_HI  RC0_bit=1;
#define LED RB0_bit
#define START_1SEG 1
#define START_2SEG 9
#define START_3SEG 16
#define START_4SEG 24
#define START_5SEG 32
#define START_6SEG 40


/**********************setup number of chip attached to the board***************/
#define NUMBER_OF_LAST_MAX7219 5                       // number will be the last unit (unit Numbering are 0, 1, 2, ....)

/*********************** MAX7219 definition *****************************/
#define MAX7219_REGNOOP 0x00                                        // no operations
#define MAX7219_REGROW1 0x01                                        // write data to the first Line:
#define MAX7219_REGROW2 0x02                                        // write data to the second Line:
#define MAX7219_REGROW3 0x03                                        // write data to the third Line:
#define MAX7219_REGROW4 0x04                                        // write data to the forth Line:
#define MAX7219_REGROW5 0x05                                        // writing data to the Fifth Line:
#define MAX7219_REGROW6 0x06                                        // writing data to the Sixth Line:
#define MAX7219_REGROW7 0x07                                        // write data to the Seventh Line:
#define MAX7219_REGROW8 0x08                                        // write data to the eighth Line:
#define MAX7219_REGDECODE 0x09                                      // setting a method of decoding information for DIGITAL (0x00 - no decode, more pdf p. 7)
#define MAX7219_REGINTENSITY 0x0A                                   //Setting the display intensity
#define MAX7219_REGSCANLIMIT 0x0B                                   // Number operated Digitel (Digitel for eight, the election 0x07)
#define MAX7219_REGSHUTDOWN 0x0C                                    // Display Off (LSB setting data bits, 0 = shutdown mode, 1 = normal mode operas)
#define MAX7219_REGTEST 0x0F                                        // Starting the test function display (all points will be lit)
//**********************************************************************************************************************************************************

uint8_t VIDEO_MEM_1[8][6];                                  //Stores data to be displayed
uint8_t bufferLong[8];


const  code uint8_t font5x7[] = {         //Numeric Font Matrix (Arranged as 7x font data + 1x kerning data)
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,3,                //Space (Char 0x20)
    0x80,0x80,0x80,0x80,0x00,0x00,0x80,2,                //!
    0xA0,0xA0,0xA0,0x00,0x00,0x00,0x00,4,                //"
    0x50,0x50,0xF8,0x50,0xF8,0x50,0x50,6,                //#
    0x20,0x78,0xA0,0x70,0x28,0xF0,0x20,6,                //$
    0xC0,0xC8,0x10,0x20,0x40,0x98,0x18,6,                //%
    0x60,0x90,0xA0,0x40,0xA8,0x90,0x68,6,                //&
    0xC0,0x40,0x80,0x00,0x00,0x00,0x00,3,                //'
    0x20,0x40,0x80,0x80,0x80,0x40,0x20,4,                //(
    0x80,0x40,0x20,0x20,0x20,0x40,0x80,4,                //)
    0x00,0x20,0xA8,0x70,0xA8,0x20,0x00,6,                //*
    0x00,0x20,0x20,0xF8,0x20,0x20,0x00,6,                //+
    0x00,0x00,0x00,0x00,0xC0,0x40,0x80,3,                //,
    0x00,0x00,0x00,0xF8,0x00,0x00,0x00,6,                //-
    0x00,0x00,0x00,0x00,0x00,0xC0,0xC0,3,                //.
    0x00,0x08,0x10,0x20,0x40,0x80,0x00,6,                ///
    0x70,0x88,0x98,0xA8,0xC8,0x88,0x70,6,                //0
        0x40,0xC0,0x40,0x40,0x40,0x40,0xE0,4,                //1
        0x70,0x88,0x08,0x10,0x20,0x40,0xF8,6,                //2
        0xF8,0x10,0x20,0x10,0x08,0x88,0x70,6,                //3
        0x10,0x30,0x50,0x90,0xF8,0x10,0x10,6,                //4
        0xF8,0x80,0xF0,0x08,0x08,0x88,0x70,6,                //5
        0x30,0x40,0x80,0xF0,0x88,0x88,0x70,6,                //6
        0xF8,0x88,0x08,0x10,0x20,0x20,0x20,6,                //7
        0x70,0x88,0x88,0x70,0x88,0x88,0x70,6,                //8
        0x70,0x88,0x88,0x78,0x08,0x10,0x60,6,                //9
        0x00,0xC0,0xC0,0x00,0xC0,0xC0,0x00,3,                //:
        0x00,0xC0,0xC0,0x00,0xC0,0x40,0x80,3,                //;
        0x10,0x20,0x40,0x80,0x40,0x20,0x10,5,                //<
        0x00,0x00,0xF8,0x00,0xF8,0x00,0x00,6,                //=
        0x80,0x40,0x20,0x10,0x20,0x40,0x80,5,                //>
        0x70,0x88,0x08,0x10,0x20,0x00,0x20,6,                //?
        0x70,0x88,0x08,0x68,0xA8,0xA8,0x70,6,                //@
        0x70,0x88,0x88,0x88,0xF8,0x88,0x88,6,                //A
        0xF0,0x88,0x88,0xF0,0x88,0x88,0xF0,6,                //B
        0x70,0x88,0x80,0x80,0x80,0x88,0x70,6,                //C
        0xE0,0x90,0x88,0x88,0x88,0x90,0xE0,6,                //D
        0xF8,0x80,0x80,0xF0,0x80,0x80,0xF8,6,                //E
        0xF8,0x80,0x80,0xF0,0x80,0x80,0x80,6,                //F
        0x70,0x88,0x80,0xB8,0x88,0x88,0x70,6,                //G
        0x88,0x88,0x88,0xF8,0x88,0x88,0x88,6,                //H
        0xE0,0x40,0x40,0x40,0x40,0x40,0xE0,4,                //I
        0x38,0x10,0x10,0x10,0x10,0x90,0x60,6,                //J
        0x88,0x90,0xA0,0xC0,0xA0,0x90,0x88,6,                //K
        0x80,0x80,0x80,0x80,0x80,0x80,0xF8,6,                //L
        0x88,0xD8,0xA8,0xA8,0x88,0x88,0x88,6,                //M
        0x88,0x88,0xC8,0xA8,0x98,0x88,0x88,6,                //N
        0x70,0x88,0x88,0x88,0x88,0x88,0x70,6,                //O
        0xF0,0x88,0x88,0xF0,0x80,0x80,0x80,6,                //P
        0x70,0x88,0x88,0x88,0xA8,0x90,0x68,6,                //Q
        0xF0,0x88,0x88,0xF0,0xA0,0x90,0x88,6,                //R
        0x78,0x80,0x80,0x70,0x08,0x08,0xF0,6,                //S
        0xF8,0x20,0x20,0x20,0x20,0x20,0x20,6,                //T
        0x88,0x88,0x88,0x88,0x88,0x88,0x70,6,                //U
        0x88,0x88,0x88,0x88,0x88,0x50,0x20,6,                //V
        0x88,0x88,0x88,0xA8,0xA8,0xA8,0x50,6,                //W
        0x88,0x88,0x50,0x20,0x50,0x88,0x88,6,                //X
        0x88,0x88,0x88,0x50,0x20,0x20,0x20,6,                //Y
        0xF8,0x08,0x10,0x20,0x40,0x80,0xF8,6,                //Z
        0xE0,0x80,0x80,0x80,0x80,0x80,0xE0,4,                //[
        0x00,0x80,0x40,0x20,0x10,0x08,0x00,6,                // \ (Back slash)
        0xE0,0x20,0x20,0x20,0x20,0x20,0xE0,4,                //]
        0x20,0x50,0x88,0x00,0x00,0x00,0x00,6,                //^
        0x00,0x00,0x00,0x00,0x00,0x00,0xF8,6,                //_
        0x80,0x40,0x20,0x00,0x00,0x00,0x00,4,                //`
        0x00,0x00,0x70,0x08,0x78,0x88,0x78,6,                //a
        0x80,0x80,0xB0,0xC8,0x88,0x88,0xF0,6,                //b
        0x00,0x00,0x70,0x88,0x80,0x88,0x70,6,                //c
        0x08,0x08,0x68,0x98,0x88,0x88,0x78,6,                //d
        0x00,0x00,0x70,0x88,0xF8,0x80,0x70,6,                //e
        0x30,0x48,0x40,0xE0,0x40,0x40,0x40,6,                //f
        0x00,0x78,0x88,0x88,0x78,0x08,0x70,6,                //g
        0x80,0x80,0xB0,0xC8,0x88,0x88,0x88,6,                //h
        0x40,0x00,0xC0,0x40,0x40,0x40,0xE0,4,                //i
        0x10,0x00,0x30,0x10,0x10,0x90,0x60,5,                //j
        0x80,0x80,0x90,0xA0,0xC0,0xA0,0x90,5,                //k
        0xC0,0x40,0x40,0x40,0x40,0x40,0xE0,4,                //l
        0x00,0x00,0xD0,0xA8,0xA8,0x88,0x88,6,                //m
        0x00,0x00,0xB0,0xC8,0x88,0x88,0x88,6,                //n
        0x00,0x00,0x70,0x88,0x88,0x88,0x70,6,                //o
        0x00,0x00,0xF0,0x88,0xF0,0x80,0x80,6,                //p
        0x00,0x00,0x68,0x98,0x78,0x08,0x08,6,                //q
        0x00,0x00,0xB0,0xC8,0x80,0x80,0x80,6,                //r
        0x00,0x00,0x70,0x80,0x70,0x08,0xF0,6,                //s
        0x40,0x40,0xE0,0x40,0x40,0x48,0x30,6,                //t
        0x00,0x00,0x88,0x88,0x88,0x98,0x68,6,                //u
        0x00,0x00,0x88,0x88,0x88,0x50,0x20,6,                //v
        0x00,0x00,0x88,0xA8,0xA8,0xA8,0x50,6,                //w
        0x00,0x00,0x88,0x50,0x20,0x50,0x88,6,                //x
        0x00,0x00,0x88,0x88,0x78,0x08,0x70,6,                //y
        0x00,0x00,0xF8,0x10,0x20,0x40,0xF8,6,                //z
        0x20,0x40,0x40,0x80,0x40,0x40,0x20,4,                //{
        0x80,0x80,0x80,0x80,0x80,0x80,0x80,2,                //|
        0x80,0x40,0x40,0x20,0x40,0x40,0x80,4,                //}
        0x00,0x00,0x00,0x68,0x90,0x00,0x00,6,                //~
        0x60,0x90,0x90,0x60,0x00,0x00,0x00,5                //°

};


/*************Send data to Max7219*************************************/
void shift_out_byte(uint8_t byte_to_send)
{
   SPI1_Write(byte_to_Send);
   //delay_ms(10);
}

void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA)
{
        uint8_t i = 0;
        LOAD_OUT_LO                                      // initialization, setting bit perform write zero
        if(num_of_unit < NUMBER_OF_LAST_MAX7219)        // The case for first-aid kit, when the communication unit is not the end of the agencies
        {
           for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
              {
                  shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
                  shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
              }
        }

        //sending data to the desired unit
        shift_out_byte(ADDR);                                // sending the address byte to the desired unit
        shift_out_byte(DATA);                                //sending a data byte to the desired unit
        //sending empty bytes per unit before addressed
        for (i=0;i<num_of_unit;i++)
        {
                shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
                shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicatedým
        }

        LOAD_OUT_HI
        LOAD_OUT_LO
}

/***********Clear the Video memmory************************************/
void clear_videoMem_1()
{
     uint8_t seg=0,row=0;
     for (row=0;row<8;row++)
       {
         for (seg=0;seg<6;seg++)
             VIDEO_MEM_1[row][seg]=0x00;
       }
}

/**********Retriving the character from 5x7font ***********************/
void loadBufferLong(uint8_t ascii)
{
        uint8_t dat=0,i=0;
        for(i=0;i<8;i++) { bufferLong[i]=0x00;}  //clearing buffer
        
        if (ascii>=0x20 && ascii<=0x7f)
        {
           for (i=0;i<8;i++)                               // Loop 7 times for a 5x7 font
             {
                dat = font5x7[((ascii-0x20)*8)+i];
                bufferLong[i] = dat;                         // Store in buffer

             }
        }
}
/**************************Setting by the bit order**************************/
uint8_t bit_read(uint8_t variable, uint8_t bit_num)
{
   if(variable & (1<<bit_num)) return 1;
   else  return 0;
}

/*****************seting up video memory buffer********************************/
void set_char_5x7_on_XY(sint8_t col_offset, sint8_t row_offset, uint8_t character)
{

        uint8_t font_lenght;        // Investigations Width font in pixels
        sint8_t pixel_to_start_draw = col_offset;
        sint8_t pixel_to_end_draw;
        uint8_t bit_to_read=0;

        sint8_t start_row = row_offset;
        sint8_t end_row = row_offset + 7;
        sint8_t act_row=0,row=0;                                        //Current Line: reading a character from memory within the plot
        sint8_t col_pos=0;
        
        loadBufferLong(character);
         font_lenght = bufferLong[7];
         pixel_to_end_draw = (col_offset-1) + font_lenght;
        //Fonts are in, dimension 5x7 points, seven points is a row. When plotting to videopamìti is y_offsetem Line: from which (In case outside the scope of rendering videopamìti negative coordinate)
        //pøíslušný portrays the character pøièemž øádkování counts from baseline to the coordinates and increments up to 7 (vertical dimension character sets).


   for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
        {
         if(row>=0&&row<9)
           {
           bit_to_read = 7;
           for(col_pos = col_offset; col_pos < 48; col_pos++)                //cyklus postupnì probìhne celý øádek pamìti
             {
               if (col_pos<(0)){ bit_to_read--; }
                if((col_pos>-1)&&(col_pos<8))                //kreslení do pamìového prostoru první matice
                  {
                     if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                        {
                           if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                              VIDEO_MEM_1[row][0] |= (1<<(7 - col_pos));
                           else
                              VIDEO_MEM_1[row][0] &= ~(1<<(7 - col_pos));
                           bit_to_read--;
                         }
                   }

                if((col_pos>7)&&(col_pos<16))                //kreslení do pamìového prostoru druhé matice
                  {
                    if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                        {
                           if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                VIDEO_MEM_1[row][1] |= (1<<(7 - (col_pos-8)));
                     //       else
                      //        VIDEO_MEM_1[row][1] &= ~(1<<(7 - col_pos-8));
                           bit_to_read--;
                        }
                  }
                  
                if((col_pos>15)&&(col_pos<24))                //kreslení do pamìového prostoru tøetí matice
                  {
                    if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                       {
                         if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                             VIDEO_MEM_1[row][2] |= (1<<(7 - (col_pos-16)));
                     //    else
                     //         VIDEO_MEM_1[row][2] &= ~(1<<(7 - col_pos-16));
                        bit_to_read--;
                       }
                  }

                  if((col_pos>23)&&(col_pos<32))                //kreslení do pamìového prostoru ètvrté matice
                    {
                       if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                         {
                          if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                             VIDEO_MEM_1[row][3] |= (1<<(7 - (col_pos-24)));
                    //      else
                     //         VIDEO_MEM_1[row][3] &= ~(1<<(7 - col_pos-24));
                         bit_to_read--;
                         }
                    }

                  if((col_pos>31)&&(col_pos<40))                //kreslení do pamìového prostoru páté matice
                    {
                       if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                          {
                            if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                               VIDEO_MEM_1[row][4] |= (1<<(7 - (col_pos-32)));
                     //       else
                     //         VIDEO_MEM_1[row][4] &= ~(1<<(7 - col_pos-32));
                            bit_to_read--;
                          }
                    }

                  if((col_pos>39)&&(col_pos<48))                //kreslení do pamìového prostoru páté matice
                    {
                       if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                          {
                            if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                VIDEO_MEM_1[row][5] |= (1<<(7 - (col_pos-40)));
                      //       else
                      //        VIDEO_MEM_1[row][5] &= ~(1<<(7 - col_pos-40));
                        bit_to_read--;
                           }
                    }
                }
               }
                act_row++;

        }

}
// rendering video 1 for matrix display
void print_disp_memory_1()                                //rendering video memory after OADC
{
        uint8_t a=0,i=0;
        LOAD_OUT_LO                                      //initialization, setting bit perform write zero
        for(a=0; a<8 ; a++)                                // pøepínání øádkù matic (øádek 0 - 7)
        {
                for(i=0;i<6;i++)                        // postupné odeslání dat øádkù pro všechny matice po SPI (i = 0: data øádku páté matice, odesílá se poøadím LSB first)
                {
                        if(a==0)
                        {
                                shift_out_byte(MAX7219_REGROW1);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==1)
                        {
                                shift_out_byte(MAX7219_REGROW2);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==2)
                        {
                                shift_out_byte(MAX7219_REGROW3);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==3)
                        {
                                shift_out_byte(MAX7219_REGROW4);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==4)
                        {
                                shift_out_byte(MAX7219_REGROW5);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==5)
                        {
                                shift_out_byte(MAX7219_REGROW6);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==6)
                        {
                                shift_out_byte(MAX7219_REGROW7);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                        if(a==7)
                        {
                                shift_out_byte(MAX7219_REGROW8);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
                        }
                }


                LOAD_OUT_HI                                                                        // inicializace, nastavení bitu provedení zápisu na log 1
                LOAD_OUT_LO                                                                        // inicializace, nastavení bitu provedení zápisu na nulu
          }
}

/***********Print String**********************************************/
void print_string(sint8_t clean_video_mem, sint8_t col_offset, sint8_t row_offset,uint8_t *string)
{
        sint8_t seg=0,act_char_position=0;           //the position of the currently processed character
        uint8_t font_lenght=0;                // variable into which retrieved length of the active character
        
        if(clean_video_mem==1){  clear_videoMem_1(); }
        act_char_position = col_offset;
        while(*string)                //in the cycle is maintained as reading the entire field, which should be displayed
           {

              loadBufferLong(*string);
              font_lenght = bufferLong[7];        // first detected in the bit length of the processed character string
              if((act_char_position+font_lenght)>(-1))   //if the last point of a character rendered from the current position extends into the display area is called rendering function character in videopamìti
                    set_char_5x7_on_XY(act_char_position,row_offset,*string);
              if (act_char_position > 47)  //if poeatek newly rendered character display area for matrix display, rendering will be interrupted
                    break;
              *string++;
              act_char_position = act_char_position + font_lenght;   //after the decision, product or to rendering step is increased further pointer to the next character position pøípadného

           }

        print_disp_memory_1();
}

void set_bode_to_videoMem(uint8_t x, uint8_t y)
{
        if(x<9)                //bod bude kreslen na první matici
        {
                VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
        }

        if((x>8) && (x<17))        // bod bude kreslen na druhé matici
        {
                VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
        }

        if((x>16) && (x<25))        // bod bude kreslen na tøetí matici
        {
                VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
        }

        if((x>24) && (x<33))        // bod bude kreslen na ètvrtou matici
        {
                VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
        }

        if((x>32) && (x<41))        // bod bude kreslen na ètvrtou matici
        {
                VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
        }
        if((x>40) && (x<49))        // bod bude kreslen na ètvrtou matici
        {
                VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
        }
}


uint16_t check_string_lenght(uint8_t *string)

/*****************************************************
The function returns the specified string Width in pixels according to the used charset
a particular position on the axis "x", which would render the matrix when dipleji
the positions to which the draw is over - the next position may be videopamìti
rendered next character.

If the indication = 4, and the character would be positioned to offset the coordinates x = 0, then pøíslušný
character or characters will konèit at the coordinates x = 4
******************************************************/
{
        uint16_t string_on_display_lenght = 0;
        while (*string)                //in the cycle is maintained as reading the entire field, which finally position for rendering has to be detected in
        {
                loadBufferLong(*string);
                string_on_display_lenght = string_on_display_lenght + bufferLong[7];        // first detected in the bit length of the processed character strings
                *string++;
        }

        return string_on_display_lenght;
}


void RUNNING_TEXT(sint8_t disp_points,sint16_t step_delay_time,uint8_t *text)
{
        uint8_t i,string_lenght;                        //the length of the text displayed at points on the x axis
        string_lenght = check_string_lenght(text);
        //snprintf(disassembly,20,"Delka retezce: %d\n",string_lenght);
        //uart_puts(disassembly);
        //uart_puts(length_print);

        for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
        {
                LED = 1;
                print_string(1,i,0,text);

                LED = 1;
                for(i=0;i<step_delay_time;i++)
                {
                        delay_ms(10);
                }

        }

}