#line 1 "D:/PIC Project/digital clock/source/digital_clock_SPI.C"
#line 1 "d:/pic project/digital clock/source/matrix_disp_driving.h"
#line 1 "d:/pic project/digital clock/source/types.h"



typedef unsigned char uint8_t;
typedef signed char sint8_t;
typedef unsigned int uint16_t;
typedef signed int sint16_t;
typedef unsigned long uint32_t;
typedef unsigned long sint32_t;
#line 5 "d:/pic project/digital clock/source/matrix_disp_driving.h"
extern void shift_out_byte(uint8_t byte_to_send);
extern void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA);
extern void loadBufferLong(uint8_t ascii);
extern uint8_t bit_read(uint8_t variable, uint8_t bit_num);
extern void set_char_5x7_on_XY(sint8_t x_offset, sint8_t y_offset, uint8_t character);
extern void clear_videoMem_1();
extern void print_disp_memory_1();
extern void set_bode_to_videoMem(uint8_t x, uint8_t y);
extern void print_string(sint8_t clean_video_mem, sint8_t x_offset, sint8_t y_offset,uint8_t *string);
extern void RUNNING_TEXT(sint8_t disp_points,sint16_t step_delay_time, uint8_t *text);
extern uint16_t check_string_lenght(uint8_t *string);
#line 1 "d:/pic project/digital clock/source/display_demo.h"



 extern void init_LED_display();
 extern void display_test();
 extern void display_time();
 extern void display_date();
 extern void Roll_time();
 extern void demo_disp();
#line 1 "d:/pic project/digital clock/source/types.h"
#line 1 "d:/pic project/digital clock/source/i2c.h"
#line 1 "d:/pic project/digital clock/source/types.h"
#line 4 "d:/pic project/digital clock/source/i2c.h"
 extern void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat);
 extern uint8_t read_I2C(uint8_t sa_addr,uint16_t buff_add);
 extern void Check_time(void);
 extern void Check_date(void);
#line 6 "D:/PIC Project/digital clock/source/digital_clock_SPI.C"
uint8_t sec,p_sec,mins,p_mins,hrs,p_hrs,day,date,p_date,month,p_month,year,p_year;


void main(void)
{
 uint8_t i;
 TRISB=0x02;
 TRISC=0x00;
 ADCON0=0X00;
 ADCON1=0x00;
 Soft_I2C_Init();
 SPI1_Init();
 UART1_Init(9600);
 init_LED_display();


 print_string(1,4,0,"VS-CORP");
 Check_time(); Check_date();
 delay_ms(1000);

 while(1)
 {



 for(i=0;i<5;i++){ Roll_time(); }
 display_date();

 }



}
