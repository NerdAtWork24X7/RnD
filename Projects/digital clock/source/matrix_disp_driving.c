#include"types.h"

// block of definitions

#define LOAD_OUT_LO RC0_bit=0;
#define LOAD_OUT_HI  RC0_bit=1;
//#define NUMBER_OF_LAST_MAX7219 6
#define LED RB0_bit
#define START_1SEG 1
#define START_2SEG 9
#define START_3SEG 16
#define START_4SEG 24
#define START_5SEG 32
#define START_6SEG 40

//*********************** MAX7219 definition ******************************
//setup number of chip attached to the board
#define NUMBER_OF_LAST_MAX7219 6                                    // number will be the last unit (unit Numbering are 0, 1, 2, ....)

//define registers
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

extern uint8_t a,b;

uint8_t disassembly[150];       //150
uint8_t length_print[205];      //205


//videopamì ?? 1 for display on the six matrices
uint8_t VIDEO_MEM_1[8][6];

//videopamì 2 for display on six nuts
uint8_t VIDEO_MEM_2[8][6];

//auxiliary buffer variable to retrieve a character from memory PROGMA
uint8_t bufferLong[14] = {0};



// standard ascii 5x7 font
// defines ascii characters 0x20-0x7F (32-127)
const code  uint8_t font5x7[] = {         //Numeric Font Matrix (Arranged as 7x font data + 1x kerning data)
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


//operation matrix

void shift_out_byte(uint8_t byte_to_send)
{
       SPI1_Write(byte_to_Send);
}

// send serial data over SPI
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
        
        for (i=0; i < num_of_unit; i++)
        {
                shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
                shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicatedým
        }
        
        LOAD_OUT_HI
        //delay_us(1);
        LOAD_OUT_LO
}

//function to retrieve the character of PROGMA
void loadBufferLong(uint8_t ascii)
{
        uint8_t c=0;
        uint8_t x, count;
        for(a = 0; a < 14; a++)  bufferLong [a] = 0;        //compacting buffer
        
        if (ascii >= 0x20 && ascii <=0x7f)
        {
           for (a=0;a<8;a++)                               // Loop 7 times for a 5x7 font
             {
                c=font5x7[((ascii - 0x20) * 8) + a];
                bufferLong[a] = c;                         // Store in buffer
             }
                
           count = font5x7[((ascii - 0x20) * 8) + 7];     // Index into character table for kerning data
           for (x=0; x<count;x++)
             {
                 // rotateBufferLong();
                 // printBufferLong();
                 //delay_ms(500);
             }
        }
}

// Authenticate value of the variable bit
uint8_t bit_read(uint8_t variable, uint8_t bit_num)
{
        if(variable & (1<<bit_num)) return 1;
        else  return 0;
}

//Function to insert the character into the 5x7 videopamìti 1
sint8_t set_char_5x7_on_XY(sint16_t x_offset, sint16_t y_offset, uint8_t character)
{
        
        uint8_t font_lenght = bufferLong[7];        // Investigations Width font in pixels
        sint8_t pixel_to_start_draw = x_offset;
        sint8_t pixel_to_end_draw = (x_offset-1) + font_lenght;
        uint8_t bit_to_read;
        
        sint8_t start_row = y_offset;
        sint8_t end_row = y_offset + 7;
        sint8_t act_row=0,row;                                        //Current Line: reading a character from memory within the plot
        sint16_t x_pos;
       // loadBufferLong(character);

        //Fonts are in, dimension 5x7 points, seven points is a row. When plotting to videopamìti is y_offsetem Line: from which (In case outside the scope of rendering videopamìti negative coordinate)
        //pøíslušný portrays the character pøièemž øádkování counts from baseline to the coordinates and increments up to 7 (vertical dimension character sets).


      for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
        {
           bit_to_read = 7;
            for(x_pos = x_offset; x_pos < 48; x_pos++)                //cyklus postupnì probìhne celý øádek pamìti
               {        
                  if (x_pos<(0)){ bit_to_read--; }
                  if((x_pos>=0)&&(x_pos<8))                //kreslení do pamìového prostoru první matice
                    {
                        if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                           {
                              if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                 {
                                    VIDEO_MEM_1[row][0] |= (1<<(7 - x_pos));
                                 }
                              else
                                 {
                                   VIDEO_MEM_1[row][0] &= ~(1<<(7 - x_pos));
                                 }
                                 bit_to_read--;
                            }
                    }
                     if((x_pos>7)&&(x_pos<17))                //kreslení do pamìového prostoru druhé matice
                       {
                          if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                            {
                               if((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                  {
                                      VIDEO_MEM_1[row][1] |= (1<<(7 - (x_pos-8)));
                                  }
                                bit_to_read--;
                             }
                        }
                      if((x_pos>15)&&(x_pos<25))                //kreslení do pamìového prostoru tøetí matice
                        {
                           if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                             {
                                if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                   {
                                        VIDEO_MEM_1[row][2] |= (1<<(7 - (x_pos-16)));
                                   }
                                   bit_to_read--;
                             }
                        }

                        if((x_pos>23)&&(x_pos<33))                //kreslení do pamìového prostoru ètvrté matice
                        {
                           if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                             {
                                if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                   {
                                      VIDEO_MEM_1[row][3] |= (1<<(7 - (x_pos-24)));
                                    }
                                    bit_to_read--;
                              }
                        }

                        if((x_pos>31)&&(x_pos<41))                //kreslení do pamìového prostoru páté matice
                        {
                            if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                                {
                                  if((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                     {
                                        VIDEO_MEM_1[row][4] |= (1<<(7 - (x_pos-32)));
                                       }
                                        bit_to_read--;
                                }
                        }

                        if((x_pos>39)&&(x_pos<49))                //kreslení do pamìového prostoru páté matice
                        {
                                if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
                                {

                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
                                        {
                                                VIDEO_MEM_1[row][5] |= (1<<(7 - (x_pos-40)));

                                        }

                                        bit_to_read--;
                                }        
               }
            }
            act_row++;
        }
        return font_lenght;
}

//Functions for compacting videopamìti 1
void clear_videoMem_1()
{
     uint8_t x,row;
        for (row = 0; row<8;row++)
        {
                for (x = 0; x < 7; x++)
                {
                        VIDEO_MEM_1 [row][x]=0x00;
                }

        }
}

// rendering videopamìti 1 for matrix display
void print_disp_memory_1()                                //rendering video memory after OADC
{
        uint8_t i;
        LOAD_OUT_LO                                      //initialization, setting bit perform write zero
        for(a=0; a<8 ; a++)                             // Lines switching matrix (Line: 0-7)
        {
            for(i=0;i<7;i++)                           // Lines of data submission process for all SPI nut for (i = 0: Lines fifth matrix data, sending the order of LSB first)
                {
                     if(a==0)
                        {
                                shift_out_byte(MAX7219_REGROW1);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                 UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        
                        if(a==1)
                        {
                                shift_out_byte(MAX7219_REGROW2);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 first Itera
                                UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==2)
                        {

                                shift_out_byte(MAX7219_REGROW3);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                 UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==3)
                        {
                               shift_out_byte(MAX7219_REGROW4);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==4)
                        {
                                shift_out_byte(MAX7219_REGROW5);
                               shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                               UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==5)
                        {
                                shift_out_byte(MAX7219_REGROW6);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                 UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==6)
                        {
                                shift_out_byte(MAX7219_REGROW7);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                 UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                        if(a==7)
                        {
                                shift_out_byte(MAX7219_REGROW8);
                                shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
                                 UART1_Write_text(VIDEO_MEM_1[a][6-i]);
                        }
                }
                
                LOAD_OUT_HI                                                                        //initialization, setting bit perform write log 1
                LOAD_OUT_LO                                                                        // initialization, setting bit perform write zero
        }

}


void set_bode_to_videoMem(uint8_t x, uint8_t y)
{
        if(x<9)                //Point will draw a first matrix
        {
                VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
        }
        
        if((x>8) && (x<17))        // Point will draw a second matrix
        {
                VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
        }
        
        if((x>16) && (x<25))        //Point will draw on the third matrix
        {
                VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
        }

        if((x>24) && (x<33))        // Item will be drawing to a quarter of a matrix
        {
                VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
        }
        
        if((x>32) && (x<41))        // Item will be drawing to a quarter of a matrix
        {
                VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
        }
        if((x>40) && (x<49))        // Item will be drawing to a quarter of a matrix
        {
                VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
        }        
}

uint8_t check_string_lenght(uint8_t *string)

/*****************************************************
The function returns the specified string Width in pixels according to the used charset
a particular position on the axis "x", which would render the matrix when dipleji
the positions to which the draw is over - the next position may be videopamìti
rendered next character.

If the indication = 4, and the character would be positioned to offset the coordinates x = 0, then pøíslušný
character or characters will konèit at the coordinates x = 4
******************************************************/
{
        uint8_t string_on_display_lenght = 0;
        while (*string)                //in the cycle is maintained as reading the entire field, which finally position for rendering has to be detected in
        {
                loadBufferLong(*string);
                string_on_display_lenght = string_on_display_lenght + bufferLong[7];        // first detected in the bit length of the processed character strings
                *string++;
        }

        return string_on_display_lenght;
}



void print_string(uint8_t clean_video_mem, uint8_t x_offset, uint8_t y_offset,  uint8_t *string)
{
        uint8_t i,j;
        sint8_t act_char_position=0;                //the position of the currently processed character
        sint8_t font_lenght=0;                // variable into which retrieved length of the active character
          //uint8_t last_char_lenght;
        if(clean_video_mem==1){  clear_videoMem_1(); }
        //videoMem[2][0]=0xf0;
        
        // rendering a text string is based on the simultaneous recording of characters that are behind the strings contained, pøièemž is the character initially retrieved from the memory 
        // together with a bit SIOK character. Only if the character A piece extends into areas rendered ohranièené offset on the x-axis, and coordinate 0px 39px (for a given application is 
        // Estimated Width display area 40 points) is performed to render video memory, which is after finally sent for processing 
        // display on the matrix display. The function is designed for sliding display text strings to its length (number of characters) exceeds the display options (number of horizontal  points) matrix displays.
        
        act_char_position = x_offset;

                while(*string)                //in the cycle is maintained as reading the entire field, which should be displayed
                {
                   loadBufferLong(*string);
                   font_lenght = bufferLong[7];        // first detected in the bit length of the processed character string
                        if((act_char_position+font_lenght)>(0))   //if the last point of a character rendered from the current position extends into the display area is called rendering function character in videopamìti
                        {
                            set_char_5x7_on_XY(act_char_position,y_offset,*string);
                        }
                        if (act_char_position > 47)  //if poeatek newly rendered character display area for matrix display, rendering will be interrupted
                        {
                                break;
                        }
                        *string++;
                        act_char_position+=font_lenght;   //after the decision, product or to rendering step is increased further pointer to the next character position pøípadného
                }
        print_disp_memory_1();
}


void RUNNING_TEXT(sint8_t disp_points,sint8_t step_delay_time, uint8_t *text)
{
        sint8_t i,string_lenght;                        //the length of the text displayed at points on the x axis
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
                        delay_ms(100);
                }        

        }
        
}