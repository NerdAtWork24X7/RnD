
#ifndef GLCD_H
#define GLCD_H
/*************function delcaration*************/
extern void ctrl_off();
extern void delay(unsigned int j);
extern void display_on();
extern void display_off();
extern void set_column(unsigned char y);
extern void set_page(unsigned char x);
extern void set_start_line(unsigned char l);
extern void lcd_data(const unsigned char *value,unsigned int limit);
extern void lcd_puts1(unsigned char y,unsigned char x,unsigned char *str);
extern void lcd_puts2(unsigned char y,unsigned char x,unsigned char *str);
extern void lcd_puts2_const(unsigned char y,unsigned char x,const unsigned char *str);
extern void lcd_notify_const(unsigned char col,unsigned char page,unsigned char num);
extern void picture(const unsigned char * val);
extern void clr_lcd();
extern void init_lcd();

extern const unsigned char noti_bar8x8[];
#endif