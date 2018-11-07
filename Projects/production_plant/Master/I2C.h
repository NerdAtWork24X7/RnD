#ifndef I2C_H
#define I2C_H

	#include"types.h"
	extern void I2C_device_write(u8,u8,u8);
	extern u8 I2C_device_read(u8,u8);
	extern void I2C_start(void);
	extern void I2C_write(u8);
	extern void I2C_ack(void);
	extern void I2C_stop(void);
	extern void I2C_noack(void);
	extern u8 I2C_read(void);

#endif

