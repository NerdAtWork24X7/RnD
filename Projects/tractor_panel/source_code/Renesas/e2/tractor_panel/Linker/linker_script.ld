MEMORY
{
	VEC : ORIGIN = 0x0, LENGTH = 4
	IVEC : ORIGIN = 0x4, LENGTH = 188
	OPT : ORIGIN = 0xC0, LENGTH = 4
	SEC_ID : ORIGIN = 0xC4, LENGTH = 10
	OCDSTAD : ORIGIN = 0xCE, LENGTH = 10
	OCDROM : ORIGIN = 0x7E00, LENGTH = 512
	ROM : ORIGIN = 0xD8, LENGTH = 32040
	MIRROR : ORIGIN = 0xF2000, LENGTH = 24576
	RAM : ORIGIN = 0xFF700, LENGTH = 2048
}
SECTIONS
{
	.vec 0x0: AT(0x0)
	{
		KEEP(*(.vec))
	} > VEC
	.vects 0x4: AT(0x4)
	{
		KEEP(*(.vects))
	} > IVEC
	.option_bytes 0xc0 : AT(0xc0)
	{
		KEEP(*(.option_bytes))
	} > OPT
	.security_id 0xc4 : AT(0xc4)
	{
		KEEP(*(.security_id))
	} > SEC_ID
	.lowtext 0xD8: AT(0xD8)
	{
		*(.plt)
		*(.lowtext)
		. = ALIGN(2);
	} > ROM
	.tors :
	{
		__CTOR_LIST__ = .;
		. = ALIGN(2);
		___ctors = .;
		KEEP(*(.ctors))
		___ctors_end = .;
		__CTOR_END__ = .;
		__DTOR_LIST__ = .;
		___dtors = .;
		KEEP(*(.dtors))
		___dtors_end = .;
		__DTOR_END__ = .;
		. = ALIGN(2);
		_mdata = .;
	} > ROM
	.text (. + __romdatacopysize): 
	{
		*(.text)
		*(.text.*)
		etext = .;
		. = ALIGN(2);
	} > ROM
	PROVIDE(__rl78_abs__ = 0);
	.init :
	{
		*(.init)
	} > ROM
	.fini :
	{
		KEEP(*(.fini))
	} > ROM
	.got :
	{
		*(.got)
		*(.got.plt)
	} > ROM
	.rodata MAX(., 0x2000): 
	{
		. = ALIGN(2);
		*(.rodata)
		*(.rodata.*)
		_erodata = .;
	} > ROM
	.frodata :
	{
		. = ALIGN(2);
		*(.frodata)
		*(.frodata.*)
		_efrodata = .;
	} > ROM
	.eh_frame_hdr :
	{
		*(.eh_frame_hdr)
	} > ROM
	.eh_frame :
	{
		*(.eh_frame)
	} > ROM
	.jcr :
	{
		*(.jcr)
		. = ALIGN(2);
	} > ROM
	.data 0xFF700: AT(_mdata)
	{
		. = ALIGN(2);
		_data = .;
		*(.data)
		*(.data.*)
		. = ALIGN(2);
		_edata = .;
	} > RAM
	PROVIDE(__romdatacopysize = SIZEOF(.data));
	.bss :
	{
		. = ALIGN(2);
		_bss = .;
		*(.bss)
		*(.bss.**)
		. = ALIGN(2);
		*(COMMON)
		. = ALIGN(2);
		_ebss = .;
		_end = .;
	} > RAM
	PROVIDE(stack_size = 0x64);
	.stack 0xFFEDC (NOLOAD) : AT(0xFFEDC)
	{
		_stack = .;
		ASSERT((_stack > (_end + stack_size)), "Error: Too much data - no room left for the stack");
	} > RAM
}
