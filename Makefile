# Simple Makefile for GCC or LLVM

#CCPRE = llvm-

GPP   = ${CCPRE}g++
AR    = ar

OBJDIR = ./obj
OUTDIR = ./out
OUTNM  = libwavelet2s.a

RLIBS  = fftw3
WTINC  = wavelet2s.h
WTSRC  = wavelet2s.cpp
INCOPT = -Isrc -l${RLIBS} -I/usr/local/include
LIBOPT = -L/usr/local/lib

CFLAGS = ${INCOPT} ${LIBOPT}

all : prepare ${OUTDIR}/${OUTNM}

prepare:
	@mkdir -p ${OBJDIR}
	@mkdir -p ${OUTDIR}

clean:
	@rm -rf ${OBJDIR}/*.o
	@rm -rf ${OUTDIR}/*

${OUTDIR}/${OUTNM}:
	$(GPP) -c src/${WTSRC} ${CFLAGS} -o ${OBJDIR}/${WTSRC}.o
	$(AR) rvs $@ ${OBJDIR}/${WTSRC}.o
	cp src/${WTINC} ${OUTDIR}/
