#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/tmr0.c mcc_generated_files/ecan.c mcc_generated_files/adc.c mcc_generated_files/device_config.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/memory.c src/J1939.c src/main.c src/lcd.c mcc_generated_files/pic18f_bootload.c mcc_generated_files/pic18f_uart.c mcc_generated_files/eusart1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/tmr0.p1 ${OBJECTDIR}/mcc_generated_files/ecan.p1 ${OBJECTDIR}/mcc_generated_files/adc.p1 ${OBJECTDIR}/mcc_generated_files/device_config.p1 ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/tmr1.p1 ${OBJECTDIR}/mcc_generated_files/memory.p1 ${OBJECTDIR}/src/J1939.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/lcd.p1 ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1 ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1 ${OBJECTDIR}/mcc_generated_files/eusart1.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/tmr0.p1.d ${OBJECTDIR}/mcc_generated_files/ecan.p1.d ${OBJECTDIR}/mcc_generated_files/adc.p1.d ${OBJECTDIR}/mcc_generated_files/device_config.p1.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d ${OBJECTDIR}/mcc_generated_files/mcc.p1.d ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d ${OBJECTDIR}/mcc_generated_files/memory.p1.d ${OBJECTDIR}/src/J1939.p1.d ${OBJECTDIR}/src/main.p1.d ${OBJECTDIR}/src/lcd.p1.d ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d ${OBJECTDIR}/mcc_generated_files/eusart1.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/tmr0.p1 ${OBJECTDIR}/mcc_generated_files/ecan.p1 ${OBJECTDIR}/mcc_generated_files/adc.p1 ${OBJECTDIR}/mcc_generated_files/device_config.p1 ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1 ${OBJECTDIR}/mcc_generated_files/mcc.p1 ${OBJECTDIR}/mcc_generated_files/pin_manager.p1 ${OBJECTDIR}/mcc_generated_files/tmr1.p1 ${OBJECTDIR}/mcc_generated_files/memory.p1 ${OBJECTDIR}/src/J1939.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/lcd.p1 ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1 ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1 ${OBJECTDIR}/mcc_generated_files/eusart1.p1

# Source Files
SOURCEFILES=mcc_generated_files/tmr0.c mcc_generated_files/ecan.c mcc_generated_files/adc.c mcc_generated_files/device_config.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/memory.c src/J1939.c src/main.c src/lcd.c mcc_generated_files/pic18f_bootload.c mcc_generated_files/pic18f_uart.c mcc_generated_files/eusart1.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F45K80
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/tmr0.p1: mcc_generated_files/tmr0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/tmr0.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/tmr0.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/tmr0.p1: > ${OBJECTDIR}/mcc_generated_files/tmr0.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/tmr0.dep >> ${OBJECTDIR}/mcc_generated_files/tmr0.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr0.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/ecan.p1: mcc_generated_files/ecan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/ecan.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/ecan.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/ecan.p1: > ${OBJECTDIR}/mcc_generated_files/ecan.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/ecan.dep >> ${OBJECTDIR}/mcc_generated_files/ecan.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ecan.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/adc.p1: mcc_generated_files/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/adc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/adc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/adc.p1: > ${OBJECTDIR}/mcc_generated_files/adc.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/adc.dep >> ${OBJECTDIR}/mcc_generated_files/adc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/device_config.p1: mcc_generated_files/device_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/device_config.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/device_config.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/device_config.p1: > ${OBJECTDIR}/mcc_generated_files/device_config.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/device_config.dep >> ${OBJECTDIR}/mcc_generated_files/device_config.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/device_config.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/interrupt_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/interrupt_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: > ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/interrupt_manager.dep >> ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/mcc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/mcc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/mcc.p1: > ${OBJECTDIR}/mcc_generated_files/mcc.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/mcc.dep >> ${OBJECTDIR}/mcc_generated_files/mcc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pin_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pin_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pin_manager.p1: > ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pin_manager.dep >> ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.p1: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/tmr1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/tmr1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/tmr1.p1: > ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/tmr1.dep >> ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/memory.p1: mcc_generated_files/memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/memory.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/memory.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/memory.p1: > ${OBJECTDIR}/mcc_generated_files/memory.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/memory.dep >> ${OBJECTDIR}/mcc_generated_files/memory.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/memory.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/J1939.p1: src/J1939.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/J1939.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/J1939.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/J1939.p1: > ${OBJECTDIR}/src/J1939.p1.d
	@cat ${OBJECTDIR}/src/J1939.dep >> ${OBJECTDIR}/src/J1939.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/J1939.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/main.p1: > ${OBJECTDIR}/src/main.p1.d
	@cat ${OBJECTDIR}/src/main.dep >> ${OBJECTDIR}/src/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/main.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/lcd.p1: src/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/lcd.p1: > ${OBJECTDIR}/src/lcd.p1.d
	@cat ${OBJECTDIR}/src/lcd.dep >> ${OBJECTDIR}/src/lcd.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/lcd.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1: mcc_generated_files/pic18f_bootload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pic18f_bootload.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pic18f_bootload.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1: > ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.dep >> ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1: mcc_generated_files/pic18f_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pic18f_uart.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pic18f_uart.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1: > ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pic18f_uart.dep >> ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/eusart1.p1: mcc_generated_files/eusart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/eusart1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/eusart1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/eusart1.p1: > ${OBJECTDIR}/mcc_generated_files/eusart1.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/eusart1.dep >> ${OBJECTDIR}/mcc_generated_files/eusart1.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/eusart1.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/mcc_generated_files/tmr0.p1: mcc_generated_files/tmr0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/tmr0.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/tmr0.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/tmr0.p1: > ${OBJECTDIR}/mcc_generated_files/tmr0.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/tmr0.dep >> ${OBJECTDIR}/mcc_generated_files/tmr0.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr0.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/ecan.p1: mcc_generated_files/ecan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/ecan.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/ecan.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/ecan.p1: > ${OBJECTDIR}/mcc_generated_files/ecan.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/ecan.dep >> ${OBJECTDIR}/mcc_generated_files/ecan.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/ecan.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/adc.p1: mcc_generated_files/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/adc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/adc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/adc.p1: > ${OBJECTDIR}/mcc_generated_files/adc.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/adc.dep >> ${OBJECTDIR}/mcc_generated_files/adc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/adc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/device_config.p1: mcc_generated_files/device_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/device_config.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/device_config.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/device_config.p1: > ${OBJECTDIR}/mcc_generated_files/device_config.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/device_config.dep >> ${OBJECTDIR}/mcc_generated_files/device_config.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/device_config.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: mcc_generated_files/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/interrupt_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/interrupt_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1: > ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/interrupt_manager.dep >> ${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/interrupt_manager.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/mcc.p1: mcc_generated_files/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/mcc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/mcc.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/mcc.p1: > ${OBJECTDIR}/mcc_generated_files/mcc.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/mcc.dep >> ${OBJECTDIR}/mcc_generated_files/mcc.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/mcc.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pin_manager.p1: mcc_generated_files/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pin_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pin_manager.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pin_manager.p1: > ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pin_manager.dep >> ${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pin_manager.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/tmr1.p1: mcc_generated_files/tmr1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/tmr1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/tmr1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/tmr1.p1: > ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/tmr1.dep >> ${OBJECTDIR}/mcc_generated_files/tmr1.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/tmr1.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/memory.p1: mcc_generated_files/memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/memory.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/memory.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/memory.p1: > ${OBJECTDIR}/mcc_generated_files/memory.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/memory.dep >> ${OBJECTDIR}/mcc_generated_files/memory.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/memory.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/J1939.p1: src/J1939.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/J1939.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/J1939.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/J1939.p1: > ${OBJECTDIR}/src/J1939.p1.d
	@cat ${OBJECTDIR}/src/J1939.dep >> ${OBJECTDIR}/src/J1939.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/J1939.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/main.p1: > ${OBJECTDIR}/src/main.p1.d
	@cat ${OBJECTDIR}/src/main.dep >> ${OBJECTDIR}/src/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/main.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/lcd.p1: src/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	${MP_CC} --pass1 src/lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  src/lcd.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\src" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/src/lcd.p1: > ${OBJECTDIR}/src/lcd.p1.d
	@cat ${OBJECTDIR}/src/lcd.dep >> ${OBJECTDIR}/src/lcd.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/lcd.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1: mcc_generated_files/pic18f_bootload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pic18f_bootload.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pic18f_bootload.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1: > ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.dep >> ${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pic18f_bootload.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1: mcc_generated_files/pic18f_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/pic18f_uart.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/pic18f_uart.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1: > ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/pic18f_uart.dep >> ${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/pic18f_uart.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/mcc_generated_files/eusart1.p1: mcc_generated_files/eusart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	${MP_CC} --pass1 mcc_generated_files/eusart1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@${MP_CC} --scandep  mcc_generated_files/eusart1.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir="${OBJECTDIR}\mcc_generated_files" -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 --cp=16 -Blarge --double=32  --mode=pro -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  
	@echo ${OBJECTDIR}/mcc_generated_files/eusart1.p1: > ${OBJECTDIR}/mcc_generated_files/eusart1.p1.d
	@cat ${OBJECTDIR}/mcc_generated_files/eusart1.dep >> ${OBJECTDIR}/mcc_generated_files/eusart1.p1.d
	@${FIXDEPS} "${OBJECTDIR}/mcc_generated_files/eusart1.p1.d" $(SILENT) -ht  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -D__DEBUG --debugger=realice -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --cp=16 -Blarge --double=32  --mode=pro  --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s" ${OBJECTFILES_QUOTED_IF_SPACED}    
	${RM} dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.hex
else
dist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/v1.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,+keep,-download,+stackwarn,-config,+clib,-plib --opt=all,+asm,+asmfile,+speed,-space,9 -P -N31 -I"inc" -I"mcc_generated_files" --warn=0 --cp=16 -Blarge --double=32  --mode=pro  --output=default,-inhx032 -g --asmlist "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s" ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
