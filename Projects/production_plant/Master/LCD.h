#ifndef LCD_8_H
#define LCD_8_H
#include"types.h"
	extern void lcd_write(u8);
	extern void lcd_cmd(u8);
	extern void lcd_init(void);
	extern void lcd_char(u8);
	extern void lcd_str(u8*);
	extern void lcd_uint(u16);
	extern void lcd_float(float);
	extern void build_cgram(u8*,u8);

#endif