
set PROJECT_PATH=D:\PIC_Project\tractor\source_code\eclipse\v1_5

set COMPILER_PATH=C:\Users\Public\Documents\Mikroelektronika\mikroC PRO for PIC

set OUTPUT_PATH=D:\PIC_Project\tractor\source_code\eclipse\v1_5\output

::mikroCPIC1618.exe -MSF -DBG -pP16F1503 -RA -DL -O11111114 -fo8 -N"%OUTPUT_PATH%\tractor.mcppi" -SP"%COMPILER_PATH%\Defs\" -SP"%COMPILER_PATH%\Uses\P16_Enh\" -SP"%PROJECT_PATH%\Port\source\" -IP"%PROJECT_PATH%\Port\includes\" "pwm3.c" "tmr0.c" "tmr2.c" "Tractor.c" "__Lib_Math.mcl" "__Lib_MathDouble.mcl" "__Lib_System.mcl" "__Lib_Delays.mcl" "__Lib_PWM_150x.mcl"	 


mikroCPIC1618.exe -MSF -DBG -pP16F1503 -RA -O01110104 -fo16 -N"%OUTPUT_PATH%\OPSM.mcppi" -SP"%PROJECT_PATH%\Lib" -SP"%PROJECT_PATH%\Port\source\" -IP"%PROJECT_PATH%\Port\includes\" "pwm3.c" "tmr0.c" "tmr2.c" "Tractor.c" "__Lib_Math.mcl" "__Lib_MathDouble.mcl" "__Lib_System.mcl" "__Lib_Delays.mcl" "__Lib_PWM_150x.mcl"	 


::"C:\Users\Public\Documents\Mikroelektronika\mikroProg Suite For PIC\mikroProg Suite for PIC.exe" -w -fC"D:\PIC_Project\tractor\source_code\eclipse\v1_5\output\MAIN.hex" -p16F1503 -q