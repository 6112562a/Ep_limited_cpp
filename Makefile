# file: Makefile	G. Moody	10 April 2003
#
# make description file for compiling easytest & bxbep using gcc
#
# Install the WFDB package (http://www.physionet.org/physiotools/wfdb.shtml)
# before attempting to compile these programs.
#
# To compile these programs, just type 'make' at a command prompt while in
# this directory.  This has been tested under GNU/Linux and MS-Windows/Cygwin,
# and it should also work under MacOS/X (Darwin) and all versions of Unix.
#
# See '00README' in this directory for further information.

# CC is the name of your ANSI/ISO C compiler (might be 'cc' on some platforms).
CC = g++

ETOBJS = easytest.o bdac.o classify.o rythmchk.o noisechk.o match.o \
 postclas.o analbeat.o qrsfilt.o

all:		easytest easytest2 bxbep

easytest:	$(ETOBJS) qrsdet.o 
	$(CC) -o easytest $(ETOBJS) qrsdet.o libwfdb.a

easytest2:	$(ETOBJS) qrsdet2.o
	$(CC) -o easytest2 $(ETOBJS) qrsdet2.o libwfdb.a

easytest.o:	easytest.cpp qrsdet.h 
	$(CC) -c easytest.cpp

bdac.o:		bdac.cpp bdac.h qrsdet.h
	$(CC) -c bdac.cpp

classify.o:	classify.cpp qrsdet.h bdac.h match.h rythmchk.h analbeat.h \
 postclas.h
	$(CC) -c classify.cpp

rythmchk.o:	rythmchk.cpp qrsdet.h
	$(CC) -c rythmchk.cpp

noisechk.o:	noisechk.cpp qrsdet.h
	$(CC) -c noisechk.cpp

match.o:	match.cpp bdac.h
	$(CC) -c match.cpp

postclas.o:	postclas.cpp bdac.h
	$(CC) -c postclas.cpp

analbeat.o:	analbeat.cpp bdac.h
	$(CC) -c analbeat.cpp

qrsfilt.o:	qrsfilt.cpp qrsdet.h
	$(CC) -c qrsfilt.cpp

qrsdet.o:	qrsdet.cpp qrsdet.h
	$(CC) -c qrsdet.cpp

qrsdet2.o:	qrsdet2.cpp qrsdet.h
	$(CC) -c qrsdet2.cpp


bxbep:		bxb.cpp 
	$(CC) -o bxb bxb.cpp libwfdb.a -lm

clean:
	rm -f *.o *~ bxbep easytest easytest2
