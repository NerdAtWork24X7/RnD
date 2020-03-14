//3.5.3.24714                                                                      
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
                                                                                   
/************************************************************************/
/* Header file generated from device file:                              */
/*    DR5F10BGC.DVF                                                     */
/*    V1.11 (2015/07/09)                                                */
/*    Copyright(C) 2015 Renesas                                         */
/* Tool Version: 3.5.3                                                  */
/* Date Generated: 2016/02/17                                           */
/************************************************************************/

#ifndef __INTRINSIC_FUNCTIONS
#define __INTRINSIC_FUNCTIONS

#define DI() asm("di")
#define EI() asm("ei")
#define HALT() asm("halt")
#define NOP() asm("nop")
#define STOP() asm("stop")

#endif

#ifndef __IOREG_BIT_STRUCTURES
#define __IOREG_BIT_STRUCTURES
typedef struct {
	unsigned char no0 :1;
	unsigned char no1 :1;
	unsigned char no2 :1;
	unsigned char no3 :1;
	unsigned char no4 :1;
	unsigned char no5 :1;
	unsigned char no6 :1;
	unsigned char no7 :1;
} __BITS8;

typedef struct {
	unsigned short no0 :1;
	unsigned short no1 :1;
	unsigned short no2 :1;
	unsigned short no3 :1;
	unsigned short no4 :1;
	unsigned short no5 :1;
	unsigned short no6 :1;
	unsigned short no7 :1;
	unsigned short no8 :1;
	unsigned short no9 :1;
	unsigned short no10 :1;
	unsigned short no11 :1;
	unsigned short no12 :1;
	unsigned short no13 :1;
	unsigned short no14 :1;
	unsigned short no15 :1;
} __BITS16;

#endif

#ifndef IODEFINE_EXT_H
#define IODEFINE_EXT_H

/*
 IO Registers
 */
union un_adm2 {
	unsigned char adm2;
	__BITS8 BIT;
};
union un_pithl1 {
	unsigned char pithl1;
	__BITS8 BIT;
};
union un_pithl3 {
	unsigned char pithl3;
	__BITS8 BIT;
};
union un_pithl6 {
	unsigned char pithl6;
	__BITS8 BIT;
};
union un_pithl7 {
	unsigned char pithl7;
	__BITS8 BIT;
};
union un_pithl12 {
	unsigned char pithl12;
	__BITS8 BIT;
};
union un_pu0 {
	unsigned char pu0;
	__BITS8 BIT;
};
union un_pu1 {
	unsigned char pu1;
	__BITS8 BIT;
};
union un_pu3 {
	unsigned char pu3;
	__BITS8 BIT;
};
union un_pu4 {
	unsigned char pu4;
	__BITS8 BIT;
};
union un_pu6 {
	unsigned char pu6;
	__BITS8 BIT;
};
union un_pu7 {
	unsigned char pu7;
	__BITS8 BIT;
};
union un_pu12 {
	unsigned char pu12;
	__BITS8 BIT;
};
union un_pu14 {
	unsigned char pu14;
	__BITS8 BIT;
};
union un_pim1 {
	unsigned char pim1;
	__BITS8 BIT;
};
union un_pim3 {
	unsigned char pim3;
	__BITS8 BIT;
};
union un_pim6 {
	unsigned char pim6;
	__BITS8 BIT;
};
union un_pim7 {
	unsigned char pim7;
	__BITS8 BIT;
};
union un_pim12 {
	unsigned char pim12;
	__BITS8 BIT;
};
union un_pom1 {
	unsigned char pom1;
	__BITS8 BIT;
};
union un_pom6 {
	unsigned char pom6;
	__BITS8 BIT;
};
union un_pom7 {
	unsigned char pom7;
	__BITS8 BIT;
};
union un_pom12 {
	unsigned char pom12;
	__BITS8 BIT;
};
union un_pmc12 {
	unsigned char pmc12;
	__BITS8 BIT;
};
union un_nfen0 {
	unsigned char nfen0;
	__BITS8 BIT;
};
union un_nfen1 {
	unsigned char nfen1;
	__BITS8 BIT;
};
union un_nfen2 {
	unsigned char nfen2;
	__BITS8 BIT;
};
union un_isc {
	unsigned char isc;
	__BITS8 BIT;
};
union un_pms {
	unsigned char pms;
	__BITS8 BIT;
};
union un_dflctl {
	unsigned char dflctl;
	__BITS8 BIT;
};
union un_per0 {
	unsigned char per0;
	__BITS8 BIT;
};
union un_se0l {
	unsigned char se0l;
	__BITS8 BIT;
};
union un_ss0l {
	unsigned char ss0l;
	__BITS8 BIT;
};
union un_st0l {
	unsigned char st0l;
	__BITS8 BIT;
};
union un_soe0l {
	unsigned char soe0l;
	__BITS8 BIT;
};
union un_se1l {
	unsigned char se1l;
	__BITS8 BIT;
};
union un_ss1l {
	unsigned char ss1l;
	__BITS8 BIT;
};
union un_st1l {
	unsigned char st1l;
	__BITS8 BIT;
};
union un_soe1l {
	unsigned char soe1l;
	__BITS8 BIT;
};
union un_te0l {
	unsigned char te0l;
	__BITS8 BIT;
};
union un_ts0l {
	unsigned char ts0l;
	__BITS8 BIT;
};
union un_tt0l {
	unsigned char tt0l;
	__BITS8 BIT;
};
union un_toe0l {
	unsigned char toe0l;
	__BITS8 BIT;
};
union un_te1l {
	unsigned char te1l;
	__BITS8 BIT;
};
union un_ts1l {
	unsigned char ts1l;
	__BITS8 BIT;
};
union un_tt1l {
	unsigned char tt1l;
	__BITS8 BIT;
};
union un_toe1l {
	unsigned char toe1l;
	__BITS8 BIT;
};
union un_psrsel {
	unsigned char psrsel;
	__BITS8 BIT;
};
union un_psnzcnt0 {
	unsigned char psnzcnt0;
	__BITS8 BIT;
};
union un_psnzcnt1 {
	unsigned char psnzcnt1;
	__BITS8 BIT;
};
union un_psnzcnt2 {
	unsigned char psnzcnt2;
	__BITS8 BIT;
};
union un_psnzcnt3 {
	unsigned char psnzcnt3;
	__BITS8 BIT;
};
union un_iicctl00 {
	unsigned char iicctl00;
	__BITS8 BIT;
};
union un_iicctl01 {
	unsigned char iicctl01;
	__BITS8 BIT;
};
union un_trjioc0 {
	unsigned char trjioc0;
	__BITS8 BIT;
};
union un_trjmr0 {
	unsigned char trjmr0;
	__BITS8 BIT;
};
union un_trjisr0 {
	unsigned char trjisr0;
	__BITS8 BIT;
};
union un_trdmr {
	unsigned char trdmr;
	__BITS8 BIT;
};
union un_trdpmr {
	unsigned char trdpmr;
	__BITS8 BIT;
};
union un_trdfcr {
	unsigned char trdfcr;
	__BITS8 BIT;
};
union un_trdoer1 {
	unsigned char trdoer1;
	__BITS8 BIT;
};
union un_trdoer2 {
	unsigned char trdoer2;
	__BITS8 BIT;
};
union un_trdocr {
	unsigned char trdocr;
	__BITS8 BIT;
};
union un_trddf0 {
	unsigned char trddf0;
	__BITS8 BIT;
};
union un_trddf1 {
	unsigned char trddf1;
	__BITS8 BIT;
};
union un_trdcr0 {
	unsigned char trdcr0;
	__BITS8 BIT;
};
union un_trdiora0 {
	unsigned char trdiora0;
	__BITS8 BIT;
};
union un_trdiorc0 {
	unsigned char trdiorc0;
	__BITS8 BIT;
};
union un_trdsr0 {
	unsigned char trdsr0;
	__BITS8 BIT;
};
union un_trdier0 {
	unsigned char trdier0;
	__BITS8 BIT;
};
union un_trdpocr0 {
	unsigned char trdpocr0;
	__BITS8 BIT;
};
union un_trdcr1 {
	unsigned char trdcr1;
	__BITS8 BIT;
};
union un_trdiora1 {
	unsigned char trdiora1;
	__BITS8 BIT;
};
union un_trdiorc1 {
	unsigned char trdiorc1;
	__BITS8 BIT;
};
union un_trdsr1 {
	unsigned char trdsr1;
	__BITS8 BIT;
};
union un_trdier1 {
	unsigned char trdier1;
	__BITS8 BIT;
};
union un_trdpocr1 {
	unsigned char trdpocr1;
	__BITS8 BIT;
};
union un_per1 {
	unsigned char per1;
	__BITS8 BIT;
};
union un_per2 {
	unsigned char per2;
	__BITS8 BIT;
};
union un_cancksel {
	unsigned char cancksel;
	__BITS8 BIT;
};
union un_lincksel {
	unsigned char lincksel;
	__BITS8 BIT;
};
union un_cksel {
	unsigned char cksel;
	__BITS8 BIT;
};
union un_pllctl {
	unsigned char pllctl;
	__BITS8 BIT;
};
union un_pllsts {
	unsigned char pllsts;
	__BITS8 BIT;
};
union un_rtccl {
	unsigned char rtccl;
	__BITS8 BIT;
};
union un_pocres {
	unsigned char pocres;
	__BITS8 BIT;
};
union un_stpstc {
	unsigned char stpstc;
	__BITS8 BIT;
};
union un_hdtccr0 {
	unsigned char hdtccr0;
	__BITS8 BIT;
};
union un_hdtcct0 {
	unsigned char hdtcct0;
	__BITS8 BIT;
};
union un_hdtrld0 {
	unsigned char hdtrld0;
	__BITS8 BIT;
};
union un_hdtccr1 {
	unsigned char hdtccr1;
	__BITS8 BIT;
};
union un_hdtcct1 {
	unsigned char hdtcct1;
	__BITS8 BIT;
};
union un_hdtrld1 {
	unsigned char hdtrld1;
	__BITS8 BIT;
};
union un_selhs0 {
	unsigned char selhs0;
	__BITS8 BIT;
};
union un_selhs1 {
	unsigned char selhs1;
	__BITS8 BIT;
};
union un_dtcen0 {
	unsigned char dtcen0;
	__BITS8 BIT;
};
union un_dtcen1 {
	unsigned char dtcen1;
	__BITS8 BIT;
};
union un_dtcen2 {
	unsigned char dtcen2;
	__BITS8 BIT;
};
union un_dtcen3 {
	unsigned char dtcen3;
	__BITS8 BIT;
};
union un_dtcen4 {
	unsigned char dtcen4;
	__BITS8 BIT;
};
union un_crc0ctl {
	unsigned char crc0ctl;
	__BITS8 BIT;
};
union un_adtrgs0 {
	unsigned char adtrgs0;
	__BITS8 BIT;
};
union un_adtrgs1 {
	unsigned char adtrgs1;
	__BITS8 BIT;
};

#define ADM2 (*(volatile union un_adm2 *)0xF0010).adm2
#define ADM2_bit (*(volatile union un_adm2 *)0xF0010).BIT
#define ADUL (*(volatile unsigned char *)0xF0011)
#define ADLL (*(volatile unsigned char *)0xF0012)
#define ADTES (*(volatile unsigned char *)0xF0013)
#define PIOR0 (*(volatile unsigned char *)0xF0016)
#define PIOR1 (*(volatile unsigned char *)0xF0017)
#define PIOR4 (*(volatile unsigned char *)0xF001A)
#define PIOR5 (*(volatile unsigned char *)0xF001B)
#define PIOR7 (*(volatile unsigned char *)0xF001D)
#define PITHL1 (*(volatile union un_pithl1 *)0xF0021).pithl1
#define PITHL1_bit (*(volatile union un_pithl1 *)0xF0021).BIT
#define PITHL3 (*(volatile union un_pithl3 *)0xF0023).pithl3
#define PITHL3_bit (*(volatile union un_pithl3 *)0xF0023).BIT
#define PITHL6 (*(volatile union un_pithl6 *)0xF0026).pithl6
#define PITHL6_bit (*(volatile union un_pithl6 *)0xF0026).BIT
#define PITHL7 (*(volatile union un_pithl7 *)0xF0027).pithl7
#define PITHL7_bit (*(volatile union un_pithl7 *)0xF0027).BIT
#define PITHL12 (*(volatile union un_pithl12 *)0xF002C).pithl12
#define PITHL12_bit (*(volatile union un_pithl12 *)0xF002C).BIT
#define PU0 (*(volatile union un_pu0 *)0xF0030).pu0
#define PU0_bit (*(volatile union un_pu0 *)0xF0030).BIT
#define PU1 (*(volatile union un_pu1 *)0xF0031).pu1
#define PU1_bit (*(volatile union un_pu1 *)0xF0031).BIT
#define PU3 (*(volatile union un_pu3 *)0xF0033).pu3
#define PU3_bit (*(volatile union un_pu3 *)0xF0033).BIT
#define PU4 (*(volatile union un_pu4 *)0xF0034).pu4
#define PU4_bit (*(volatile union un_pu4 *)0xF0034).BIT
#define PU6 (*(volatile union un_pu6 *)0xF0036).pu6
#define PU6_bit (*(volatile union un_pu6 *)0xF0036).BIT
#define PU7 (*(volatile union un_pu7 *)0xF0037).pu7
#define PU7_bit (*(volatile union un_pu7 *)0xF0037).BIT
#define PU12 (*(volatile union un_pu12 *)0xF003C).pu12
#define PU12_bit (*(volatile union un_pu12 *)0xF003C).BIT
#define PU14 (*(volatile union un_pu14 *)0xF003E).pu14
#define PU14_bit (*(volatile union un_pu14 *)0xF003E).BIT
#define PIM1 (*(volatile union un_pim1 *)0xF0041).pim1
#define PIM1_bit (*(volatile union un_pim1 *)0xF0041).BIT
#define PIM3 (*(volatile union un_pim3 *)0xF0043).pim3
#define PIM3_bit (*(volatile union un_pim3 *)0xF0043).BIT
#define PIM6 (*(volatile union un_pim6 *)0xF0046).pim6
#define PIM6_bit (*(volatile union un_pim6 *)0xF0046).BIT
#define PIM7 (*(volatile union un_pim7 *)0xF0047).pim7
#define PIM7_bit (*(volatile union un_pim7 *)0xF0047).BIT
#define PIM12 (*(volatile union un_pim12 *)0xF004C).pim12
#define PIM12_bit (*(volatile union un_pim12 *)0xF004C).BIT
#define POM1 (*(volatile union un_pom1 *)0xF0051).pom1
#define POM1_bit (*(volatile union un_pom1 *)0xF0051).BIT
#define POM6 (*(volatile union un_pom6 *)0xF0056).pom6
#define POM6_bit (*(volatile union un_pom6 *)0xF0056).BIT
#define POM7 (*(volatile union un_pom7 *)0xF0057).pom7
#define POM7_bit (*(volatile union un_pom7 *)0xF0057).BIT
#define POM12 (*(volatile union un_pom12 *)0xF005C).pom12
#define POM12_bit (*(volatile union un_pom12 *)0xF005C).BIT
#define PMC12 (*(volatile union un_pmc12 *)0xF006C).pmc12
#define PMC12_bit (*(volatile union un_pmc12 *)0xF006C).BIT
#define NFEN0 (*(volatile union un_nfen0 *)0xF0070).nfen0
#define NFEN0_bit (*(volatile union un_nfen0 *)0xF0070).BIT
#define NFEN1 (*(volatile union un_nfen1 *)0xF0071).nfen1
#define NFEN1_bit (*(volatile union un_nfen1 *)0xF0071).BIT
#define NFEN2 (*(volatile union un_nfen2 *)0xF0072).nfen2
#define NFEN2_bit (*(volatile union un_nfen2 *)0xF0072).BIT
#define ISC (*(volatile union un_isc *)0xF0073).isc
#define ISC_bit (*(volatile union un_isc *)0xF0073).BIT
#define TIS0 (*(volatile unsigned char *)0xF0074)
#define TIS1 (*(volatile unsigned char *)0xF0075)
#define ADPC (*(volatile unsigned char *)0xF0076)
#define PMS (*(volatile union un_pms *)0xF0077).pms
#define PMS_bit (*(volatile union un_pms *)0xF0077).BIT
#define IAWCTL (*(volatile unsigned char *)0xF0078)
#define INTFLG0 (*(volatile unsigned char *)0xF0079)
#define LCHSEL (*(volatile unsigned char *)0xF007B)
#define INTMSK (*(volatile unsigned char *)0xF007C)
#define DFLCTL (*(volatile union un_dflctl *)0xF0090).dflctl
#define DFLCTL_bit (*(volatile union un_dflctl *)0xF0090).BIT
#define HIOTRM (*(volatile unsigned char *)0xF00A0)
#define HOCODIV (*(volatile unsigned char *)0xF00A8)
#define SPMCTRL (*(volatile unsigned char *)0xF00D8)
#define SPOFR (*(volatile unsigned short *)0xF00DA)
#define SPUFR (*(volatile unsigned short *)0xF00DC)
#define PER0 (*(volatile union un_per0 *)0xF00F0).per0
#define PER0_bit (*(volatile union un_per0 *)0xF00F0).BIT
#define OSMC (*(volatile unsigned char *)0xF00F3)
#define BCDADJ (*(volatile unsigned char *)0xF00FE)
#define SSR00 (*(volatile unsigned short *)0xF0100)
#define SSR00L (*(volatile unsigned char *)0xF0100)
#define SSR01 (*(volatile unsigned short *)0xF0102)
#define SSR01L (*(volatile unsigned char *)0xF0102)
#define SIR00 (*(volatile unsigned short *)0xF0104)
#define SIR00L (*(volatile unsigned char *)0xF0104)
#define SIR01 (*(volatile unsigned short *)0xF0106)
#define SIR01L (*(volatile unsigned char *)0xF0106)
#define SMR00 (*(volatile unsigned short *)0xF0108)
#define SMR01 (*(volatile unsigned short *)0xF010A)
#define SCR00 (*(volatile unsigned short *)0xF010C)
#define SCR01 (*(volatile unsigned short *)0xF010E)
#define SE0 (*(volatile unsigned short *)0xF0110)
#define SE0L (*(volatile union un_se0l *)0xF0110).se0l
#define SE0L_bit (*(volatile union un_se0l *)0xF0110).BIT
#define SS0 (*(volatile unsigned short *)0xF0112)
#define SS0L (*(volatile union un_ss0l *)0xF0112).ss0l
#define SS0L_bit (*(volatile union un_ss0l *)0xF0112).BIT
#define ST0 (*(volatile unsigned short *)0xF0114)
#define ST0L (*(volatile union un_st0l *)0xF0114).st0l
#define ST0L_bit (*(volatile union un_st0l *)0xF0114).BIT
#define SPS0 (*(volatile unsigned short *)0xF0116)
#define SPS0L (*(volatile unsigned char *)0xF0116)
#define SO0 (*(volatile unsigned short *)0xF0118)
#define SOE0 (*(volatile unsigned short *)0xF011A)
#define SOE0L (*(volatile union un_soe0l *)0xF011A).soe0l
#define SOE0L_bit (*(volatile union un_soe0l *)0xF011A).BIT
#define SOL0 (*(volatile unsigned short *)0xF0120)
#define SOL0L (*(volatile unsigned char *)0xF0120)
#define SSE0 (*(volatile unsigned short *)0xF0122)
#define SSE0L (*(volatile unsigned char *)0xF0122)
#define SSR10 (*(volatile unsigned short *)0xF0140)
#define SSR10L (*(volatile unsigned char *)0xF0140)
#define SSR11 (*(volatile unsigned short *)0xF0142)
#define SSR11L (*(volatile unsigned char *)0xF0142)
#define SIR10 (*(volatile unsigned short *)0xF0144)
#define SIR10L (*(volatile unsigned char *)0xF0144)
#define SIR11 (*(volatile unsigned short *)0xF0146)
#define SIR11L (*(volatile unsigned char *)0xF0146)
#define SMR10 (*(volatile unsigned short *)0xF0148)
#define SMR11 (*(volatile unsigned short *)0xF014A)
#define SCR10 (*(volatile unsigned short *)0xF014C)
#define SCR11 (*(volatile unsigned short *)0xF014E)
#define SE1 (*(volatile unsigned short *)0xF0150)
#define SE1L (*(volatile union un_se1l *)0xF0150).se1l
#define SE1L_bit (*(volatile union un_se1l *)0xF0150).BIT
#define SS1 (*(volatile unsigned short *)0xF0152)
#define SS1L (*(volatile union un_ss1l *)0xF0152).ss1l
#define SS1L_bit (*(volatile union un_ss1l *)0xF0152).BIT
#define ST1 (*(volatile unsigned short *)0xF0154)
#define ST1L (*(volatile union un_st1l *)0xF0154).st1l
#define ST1L_bit (*(volatile union un_st1l *)0xF0154).BIT
#define SPS1 (*(volatile unsigned short *)0xF0156)
#define SPS1L (*(volatile unsigned char *)0xF0156)
#define SO1 (*(volatile unsigned short *)0xF0158)
#define SOE1 (*(volatile unsigned short *)0xF015A)
#define SOE1L (*(volatile union un_soe1l *)0xF015A).soe1l
#define SOE1L_bit (*(volatile union un_soe1l *)0xF015A).BIT
#define SOL1 (*(volatile unsigned short *)0xF0160)
#define SOL1L (*(volatile unsigned char *)0xF0160)
#define SSE1 (*(volatile unsigned short *)0xF0162)
#define SSE1L (*(volatile unsigned char *)0xF0162)
#define TCR00 (*(volatile unsigned short *)0xF0180)
#define TCR01 (*(volatile unsigned short *)0xF0182)
#define TCR02 (*(volatile unsigned short *)0xF0184)
#define TCR03 (*(volatile unsigned short *)0xF0186)
#define TCR04 (*(volatile unsigned short *)0xF0188)
#define TCR05 (*(volatile unsigned short *)0xF018A)
#define TCR06 (*(volatile unsigned short *)0xF018C)
#define TCR07 (*(volatile unsigned short *)0xF018E)
#define TMR00 (*(volatile unsigned short *)0xF0190)
#define TMR01 (*(volatile unsigned short *)0xF0192)
#define TMR02 (*(volatile unsigned short *)0xF0194)
#define TMR03 (*(volatile unsigned short *)0xF0196)
#define TMR04 (*(volatile unsigned short *)0xF0198)
#define TMR05 (*(volatile unsigned short *)0xF019A)
#define TMR06 (*(volatile unsigned short *)0xF019C)
#define TMR07 (*(volatile unsigned short *)0xF019E)
#define TSR00 (*(volatile unsigned short *)0xF01A0)
#define TSR00L (*(volatile unsigned char *)0xF01A0)
#define TSR01 (*(volatile unsigned short *)0xF01A2)
#define TSR01L (*(volatile unsigned char *)0xF01A2)
#define TSR02 (*(volatile unsigned short *)0xF01A4)
#define TSR02L (*(volatile unsigned char *)0xF01A4)
#define TSR03 (*(volatile unsigned short *)0xF01A6)
#define TSR03L (*(volatile unsigned char *)0xF01A6)
#define TSR04 (*(volatile unsigned short *)0xF01A8)
#define TSR04L (*(volatile unsigned char *)0xF01A8)
#define TSR05 (*(volatile unsigned short *)0xF01AA)
#define TSR05L (*(volatile unsigned char *)0xF01AA)
#define TSR06 (*(volatile unsigned short *)0xF01AC)
#define TSR06L (*(volatile unsigned char *)0xF01AC)
#define TSR07 (*(volatile unsigned short *)0xF01AE)
#define TSR07L (*(volatile unsigned char *)0xF01AE)
#define TE0 (*(volatile unsigned short *)0xF01B0)
#define TE0L (*(volatile union un_te0l *)0xF01B0).te0l
#define TE0L_bit (*(volatile union un_te0l *)0xF01B0).BIT
#define TS0 (*(volatile unsigned short *)0xF01B2)
#define TS0L (*(volatile union un_ts0l *)0xF01B2).ts0l
#define TS0L_bit (*(volatile union un_ts0l *)0xF01B2).BIT
#define TT0 (*(volatile unsigned short *)0xF01B4)
#define TT0L (*(volatile union un_tt0l *)0xF01B4).tt0l
#define TT0L_bit (*(volatile union un_tt0l *)0xF01B4).BIT
#define TPS0 (*(volatile unsigned short *)0xF01B6)
#define TO0 (*(volatile unsigned short *)0xF01B8)
#define TO0L (*(volatile unsigned char *)0xF01B8)
#define TOE0 (*(volatile unsigned short *)0xF01BA)
#define TOE0L (*(volatile union un_toe0l *)0xF01BA).toe0l
#define TOE0L_bit (*(volatile union un_toe0l *)0xF01BA).BIT
#define TOL0 (*(volatile unsigned short *)0xF01BC)
#define TOL0L (*(volatile unsigned char *)0xF01BC)
#define TOM0 (*(volatile unsigned short *)0xF01BE)
#define TOM0L (*(volatile unsigned char *)0xF01BE)
#define TCR10 (*(volatile unsigned short *)0xF01C0)
#define TCR11 (*(volatile unsigned short *)0xF01C2)
#define TCR12 (*(volatile unsigned short *)0xF01C4)
#define TCR13 (*(volatile unsigned short *)0xF01C6)
#define TMR10 (*(volatile unsigned short *)0xF01D0)
#define TMR11 (*(volatile unsigned short *)0xF01D2)
#define TMR12 (*(volatile unsigned short *)0xF01D4)
#define TMR13 (*(volatile unsigned short *)0xF01D6)
#define TSR10 (*(volatile unsigned short *)0xF01E0)
#define TSR10L (*(volatile unsigned char *)0xF01E0)
#define TSR11 (*(volatile unsigned short *)0xF01E2)
#define TSR11L (*(volatile unsigned char *)0xF01E2)
#define TSR12 (*(volatile unsigned short *)0xF01E4)
#define TSR12L (*(volatile unsigned char *)0xF01E4)
#define TSR13 (*(volatile unsigned short *)0xF01E6)
#define TSR13L (*(volatile unsigned char *)0xF01E6)
#define TE1 (*(volatile unsigned short *)0xF01F0)
#define TE1L (*(volatile union un_te1l *)0xF01F0).te1l
#define TE1L_bit (*(volatile union un_te1l *)0xF01F0).BIT
#define TS1 (*(volatile unsigned short *)0xF01F2)
#define TS1L (*(volatile union un_ts1l *)0xF01F2).ts1l
#define TS1L_bit (*(volatile union un_ts1l *)0xF01F2).BIT
#define TT1 (*(volatile unsigned short *)0xF01F4)
#define TT1L (*(volatile union un_tt1l *)0xF01F4).tt1l
#define TT1L_bit (*(volatile union un_tt1l *)0xF01F4).BIT
#define TPS1 (*(volatile unsigned short *)0xF01F6)
#define TO1 (*(volatile unsigned short *)0xF01F8)
#define TO1L (*(volatile unsigned char *)0xF01F8)
#define TOE1 (*(volatile unsigned short *)0xF01FA)
#define TOE1L (*(volatile union un_toe1l *)0xF01FA).toe1l
#define TOE1L_bit (*(volatile union un_toe1l *)0xF01FA).BIT
#define TOL1 (*(volatile unsigned short *)0xF01FC)
#define TOL1L (*(volatile unsigned char *)0xF01FC)
#define TOM1 (*(volatile unsigned short *)0xF01FE)
#define TOM1L (*(volatile unsigned char *)0xF01FE)
#define ERADR (*(volatile unsigned short *)0xF0200)
#define ECCIER (*(volatile unsigned char *)0xF0202)
#define ECCER (*(volatile unsigned char *)0xF0203)
#define ECCTPR (*(volatile unsigned char *)0xF0204)
#define ECCTMDR (*(volatile unsigned char *)0xF0205)
#define ECCDWRVR (*(volatile unsigned short *)0xF0206)
#define PSRSEL (*(volatile union un_psrsel *)0xF0220).psrsel
#define PSRSEL_bit (*(volatile union un_psrsel *)0xF0220).BIT
#define PSNZCNT0 (*(volatile union un_psnzcnt0 *)0xF0222).psnzcnt0
#define PSNZCNT0_bit (*(volatile union un_psnzcnt0 *)0xF0222).BIT
#define PSNZCNT1 (*(volatile union un_psnzcnt1 *)0xF0223).psnzcnt1
#define PSNZCNT1_bit (*(volatile union un_psnzcnt1 *)0xF0223).BIT
#define PSNZCNT2 (*(volatile union un_psnzcnt2 *)0xF0224).psnzcnt2
#define PSNZCNT2_bit (*(volatile union un_psnzcnt2 *)0xF0224).BIT
#define PSNZCNT3 (*(volatile union un_psnzcnt3 *)0xF0225).psnzcnt3
#define PSNZCNT3_bit (*(volatile union un_psnzcnt3 *)0xF0225).BIT
#define PWMDLY0 (*(volatile unsigned short *)0xF0228)
#define PWMDLY1 (*(volatile unsigned short *)0xF022A)
#define PWMDLY2 (*(volatile unsigned short *)0xF022C)
#define IICCTL00 (*(volatile union un_iicctl00 *)0xF0230).iicctl00
#define IICCTL00_bit (*(volatile union un_iicctl00 *)0xF0230).BIT
#define IICCTL01 (*(volatile union un_iicctl01 *)0xF0231).iicctl01
#define IICCTL01_bit (*(volatile union un_iicctl01 *)0xF0231).BIT
#define IICWL0 (*(volatile unsigned char *)0xF0232)
#define IICWH0 (*(volatile unsigned char *)0xF0233)
#define SVA0 (*(volatile unsigned char *)0xF0234)
#define TRJCR0 (*(volatile unsigned char *)0xF0240)
#define TRJIOC0 (*(volatile union un_trjioc0 *)0xF0241).trjioc0
#define TRJIOC0_bit (*(volatile union un_trjioc0 *)0xF0241).BIT
#define TRJMR0 (*(volatile union un_trjmr0 *)0xF0242).trjmr0
#define TRJMR0_bit (*(volatile union un_trjmr0 *)0xF0242).BIT
#define TRJISR0 (*(volatile union un_trjisr0 *)0xF0243).trjisr0
#define TRJISR0_bit (*(volatile union un_trjisr0 *)0xF0243).BIT
#define TRDSTR (*(volatile unsigned char *)0xF0263)
#define TRDMR (*(volatile union un_trdmr *)0xF0264).trdmr
#define TRDMR_bit (*(volatile union un_trdmr *)0xF0264).BIT
#define TRDPMR (*(volatile union un_trdpmr *)0xF0265).trdpmr
#define TRDPMR_bit (*(volatile union un_trdpmr *)0xF0265).BIT
#define TRDFCR (*(volatile union un_trdfcr *)0xF0266).trdfcr
#define TRDFCR_bit (*(volatile union un_trdfcr *)0xF0266).BIT
#define TRDOER1 (*(volatile union un_trdoer1 *)0xF0267).trdoer1
#define TRDOER1_bit (*(volatile union un_trdoer1 *)0xF0267).BIT
#define TRDOER2 (*(volatile union un_trdoer2 *)0xF0268).trdoer2
#define TRDOER2_bit (*(volatile union un_trdoer2 *)0xF0268).BIT
#define TRDOCR (*(volatile union un_trdocr *)0xF0269).trdocr
#define TRDOCR_bit (*(volatile union un_trdocr *)0xF0269).BIT
#define TRDDF0 (*(volatile union un_trddf0 *)0xF026A).trddf0
#define TRDDF0_bit (*(volatile union un_trddf0 *)0xF026A).BIT
#define TRDDF1 (*(volatile union un_trddf1 *)0xF026B).trddf1
#define TRDDF1_bit (*(volatile union un_trddf1 *)0xF026B).BIT
#define TRDCR0 (*(volatile union un_trdcr0 *)0xF0270).trdcr0
#define TRDCR0_bit (*(volatile union un_trdcr0 *)0xF0270).BIT
#define TRDIORA0 (*(volatile union un_trdiora0 *)0xF0271).trdiora0
#define TRDIORA0_bit (*(volatile union un_trdiora0 *)0xF0271).BIT
#define TRDIORC0 (*(volatile union un_trdiorc0 *)0xF0272).trdiorc0
#define TRDIORC0_bit (*(volatile union un_trdiorc0 *)0xF0272).BIT
#define TRDSR0 (*(volatile union un_trdsr0 *)0xF0273).trdsr0
#define TRDSR0_bit (*(volatile union un_trdsr0 *)0xF0273).BIT
#define TRDIER0 (*(volatile union un_trdier0 *)0xF0274).trdier0
#define TRDIER0_bit (*(volatile union un_trdier0 *)0xF0274).BIT
#define TRDPOCR0 (*(volatile union un_trdpocr0 *)0xF0275).trdpocr0
#define TRDPOCR0_bit (*(volatile union un_trdpocr0 *)0xF0275).BIT
#define TRD0 (*(volatile unsigned short *)0xF0276)
#define TRDGRA0 (*(volatile unsigned short *)0xF0278)
#define TRDGRB0 (*(volatile unsigned short *)0xF027A)
#define TRDCR1 (*(volatile union un_trdcr1 *)0xF0280).trdcr1
#define TRDCR1_bit (*(volatile union un_trdcr1 *)0xF0280).BIT
#define TRDIORA1 (*(volatile union un_trdiora1 *)0xF0281).trdiora1
#define TRDIORA1_bit (*(volatile union un_trdiora1 *)0xF0281).BIT
#define TRDIORC1 (*(volatile union un_trdiorc1 *)0xF0282).trdiorc1
#define TRDIORC1_bit (*(volatile union un_trdiorc1 *)0xF0282).BIT
#define TRDSR1 (*(volatile union un_trdsr1 *)0xF0283).trdsr1
#define TRDSR1_bit (*(volatile union un_trdsr1 *)0xF0283).BIT
#define TRDIER1 (*(volatile union un_trdier1 *)0xF0284).trdier1
#define TRDIER1_bit (*(volatile union un_trdier1 *)0xF0284).BIT
#define TRDPOCR1 (*(volatile union un_trdpocr1 *)0xF0285).trdpocr1
#define TRDPOCR1_bit (*(volatile union un_trdpocr1 *)0xF0285).BIT
#define TRD1 (*(volatile unsigned short *)0xF0286)
#define TRDGRA1 (*(volatile unsigned short *)0xF0288)
#define TRDGRB1 (*(volatile unsigned short *)0xF028A)
#define PER1 (*(volatile union un_per1 *)0xF02C0).per1
#define PER1_bit (*(volatile union un_per1 *)0xF02C0).BIT
#define PER2 (*(volatile union un_per2 *)0xF02C1).per2
#define PER2_bit (*(volatile union un_per2 *)0xF02C1).BIT
#define CANCKSEL (*(volatile union un_cancksel *)0xF02C2).cancksel
#define CANCKSEL_bit (*(volatile union un_cancksel *)0xF02C2).BIT
#define LINCKSEL (*(volatile union un_lincksel *)0xF02C3).lincksel
#define LINCKSEL_bit (*(volatile union un_lincksel *)0xF02C3).BIT
#define CKSEL (*(volatile union un_cksel *)0xF02C4).cksel
#define CKSEL_bit (*(volatile union un_cksel *)0xF02C4).BIT
#define PLLCTL (*(volatile union un_pllctl *)0xF02C5).pllctl
#define PLLCTL_bit (*(volatile union un_pllctl *)0xF02C5).BIT
#define PLLSTS (*(volatile union un_pllsts *)0xF02C6).pllsts
#define PLLSTS_bit (*(volatile union un_pllsts *)0xF02C6).BIT
#define MDIV (*(volatile unsigned char *)0xF02C7)
#define RTCCL (*(volatile union un_rtccl *)0xF02C8).rtccl
#define RTCCL_bit (*(volatile union un_rtccl *)0xF02C8).BIT
#define POCRES (*(volatile union un_pocres *)0xF02C9).pocres
#define POCRES_bit (*(volatile union un_pocres *)0xF02C9).BIT
#define STPSTC (*(volatile union un_stpstc *)0xF02CA).stpstc
#define STPSTC_bit (*(volatile union un_stpstc *)0xF02CA).BIT
#define HDTCCR0 (*(volatile union un_hdtccr0 *)0xF02D0).hdtccr0
#define HDTCCR0_bit (*(volatile union un_hdtccr0 *)0xF02D0).BIT
#define HDTCCT0 (*(volatile union un_hdtcct0 *)0xF02D2).hdtcct0
#define HDTCCT0_bit (*(volatile union un_hdtcct0 *)0xF02D2).BIT
#define HDTRLD0 (*(volatile union un_hdtrld0 *)0xF02D3).hdtrld0
#define HDTRLD0_bit (*(volatile union un_hdtrld0 *)0xF02D3).BIT
#define HDTSAR0 (*(volatile unsigned short *)0xF02D4)
#define HDTDAR0 (*(volatile unsigned short *)0xF02D6)
#define HDTCCR1 (*(volatile union un_hdtccr1 *)0xF02D8).hdtccr1
#define HDTCCR1_bit (*(volatile union un_hdtccr1 *)0xF02D8).BIT
#define HDTCCT1 (*(volatile union un_hdtcct1 *)0xF02DA).hdtcct1
#define HDTCCT1_bit (*(volatile union un_hdtcct1 *)0xF02DA).BIT
#define HDTRLD1 (*(volatile union un_hdtrld1 *)0xF02DB).hdtrld1
#define HDTRLD1_bit (*(volatile union un_hdtrld1 *)0xF02DB).BIT
#define HDTSAR1 (*(volatile unsigned short *)0xF02DC)
#define HDTDAR1 (*(volatile unsigned short *)0xF02DE)
#define DTCBAR (*(volatile unsigned char *)0xF02E0)
#define SELHS0 (*(volatile union un_selhs0 *)0xF02E1).selhs0
#define SELHS0_bit (*(volatile union un_selhs0 *)0xF02E1).BIT
#define SELHS1 (*(volatile union un_selhs1 *)0xF02E2).selhs1
#define SELHS1_bit (*(volatile union un_selhs1 *)0xF02E2).BIT
#define DTCEN0 (*(volatile union un_dtcen0 *)0xF02E8).dtcen0
#define DTCEN0_bit (*(volatile union un_dtcen0 *)0xF02E8).BIT
#define DTCEN1 (*(volatile union un_dtcen1 *)0xF02E9).dtcen1
#define DTCEN1_bit (*(volatile union un_dtcen1 *)0xF02E9).BIT
#define DTCEN2 (*(volatile union un_dtcen2 *)0xF02EA).dtcen2
#define DTCEN2_bit (*(volatile union un_dtcen2 *)0xF02EA).BIT
#define DTCEN3 (*(volatile union un_dtcen3 *)0xF02EB).dtcen3
#define DTCEN3_bit (*(volatile union un_dtcen3 *)0xF02EB).BIT
#define DTCEN4 (*(volatile union un_dtcen4 *)0xF02EC).dtcen4
#define DTCEN4_bit (*(volatile union un_dtcen4 *)0xF02EC).BIT
#define CRC0CTL (*(volatile union un_crc0ctl *)0xF02F0).crc0ctl
#define CRC0CTL_bit (*(volatile union un_crc0ctl *)0xF02F0).BIT
#define PGCRCL (*(volatile unsigned short *)0xF02F2)
#define CRCMD (*(volatile unsigned char *)0xF02F9)
#define CRCD (*(volatile unsigned short *)0xF02FA)
#define C0CFGL (*(volatile unsigned short *)0xF0300)
#define C0CFGLL (*(volatile unsigned char *)0xF0300)
#define C0CFGLH (*(volatile unsigned char *)0xF0301)
#define C0CFGH (*(volatile unsigned short *)0xF0302)
#define C0CFGHL (*(volatile unsigned char *)0xF0302)
#define C0CFGHH (*(volatile unsigned char *)0xF0303)
#define C0CTRL (*(volatile unsigned short *)0xF0304)
#define C0CTRLL (*(volatile unsigned char *)0xF0304)
#define C0CTRLH (*(volatile unsigned char *)0xF0305)
#define C0CTRH (*(volatile unsigned short *)0xF0306)
#define C0CTRHL (*(volatile unsigned char *)0xF0306)
#define C0CTRHH (*(volatile unsigned char *)0xF0307)
#define C0STSL (*(volatile unsigned short *)0xF0308)
#define C0STSLL (*(volatile unsigned char *)0xF0308)
#define C0STSLH (*(volatile unsigned char *)0xF0309)
#define C0STSH (*(volatile unsigned short *)0xF030A)
#define C0STSHL (*(volatile unsigned char *)0xF030A)
#define C0STSHH (*(volatile unsigned char *)0xF030B)
#define C0ERFLL (*(volatile unsigned short *)0xF030C)
#define C0ERFLLL (*(volatile unsigned char *)0xF030C)
#define C0ERFLLH (*(volatile unsigned char *)0xF030D)
#define C0ERFLH (*(volatile unsigned short *)0xF030E)
#define C0ERFLHL (*(volatile unsigned char *)0xF030E)
#define C0ERFLHH (*(volatile unsigned char *)0xF030F)
#define GCFGL (*(volatile unsigned short *)0xF0322)
#define GCFGLL (*(volatile unsigned char *)0xF0322)
#define GCFGLH (*(volatile unsigned char *)0xF0323)
#define GCFGH (*(volatile unsigned short *)0xF0324)
#define GCFGHL (*(volatile unsigned char *)0xF0324)
#define GCFGHH (*(volatile unsigned char *)0xF0325)
#define GCTRL (*(volatile unsigned short *)0xF0326)
#define GCTRLL (*(volatile unsigned char *)0xF0326)
#define GCTRLH (*(volatile unsigned char *)0xF0327)
#define GCTRH (*(volatile unsigned short *)0xF0328)
#define GCTRHL (*(volatile unsigned char *)0xF0328)
#define GCTRHH (*(volatile unsigned char *)0xF0329)
#define GSTS (*(volatile unsigned short *)0xF032A)
#define GSTSL (*(volatile unsigned char *)0xF032A)
#define GSTSH (*(volatile unsigned char *)0xF032B)
#define GERFLL (*(volatile unsigned char *)0xF032C)
#define GTSC (*(volatile unsigned short *)0xF032E)
#define GAFLCFG (*(volatile unsigned short *)0xF0330)
#define GAFLCFGL (*(volatile unsigned char *)0xF0330)
#define GAFLCFGH (*(volatile unsigned char *)0xF0331)
#define RMNB (*(volatile unsigned short *)0xF0332)
#define RMNBL (*(volatile unsigned char *)0xF0332)
#define RMND0 (*(volatile unsigned short *)0xF0334)
#define RMND0L (*(volatile unsigned char *)0xF0334)
#define RMND0H (*(volatile unsigned char *)0xF0335)
#define RFCC0 (*(volatile unsigned short *)0xF0338)
#define RFCC0L (*(volatile unsigned char *)0xF0338)
#define RFCC0H (*(volatile unsigned char *)0xF0339)
#define RFCC1 (*(volatile unsigned short *)0xF033A)
#define RFCC1L (*(volatile unsigned char *)0xF033A)
#define RFCC1H (*(volatile unsigned char *)0xF033B)
#define RFSTS0 (*(volatile unsigned short *)0xF0340)
#define RFSTS0L (*(volatile unsigned char *)0xF0340)
#define RFSTS0H (*(volatile unsigned char *)0xF0341)
#define RFSTS1 (*(volatile unsigned short *)0xF0342)
#define RFSTS1L (*(volatile unsigned char *)0xF0342)
#define RFSTS1H (*(volatile unsigned char *)0xF0343)
#define RFPCTR0 (*(volatile unsigned short *)0xF0348)
#define RFPCTR0L (*(volatile unsigned char *)0xF0348)
#define RFPCTR0H (*(volatile unsigned char *)0xF0349)
#define RFPCTR1 (*(volatile unsigned short *)0xF034A)
#define RFPCTR1L (*(volatile unsigned char *)0xF034A)
#define RFPCTR1H (*(volatile unsigned char *)0xF034B)
#define CFCCL0 (*(volatile unsigned short *)0xF0350)
#define CFCCL0L (*(volatile unsigned char *)0xF0350)
#define CFCCL0H (*(volatile unsigned char *)0xF0351)
#define CFCCH0 (*(volatile unsigned short *)0xF0352)
#define CFCCH0L (*(volatile unsigned char *)0xF0352)
#define CFCCH0H (*(volatile unsigned char *)0xF0353)
#define CFSTS0 (*(volatile unsigned short *)0xF0358)
#define CFSTS0L (*(volatile unsigned char *)0xF0358)
#define CFSTS0H (*(volatile unsigned char *)0xF0359)
#define CFPCTR0 (*(volatile unsigned short *)0xF035C)
#define CFPCTR0L (*(volatile unsigned char *)0xF035C)
#define RFMSTS (*(volatile unsigned char *)0xF0360)
#define CFMSTS (*(volatile unsigned char *)0xF0361)
#define RFISTS (*(volatile unsigned char *)0xF0362)
#define CFISTS (*(volatile unsigned char *)0xF0363)
#define TMC0 (*(volatile unsigned char *)0xF0364)
#define TMC1 (*(volatile unsigned char *)0xF0365)
#define TMC2 (*(volatile unsigned char *)0xF0366)
#define TMC3 (*(volatile unsigned char *)0xF0367)
#define TMSTS0 (*(volatile unsigned char *)0xF036C)
#define TMSTS1 (*(volatile unsigned char *)0xF036D)
#define TMSTS2 (*(volatile unsigned char *)0xF036E)
#define TMSTS3 (*(volatile unsigned char *)0xF036F)
#define TMTRSTS (*(volatile unsigned short *)0xF0374)
#define TMTRSTSL (*(volatile unsigned char *)0xF0374)
#define TMTRSTSH (*(volatile unsigned char *)0xF0375)
#define TMTCSTS (*(volatile unsigned short *)0xF0376)
#define TMTCSTSL (*(volatile unsigned char *)0xF0376)
#define TMTCSTSH (*(volatile unsigned char *)0xF0377)
#define TMTASTS (*(volatile unsigned short *)0xF0378)
#define TMTASTSL (*(volatile unsigned char *)0xF0378)
#define TMTASTSH (*(volatile unsigned char *)0xF0379)
#define TMIEC (*(volatile unsigned short *)0xF037A)
#define TMIECL (*(volatile unsigned char *)0xF037A)
#define TMIECH (*(volatile unsigned char *)0xF037B)
#define THLCC0 (*(volatile unsigned short *)0xF037C)
#define THLCC0L (*(volatile unsigned char *)0xF037C)
#define THLCC0H (*(volatile unsigned char *)0xF037D)
#define THLSTS0 (*(volatile unsigned short *)0xF0380)
#define THLSTS0L (*(volatile unsigned char *)0xF0380)
#define THLSTS0H (*(volatile unsigned char *)0xF0381)
#define THLPCTR0 (*(volatile unsigned short *)0xF0384)
#define THLPCTR0L (*(volatile unsigned char *)0xF0384)
#define THLPCTR0H (*(volatile unsigned char *)0xF0385)
#define GTINTSTS (*(volatile unsigned short *)0xF0388)
#define GTINTSTSL (*(volatile unsigned char *)0xF0388)
#define GTINTSTSH (*(volatile unsigned char *)0xF0389)
#define GRWCR (*(volatile unsigned short *)0xF038A)
#define GRWCRL (*(volatile unsigned char *)0xF038A)
#define GRWCRH (*(volatile unsigned char *)0xF038B)
#define GTSTCFG (*(volatile unsigned short *)0xF038C)
#define GTSTCFGL (*(volatile unsigned char *)0xF038C)
#define GTSTCFGH (*(volatile unsigned char *)0xF038D)
#define GTSTCTRL (*(volatile unsigned char *)0xF038E)
#define GLOCKK (*(volatile unsigned short *)0xF0394)
#define GAFLIDL0 (*(volatile unsigned short *)0xF03A0)
#define RMIDL0 (*(volatile unsigned short *)0xF03A0)
#define GAFLIDL0L (*(volatile unsigned char *)0xF03A0)
#define RMIDL0L (*(volatile unsigned char *)0xF03A0)
#define GAFLIDL0H (*(volatile unsigned char *)0xF03A1)
#define RMIDL0H (*(volatile unsigned char *)0xF03A1)
#define GAFLIDH0 (*(volatile unsigned short *)0xF03A2)
#define RMIDH0 (*(volatile unsigned short *)0xF03A2)
#define GAFLIDH0L (*(volatile unsigned char *)0xF03A2)
#define RMIDH0L (*(volatile unsigned char *)0xF03A2)
#define GAFLIDH0H (*(volatile unsigned char *)0xF03A3)
#define RMIDH0H (*(volatile unsigned char *)0xF03A3)
#define GAFLML0 (*(volatile unsigned short *)0xF03A4)
#define RMTS0 (*(volatile unsigned short *)0xF03A4)
#define GAFLML0L (*(volatile unsigned char *)0xF03A4)
#define RMTS0L (*(volatile unsigned char *)0xF03A4)
#define GAFLML0H (*(volatile unsigned char *)0xF03A5)
#define RMTS0H (*(volatile unsigned char *)0xF03A5)
#define GAFLMH0 (*(volatile unsigned short *)0xF03A6)
#define RMPTR0 (*(volatile unsigned short *)0xF03A6)
#define GAFLMH0L (*(volatile unsigned char *)0xF03A6)
#define RMPTR0L (*(volatile unsigned char *)0xF03A6)
#define GAFLMH0H (*(volatile unsigned char *)0xF03A7)
#define RMPTR0H (*(volatile unsigned char *)0xF03A7)
#define GAFLPL0 (*(volatile unsigned short *)0xF03A8)
#define RMDF00 (*(volatile unsigned short *)0xF03A8)
#define GAFLPL0L (*(volatile unsigned char *)0xF03A8)
#define RMDF00L (*(volatile unsigned char *)0xF03A8)
#define GAFLPL0H (*(volatile unsigned char *)0xF03A9)
#define RMDF00H (*(volatile unsigned char *)0xF03A9)
#define GAFLPH0 (*(volatile unsigned short *)0xF03AA)
#define RMDF10 (*(volatile unsigned short *)0xF03AA)
#define GAFLPH0L (*(volatile unsigned char *)0xF03AA)
#define RMDF10L (*(volatile unsigned char *)0xF03AA)
#define GAFLPH0H (*(volatile unsigned char *)0xF03AB)
#define RMDF10H (*(volatile unsigned char *)0xF03AB)
#define GAFLIDL1 (*(volatile unsigned short *)0xF03AC)
#define RMDF20 (*(volatile unsigned short *)0xF03AC)
#define GAFLIDL1L (*(volatile unsigned char *)0xF03AC)
#define RMDF20L (*(volatile unsigned char *)0xF03AC)
#define GAFLIDL1H (*(volatile unsigned char *)0xF03AD)
#define RMDF20H (*(volatile unsigned char *)0xF03AD)
#define GAFLIDH1 (*(volatile unsigned short *)0xF03AE)
#define RMDF30 (*(volatile unsigned short *)0xF03AE)
#define GAFLIDH1L (*(volatile unsigned char *)0xF03AE)
#define RMDF30L (*(volatile unsigned char *)0xF03AE)
#define GAFLIDH1H (*(volatile unsigned char *)0xF03AF)
#define RMDF30H (*(volatile unsigned char *)0xF03AF)
#define GAFLML1 (*(volatile unsigned short *)0xF03B0)
#define RMIDL1 (*(volatile unsigned short *)0xF03B0)
#define GAFLML1L (*(volatile unsigned char *)0xF03B0)
#define RMIDL1L (*(volatile unsigned char *)0xF03B0)
#define GAFLML1H (*(volatile unsigned char *)0xF03B1)
#define RMIDL1H (*(volatile unsigned char *)0xF03B1)
#define GAFLMH1 (*(volatile unsigned short *)0xF03B2)
#define RMIDH1 (*(volatile unsigned short *)0xF03B2)
#define GAFLMH1L (*(volatile unsigned char *)0xF03B2)
#define RMIDH1L (*(volatile unsigned char *)0xF03B2)
#define GAFLMH1H (*(volatile unsigned char *)0xF03B3)
#define RMIDH1H (*(volatile unsigned char *)0xF03B3)
#define GAFLPL1 (*(volatile unsigned short *)0xF03B4)
#define RMTS1 (*(volatile unsigned short *)0xF03B4)
#define GAFLPL1L (*(volatile unsigned char *)0xF03B4)
#define RMTS1L (*(volatile unsigned char *)0xF03B4)
#define GAFLPL1H (*(volatile unsigned char *)0xF03B5)
#define RMTS1H (*(volatile unsigned char *)0xF03B5)
#define GAFLPH1 (*(volatile unsigned short *)0xF03B6)
#define RMPTR1 (*(volatile unsigned short *)0xF03B6)
#define GAFLPH1L (*(volatile unsigned char *)0xF03B6)
#define RMPTR1L (*(volatile unsigned char *)0xF03B6)
#define GAFLPH1H (*(volatile unsigned char *)0xF03B7)
#define RMPTR1H (*(volatile unsigned char *)0xF03B7)
#define GAFLIDL2 (*(volatile unsigned short *)0xF03B8)
#define RMDF01 (*(volatile unsigned short *)0xF03B8)
#define GAFLIDL2L (*(volatile unsigned char *)0xF03B8)
#define RMDF01L (*(volatile unsigned char *)0xF03B8)
#define GAFLIDL2H (*(volatile unsigned char *)0xF03B9)
#define RMDF01H (*(volatile unsigned char *)0xF03B9)
#define GAFLIDH2 (*(volatile unsigned short *)0xF03BA)
#define RMDF11 (*(volatile unsigned short *)0xF03BA)
#define GAFLIDH2L (*(volatile unsigned char *)0xF03BA)
#define RMDF11L (*(volatile unsigned char *)0xF03BA)
#define GAFLIDH2H (*(volatile unsigned char *)0xF03BB)
#define RMDF11H (*(volatile unsigned char *)0xF03BB)
#define GAFLML2 (*(volatile unsigned short *)0xF03BC)
#define RMDF21 (*(volatile unsigned short *)0xF03BC)
#define GAFLML2L (*(volatile unsigned char *)0xF03BC)
#define RMDF21L (*(volatile unsigned char *)0xF03BC)
#define GAFLML2H (*(volatile unsigned char *)0xF03BD)
#define RMDF21H (*(volatile unsigned char *)0xF03BD)
#define GAFLMH2 (*(volatile unsigned short *)0xF03BE)
#define RMDF31 (*(volatile unsigned short *)0xF03BE)
#define GAFLMH2L (*(volatile unsigned char *)0xF03BE)
#define RMDF31L (*(volatile unsigned char *)0xF03BE)
#define GAFLMH2H (*(volatile unsigned char *)0xF03BF)
#define RMDF31H (*(volatile unsigned char *)0xF03BF)
#define GAFLPL2 (*(volatile unsigned short *)0xF03C0)
#define RMIDL2 (*(volatile unsigned short *)0xF03C0)
#define GAFLPL2L (*(volatile unsigned char *)0xF03C0)
#define RMIDL2L (*(volatile unsigned char *)0xF03C0)
#define GAFLPL2H (*(volatile unsigned char *)0xF03C1)
#define RMIDL2H (*(volatile unsigned char *)0xF03C1)
#define GAFLPH2 (*(volatile unsigned short *)0xF03C2)
#define RMIDH2 (*(volatile unsigned short *)0xF03C2)
#define GAFLPH2L (*(volatile unsigned char *)0xF03C2)
#define RMIDH2L (*(volatile unsigned char *)0xF03C2)
#define GAFLPH2H (*(volatile unsigned char *)0xF03C3)
#define RMIDH2H (*(volatile unsigned char *)0xF03C3)
#define GAFLIDL3 (*(volatile unsigned short *)0xF03C4)
#define RMTS2 (*(volatile unsigned short *)0xF03C4)
#define GAFLIDL3L (*(volatile unsigned char *)0xF03C4)
#define RMTS2L (*(volatile unsigned char *)0xF03C4)
#define GAFLIDL3H (*(volatile unsigned char *)0xF03C5)
#define RMTS2H (*(volatile unsigned char *)0xF03C5)
#define GAFLIDH3 (*(volatile unsigned short *)0xF03C6)
#define RMPTR2 (*(volatile unsigned short *)0xF03C6)
#define GAFLIDH3L (*(volatile unsigned char *)0xF03C6)
#define RMPTR2L (*(volatile unsigned char *)0xF03C6)
#define GAFLIDH3H (*(volatile unsigned char *)0xF03C7)
#define RMPTR2H (*(volatile unsigned char *)0xF03C7)
#define GAFLML3 (*(volatile unsigned short *)0xF03C8)
#define RMDF02 (*(volatile unsigned short *)0xF03C8)
#define GAFLML3L (*(volatile unsigned char *)0xF03C8)
#define RMDF02L (*(volatile unsigned char *)0xF03C8)
#define GAFLML3H (*(volatile unsigned char *)0xF03C9)
#define RMDF02H (*(volatile unsigned char *)0xF03C9)
#define GAFLMH3 (*(volatile unsigned short *)0xF03CA)
#define RMDF12 (*(volatile unsigned short *)0xF03CA)
#define GAFLMH3L (*(volatile unsigned char *)0xF03CA)
#define RMDF12L (*(volatile unsigned char *)0xF03CA)
#define GAFLMH3H (*(volatile unsigned char *)0xF03CB)
#define RMDF12H (*(volatile unsigned char *)0xF03CB)
#define GAFLPL3 (*(volatile unsigned short *)0xF03CC)
#define RMDF22 (*(volatile unsigned short *)0xF03CC)
#define GAFLPL3L (*(volatile unsigned char *)0xF03CC)
#define RMDF22L (*(volatile unsigned char *)0xF03CC)
#define GAFLPL3H (*(volatile unsigned char *)0xF03CD)
#define RMDF22H (*(volatile unsigned char *)0xF03CD)
#define GAFLPH3 (*(volatile unsigned short *)0xF03CE)
#define RMDF32 (*(volatile unsigned short *)0xF03CE)
#define GAFLPH3L (*(volatile unsigned char *)0xF03CE)
#define RMDF32L (*(volatile unsigned char *)0xF03CE)
#define GAFLPH3H (*(volatile unsigned char *)0xF03CF)
#define RMDF32H (*(volatile unsigned char *)0xF03CF)
#define GAFLIDL4 (*(volatile unsigned short *)0xF03D0)
#define RMIDL3 (*(volatile unsigned short *)0xF03D0)
#define GAFLIDL4L (*(volatile unsigned char *)0xF03D0)
#define RMIDL3L (*(volatile unsigned char *)0xF03D0)
#define GAFLIDL4H (*(volatile unsigned char *)0xF03D1)
#define RMIDL3H (*(volatile unsigned char *)0xF03D1)
#define GAFLIDH4 (*(volatile unsigned short *)0xF03D2)
#define RMIDH3 (*(volatile unsigned short *)0xF03D2)
#define GAFLIDH4L (*(volatile unsigned char *)0xF03D2)
#define RMIDH3L (*(volatile unsigned char *)0xF03D2)
#define GAFLIDH4H (*(volatile unsigned char *)0xF03D3)
#define RMIDH3H (*(volatile unsigned char *)0xF03D3)
#define GAFLML4 (*(volatile unsigned short *)0xF03D4)
#define RMTS3 (*(volatile unsigned short *)0xF03D4)
#define GAFLML4L (*(volatile unsigned char *)0xF03D4)
#define RMTS3L (*(volatile unsigned char *)0xF03D4)
#define GAFLML4H (*(volatile unsigned char *)0xF03D5)
#define RMTS3H (*(volatile unsigned char *)0xF03D5)
#define GAFLMH4 (*(volatile unsigned short *)0xF03D6)
#define RMPTR3 (*(volatile unsigned short *)0xF03D6)
#define GAFLMH4L (*(volatile unsigned char *)0xF03D6)
#define RMPTR3L (*(volatile unsigned char *)0xF03D6)
#define GAFLMH4H (*(volatile unsigned char *)0xF03D7)
#define RMPTR3H (*(volatile unsigned char *)0xF03D7)
#define GAFLPL4 (*(volatile unsigned short *)0xF03D8)
#define RMDF03 (*(volatile unsigned short *)0xF03D8)
#define GAFLPL4L (*(volatile unsigned char *)0xF03D8)
#define RMDF03L (*(volatile unsigned char *)0xF03D8)
#define GAFLPL4H (*(volatile unsigned char *)0xF03D9)
#define RMDF03H (*(volatile unsigned char *)0xF03D9)
#define GAFLPH4 (*(volatile unsigned short *)0xF03DA)
#define RMDF13 (*(volatile unsigned short *)0xF03DA)
#define GAFLPH4L (*(volatile unsigned char *)0xF03DA)
#define RMDF13L (*(volatile unsigned char *)0xF03DA)
#define GAFLPH4H (*(volatile unsigned char *)0xF03DB)
#define RMDF13H (*(volatile unsigned char *)0xF03DB)
#define GAFLIDL5 (*(volatile unsigned short *)0xF03DC)
#define RMDF23 (*(volatile unsigned short *)0xF03DC)
#define GAFLIDL5L (*(volatile unsigned char *)0xF03DC)
#define RMDF23L (*(volatile unsigned char *)0xF03DC)
#define GAFLIDL5H (*(volatile unsigned char *)0xF03DD)
#define RMDF23H (*(volatile unsigned char *)0xF03DD)
#define GAFLIDH5 (*(volatile unsigned short *)0xF03DE)
#define RMDF33 (*(volatile unsigned short *)0xF03DE)
#define GAFLIDH5L (*(volatile unsigned char *)0xF03DE)
#define RMDF33L (*(volatile unsigned char *)0xF03DE)
#define GAFLIDH5H (*(volatile unsigned char *)0xF03DF)
#define RMDF33H (*(volatile unsigned char *)0xF03DF)
#define GAFLML5 (*(volatile unsigned short *)0xF03E0)
#define RMIDL4 (*(volatile unsigned short *)0xF03E0)
#define GAFLML5L (*(volatile unsigned char *)0xF03E0)
#define RMIDL4L (*(volatile unsigned char *)0xF03E0)
#define GAFLML5H (*(volatile unsigned char *)0xF03E1)
#define RMIDL4H (*(volatile unsigned char *)0xF03E1)
#define GAFLMH5 (*(volatile unsigned short *)0xF03E2)
#define RMIDH4 (*(volatile unsigned short *)0xF03E2)
#define GAFLMH5L (*(volatile unsigned char *)0xF03E2)
#define RMIDH4L (*(volatile unsigned char *)0xF03E2)
#define GAFLMH5H (*(volatile unsigned char *)0xF03E3)
#define RMIDH4H (*(volatile unsigned char *)0xF03E3)
#define GAFLPL5 (*(volatile unsigned short *)0xF03E4)
#define RMTS4 (*(volatile unsigned short *)0xF03E4)
#define GAFLPL5L (*(volatile unsigned char *)0xF03E4)
#define RMTS4L (*(volatile unsigned char *)0xF03E4)
#define GAFLPL5H (*(volatile unsigned char *)0xF03E5)
#define RMTS4H (*(volatile unsigned char *)0xF03E5)
#define GAFLPH5 (*(volatile unsigned short *)0xF03E6)
#define RMPTR4 (*(volatile unsigned short *)0xF03E6)
#define GAFLPH5L (*(volatile unsigned char *)0xF03E6)
#define RMPTR4L (*(volatile unsigned char *)0xF03E6)
#define GAFLPH5H (*(volatile unsigned char *)0xF03E7)
#define RMPTR4H (*(volatile unsigned char *)0xF03E7)
#define GAFLIDL6 (*(volatile unsigned short *)0xF03E8)
#define RMDF04 (*(volatile unsigned short *)0xF03E8)
#define GAFLIDL6L (*(volatile unsigned char *)0xF03E8)
#define RMDF04L (*(volatile unsigned char *)0xF03E8)
#define GAFLIDL6H (*(volatile unsigned char *)0xF03E9)
#define RMDF04H (*(volatile unsigned char *)0xF03E9)
#define GAFLIDH6 (*(volatile unsigned short *)0xF03EA)
#define RMDF14 (*(volatile unsigned short *)0xF03EA)
#define GAFLIDH6L (*(volatile unsigned char *)0xF03EA)
#define RMDF14L (*(volatile unsigned char *)0xF03EA)
#define GAFLIDH6H (*(volatile unsigned char *)0xF03EB)
#define RMDF14H (*(volatile unsigned char *)0xF03EB)
#define GAFLML6 (*(volatile unsigned short *)0xF03EC)
#define RMDF24 (*(volatile unsigned short *)0xF03EC)
#define GAFLML6L (*(volatile unsigned char *)0xF03EC)
#define RMDF24L (*(volatile unsigned char *)0xF03EC)
#define GAFLML6H (*(volatile unsigned char *)0xF03ED)
#define RMDF24H (*(volatile unsigned char *)0xF03ED)
#define GAFLMH6 (*(volatile unsigned short *)0xF03EE)
#define RMDF34 (*(volatile unsigned short *)0xF03EE)
#define GAFLMH6L (*(volatile unsigned char *)0xF03EE)
#define RMDF34L (*(volatile unsigned char *)0xF03EE)
#define GAFLMH6H (*(volatile unsigned char *)0xF03EF)
#define RMDF34H (*(volatile unsigned char *)0xF03EF)
#define GAFLPL6 (*(volatile unsigned short *)0xF03F0)
#define RMIDL5 (*(volatile unsigned short *)0xF03F0)
#define GAFLPL6L (*(volatile unsigned char *)0xF03F0)
#define RMIDL5L (*(volatile unsigned char *)0xF03F0)
#define GAFLPL6H (*(volatile unsigned char *)0xF03F1)
#define RMIDL5H (*(volatile unsigned char *)0xF03F1)
#define GAFLPH6 (*(volatile unsigned short *)0xF03F2)
#define RMIDH5 (*(volatile unsigned short *)0xF03F2)
#define GAFLPH6L (*(volatile unsigned char *)0xF03F2)
#define RMIDH5L (*(volatile unsigned char *)0xF03F2)
#define GAFLPH6H (*(volatile unsigned char *)0xF03F3)
#define RMIDH5H (*(volatile unsigned char *)0xF03F3)
#define GAFLIDL7 (*(volatile unsigned short *)0xF03F4)
#define RMTS5 (*(volatile unsigned short *)0xF03F4)
#define GAFLIDL7L (*(volatile unsigned char *)0xF03F4)
#define RMTS5L (*(volatile unsigned char *)0xF03F4)
#define GAFLIDL7H (*(volatile unsigned char *)0xF03F5)
#define RMTS5H (*(volatile unsigned char *)0xF03F5)
#define GAFLIDH7 (*(volatile unsigned short *)0xF03F6)
#define RMPTR5 (*(volatile unsigned short *)0xF03F6)
#define GAFLIDH7L (*(volatile unsigned char *)0xF03F6)
#define RMPTR5L (*(volatile unsigned char *)0xF03F6)
#define GAFLIDH7H (*(volatile unsigned char *)0xF03F7)
#define RMPTR5H (*(volatile unsigned char *)0xF03F7)
#define GAFLML7 (*(volatile unsigned short *)0xF03F8)
#define RMDF05 (*(volatile unsigned short *)0xF03F8)
#define GAFLML7L (*(volatile unsigned char *)0xF03F8)
#define RMDF05L (*(volatile unsigned char *)0xF03F8)
#define GAFLML7H (*(volatile unsigned char *)0xF03F9)
#define RMDF05H (*(volatile unsigned char *)0xF03F9)
#define GAFLMH7 (*(volatile unsigned short *)0xF03FA)
#define RMDF15 (*(volatile unsigned short *)0xF03FA)
#define GAFLMH7L (*(volatile unsigned char *)0xF03FA)
#define RMDF15L (*(volatile unsigned char *)0xF03FA)
#define GAFLMH7H (*(volatile unsigned char *)0xF03FB)
#define RMDF15H (*(volatile unsigned char *)0xF03FB)
#define GAFLPL7 (*(volatile unsigned short *)0xF03FC)
#define RMDF25 (*(volatile unsigned short *)0xF03FC)
#define GAFLPL7L (*(volatile unsigned char *)0xF03FC)
#define RMDF25L (*(volatile unsigned char *)0xF03FC)
#define GAFLPL7H (*(volatile unsigned char *)0xF03FD)
#define RMDF25H (*(volatile unsigned char *)0xF03FD)
#define GAFLPH7 (*(volatile unsigned short *)0xF03FE)
#define RMDF35 (*(volatile unsigned short *)0xF03FE)
#define GAFLPH7L (*(volatile unsigned char *)0xF03FE)
#define RMDF35L (*(volatile unsigned char *)0xF03FE)
#define GAFLPH7H (*(volatile unsigned char *)0xF03FF)
#define RMDF35H (*(volatile unsigned char *)0xF03FF)
#define GAFLIDL8 (*(volatile unsigned short *)0xF0400)
#define RMIDL6 (*(volatile unsigned short *)0xF0400)
#define GAFLIDL8L (*(volatile unsigned char *)0xF0400)
#define RMIDL6L (*(volatile unsigned char *)0xF0400)
#define GAFLIDL8H (*(volatile unsigned char *)0xF0401)
#define RMIDL6H (*(volatile unsigned char *)0xF0401)
#define GAFLIDH8 (*(volatile unsigned short *)0xF0402)
#define RMIDH6 (*(volatile unsigned short *)0xF0402)
#define GAFLIDH8L (*(volatile unsigned char *)0xF0402)
#define RMIDH6L (*(volatile unsigned char *)0xF0402)
#define GAFLIDH8H (*(volatile unsigned char *)0xF0403)
#define RMIDH6H (*(volatile unsigned char *)0xF0403)
#define GAFLML8 (*(volatile unsigned short *)0xF0404)
#define RMTS6 (*(volatile unsigned short *)0xF0404)
#define GAFLML8L (*(volatile unsigned char *)0xF0404)
#define RMTS6L (*(volatile unsigned char *)0xF0404)
#define GAFLML8H (*(volatile unsigned char *)0xF0405)
#define RMTS6H (*(volatile unsigned char *)0xF0405)
#define GAFLMH8 (*(volatile unsigned short *)0xF0406)
#define RMPTR6 (*(volatile unsigned short *)0xF0406)
#define GAFLMH8L (*(volatile unsigned char *)0xF0406)
#define RMPTR6L (*(volatile unsigned char *)0xF0406)
#define GAFLMH8H (*(volatile unsigned char *)0xF0407)
#define RMPTR6H (*(volatile unsigned char *)0xF0407)
#define GAFLPL8 (*(volatile unsigned short *)0xF0408)
#define RMDF06 (*(volatile unsigned short *)0xF0408)
#define GAFLPL8L (*(volatile unsigned char *)0xF0408)
#define RMDF06L (*(volatile unsigned char *)0xF0408)
#define GAFLPL8H (*(volatile unsigned char *)0xF0409)
#define RMDF06H (*(volatile unsigned char *)0xF0409)
#define GAFLPH8 (*(volatile unsigned short *)0xF040A)
#define RMDF16 (*(volatile unsigned short *)0xF040A)
#define GAFLPH8L (*(volatile unsigned char *)0xF040A)
#define RMDF16L (*(volatile unsigned char *)0xF040A)
#define GAFLPH8H (*(volatile unsigned char *)0xF040B)
#define RMDF16H (*(volatile unsigned char *)0xF040B)
#define GAFLIDL9 (*(volatile unsigned short *)0xF040C)
#define RMDF26 (*(volatile unsigned short *)0xF040C)
#define GAFLIDL9L (*(volatile unsigned char *)0xF040C)
#define RMDF26L (*(volatile unsigned char *)0xF040C)
#define GAFLIDL9H (*(volatile unsigned char *)0xF040D)
#define RMDF26H (*(volatile unsigned char *)0xF040D)
#define GAFLIDH9 (*(volatile unsigned short *)0xF040E)
#define RMDF36 (*(volatile unsigned short *)0xF040E)
#define GAFLIDH9L (*(volatile unsigned char *)0xF040E)
#define RMDF36L (*(volatile unsigned char *)0xF040E)
#define GAFLIDH9H (*(volatile unsigned char *)0xF040F)
#define RMDF36H (*(volatile unsigned char *)0xF040F)
#define GAFLML9 (*(volatile unsigned short *)0xF0410)
#define RMIDL7 (*(volatile unsigned short *)0xF0410)
#define GAFLML9L (*(volatile unsigned char *)0xF0410)
#define RMIDL7L (*(volatile unsigned char *)0xF0410)
#define GAFLML9H (*(volatile unsigned char *)0xF0411)
#define RMIDL7H (*(volatile unsigned char *)0xF0411)
#define GAFLMH9 (*(volatile unsigned short *)0xF0412)
#define RMIDH7 (*(volatile unsigned short *)0xF0412)
#define GAFLMH9L (*(volatile unsigned char *)0xF0412)
#define RMIDH7L (*(volatile unsigned char *)0xF0412)
#define GAFLMH9H (*(volatile unsigned char *)0xF0413)
#define RMIDH7H (*(volatile unsigned char *)0xF0413)
#define GAFLPL9 (*(volatile unsigned short *)0xF0414)
#define RMTS7 (*(volatile unsigned short *)0xF0414)
#define GAFLPL9L (*(volatile unsigned char *)0xF0414)
#define RMTS7L (*(volatile unsigned char *)0xF0414)
#define GAFLPL9H (*(volatile unsigned char *)0xF0415)
#define RMTS7H (*(volatile unsigned char *)0xF0415)
#define GAFLPH9 (*(volatile unsigned short *)0xF0416)
#define RMPTR7 (*(volatile unsigned short *)0xF0416)
#define GAFLPH9L (*(volatile unsigned char *)0xF0416)
#define RMPTR7L (*(volatile unsigned char *)0xF0416)
#define GAFLPH9H (*(volatile unsigned char *)0xF0417)
#define RMPTR7H (*(volatile unsigned char *)0xF0417)
#define GAFLIDL10 (*(volatile unsigned short *)0xF0418)
#define RMDF07 (*(volatile unsigned short *)0xF0418)
#define GAFLIDL10L (*(volatile unsigned char *)0xF0418)
#define RMDF07L (*(volatile unsigned char *)0xF0418)
#define GAFLIDL10H (*(volatile unsigned char *)0xF0419)
#define RMDF07H (*(volatile unsigned char *)0xF0419)
#define GAFLIDH10 (*(volatile unsigned short *)0xF041A)
#define RMDF17 (*(volatile unsigned short *)0xF041A)
#define GAFLIDH10L (*(volatile unsigned char *)0xF041A)
#define RMDF17L (*(volatile unsigned char *)0xF041A)
#define GAFLIDH10H (*(volatile unsigned char *)0xF041B)
#define RMDF17H (*(volatile unsigned char *)0xF041B)
#define GAFLML10 (*(volatile unsigned short *)0xF041C)
#define RMDF27 (*(volatile unsigned short *)0xF041C)
#define GAFLML10L (*(volatile unsigned char *)0xF041C)
#define RMDF27L (*(volatile unsigned char *)0xF041C)
#define GAFLML10H (*(volatile unsigned char *)0xF041D)
#define RMDF27H (*(volatile unsigned char *)0xF041D)
#define GAFLMH10 (*(volatile unsigned short *)0xF041E)
#define RMDF37 (*(volatile unsigned short *)0xF041E)
#define GAFLMH10L (*(volatile unsigned char *)0xF041E)
#define RMDF37L (*(volatile unsigned char *)0xF041E)
#define GAFLMH10H (*(volatile unsigned char *)0xF041F)
#define RMDF37H (*(volatile unsigned char *)0xF041F)
#define GAFLPL10 (*(volatile unsigned short *)0xF0420)
#define RMIDL8 (*(volatile unsigned short *)0xF0420)
#define GAFLPL10L (*(volatile unsigned char *)0xF0420)
#define RMIDL8L (*(volatile unsigned char *)0xF0420)
#define GAFLPL10H (*(volatile unsigned char *)0xF0421)
#define RMIDL8H (*(volatile unsigned char *)0xF0421)
#define GAFLPH10 (*(volatile unsigned short *)0xF0422)
#define RMIDH8 (*(volatile unsigned short *)0xF0422)
#define GAFLPH10L (*(volatile unsigned char *)0xF0422)
#define RMIDH8L (*(volatile unsigned char *)0xF0422)
#define GAFLPH10H (*(volatile unsigned char *)0xF0423)
#define RMIDH8H (*(volatile unsigned char *)0xF0423)
#define GAFLIDL11 (*(volatile unsigned short *)0xF0424)
#define RMTS8 (*(volatile unsigned short *)0xF0424)
#define GAFLIDL11L (*(volatile unsigned char *)0xF0424)
#define RMTS8L (*(volatile unsigned char *)0xF0424)
#define GAFLIDL11H (*(volatile unsigned char *)0xF0425)
#define RMTS8H (*(volatile unsigned char *)0xF0425)
#define GAFLIDH11 (*(volatile unsigned short *)0xF0426)
#define RMPTR8 (*(volatile unsigned short *)0xF0426)
#define GAFLIDH11L (*(volatile unsigned char *)0xF0426)
#define RMPTR8L (*(volatile unsigned char *)0xF0426)
#define GAFLIDH11H (*(volatile unsigned char *)0xF0427)
#define RMPTR8H (*(volatile unsigned char *)0xF0427)
#define GAFLML11 (*(volatile unsigned short *)0xF0428)
#define RMDF08 (*(volatile unsigned short *)0xF0428)
#define GAFLML11L (*(volatile unsigned char *)0xF0428)
#define RMDF08L (*(volatile unsigned char *)0xF0428)
#define GAFLML11H (*(volatile unsigned char *)0xF0429)
#define RMDF08H (*(volatile unsigned char *)0xF0429)
#define GAFLMH11 (*(volatile unsigned short *)0xF042A)
#define RMDF18 (*(volatile unsigned short *)0xF042A)
#define GAFLMH11L (*(volatile unsigned char *)0xF042A)
#define RMDF18L (*(volatile unsigned char *)0xF042A)
#define GAFLMH11H (*(volatile unsigned char *)0xF042B)
#define RMDF18H (*(volatile unsigned char *)0xF042B)
#define GAFLPL11 (*(volatile unsigned short *)0xF042C)
#define RMDF28 (*(volatile unsigned short *)0xF042C)
#define GAFLPL11L (*(volatile unsigned char *)0xF042C)
#define RMDF28L (*(volatile unsigned char *)0xF042C)
#define GAFLPL11H (*(volatile unsigned char *)0xF042D)
#define RMDF28H (*(volatile unsigned char *)0xF042D)
#define GAFLPH11 (*(volatile unsigned short *)0xF042E)
#define RMDF38 (*(volatile unsigned short *)0xF042E)
#define GAFLPH11L (*(volatile unsigned char *)0xF042E)
#define RMDF38L (*(volatile unsigned char *)0xF042E)
#define GAFLPH11H (*(volatile unsigned char *)0xF042F)
#define RMDF38H (*(volatile unsigned char *)0xF042F)
#define GAFLIDL12 (*(volatile unsigned short *)0xF0430)
#define RMIDL9 (*(volatile unsigned short *)0xF0430)
#define GAFLIDL12L (*(volatile unsigned char *)0xF0430)
#define RMIDL9L (*(volatile unsigned char *)0xF0430)
#define GAFLIDL12H (*(volatile unsigned char *)0xF0431)
#define RMIDL9H (*(volatile unsigned char *)0xF0431)
#define GAFLIDH12 (*(volatile unsigned short *)0xF0432)
#define RMIDH9 (*(volatile unsigned short *)0xF0432)
#define GAFLIDH12L (*(volatile unsigned char *)0xF0432)
#define RMIDH9L (*(volatile unsigned char *)0xF0432)
#define GAFLIDH12H (*(volatile unsigned char *)0xF0433)
#define RMIDH9H (*(volatile unsigned char *)0xF0433)
#define GAFLML12 (*(volatile unsigned short *)0xF0434)
#define RMTS9 (*(volatile unsigned short *)0xF0434)
#define GAFLML12L (*(volatile unsigned char *)0xF0434)
#define RMTS9L (*(volatile unsigned char *)0xF0434)
#define GAFLML12H (*(volatile unsigned char *)0xF0435)
#define RMTS9H (*(volatile unsigned char *)0xF0435)
#define GAFLMH12 (*(volatile unsigned short *)0xF0436)
#define RMPTR9 (*(volatile unsigned short *)0xF0436)
#define GAFLMH12L (*(volatile unsigned char *)0xF0436)
#define RMPTR9L (*(volatile unsigned char *)0xF0436)
#define GAFLMH12H (*(volatile unsigned char *)0xF0437)
#define RMPTR9H (*(volatile unsigned char *)0xF0437)
#define GAFLPL12 (*(volatile unsigned short *)0xF0438)
#define RMDF09 (*(volatile unsigned short *)0xF0438)
#define GAFLPL12L (*(volatile unsigned char *)0xF0438)
#define RMDF09L (*(volatile unsigned char *)0xF0438)
#define GAFLPL12H (*(volatile unsigned char *)0xF0439)
#define RMDF09H (*(volatile unsigned char *)0xF0439)
#define GAFLPH12 (*(volatile unsigned short *)0xF043A)
#define RMDF19 (*(volatile unsigned short *)0xF043A)
#define GAFLPH12L (*(volatile unsigned char *)0xF043A)
#define RMDF19L (*(volatile unsigned char *)0xF043A)
#define GAFLPH12H (*(volatile unsigned char *)0xF043B)
#define RMDF19H (*(volatile unsigned char *)0xF043B)
#define GAFLIDL13 (*(volatile unsigned short *)0xF043C)
#define RMDF29 (*(volatile unsigned short *)0xF043C)
#define GAFLIDL13L (*(volatile unsigned char *)0xF043C)
#define RMDF29L (*(volatile unsigned char *)0xF043C)
#define GAFLIDL13H (*(volatile unsigned char *)0xF043D)
#define RMDF29H (*(volatile unsigned char *)0xF043D)
#define GAFLIDH13 (*(volatile unsigned short *)0xF043E)
#define RMDF39 (*(volatile unsigned short *)0xF043E)
#define GAFLIDH13L (*(volatile unsigned char *)0xF043E)
#define RMDF39L (*(volatile unsigned char *)0xF043E)
#define GAFLIDH13H (*(volatile unsigned char *)0xF043F)
#define RMDF39H (*(volatile unsigned char *)0xF043F)
#define GAFLML13 (*(volatile unsigned short *)0xF0440)
#define RMIDL10 (*(volatile unsigned short *)0xF0440)
#define GAFLML13L (*(volatile unsigned char *)0xF0440)
#define RMIDL10L (*(volatile unsigned char *)0xF0440)
#define GAFLML13H (*(volatile unsigned char *)0xF0441)
#define RMIDL10H (*(volatile unsigned char *)0xF0441)
#define GAFLMH13 (*(volatile unsigned short *)0xF0442)
#define RMIDH10 (*(volatile unsigned short *)0xF0442)
#define GAFLMH13L (*(volatile unsigned char *)0xF0442)
#define RMIDH10L (*(volatile unsigned char *)0xF0442)
#define GAFLMH13H (*(volatile unsigned char *)0xF0443)
#define RMIDH10H (*(volatile unsigned char *)0xF0443)
#define GAFLPL13 (*(volatile unsigned short *)0xF0444)
#define RMTS10 (*(volatile unsigned short *)0xF0444)
#define GAFLPL13L (*(volatile unsigned char *)0xF0444)
#define RMTS10L (*(volatile unsigned char *)0xF0444)
#define GAFLPL13H (*(volatile unsigned char *)0xF0445)
#define RMTS10H (*(volatile unsigned char *)0xF0445)
#define GAFLPH13 (*(volatile unsigned short *)0xF0446)
#define RMPTR10 (*(volatile unsigned short *)0xF0446)
#define GAFLPH13L (*(volatile unsigned char *)0xF0446)
#define RMPTR10L (*(volatile unsigned char *)0xF0446)
#define GAFLPH13H (*(volatile unsigned char *)0xF0447)
#define RMPTR10H (*(volatile unsigned char *)0xF0447)
#define GAFLIDL14 (*(volatile unsigned short *)0xF0448)
#define RMDF010 (*(volatile unsigned short *)0xF0448)
#define GAFLIDL14L (*(volatile unsigned char *)0xF0448)
#define RMDF010L (*(volatile unsigned char *)0xF0448)
#define GAFLIDL14H (*(volatile unsigned char *)0xF0449)
#define RMDF010H (*(volatile unsigned char *)0xF0449)
#define GAFLIDH14 (*(volatile unsigned short *)0xF044A)
#define RMDF110 (*(volatile unsigned short *)0xF044A)
#define GAFLIDH14L (*(volatile unsigned char *)0xF044A)
#define RMDF110L (*(volatile unsigned char *)0xF044A)
#define GAFLIDH14H (*(volatile unsigned char *)0xF044B)
#define RMDF110H (*(volatile unsigned char *)0xF044B)
#define GAFLML14 (*(volatile unsigned short *)0xF044C)
#define RMDF210 (*(volatile unsigned short *)0xF044C)
#define GAFLML14L (*(volatile unsigned char *)0xF044C)
#define RMDF210L (*(volatile unsigned char *)0xF044C)
#define GAFLML14H (*(volatile unsigned char *)0xF044D)
#define RMDF210H (*(volatile unsigned char *)0xF044D)
#define GAFLMH14 (*(volatile unsigned short *)0xF044E)
#define RMDF310 (*(volatile unsigned short *)0xF044E)
#define GAFLMH14L (*(volatile unsigned char *)0xF044E)
#define RMDF310L (*(volatile unsigned char *)0xF044E)
#define GAFLMH14H (*(volatile unsigned char *)0xF044F)
#define RMDF310H (*(volatile unsigned char *)0xF044F)
#define GAFLPL14 (*(volatile unsigned short *)0xF0450)
#define RMIDL11 (*(volatile unsigned short *)0xF0450)
#define GAFLPL14L (*(volatile unsigned char *)0xF0450)
#define RMIDL11L (*(volatile unsigned char *)0xF0450)
#define GAFLPL14H (*(volatile unsigned char *)0xF0451)
#define RMIDL11H (*(volatile unsigned char *)0xF0451)
#define GAFLPH14 (*(volatile unsigned short *)0xF0452)
#define RMIDH11 (*(volatile unsigned short *)0xF0452)
#define GAFLPH14L (*(volatile unsigned char *)0xF0452)
#define RMIDH11L (*(volatile unsigned char *)0xF0452)
#define GAFLPH14H (*(volatile unsigned char *)0xF0453)
#define RMIDH11H (*(volatile unsigned char *)0xF0453)
#define GAFLIDL15 (*(volatile unsigned short *)0xF0454)
#define RMTS11 (*(volatile unsigned short *)0xF0454)
#define GAFLIDL15L (*(volatile unsigned char *)0xF0454)
#define RMTS11L (*(volatile unsigned char *)0xF0454)
#define GAFLIDL15H (*(volatile unsigned char *)0xF0455)
#define RMTS11H (*(volatile unsigned char *)0xF0455)
#define GAFLIDH15 (*(volatile unsigned short *)0xF0456)
#define RMPTR11 (*(volatile unsigned short *)0xF0456)
#define GAFLIDH15L (*(volatile unsigned char *)0xF0456)
#define RMPTR11L (*(volatile unsigned char *)0xF0456)
#define GAFLIDH15H (*(volatile unsigned char *)0xF0457)
#define RMPTR11H (*(volatile unsigned char *)0xF0457)
#define GAFLML15 (*(volatile unsigned short *)0xF0458)
#define RMDF011 (*(volatile unsigned short *)0xF0458)
#define GAFLML15L (*(volatile unsigned char *)0xF0458)
#define RMDF011L (*(volatile unsigned char *)0xF0458)
#define GAFLML15H (*(volatile unsigned char *)0xF0459)
#define RMDF011H (*(volatile unsigned char *)0xF0459)
#define GAFLMH15 (*(volatile unsigned short *)0xF045A)
#define RMDF111 (*(volatile unsigned short *)0xF045A)
#define GAFLMH15L (*(volatile unsigned char *)0xF045A)
#define RMDF111L (*(volatile unsigned char *)0xF045A)
#define GAFLMH15H (*(volatile unsigned char *)0xF045B)
#define RMDF111H (*(volatile unsigned char *)0xF045B)
#define GAFLPL15 (*(volatile unsigned short *)0xF045C)
#define RMDF211 (*(volatile unsigned short *)0xF045C)
#define GAFLPL15L (*(volatile unsigned char *)0xF045C)
#define RMDF211L (*(volatile unsigned char *)0xF045C)
#define GAFLPL15H (*(volatile unsigned char *)0xF045D)
#define RMDF211H (*(volatile unsigned char *)0xF045D)
#define GAFLPH15 (*(volatile unsigned short *)0xF045E)
#define RMDF311 (*(volatile unsigned short *)0xF045E)
#define GAFLPH15L (*(volatile unsigned char *)0xF045E)
#define RMDF311L (*(volatile unsigned char *)0xF045E)
#define GAFLPH15H (*(volatile unsigned char *)0xF045F)
#define RMDF311H (*(volatile unsigned char *)0xF045F)
#define RMIDL12 (*(volatile unsigned short *)0xF0460)
#define RMIDL12L (*(volatile unsigned char *)0xF0460)
#define RMIDL12H (*(volatile unsigned char *)0xF0461)
#define RMIDH12 (*(volatile unsigned short *)0xF0462)
#define RMIDH12L (*(volatile unsigned char *)0xF0462)
#define RMIDH12H (*(volatile unsigned char *)0xF0463)
#define RMTS12 (*(volatile unsigned short *)0xF0464)
#define RMTS12L (*(volatile unsigned char *)0xF0464)
#define RMTS12H (*(volatile unsigned char *)0xF0465)
#define RMPTR12 (*(volatile unsigned short *)0xF0466)
#define RMPTR12L (*(volatile unsigned char *)0xF0466)
#define RMPTR12H (*(volatile unsigned char *)0xF0467)
#define RMDF012 (*(volatile unsigned short *)0xF0468)
#define RMDF012L (*(volatile unsigned char *)0xF0468)
#define RMDF012H (*(volatile unsigned char *)0xF0469)
#define RMDF112 (*(volatile unsigned short *)0xF046A)
#define RMDF112L (*(volatile unsigned char *)0xF046A)
#define RMDF112H (*(volatile unsigned char *)0xF046B)
#define RMDF212 (*(volatile unsigned short *)0xF046C)
#define RMDF212L (*(volatile unsigned char *)0xF046C)
#define RMDF212H (*(volatile unsigned char *)0xF046D)
#define RMDF312 (*(volatile unsigned short *)0xF046E)
#define RMDF312L (*(volatile unsigned char *)0xF046E)
#define RMDF312H (*(volatile unsigned char *)0xF046F)
#define RMIDL13 (*(volatile unsigned short *)0xF0470)
#define RMIDL13L (*(volatile unsigned char *)0xF0470)
#define RMIDL13H (*(volatile unsigned char *)0xF0471)
#define RMIDH13 (*(volatile unsigned short *)0xF0472)
#define RMIDH13L (*(volatile unsigned char *)0xF0472)
#define RMIDH13H (*(volatile unsigned char *)0xF0473)
#define RMTS13 (*(volatile unsigned short *)0xF0474)
#define RMTS13L (*(volatile unsigned char *)0xF0474)
#define RMTS13H (*(volatile unsigned char *)0xF0475)
#define RMPTR13 (*(volatile unsigned short *)0xF0476)
#define RMPTR13L (*(volatile unsigned char *)0xF0476)
#define RMPTR13H (*(volatile unsigned char *)0xF0477)
#define RMDF013 (*(volatile unsigned short *)0xF0478)
#define RMDF013L (*(volatile unsigned char *)0xF0478)
#define RMDF013H (*(volatile unsigned char *)0xF0479)
#define RMDF113 (*(volatile unsigned short *)0xF047A)
#define RMDF113L (*(volatile unsigned char *)0xF047A)
#define RMDF113H (*(volatile unsigned char *)0xF047B)
#define RMDF213 (*(volatile unsigned short *)0xF047C)
#define RMDF213L (*(volatile unsigned char *)0xF047C)
#define RMDF213H (*(volatile unsigned char *)0xF047D)
#define RMDF313 (*(volatile unsigned short *)0xF047E)
#define RMDF313L (*(volatile unsigned char *)0xF047E)
#define RMDF313H (*(volatile unsigned char *)0xF047F)
#define RMIDL14 (*(volatile unsigned short *)0xF0480)
#define RMIDL14L (*(volatile unsigned char *)0xF0480)
#define RMIDL14H (*(volatile unsigned char *)0xF0481)
#define RMIDH14 (*(volatile unsigned short *)0xF0482)
#define RMIDH14L (*(volatile unsigned char *)0xF0482)
#define RMIDH14H (*(volatile unsigned char *)0xF0483)
#define RMTS14 (*(volatile unsigned short *)0xF0484)
#define RMTS14L (*(volatile unsigned char *)0xF0484)
#define RMTS14H (*(volatile unsigned char *)0xF0485)
#define RMPTR14 (*(volatile unsigned short *)0xF0486)
#define RMPTR14L (*(volatile unsigned char *)0xF0486)
#define RMPTR14H (*(volatile unsigned char *)0xF0487)
#define RMDF014 (*(volatile unsigned short *)0xF0488)
#define RMDF014L (*(volatile unsigned char *)0xF0488)
#define RMDF014H (*(volatile unsigned char *)0xF0489)
#define RMDF114 (*(volatile unsigned short *)0xF048A)
#define RMDF114L (*(volatile unsigned char *)0xF048A)
#define RMDF114H (*(volatile unsigned char *)0xF048B)
#define RMDF214 (*(volatile unsigned short *)0xF048C)
#define RMDF214L (*(volatile unsigned char *)0xF048C)
#define RMDF214H (*(volatile unsigned char *)0xF048D)
#define RMDF314 (*(volatile unsigned short *)0xF048E)
#define RMDF314L (*(volatile unsigned char *)0xF048E)
#define RMDF314H (*(volatile unsigned char *)0xF048F)
#define RMIDL15 (*(volatile unsigned short *)0xF0490)
#define RMIDL15L (*(volatile unsigned char *)0xF0490)
#define RMIDL15H (*(volatile unsigned char *)0xF0491)
#define RMIDH15 (*(volatile unsigned short *)0xF0492)
#define RMIDH15L (*(volatile unsigned char *)0xF0492)
#define RMIDH15H (*(volatile unsigned char *)0xF0493)
#define RMTS15 (*(volatile unsigned short *)0xF0494)
#define RMTS15L (*(volatile unsigned char *)0xF0494)
#define RMTS15H (*(volatile unsigned char *)0xF0495)
#define RMPTR15 (*(volatile unsigned short *)0xF0496)
#define RMPTR15L (*(volatile unsigned char *)0xF0496)
#define RMPTR15H (*(volatile unsigned char *)0xF0497)
#define RMDF015 (*(volatile unsigned short *)0xF0498)
#define RMDF015L (*(volatile unsigned char *)0xF0498)
#define RMDF015H (*(volatile unsigned char *)0xF0499)
#define RMDF115 (*(volatile unsigned short *)0xF049A)
#define RMDF115L (*(volatile unsigned char *)0xF049A)
#define RMDF115H (*(volatile unsigned char *)0xF049B)
#define RMDF215 (*(volatile unsigned short *)0xF049C)
#define RMDF215L (*(volatile unsigned char *)0xF049C)
#define RMDF215H (*(volatile unsigned char *)0xF049D)
#define RMDF315 (*(volatile unsigned short *)0xF049E)
#define RMDF315L (*(volatile unsigned char *)0xF049E)
#define RMDF315H (*(volatile unsigned char *)0xF049F)
#define RPGACC0 (*(volatile unsigned short *)0xF0580)
#define RPGACC0L (*(volatile unsigned char *)0xF0580)
#define RPGACC0H (*(volatile unsigned char *)0xF0581)
#define RPGACC1 (*(volatile unsigned short *)0xF0582)
#define RPGACC1L (*(volatile unsigned char *)0xF0582)
#define RPGACC1H (*(volatile unsigned char *)0xF0583)
#define RPGACC2 (*(volatile unsigned short *)0xF0584)
#define RPGACC2L (*(volatile unsigned char *)0xF0584)
#define RPGACC2H (*(volatile unsigned char *)0xF0585)
#define RPGACC3 (*(volatile unsigned short *)0xF0586)
#define RPGACC3L (*(volatile unsigned char *)0xF0586)
#define RPGACC3H (*(volatile unsigned char *)0xF0587)
#define RPGACC4 (*(volatile unsigned short *)0xF0588)
#define RPGACC4L (*(volatile unsigned char *)0xF0588)
#define RPGACC4H (*(volatile unsigned char *)0xF0589)
#define RPGACC5 (*(volatile unsigned short *)0xF058A)
#define RPGACC5L (*(volatile unsigned char *)0xF058A)
#define RPGACC5H (*(volatile unsigned char *)0xF058B)
#define RPGACC6 (*(volatile unsigned short *)0xF058C)
#define RPGACC6L (*(volatile unsigned char *)0xF058C)
#define RPGACC6H (*(volatile unsigned char *)0xF058D)
#define RPGACC7 (*(volatile unsigned short *)0xF058E)
#define RPGACC7L (*(volatile unsigned char *)0xF058E)
#define RPGACC7H (*(volatile unsigned char *)0xF058F)
#define RPGACC8 (*(volatile unsigned short *)0xF0590)
#define RPGACC8L (*(volatile unsigned char *)0xF0590)
#define RPGACC8H (*(volatile unsigned char *)0xF0591)
#define RPGACC9 (*(volatile unsigned short *)0xF0592)
#define RPGACC9L (*(volatile unsigned char *)0xF0592)
#define RPGACC9H (*(volatile unsigned char *)0xF0593)
#define RPGACC10 (*(volatile unsigned short *)0xF0594)
#define RPGACC10L (*(volatile unsigned char *)0xF0594)
#define RPGACC10H (*(volatile unsigned char *)0xF0595)
#define RPGACC11 (*(volatile unsigned short *)0xF0596)
#define RPGACC11L (*(volatile unsigned char *)0xF0596)
#define RPGACC11H (*(volatile unsigned char *)0xF0597)
#define RPGACC12 (*(volatile unsigned short *)0xF0598)
#define RPGACC12L (*(volatile unsigned char *)0xF0598)
#define RPGACC12H (*(volatile unsigned char *)0xF0599)
#define RPGACC13 (*(volatile unsigned short *)0xF059A)
#define RPGACC13L (*(volatile unsigned char *)0xF059A)
#define RPGACC13H (*(volatile unsigned char *)0xF059B)
#define RPGACC14 (*(volatile unsigned short *)0xF059C)
#define RPGACC14L (*(volatile unsigned char *)0xF059C)
#define RPGACC14H (*(volatile unsigned char *)0xF059D)
#define RPGACC15 (*(volatile unsigned short *)0xF059E)
#define RPGACC15L (*(volatile unsigned char *)0xF059E)
#define RPGACC15H (*(volatile unsigned char *)0xF059F)
#define RFIDL0 (*(volatile unsigned short *)0xF05A0)
#define RPGACC16 (*(volatile unsigned short *)0xF05A0)
#define RFIDL0L (*(volatile unsigned char *)0xF05A0)
#define RPGACC16L (*(volatile unsigned char *)0xF05A0)
#define RFIDL0H (*(volatile unsigned char *)0xF05A1)
#define RPGACC16H (*(volatile unsigned char *)0xF05A1)
#define RFIDH0 (*(volatile unsigned short *)0xF05A2)
#define RPGACC17 (*(volatile unsigned short *)0xF05A2)
#define RFIDH0L (*(volatile unsigned char *)0xF05A2)
#define RPGACC17L (*(volatile unsigned char *)0xF05A2)
#define RFIDH0H (*(volatile unsigned char *)0xF05A3)
#define RPGACC17H (*(volatile unsigned char *)0xF05A3)
#define RFTS0 (*(volatile unsigned short *)0xF05A4)
#define RPGACC18 (*(volatile unsigned short *)0xF05A4)
#define RFTS0L (*(volatile unsigned char *)0xF05A4)
#define RPGACC18L (*(volatile unsigned char *)0xF05A4)
#define RFTS0H (*(volatile unsigned char *)0xF05A5)
#define RPGACC18H (*(volatile unsigned char *)0xF05A5)
#define RFPTR0 (*(volatile unsigned short *)0xF05A6)
#define RPGACC19 (*(volatile unsigned short *)0xF05A6)
#define RFPTR0L (*(volatile unsigned char *)0xF05A6)
#define RPGACC19L (*(volatile unsigned char *)0xF05A6)
#define RFPTR0H (*(volatile unsigned char *)0xF05A7)
#define RPGACC19H (*(volatile unsigned char *)0xF05A7)
#define RFDF00 (*(volatile unsigned short *)0xF05A8)
#define RPGACC20 (*(volatile unsigned short *)0xF05A8)
#define RFDF00L (*(volatile unsigned char *)0xF05A8)
#define RPGACC20L (*(volatile unsigned char *)0xF05A8)
#define RFDF00H (*(volatile unsigned char *)0xF05A9)
#define RPGACC20H (*(volatile unsigned char *)0xF05A9)
#define RFDF10 (*(volatile unsigned short *)0xF05AA)
#define RPGACC21 (*(volatile unsigned short *)0xF05AA)
#define RFDF10L (*(volatile unsigned char *)0xF05AA)
#define RPGACC21L (*(volatile unsigned char *)0xF05AA)
#define RFDF10H (*(volatile unsigned char *)0xF05AB)
#define RPGACC21H (*(volatile unsigned char *)0xF05AB)
#define RFDF20 (*(volatile unsigned short *)0xF05AC)
#define RPGACC22 (*(volatile unsigned short *)0xF05AC)
#define RFDF20L (*(volatile unsigned char *)0xF05AC)
#define RPGACC22L (*(volatile unsigned char *)0xF05AC)
#define RFDF20H (*(volatile unsigned char *)0xF05AD)
#define RPGACC22H (*(volatile unsigned char *)0xF05AD)
#define RFDF30 (*(volatile unsigned short *)0xF05AE)
#define RPGACC23 (*(volatile unsigned short *)0xF05AE)
#define RFDF30L (*(volatile unsigned char *)0xF05AE)
#define RPGACC23L (*(volatile unsigned char *)0xF05AE)
#define RFDF30H (*(volatile unsigned char *)0xF05AF)
#define RPGACC23H (*(volatile unsigned char *)0xF05AF)
#define RFIDL1 (*(volatile unsigned short *)0xF05B0)
#define RPGACC24 (*(volatile unsigned short *)0xF05B0)
#define RFIDL1L (*(volatile unsigned char *)0xF05B0)
#define RPGACC24L (*(volatile unsigned char *)0xF05B0)
#define RFIDL1H (*(volatile unsigned char *)0xF05B1)
#define RPGACC24H (*(volatile unsigned char *)0xF05B1)
#define RFIDH1 (*(volatile unsigned short *)0xF05B2)
#define RPGACC25 (*(volatile unsigned short *)0xF05B2)
#define RFIDH1L (*(volatile unsigned char *)0xF05B2)
#define RPGACC25L (*(volatile unsigned char *)0xF05B2)
#define RFIDH1H (*(volatile unsigned char *)0xF05B3)
#define RPGACC25H (*(volatile unsigned char *)0xF05B3)
#define RFTS1 (*(volatile unsigned short *)0xF05B4)
#define RPGACC26 (*(volatile unsigned short *)0xF05B4)
#define RFTS1L (*(volatile unsigned char *)0xF05B4)
#define RPGACC26L (*(volatile unsigned char *)0xF05B4)
#define RFTS1H (*(volatile unsigned char *)0xF05B5)
#define RPGACC26H (*(volatile unsigned char *)0xF05B5)
#define RFPTR1 (*(volatile unsigned short *)0xF05B6)
#define RPGACC27 (*(volatile unsigned short *)0xF05B6)
#define RFPTR1L (*(volatile unsigned char *)0xF05B6)
#define RPGACC27L (*(volatile unsigned char *)0xF05B6)
#define RFPTR1H (*(volatile unsigned char *)0xF05B7)
#define RPGACC27H (*(volatile unsigned char *)0xF05B7)
#define RFDF01 (*(volatile unsigned short *)0xF05B8)
#define RPGACC28 (*(volatile unsigned short *)0xF05B8)
#define RFDF01L (*(volatile unsigned char *)0xF05B8)
#define RPGACC28L (*(volatile unsigned char *)0xF05B8)
#define RFDF01H (*(volatile unsigned char *)0xF05B9)
#define RPGACC28H (*(volatile unsigned char *)0xF05B9)
#define RFDF11 (*(volatile unsigned short *)0xF05BA)
#define RPGACC29 (*(volatile unsigned short *)0xF05BA)
#define RFDF11L (*(volatile unsigned char *)0xF05BA)
#define RPGACC29L (*(volatile unsigned char *)0xF05BA)
#define RFDF11H (*(volatile unsigned char *)0xF05BB)
#define RPGACC29H (*(volatile unsigned char *)0xF05BB)
#define RFDF21 (*(volatile unsigned short *)0xF05BC)
#define RPGACC30 (*(volatile unsigned short *)0xF05BC)
#define RFDF21L (*(volatile unsigned char *)0xF05BC)
#define RPGACC30L (*(volatile unsigned char *)0xF05BC)
#define RFDF21H (*(volatile unsigned char *)0xF05BD)
#define RPGACC30H (*(volatile unsigned char *)0xF05BD)
#define RFDF31 (*(volatile unsigned short *)0xF05BE)
#define RPGACC31 (*(volatile unsigned short *)0xF05BE)
#define RFDF31L (*(volatile unsigned char *)0xF05BE)
#define RPGACC31L (*(volatile unsigned char *)0xF05BE)
#define RFDF31H (*(volatile unsigned char *)0xF05BF)
#define RPGACC31H (*(volatile unsigned char *)0xF05BF)
#define RPGACC32 (*(volatile unsigned short *)0xF05C0)
#define RPGACC32L (*(volatile unsigned char *)0xF05C0)
#define RPGACC32H (*(volatile unsigned char *)0xF05C1)
#define RPGACC33 (*(volatile unsigned short *)0xF05C2)
#define RPGACC33L (*(volatile unsigned char *)0xF05C2)
#define RPGACC33H (*(volatile unsigned char *)0xF05C3)
#define RPGACC34 (*(volatile unsigned short *)0xF05C4)
#define RPGACC34L (*(volatile unsigned char *)0xF05C4)
#define RPGACC34H (*(volatile unsigned char *)0xF05C5)
#define RPGACC35 (*(volatile unsigned short *)0xF05C6)
#define RPGACC35L (*(volatile unsigned char *)0xF05C6)
#define RPGACC35H (*(volatile unsigned char *)0xF05C7)
#define RPGACC36 (*(volatile unsigned short *)0xF05C8)
#define RPGACC36L (*(volatile unsigned char *)0xF05C8)
#define RPGACC36H (*(volatile unsigned char *)0xF05C9)
#define RPGACC37 (*(volatile unsigned short *)0xF05CA)
#define RPGACC37L (*(volatile unsigned char *)0xF05CA)
#define RPGACC37H (*(volatile unsigned char *)0xF05CB)
#define RPGACC38 (*(volatile unsigned short *)0xF05CC)
#define RPGACC38L (*(volatile unsigned char *)0xF05CC)
#define RPGACC38H (*(volatile unsigned char *)0xF05CD)
#define RPGACC39 (*(volatile unsigned short *)0xF05CE)
#define RPGACC39L (*(volatile unsigned char *)0xF05CE)
#define RPGACC39H (*(volatile unsigned char *)0xF05CF)
#define RPGACC40 (*(volatile unsigned short *)0xF05D0)
#define RPGACC40L (*(volatile unsigned char *)0xF05D0)
#define RPGACC40H (*(volatile unsigned char *)0xF05D1)
#define RPGACC41 (*(volatile unsigned short *)0xF05D2)
#define RPGACC41L (*(volatile unsigned char *)0xF05D2)
#define RPGACC41H (*(volatile unsigned char *)0xF05D3)
#define RPGACC42 (*(volatile unsigned short *)0xF05D4)
#define RPGACC42L (*(volatile unsigned char *)0xF05D4)
#define RPGACC42H (*(volatile unsigned char *)0xF05D5)
#define RPGACC43 (*(volatile unsigned short *)0xF05D6)
#define RPGACC43L (*(volatile unsigned char *)0xF05D6)
#define RPGACC43H (*(volatile unsigned char *)0xF05D7)
#define RPGACC44 (*(volatile unsigned short *)0xF05D8)
#define RPGACC44L (*(volatile unsigned char *)0xF05D8)
#define RPGACC44H (*(volatile unsigned char *)0xF05D9)
#define RPGACC45 (*(volatile unsigned short *)0xF05DA)
#define RPGACC45L (*(volatile unsigned char *)0xF05DA)
#define RPGACC45H (*(volatile unsigned char *)0xF05DB)
#define RPGACC46 (*(volatile unsigned short *)0xF05DC)
#define RPGACC46L (*(volatile unsigned char *)0xF05DC)
#define RPGACC46H (*(volatile unsigned char *)0xF05DD)
#define RPGACC47 (*(volatile unsigned short *)0xF05DE)
#define RPGACC47L (*(volatile unsigned char *)0xF05DE)
#define RPGACC47H (*(volatile unsigned char *)0xF05DF)
#define CFIDL0 (*(volatile unsigned short *)0xF05E0)
#define RPGACC48 (*(volatile unsigned short *)0xF05E0)
#define CFIDL0L (*(volatile unsigned char *)0xF05E0)
#define RPGACC48L (*(volatile unsigned char *)0xF05E0)
#define CFIDL0H (*(volatile unsigned char *)0xF05E1)
#define RPGACC48H (*(volatile unsigned char *)0xF05E1)
#define CFIDH0 (*(volatile unsigned short *)0xF05E2)
#define RPGACC49 (*(volatile unsigned short *)0xF05E2)
#define CFIDH0L (*(volatile unsigned char *)0xF05E2)
#define RPGACC49L (*(volatile unsigned char *)0xF05E2)
#define CFIDH0H (*(volatile unsigned char *)0xF05E3)
#define RPGACC49H (*(volatile unsigned char *)0xF05E3)
#define CFTS0 (*(volatile unsigned short *)0xF05E4)
#define RPGACC50 (*(volatile unsigned short *)0xF05E4)
#define CFTS0L (*(volatile unsigned char *)0xF05E4)
#define RPGACC50L (*(volatile unsigned char *)0xF05E4)
#define CFTS0H (*(volatile unsigned char *)0xF05E5)
#define RPGACC50H (*(volatile unsigned char *)0xF05E5)
#define CFPTR0 (*(volatile unsigned short *)0xF05E6)
#define RPGACC51 (*(volatile unsigned short *)0xF05E6)
#define CFPTR0L (*(volatile unsigned char *)0xF05E6)
#define RPGACC51L (*(volatile unsigned char *)0xF05E6)
#define CFPTR0H (*(volatile unsigned char *)0xF05E7)
#define RPGACC51H (*(volatile unsigned char *)0xF05E7)
#define CFDF00 (*(volatile unsigned short *)0xF05E8)
#define RPGACC52 (*(volatile unsigned short *)0xF05E8)
#define CFDF00L (*(volatile unsigned char *)0xF05E8)
#define RPGACC52L (*(volatile unsigned char *)0xF05E8)
#define CFDF00H (*(volatile unsigned char *)0xF05E9)
#define RPGACC52H (*(volatile unsigned char *)0xF05E9)
#define CFDF10 (*(volatile unsigned short *)0xF05EA)
#define RPGACC53 (*(volatile unsigned short *)0xF05EA)
#define CFDF10L (*(volatile unsigned char *)0xF05EA)
#define RPGACC53L (*(volatile unsigned char *)0xF05EA)
#define CFDF10H (*(volatile unsigned char *)0xF05EB)
#define RPGACC53H (*(volatile unsigned char *)0xF05EB)
#define CFDF20 (*(volatile unsigned short *)0xF05EC)
#define RPGACC54 (*(volatile unsigned short *)0xF05EC)
#define CFDF20L (*(volatile unsigned char *)0xF05EC)
#define RPGACC54L (*(volatile unsigned char *)0xF05EC)
#define CFDF20H (*(volatile unsigned char *)0xF05ED)
#define RPGACC54H (*(volatile unsigned char *)0xF05ED)
#define CFDF30 (*(volatile unsigned short *)0xF05EE)
#define RPGACC55 (*(volatile unsigned short *)0xF05EE)
#define CFDF30L (*(volatile unsigned char *)0xF05EE)
#define RPGACC55L (*(volatile unsigned char *)0xF05EE)
#define CFDF30H (*(volatile unsigned char *)0xF05EF)
#define RPGACC55H (*(volatile unsigned char *)0xF05EF)
#define RPGACC56 (*(volatile unsigned short *)0xF05F0)
#define RPGACC56L (*(volatile unsigned char *)0xF05F0)
#define RPGACC56H (*(volatile unsigned char *)0xF05F1)
#define RPGACC57 (*(volatile unsigned short *)0xF05F2)
#define RPGACC57L (*(volatile unsigned char *)0xF05F2)
#define RPGACC57H (*(volatile unsigned char *)0xF05F3)
#define RPGACC58 (*(volatile unsigned short *)0xF05F4)
#define RPGACC58L (*(volatile unsigned char *)0xF05F4)
#define RPGACC58H (*(volatile unsigned char *)0xF05F5)
#define RPGACC59 (*(volatile unsigned short *)0xF05F6)
#define RPGACC59L (*(volatile unsigned char *)0xF05F6)
#define RPGACC59H (*(volatile unsigned char *)0xF05F7)
#define RPGACC60 (*(volatile unsigned short *)0xF05F8)
#define RPGACC60L (*(volatile unsigned char *)0xF05F8)
#define RPGACC60H (*(volatile unsigned char *)0xF05F9)
#define RPGACC61 (*(volatile unsigned short *)0xF05FA)
#define RPGACC61L (*(volatile unsigned char *)0xF05FA)
#define RPGACC61H (*(volatile unsigned char *)0xF05FB)
#define RPGACC62 (*(volatile unsigned short *)0xF05FC)
#define RPGACC62L (*(volatile unsigned char *)0xF05FC)
#define RPGACC62H (*(volatile unsigned char *)0xF05FD)
#define RPGACC63 (*(volatile unsigned short *)0xF05FE)
#define RPGACC63L (*(volatile unsigned char *)0xF05FE)
#define RPGACC63H (*(volatile unsigned char *)0xF05FF)
#define RPGACC64 (*(volatile unsigned short *)0xF0600)
#define TMIDL0 (*(volatile unsigned short *)0xF0600)
#define RPGACC64L (*(volatile unsigned char *)0xF0600)
#define TMIDL0L (*(volatile unsigned char *)0xF0600)
#define RPGACC64H (*(volatile unsigned char *)0xF0601)
#define TMIDL0H (*(volatile unsigned char *)0xF0601)
#define RPGACC65 (*(volatile unsigned short *)0xF0602)
#define TMIDH0 (*(volatile unsigned short *)0xF0602)
#define RPGACC65L (*(volatile unsigned char *)0xF0602)
#define TMIDH0L (*(volatile unsigned char *)0xF0602)
#define RPGACC65H (*(volatile unsigned char *)0xF0603)
#define TMIDH0H (*(volatile unsigned char *)0xF0603)
#define RPGACC66 (*(volatile unsigned short *)0xF0604)
#define RPGACC66L (*(volatile unsigned char *)0xF0604)
#define RPGACC66H (*(volatile unsigned char *)0xF0605)
#define RPGACC67 (*(volatile unsigned short *)0xF0606)
#define TMPTR0 (*(volatile unsigned short *)0xF0606)
#define RPGACC67L (*(volatile unsigned char *)0xF0606)
#define TMPTR0L (*(volatile unsigned char *)0xF0606)
#define RPGACC67H (*(volatile unsigned char *)0xF0607)
#define TMPTR0H (*(volatile unsigned char *)0xF0607)
#define RPGACC68 (*(volatile unsigned short *)0xF0608)
#define TMDF00 (*(volatile unsigned short *)0xF0608)
#define RPGACC68L (*(volatile unsigned char *)0xF0608)
#define TMDF00L (*(volatile unsigned char *)0xF0608)
#define RPGACC68H (*(volatile unsigned char *)0xF0609)
#define TMDF00H (*(volatile unsigned char *)0xF0609)
#define RPGACC69 (*(volatile unsigned short *)0xF060A)
#define TMDF10 (*(volatile unsigned short *)0xF060A)
#define RPGACC69L (*(volatile unsigned char *)0xF060A)
#define TMDF10L (*(volatile unsigned char *)0xF060A)
#define RPGACC69H (*(volatile unsigned char *)0xF060B)
#define TMDF10H (*(volatile unsigned char *)0xF060B)
#define RPGACC70 (*(volatile unsigned short *)0xF060C)
#define TMDF20 (*(volatile unsigned short *)0xF060C)
#define RPGACC70L (*(volatile unsigned char *)0xF060C)
#define TMDF20L (*(volatile unsigned char *)0xF060C)
#define RPGACC70H (*(volatile unsigned char *)0xF060D)
#define TMDF20H (*(volatile unsigned char *)0xF060D)
#define RPGACC71 (*(volatile unsigned short *)0xF060E)
#define TMDF30 (*(volatile unsigned short *)0xF060E)
#define RPGACC71L (*(volatile unsigned char *)0xF060E)
#define TMDF30L (*(volatile unsigned char *)0xF060E)
#define RPGACC71H (*(volatile unsigned char *)0xF060F)
#define TMDF30H (*(volatile unsigned char *)0xF060F)
#define RPGACC72 (*(volatile unsigned short *)0xF0610)
#define TMIDL1 (*(volatile unsigned short *)0xF0610)
#define RPGACC72L (*(volatile unsigned char *)0xF0610)
#define TMIDL1L (*(volatile unsigned char *)0xF0610)
#define RPGACC72H (*(volatile unsigned char *)0xF0611)
#define TMIDL1H (*(volatile unsigned char *)0xF0611)
#define RPGACC73 (*(volatile unsigned short *)0xF0612)
#define TMIDH1 (*(volatile unsigned short *)0xF0612)
#define RPGACC73L (*(volatile unsigned char *)0xF0612)
#define TMIDH1L (*(volatile unsigned char *)0xF0612)
#define RPGACC73H (*(volatile unsigned char *)0xF0613)
#define TMIDH1H (*(volatile unsigned char *)0xF0613)
#define RPGACC74 (*(volatile unsigned short *)0xF0614)
#define RPGACC74L (*(volatile unsigned char *)0xF0614)
#define RPGACC74H (*(volatile unsigned char *)0xF0615)
#define RPGACC75 (*(volatile unsigned short *)0xF0616)
#define TMPTR1 (*(volatile unsigned short *)0xF0616)
#define RPGACC75L (*(volatile unsigned char *)0xF0616)
#define TMPTR1L (*(volatile unsigned char *)0xF0616)
#define RPGACC75H (*(volatile unsigned char *)0xF0617)
#define TMPTR1H (*(volatile unsigned char *)0xF0617)
#define RPGACC76 (*(volatile unsigned short *)0xF0618)
#define TMDF01 (*(volatile unsigned short *)0xF0618)
#define RPGACC76L (*(volatile unsigned char *)0xF0618)
#define TMDF01L (*(volatile unsigned char *)0xF0618)
#define RPGACC76H (*(volatile unsigned char *)0xF0619)
#define TMDF01H (*(volatile unsigned char *)0xF0619)
#define RPGACC77 (*(volatile unsigned short *)0xF061A)
#define TMDF11 (*(volatile unsigned short *)0xF061A)
#define RPGACC77L (*(volatile unsigned char *)0xF061A)
#define TMDF11L (*(volatile unsigned char *)0xF061A)
#define RPGACC77H (*(volatile unsigned char *)0xF061B)
#define TMDF11H (*(volatile unsigned char *)0xF061B)
#define RPGACC78 (*(volatile unsigned short *)0xF061C)
#define TMDF21 (*(volatile unsigned short *)0xF061C)
#define RPGACC78L (*(volatile unsigned char *)0xF061C)
#define TMDF21L (*(volatile unsigned char *)0xF061C)
#define RPGACC78H (*(volatile unsigned char *)0xF061D)
#define TMDF21H (*(volatile unsigned char *)0xF061D)
#define RPGACC79 (*(volatile unsigned short *)0xF061E)
#define TMDF31 (*(volatile unsigned short *)0xF061E)
#define RPGACC79L (*(volatile unsigned char *)0xF061E)
#define TMDF31L (*(volatile unsigned char *)0xF061E)
#define RPGACC79H (*(volatile unsigned char *)0xF061F)
#define TMDF31H (*(volatile unsigned char *)0xF061F)
#define RPGACC80 (*(volatile unsigned short *)0xF0620)
#define TMIDL2 (*(volatile unsigned short *)0xF0620)
#define RPGACC80L (*(volatile unsigned char *)0xF0620)
#define TMIDL2L (*(volatile unsigned char *)0xF0620)
#define RPGACC80H (*(volatile unsigned char *)0xF0621)
#define TMIDL2H (*(volatile unsigned char *)0xF0621)
#define RPGACC81 (*(volatile unsigned short *)0xF0622)
#define TMIDH2 (*(volatile unsigned short *)0xF0622)
#define RPGACC81L (*(volatile unsigned char *)0xF0622)
#define TMIDH2L (*(volatile unsigned char *)0xF0622)
#define RPGACC81H (*(volatile unsigned char *)0xF0623)
#define TMIDH2H (*(volatile unsigned char *)0xF0623)
#define RPGACC82 (*(volatile unsigned short *)0xF0624)
#define RPGACC82L (*(volatile unsigned char *)0xF0624)
#define RPGACC82H (*(volatile unsigned char *)0xF0625)
#define RPGACC83 (*(volatile unsigned short *)0xF0626)
#define TMPTR2 (*(volatile unsigned short *)0xF0626)
#define RPGACC83L (*(volatile unsigned char *)0xF0626)
#define TMPTR2L (*(volatile unsigned char *)0xF0626)
#define RPGACC83H (*(volatile unsigned char *)0xF0627)
#define TMPTR2H (*(volatile unsigned char *)0xF0627)
#define RPGACC84 (*(volatile unsigned short *)0xF0628)
#define TMDF02 (*(volatile unsigned short *)0xF0628)
#define RPGACC84L (*(volatile unsigned char *)0xF0628)
#define TMDF02L (*(volatile unsigned char *)0xF0628)
#define RPGACC84H (*(volatile unsigned char *)0xF0629)
#define TMDF02H (*(volatile unsigned char *)0xF0629)
#define RPGACC85 (*(volatile unsigned short *)0xF062A)
#define TMDF12 (*(volatile unsigned short *)0xF062A)
#define RPGACC85L (*(volatile unsigned char *)0xF062A)
#define TMDF12L (*(volatile unsigned char *)0xF062A)
#define RPGACC85H (*(volatile unsigned char *)0xF062B)
#define TMDF12H (*(volatile unsigned char *)0xF062B)
#define RPGACC86 (*(volatile unsigned short *)0xF062C)
#define TMDF22 (*(volatile unsigned short *)0xF062C)
#define RPGACC86L (*(volatile unsigned char *)0xF062C)
#define TMDF22L (*(volatile unsigned char *)0xF062C)
#define RPGACC86H (*(volatile unsigned char *)0xF062D)
#define TMDF22H (*(volatile unsigned char *)0xF062D)
#define RPGACC87 (*(volatile unsigned short *)0xF062E)
#define TMDF32 (*(volatile unsigned short *)0xF062E)
#define RPGACC87L (*(volatile unsigned char *)0xF062E)
#define TMDF32L (*(volatile unsigned char *)0xF062E)
#define RPGACC87H (*(volatile unsigned char *)0xF062F)
#define TMDF32H (*(volatile unsigned char *)0xF062F)
#define RPGACC88 (*(volatile unsigned short *)0xF0630)
#define TMIDL3 (*(volatile unsigned short *)0xF0630)
#define RPGACC88L (*(volatile unsigned char *)0xF0630)
#define TMIDL3L (*(volatile unsigned char *)0xF0630)
#define RPGACC88H (*(volatile unsigned char *)0xF0631)
#define TMIDL3H (*(volatile unsigned char *)0xF0631)
#define RPGACC89 (*(volatile unsigned short *)0xF0632)
#define TMIDH3 (*(volatile unsigned short *)0xF0632)
#define RPGACC89L (*(volatile unsigned char *)0xF0632)
#define TMIDH3L (*(volatile unsigned char *)0xF0632)
#define RPGACC89H (*(volatile unsigned char *)0xF0633)
#define TMIDH3H (*(volatile unsigned char *)0xF0633)
#define RPGACC90 (*(volatile unsigned short *)0xF0634)
#define RPGACC90L (*(volatile unsigned char *)0xF0634)
#define RPGACC90H (*(volatile unsigned char *)0xF0635)
#define RPGACC91 (*(volatile unsigned short *)0xF0636)
#define TMPTR3 (*(volatile unsigned short *)0xF0636)
#define RPGACC91L (*(volatile unsigned char *)0xF0636)
#define TMPTR3L (*(volatile unsigned char *)0xF0636)
#define RPGACC91H (*(volatile unsigned char *)0xF0637)
#define TMPTR3H (*(volatile unsigned char *)0xF0637)
#define RPGACC92 (*(volatile unsigned short *)0xF0638)
#define TMDF03 (*(volatile unsigned short *)0xF0638)
#define RPGACC92L (*(volatile unsigned char *)0xF0638)
#define TMDF03L (*(volatile unsigned char *)0xF0638)
#define RPGACC92H (*(volatile unsigned char *)0xF0639)
#define TMDF03H (*(volatile unsigned char *)0xF0639)
#define RPGACC93 (*(volatile unsigned short *)0xF063A)
#define TMDF13 (*(volatile unsigned short *)0xF063A)
#define RPGACC93L (*(volatile unsigned char *)0xF063A)
#define TMDF13L (*(volatile unsigned char *)0xF063A)
#define RPGACC93H (*(volatile unsigned char *)0xF063B)
#define TMDF13H (*(volatile unsigned char *)0xF063B)
#define RPGACC94 (*(volatile unsigned short *)0xF063C)
#define TMDF23 (*(volatile unsigned short *)0xF063C)
#define RPGACC94L (*(volatile unsigned char *)0xF063C)
#define TMDF23L (*(volatile unsigned char *)0xF063C)
#define RPGACC94H (*(volatile unsigned char *)0xF063D)
#define TMDF23H (*(volatile unsigned char *)0xF063D)
#define RPGACC95 (*(volatile unsigned short *)0xF063E)
#define TMDF33 (*(volatile unsigned short *)0xF063E)
#define RPGACC95L (*(volatile unsigned char *)0xF063E)
#define TMDF33L (*(volatile unsigned char *)0xF063E)
#define RPGACC95H (*(volatile unsigned char *)0xF063F)
#define TMDF33H (*(volatile unsigned char *)0xF063F)
#define RPGACC96 (*(volatile unsigned short *)0xF0640)
#define RPGACC96L (*(volatile unsigned char *)0xF0640)
#define RPGACC96H (*(volatile unsigned char *)0xF0641)
#define RPGACC97 (*(volatile unsigned short *)0xF0642)
#define RPGACC97L (*(volatile unsigned char *)0xF0642)
#define RPGACC97H (*(volatile unsigned char *)0xF0643)
#define RPGACC98 (*(volatile unsigned short *)0xF0644)
#define RPGACC98L (*(volatile unsigned char *)0xF0644)
#define RPGACC98H (*(volatile unsigned char *)0xF0645)
#define RPGACC99 (*(volatile unsigned short *)0xF0646)
#define RPGACC99L (*(volatile unsigned char *)0xF0646)
#define RPGACC99H (*(volatile unsigned char *)0xF0647)
#define RPGACC100 (*(volatile unsigned short *)0xF0648)
#define RPGACC100L (*(volatile unsigned char *)0xF0648)
#define RPGACC100H (*(volatile unsigned char *)0xF0649)
#define RPGACC101 (*(volatile unsigned short *)0xF064A)
#define RPGACC101L (*(volatile unsigned char *)0xF064A)
#define RPGACC101H (*(volatile unsigned char *)0xF064B)
#define RPGACC102 (*(volatile unsigned short *)0xF064C)
#define RPGACC102L (*(volatile unsigned char *)0xF064C)
#define RPGACC102H (*(volatile unsigned char *)0xF064D)
#define RPGACC103 (*(volatile unsigned short *)0xF064E)
#define RPGACC103L (*(volatile unsigned char *)0xF064E)
#define RPGACC103H (*(volatile unsigned char *)0xF064F)
#define RPGACC104 (*(volatile unsigned short *)0xF0650)
#define RPGACC104L (*(volatile unsigned char *)0xF0650)
#define RPGACC104H (*(volatile unsigned char *)0xF0651)
#define RPGACC105 (*(volatile unsigned short *)0xF0652)
#define RPGACC105L (*(volatile unsigned char *)0xF0652)
#define RPGACC105H (*(volatile unsigned char *)0xF0653)
#define RPGACC106 (*(volatile unsigned short *)0xF0654)
#define RPGACC106L (*(volatile unsigned char *)0xF0654)
#define RPGACC106H (*(volatile unsigned char *)0xF0655)
#define RPGACC107 (*(volatile unsigned short *)0xF0656)
#define RPGACC107L (*(volatile unsigned char *)0xF0656)
#define RPGACC107H (*(volatile unsigned char *)0xF0657)
#define RPGACC108 (*(volatile unsigned short *)0xF0658)
#define RPGACC108L (*(volatile unsigned char *)0xF0658)
#define RPGACC108H (*(volatile unsigned char *)0xF0659)
#define RPGACC109 (*(volatile unsigned short *)0xF065A)
#define RPGACC109L (*(volatile unsigned char *)0xF065A)
#define RPGACC109H (*(volatile unsigned char *)0xF065B)
#define RPGACC110 (*(volatile unsigned short *)0xF065C)
#define RPGACC110L (*(volatile unsigned char *)0xF065C)
#define RPGACC110H (*(volatile unsigned char *)0xF065D)
#define RPGACC111 (*(volatile unsigned short *)0xF065E)
#define RPGACC111L (*(volatile unsigned char *)0xF065E)
#define RPGACC111H (*(volatile unsigned char *)0xF065F)
#define RPGACC112 (*(volatile unsigned short *)0xF0660)
#define RPGACC112L (*(volatile unsigned char *)0xF0660)
#define RPGACC112H (*(volatile unsigned char *)0xF0661)
#define RPGACC113 (*(volatile unsigned short *)0xF0662)
#define RPGACC113L (*(volatile unsigned char *)0xF0662)
#define RPGACC113H (*(volatile unsigned char *)0xF0663)
#define RPGACC114 (*(volatile unsigned short *)0xF0664)
#define RPGACC114L (*(volatile unsigned char *)0xF0664)
#define RPGACC114H (*(volatile unsigned char *)0xF0665)
#define RPGACC115 (*(volatile unsigned short *)0xF0666)
#define RPGACC115L (*(volatile unsigned char *)0xF0666)
#define RPGACC115H (*(volatile unsigned char *)0xF0667)
#define RPGACC116 (*(volatile unsigned short *)0xF0668)
#define RPGACC116L (*(volatile unsigned char *)0xF0668)
#define RPGACC116H (*(volatile unsigned char *)0xF0669)
#define RPGACC117 (*(volatile unsigned short *)0xF066A)
#define RPGACC117L (*(volatile unsigned char *)0xF066A)
#define RPGACC117H (*(volatile unsigned char *)0xF066B)
#define RPGACC118 (*(volatile unsigned short *)0xF066C)
#define RPGACC118L (*(volatile unsigned char *)0xF066C)
#define RPGACC118H (*(volatile unsigned char *)0xF066D)
#define RPGACC119 (*(volatile unsigned short *)0xF066E)
#define RPGACC119L (*(volatile unsigned char *)0xF066E)
#define RPGACC119H (*(volatile unsigned char *)0xF066F)
#define RPGACC120 (*(volatile unsigned short *)0xF0670)
#define RPGACC120L (*(volatile unsigned char *)0xF0670)
#define RPGACC120H (*(volatile unsigned char *)0xF0671)
#define RPGACC121 (*(volatile unsigned short *)0xF0672)
#define RPGACC121L (*(volatile unsigned char *)0xF0672)
#define RPGACC121H (*(volatile unsigned char *)0xF0673)
#define RPGACC122 (*(volatile unsigned short *)0xF0674)
#define RPGACC122L (*(volatile unsigned char *)0xF0674)
#define RPGACC122H (*(volatile unsigned char *)0xF0675)
#define RPGACC123 (*(volatile unsigned short *)0xF0676)
#define RPGACC123L (*(volatile unsigned char *)0xF0676)
#define RPGACC123H (*(volatile unsigned char *)0xF0677)
#define RPGACC124 (*(volatile unsigned short *)0xF0678)
#define RPGACC124L (*(volatile unsigned char *)0xF0678)
#define RPGACC124H (*(volatile unsigned char *)0xF0679)
#define RPGACC125 (*(volatile unsigned short *)0xF067A)
#define RPGACC125L (*(volatile unsigned char *)0xF067A)
#define RPGACC125H (*(volatile unsigned char *)0xF067B)
#define RPGACC126 (*(volatile unsigned short *)0xF067C)
#define RPGACC126L (*(volatile unsigned char *)0xF067C)
#define RPGACC126H (*(volatile unsigned char *)0xF067D)
#define RPGACC127 (*(volatile unsigned short *)0xF067E)
#define RPGACC127L (*(volatile unsigned char *)0xF067E)
#define RPGACC127H (*(volatile unsigned char *)0xF067F)
#define THLACC0 (*(volatile unsigned short *)0xF0680)
#define THLACC0L (*(volatile unsigned char *)0xF0680)
#define THLACC0H (*(volatile unsigned char *)0xF0681)
#define LWBR0 (*(volatile unsigned char *)0xF06C1)
#define LBRP0 (*(volatile unsigned short *)0xF06C2)
#define LBRP00 (*(volatile unsigned char *)0xF06C2)
#define LBRP01 (*(volatile unsigned char *)0xF06C3)
#define LSTC0 (*(volatile unsigned char *)0xF06C4)
#define LUSC0 (*(volatile unsigned char *)0xF06C5)
#define LMD0 (*(volatile unsigned char *)0xF06C8)
#define LBFC0 (*(volatile unsigned char *)0xF06C9)
#define LSC0 (*(volatile unsigned char *)0xF06CA)
#define LWUP0 (*(volatile unsigned char *)0xF06CB)
#define LIE0 (*(volatile unsigned char *)0xF06CC)
#define LEDE0 (*(volatile unsigned char *)0xF06CD)
#define LCUC0 (*(volatile unsigned char *)0xF06CE)
#define LTRC0 (*(volatile unsigned char *)0xF06D0)
#define LMST0 (*(volatile unsigned char *)0xF06D1)
#define LST0 (*(volatile unsigned char *)0xF06D2)
#define LEST0 (*(volatile unsigned char *)0xF06D3)
#define LDFC0 (*(volatile unsigned char *)0xF06D4)
#define LIDB0 (*(volatile unsigned char *)0xF06D5)
#define LCBR0 (*(volatile unsigned char *)0xF06D6)
#define LUDB00 (*(volatile unsigned char *)0xF06D7)
#define LDB01 (*(volatile unsigned char *)0xF06D8)
#define LDB02 (*(volatile unsigned char *)0xF06D9)
#define LDB03 (*(volatile unsigned char *)0xF06DA)
#define LDB04 (*(volatile unsigned char *)0xF06DB)
#define LDB05 (*(volatile unsigned char *)0xF06DC)
#define LDB06 (*(volatile unsigned char *)0xF06DD)
#define LDB07 (*(volatile unsigned char *)0xF06DE)
#define LDB08 (*(volatile unsigned char *)0xF06DF)
#define LUOER0 (*(volatile unsigned char *)0xF06E0)
#define LUOR01 (*(volatile unsigned char *)0xF06E1)
#define LUTDR0 (*(volatile unsigned short *)0xF06E4)
#define LUTDR0L (*(volatile unsigned char *)0xF06E4)
#define LUTDR0H (*(volatile unsigned char *)0xF06E5)
#define LURDR0 (*(volatile unsigned short *)0xF06E6)
#define LURDR0L (*(volatile unsigned char *)0xF06E6)
#define LURDR0H (*(volatile unsigned char *)0xF06E7)
#define LUWTDR0 (*(volatile unsigned short *)0xF06E8)
#define LUWTDR0L (*(volatile unsigned char *)0xF06E8)
#define LUWTDR0H (*(volatile unsigned char *)0xF06E9)
#define TRJ0 (*(volatile unsigned short *)0xF06F0)
#define ADTRGS0 (*(volatile union un_adtrgs0 *)0xF0789).adtrgs0
#define ADTRGS0_bit (*(volatile union un_adtrgs0 *)0xF0789).BIT
#define ADTRGS1 (*(volatile union un_adtrgs1 *)0xF078D).adtrgs1
#define ADTRGS1_bit (*(volatile union un_adtrgs1 *)0xF078D).BIT

/*
 Sfr bits
 */
#define ADTYP ADM2_bit.no0
#define AWC ADM2_bit.no2
#define ADRCK ADM2_bit.no3
#define DFLEN DFLCTL_bit.no0
#define TAU0EN PER0_bit.no0
#define TAU1EN PER0_bit.no1
#define SAU0EN PER0_bit.no2
#define SAU1EN PER0_bit.no3
#define IICA0EN PER0_bit.no4
#define ADCEN PER0_bit.no5
#define RTCEN PER0_bit.no7
#define SPT0 IICCTL00_bit.no0
#define STT0 IICCTL00_bit.no1
#define ACKE0 IICCTL00_bit.no2
#define WTIM0 IICCTL00_bit.no3
#define SPIE0 IICCTL00_bit.no4
#define WREL0 IICCTL00_bit.no5
#define LREL0 IICCTL00_bit.no6
#define IICE0 IICCTL00_bit.no7
#define PRS0 IICCTL01_bit.no0
#define DFC0 IICCTL01_bit.no2
#define SMC0 IICCTL01_bit.no3
#define DAD0 IICCTL01_bit.no4
#define CLD0 IICCTL01_bit.no5
#define WUP0 IICCTL01_bit.no7
#define TRDSYNC TRDMR_bit.no0
#define TRDBFC0 TRDMR_bit.no4
#define TRDBFD0 TRDMR_bit.no5
#define TRDBFC1 TRDMR_bit.no6
#define TRDBFD1 TRDMR_bit.no7
#define TRDPWMB0 TRDPMR_bit.no0
#define TRDPWMC0 TRDPMR_bit.no1
#define TRDPWMD0 TRDPMR_bit.no2
#define TRDPWMB1 TRDPMR_bit.no4
#define TRDPWMC1 TRDPMR_bit.no5
#define TRDPWMD1 TRDPMR_bit.no6
#define TRDSHUTS TRDOER2_bit.no0
#define TRDPTO TRDOER2_bit.no7
#define TRJ0EN PER1_bit.no0
#define DTCEN PER1_bit.no3
#define TRD0EN PER1_bit.no4
#define CAN0EN PER2_bit.no0
#define LIN0EN PER2_bit.no2
#define CAN0MCKE CANCKSEL_bit.no0
#define LIN0MCK LINCKSEL_bit.no0
#define LIN0MCKE LINCKSEL_bit.no4
#define SELLOSC CKSEL_bit.no0
#define TRD_CKSEL CKSEL_bit.no2
#define PLLON PLLCTL_bit.no0
#define PLLMUL PLLCTL_bit.no1
#define SELPLL PLLCTL_bit.no2
#define PLLDIV0 PLLCTL_bit.no4
#define PLLDIV1 PLLCTL_bit.no5
#define LCKSEL0 PLLCTL_bit.no6
#define LCKSEL1 PLLCTL_bit.no7
#define SELPLLS PLLSTS_bit.no3
#define LOCK PLLSTS_bit.no7
#define POCRES0 POCRES_bit.no0
#define CLKRF POCRES_bit.no4
#define STPLV STPSTC_bit.no4
#define STPOEN STPSTC_bit.no7
#define HMODE0 HDTCCR0_bit.no0
#define HRPTSEL0 HDTCCR0_bit.no1
#define HSAMOD0 HDTCCR0_bit.no2
#define HDAMOD0 HDTCCR0_bit.no3
#define HCHNE0 HDTCCR0_bit.no4
#define HRPTINT0 HDTCCR0_bit.no5
#define HSZ0 HDTCCR0_bit.no6
#define HMODE1 HDTCCR1_bit.no0
#define HRPTSEL1 HDTCCR1_bit.no1
#define HSAMOD1 HDTCCR1_bit.no2
#define HDAMOD1 HDTCCR1_bit.no3
#define HCHNE1 HDTCCR1_bit.no4
#define HRPTINT1 HDTCCR1_bit.no5
#define HSZ1 HDTCCR1_bit.no6
#define DTCEN00 DTCEN0_bit.no0
#define DTCEN01 DTCEN0_bit.no1
#define DTCEN02 DTCEN0_bit.no2
#define DTCEN03 DTCEN0_bit.no3
#define DTCEN04 DTCEN0_bit.no4
#define DTCEN05 DTCEN0_bit.no5
#define DTCEN06 DTCEN0_bit.no6
#define DTCEN10 DTCEN1_bit.no0
#define DTCEN11 DTCEN1_bit.no1
#define DTCEN12 DTCEN1_bit.no2
#define DTCEN13 DTCEN1_bit.no3
#define DTCEN14 DTCEN1_bit.no4
#define DTCEN15 DTCEN1_bit.no5
#define DTCEN16 DTCEN1_bit.no6
#define DTCEN17 DTCEN1_bit.no7
#define DTCEN20 DTCEN2_bit.no0
#define DTCEN21 DTCEN2_bit.no1
#define DTCEN22 DTCEN2_bit.no2
#define DTCEN23 DTCEN2_bit.no3
#define DTCEN24 DTCEN2_bit.no4
#define DTCEN25 DTCEN2_bit.no5
#define DTCEN27 DTCEN2_bit.no7
#define DTCEN30 DTCEN3_bit.no0
#define DTCEN31 DTCEN3_bit.no1
#define DTCEN32 DTCEN3_bit.no2
#define DTCEN33 DTCEN3_bit.no3
#define DTCEN34 DTCEN3_bit.no4
#define DTCEN35 DTCEN3_bit.no5
#define DTCEN36 DTCEN3_bit.no6
#define DTCEN37 DTCEN3_bit.no7
#define DTCEN40 DTCEN4_bit.no0
#define DTCEN41 DTCEN4_bit.no1
#define DTCEN42 DTCEN4_bit.no2
#define DTCEN43 DTCEN4_bit.no3
#define DTCEN45 DTCEN4_bit.no5
#define DTCEN46 DTCEN4_bit.no6
#define DTCEN47 DTCEN4_bit.no7
#define CRC0EN CRC0CTL_bit.no7

/*
 Interrupt vector addresses
 */
#endif
