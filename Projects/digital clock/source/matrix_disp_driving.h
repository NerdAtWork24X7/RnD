
#ifndef MATRIX_DISP_DRIVING_H_
#define MATRIX_DISP_DRIVING_H_
#include"types.h"
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


#endif /* MATRIX_DISP_DRIVING_H_ */