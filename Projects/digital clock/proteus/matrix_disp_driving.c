#include "types.h"

char rozborka[150];

char lenghs_print[205];
extern char a;

// block of definitions

#define LOAD_OUT_LO RC0_bit=0;;
#define LOAD_OUT_HI RC0_bit=1;;
#define NUMBER_OF_LAST_MAX7219 6
#define LED RB0_bit

//*********************** MAX7219 definition ******************************
//setup number of chip attached to the board
#define NUMBER_OF_LAST_MAX7219 5                                                        // ËÌslo poslednÌ jednotky budiËe (jednotky jsou ËÌslov·ny 0, 1, 2,....)

//define registers
#define MAX7219_REGNOOP 0x00                                        // nebude provedena û·dn· operace
#define MAX7219_REGROW1 0x01                                        // z·pis dat na prvnÌ ¯·dek
#define MAX7219_REGROW2 0x02                                        // z·pis dat na druh˝ ¯·dek
#define MAX7219_REGROW3 0x03                                        // z·pis dat na t¯etÌ ¯·dek
#define MAX7219_REGROW4 0x04                                        // z·pis dat na Ëtvrt˝ ¯·dek
#define MAX7219_REGROW5 0x05                                        // z·pis dat na p·t˝ ¯·dek
#define MAX7219_REGROW6 0x06                                        // z·pis dat na öest˝ ¯·dek
#define MAX7219_REGROW7 0x07                                        // z·pis dat na sedm˝ ¯·dek
#define MAX7219_REGROW8 0x08                                        // z·pis dat na osm˝ ¯·dek
#define MAX7219_REGDECODE 0x09                                        // nastavenÌ zp˘sobu dekÛdov·nÌ informace pro v˝stupy digit˘ (0x00 - no decode, vÌce datasheet str. 7)
#define MAX7219_REGINTENSITY 0x0A                                // nastavenÌ intenzity zobrazenÌ
#define MAX7219_REGSCANLIMIT 0x0B                                // poËet obsluhovan˝ch digit˘ (pro osm digit˘ se prov·dÌ volba 0x07)
#define MAX7219_REGSHUTDOWN 0x0C                                // vypnutÌ zobrazenÌ (nastavenÌ LSB datov˝mi bity, 0 = shutdown mode, 1 = normal oper mode)
#define MAX7219_REGTEST 0x0F                                        // spuötÏnÌ testovacÌ funkce dipleje (vöechny body budou rozsvÌceny)
//**********************************************************************************************************************************************************






//videopamÏù 1 pro zobrazenÌ na öest matic
uint8_t VIDEO_MEM_1 [8][6]={0};

//videopamÏù 2 pro zobrazenÌ na öest matic
uint8_t VIDEO_MEM_2 [8][6]={0};
        
//pomocn· buffer promÏnn· pro naËtenÌ znaku z progmem pamÏti
unsigned long bufferLong [14] = {0};

// standard ascii 5x7 font
// defines ascii characters 0x20-0x7F (32-127)
const unsigned char font5x7[] = {      //Numeric Font Matrix (Arranged as 7x font data + 1x kerning data)
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
        0x60,0x90,0x90,0x60,0x00,0x00,0x00,5                //∞

};


//obsluha matice

void shift_out_byte(uint8_t byte_to_send)
{      
       SPI1_Write(byte_to_send);
       // SPID.DATA = byte_to_send;                                        // adresa 15
       // while(!(SPID.STATUS & 0x80));                // wait for transmit complete
}

// odesl·nÌ sÈriov˝ch dat po SPI
void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA)
{
        uint8_t i = 0;
        
        LOAD_OUT_LO                                                                        // inicializace, nastavenÌ bitu provedenÌ z·pisu na nulu
        
        if(num_of_unit < NUMBER_OF_LAST_MAX7219)                        // oöet¯enÌ pro p¯Ìpad, kdy komunikovan· jednotka nenÌ na konci ¯ady
        {
                for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
                {
                        shift_out_byte(MAX7219_REGNOOP); // odesl·nÌ nulovÈho adresnÌho bajtu pro budiËe, kterÈ jsou za komunikovan˝m
                        shift_out_byte(MAX7219_REGNOOP); // odesl·nÌ nulovÈho datovÈho bajtu pro budiËe, kterÈ jsou za komunikovan˝m
                }
        }
        
        // zasl·nÌ dat na poûadovanou jednotku
        shift_out_byte(ADDR);                                // odesl·nÌ adresnÌho bajtu na poûadovanou jednotku
        shift_out_byte(DATA);                                // odesl·nÌ datovÈho bajtu na poûadovanou jednotku
        
        // zasl·nÌ pr·zdn˝ch bajt˘ na jednotky p¯ed adresovanou
        
        for (i=0; i < num_of_unit; i++)
        {
                shift_out_byte(MAX7219_REGNOOP); // odesl·nÌ nulovÈho adresnÌho bajtu pro budiËe, kterÈ jsou za komunikovan˝m
                shift_out_byte(MAX7219_REGNOOP); // odesl·nÌ nulovÈho datovÈho bajtu pro budiËe, kterÈ jsou za komunikovan˝m
        }
        
        LOAD_OUT_HI
        //        _delay_us(1);
        LOAD_OUT_LO
}

// funkce pro naËtenÌ znaku z progmem
void loadBufferLong(int ascii)
{
       uint32_t c;
       uint8_t count,x;
        for(a = 0; a < 14; a++)                // vyËiötÏnÌ bufferu
        {
                bufferLong [a] = 0;
        }

        if (ascii >= 0x20 && ascii <=0x7f)
        {
                for (a=0;a<8;a++)
                {                      // Loop 7 times for a 5x7 font
                        c = font5x7[(((ascii - 0x20) * 8) + a)];     // Index into character table to get row data
                        //unsigned long x = bufferLong [a*2];     // Load current scroll buffer
                        //x = x | c;                              // OR the new character onto end of current
                        bufferLong [a] = c;                   // Store in buffer
                }
                
                count = font5x7[(((ascii - 0x20) * 8) + 7)];     // Index into character table for kerning data
                for (x=0; x<count;x++){
                        //                rotateBufferLong();
                        //                printBufferLong();
                        //                _delay_ms(500);
                }
        }
}

// ovÏ¯enÌ hodnoty zadanÈho bitu promÏnnÈ
uint8_t bit_read(uint8_t variable, uint8_t bit_num)
{
        if(variable & (1<<bit_num))
        {
                return 1;
        }
        else
        {
                return 0;
        }
}

//Funkce pro vloûenÌ znaku 5x7 do videopamÏti 1
int set_char_5x7_on_XY(int x_offset, int y_offset, char character)
{
        uint8_t font_lenght = bufferLong[7];        // vyËtenÌ öÌ¯ky fontu v pixelech
        int pixel_to_start_draw = x_offset;
        int pixel_to_end_draw = (x_offset-1) + font_lenght;
        uint8_t bit_to_read;
        
        int start_row = y_offset;
        int end_row = y_offset + 7;
        int act_row,row,x_pos;                                        // aktu·lnÌ ¯·dek ËtenÌ znaku z pamÏti v r·mci vykreslov·nÌ

        //fonty jsou v rozmÏru 5x7 bod˘, tedy sedm bod˘ je ¯·dek. P¯i vykreslov·nÌ do videopamÏti je y_offsetem ¯·dek, od kterÈho se (v p¯ÌpadÏ vykreslov·nÌ mimo rozsah videopamÏti v z·porn˝ch sou¯adnicÌch)
        //vykresluje p¯Ìsluön˝ znak, p¯iËemû ¯·dkov·nÌ se poËÌt· od v˝chozÌ sou¯adnice a inkrementuje do velikosti 7 (vertik·lnÌ rozmÏr znakovÈ sady).
        
        loadBufferLong(character);

        for(row=start_row; row<end_row;row++)                                // proËÌt·nÌ jednotliv˝ch ¯·dk˘ (pro vykreslenÌ v˝öky pÌsma 7 ¯·dk˘)
        {


                
                bit_to_read = 7;
                
                
                for(x_pos = x_offset; x_pos < 48; x_pos++)                //cyklus postupnÏ probÏhne cel˝ ¯·dek pamÏti
                {
                        if (x_pos<(0))
                        {
                                bit_to_read--;
                        }
                        
                        
                        if(((-1)<x_pos)&&(x_pos<8))                //kreslenÌ do pamÏùovÈho prostoru prvnÌ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
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
                        
                        if((x_pos>7)&&(x_pos<16))                //kreslenÌ do pamÏùovÈho prostoru druhÈ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
                                        {
                                                VIDEO_MEM_1[row][1] |= (1<<(7 - (x_pos-8)));

                                        }
                                        
                                        bit_to_read--;
                                }
                        }
                        
                        if((x_pos>15)&&(x_pos<24))                //kreslenÌ do pamÏùovÈho prostoru t¯etÌ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
                                        {
                                                VIDEO_MEM_1[row][2] |= (1<<(7 - (x_pos-16)));

                                        }
                                        
                                        bit_to_read--;
                                }
                        }
                        
                        if((x_pos>23)&&(x_pos<32))                //kreslenÌ do pamÏùovÈho prostoru ËtvrtÈ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
                                        {
                                                VIDEO_MEM_1[row][3] |= (1<<(7 - (x_pos-24)));

                                        }
                                        
                                        bit_to_read--;
                                }
                        }
                        
                        if((x_pos>31)&&(x_pos<40))                //kreslenÌ do pamÏùovÈho prostoru p·tÈ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
                                        {
                                                VIDEO_MEM_1[row][4] |= (1<<(7 - (x_pos-32)));

                                        }
                                        
                                        bit_to_read--;
                                }
                        }

                        if((x_pos>39)&&(x_pos<48))                //kreslenÌ do pamÏùovÈho prostoru p·tÈ matice
                        {
                                if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaË·tek kreslenÌ
                                {
                                        
                                        if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliûe je hodnota bitu "1", uloûÌ se postupnÏ tento stav do videopamÏti
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

// funkce pro vyËiötÏnÌ videopamÏti 1
void clear_videoMem_1()
{
       int row,x;
        for (row = 0; row<8;row++)
        {
                for (x = 0; x < 6; x++)
                {
                        VIDEO_MEM_1 [row][x]=0x00;
                }

        }
}

// vykreslenÌ videopamÏti 1 na maticov˝ display
void print_disp_memory_1()                                // vykreslenÌ video pamÏti po ¯·dcÌch
{
       int i;
        LOAD_OUT_LO                                                                        // inicializace, nastavenÌ bitu provedenÌ z·pisu na nulu
        for(a=0; a<8 ; a++)                                // p¯epÌn·nÌ ¯·dk˘ matic (¯·dek 0 - 7)
        {
                for(i=0;i<6;i++)                        // postupnÈ odesl·nÌ dat ¯·dk˘ pro vöechny matice po SPI (i = 0: data ¯·dku p·tÈ matice, odesÌl· se po¯adÌm LSB first)
                {
                        if(a==0)
                        {
                                shift_out_byte(MAX7219_REGROW1);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==1)
                        {
                                shift_out_byte(MAX7219_REGROW2);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==2)
                        {
                                shift_out_byte(MAX7219_REGROW3);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==3)
                        {
                                shift_out_byte(MAX7219_REGROW4);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==4)
                        {
                                shift_out_byte(MAX7219_REGROW5);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==5)
                        {
                                shift_out_byte(MAX7219_REGROW6);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==6)
                        {
                                shift_out_byte(MAX7219_REGROW7);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                        if(a==7)
                        {
                                shift_out_byte(MAX7219_REGROW8);
                                shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejd¯Ìve se odesÌlajÌ data matice Ë.6 v prvnÌ iteraci
                        }
                }
                
                LOAD_OUT_HI                                                                        // inicializace, nastavenÌ bitu provedenÌ z·pisu na log 1
                LOAD_OUT_LO                                                                        // inicializace, nastavenÌ bitu provedenÌ z·pisu na nulu
        }

/*
        for(int a=0; a < 8; a++)                        // vykreslenÌ ¯·dk˘ prvnÌ matice
        {
                set_row_on_chip(0,a+1,displayMemory[a*2]);                        // vykreslenÌ ¯·dk˘ matice 1
                set_row_on_chip(1,a+1,displayMemory[(a*2)+1]);                // vykreslenÌ ¯·dk˘ matice 2        
        }
*/
}


void set_bode_to_videoMem(uint8_t x, uint8_t y)
{
        if(x<9)                //bod bude kreslen na prvnÌ matici
        {
                VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
        }
        
        if((x>8) && (x<17))        // bod bude kreslen na druhÈ matici
        {
                VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
        }
        
        if((x>16) && (x<25))        // bod bude kreslen na t¯etÌ matici
        {
                VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
        }

        if((x>24) && (x<33))        // bod bude kreslen na Ëtvrtou matici
        {
                VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
        }
        
        if((x>32) && (x<41))        // bod bude kreslen na Ëtvrtou matici
        {
                VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
        }
        if((x>40) && (x<49))        // bod bude kreslen na Ëtvrtou matici
        {
                VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
        }        
}

int check_string_lenght(char *string)

/*****************************************************
Funkce vracÌ öÌ¯ku zadanÈho ¯etÏzce v pixelech dle pouûitÈ znakovÈ sady,
konkrÈtnÏ pozici na ose "x", na kterÈ by p¯i vykreslenÌ na maticovÈm dipleji
byla pozice, na kterÈ vykreslenÌ skonËÌ - na dalöÌ pozici m˘ûe b˝t ve videopamÏti
vykreslen dalöÌ znak.

jestliûe je ˙daj = 4, a znak by byl umÌstÏn na sou¯adnici x_offset = 0, pak p¯Ìsluön˝
znak nebo znaky budou konËit na sou¯adnici x = 4
******************************************************/

{
        int string_on_display_lenght = 0;
        
        while (*string)                //v r·mci cyklu je prov·dÏno ËtenÌ celÈho pole, jehoû koneËn· pozice pro vykreslenÌ m· b˝t zjiötÏna
        {
                loadBufferLong(*string);
                string_on_display_lenght = string_on_display_lenght + bufferLong[7];        // nejd¯Ìve je zjiötÏna bitov· dÈlka zpracov·vanÈho znaku ¯etÏzce
                
                *string++;
        }

        return string_on_display_lenght;
        
}



void print_string(uint8_t clean_video_mem, int x_offset, int y_offset, char *string)
{
        uint8_t font_lenght;                // promÏnn·, do kterÈ je naËtena dÈlka aktu·lnÌho znaku
        //int last_char_lenght;

        int act_char_position;                // pozice aktu·lnÏ zpracov·vanÈho znaku


        // vykreslov·nÌ textovÈho ¯etÏzce je zaloûeno na simult·lnÌm vykreslov·nÌ znak˘, kterÈ jsou za sebou v ¯etÏzci obsaûeny, p¯iËemû je dan˝ znak nejprve naËten z pamÏti
        // spoleËnÏ s bitovou öÌ¯kou znaku. Pouze v p¯ÌpadÏ, kdy Ë·st znaku zasahuje do vykreslovanÈ plochy ohraniËenÈ offsetem na ose x, sou¯adnicÌ 0px a 39px (pro danou
        // aplikaci je p¯edpokl·dan· öÌ¯ka zobrazovacÌ plochy 40 bod˘), je provedeno vykreslov·nÌ do video pamÏti, kter· je po koneËnÈm zpracov·nÌ zasl·na k zobrazenÌ
        // na maticov˝ display. Funkce je urËena pro posuvnÈ zobrazenÌ textovÈho ¯etÏzce, kter˝ svou dÈlkou (poËtem znak˘) p¯esahuje zobrazovacÌ moûnosti (poËet vodorovn˝ch
        // bod˘) maticovÈho displaye.


        act_char_position = x_offset;
  
  
  
  
        
        if(clean_video_mem==1)
        {
                clear_videoMem_1();                
        }
        
                        //videoMem[2][0]=0xf0;


                while (*string)                //v r·mci cyklu je prov·dÏno ËtenÌ celÈho pole, kterÈ m· b˝t zobrazeno
                {
                        loadBufferLong(*string);
                        font_lenght = bufferLong[7];        // nejd¯Ìve je zjiötÏna bitov· dÈlka zpracov·vanÈho znaku ¯etÏzce
                        
                        
                        if((act_char_position+font_lenght)>(-1))                // jestliûe poslednÌ bod znaku vykreslen˝ od aktu·lnÌ pozice zasahuje do zobrazovanÈ oblasti, je zavol·na funkce vykreslenÌ znaku do videopamÏti
                        {
                                set_char_5x7_on_XY(act_char_position,y_offset,*string);
                                //new_char_position = new_char_position + last_char_lenght;                                
                        }


                        if (act_char_position > 47)                //jestliûe je poË·tek novÏ vykreslovanÈho znaku za zobrazovacÌ plochou maticovÈho displeje, vykreslov·nÌ bude p¯eruöeno
                        {
                                break;
                        }
                        
                        *string++;
                        act_char_position = act_char_position + font_lenght;        //po provedenÌ rozhodovacÌch, p¯ÌpadnÏ vykreslovacÌch krok˘ je nav˝öen ukazatel na dalöÌ pozici p¯ÌpadnÈho n·sledujÌcÌho znaku
                }

        print_disp_memory_1();
}


void RUNNING_TEXT(int disp_points,int step_delay_time, char *text)
{

        
        //Ondrej Blazek, www.ondrashova-automatizace.webnode.cz
        
        int string_lenght,i;                        // dÈlka zobrazovanÈho textu v bodech na ose x
        
        string_lenght = check_string_lenght(text);
        
        //snprintf(rozborka,20,"Delka retezce: %d\n",string_lenght);
        //uart_puts(rozborka);
        
        
        //uart_puts(lenghs_print);
        
        
        for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
        {
                LED = 1;
                print_string(1,i,0,text);

                LED = 1;
                for(i=0;i<step_delay_time;i++)
                {
                        delay_ms(1);
                }

        }
        
}