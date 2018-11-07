/*
 * matrix_disp_driving.h
 *
 * Created: 18.12.2015 17:36:15
 *  Author: Ondrej Blazek
 */ 


#ifndef MATRIX_DISP_DRIVING_H_
#define MATRIX_DISP_DRIVING_H_



void shift_out_byte(uint8_t byte_to_send);

void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA);

void loadBufferLong(int ascii);

uint8_t bit_read(uint8_t variable, uint8_t bit_num);

int set_char_5x7_on_XY(int x_offset, int y_offset, char character);

void clear_videoMem_1();

void print_disp_memory_1();

void set_bode_to_videoMem(uint8_t x, uint8_t y);

void print_string(uint8_t clean_video_mem, int x_offset, int y_offset, char *string);

void RUNNING_TEXT(int disp_points,int step_delay_time, char *text);

int check_string_lenght(char *string);


#endif /* MATRIX_DISP_DRIVING_H_ */