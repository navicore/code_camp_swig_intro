
include ../../CONFIG

all:
	swig -perl5 -o holder_perl.c ../holder.i
	cc -D_GNU_SOURCE -fpic -I${PERLCORE} -I.. -c holder_perl.c ../except.c
	cc -L${PERLCORE} ${PERLLIBS} -fpic -shared except.o holder_perl.o -o holder.so
	rm -f holder.bundle
	ln -s holder.so holder.bundle

clean:
	rm -f holder.bundle  
	rm -f holder.pm  
	rm -f holder.so  
	rm -f except.o  
	rm -f holder_perl.c  
	rm -f holder_perl.o

check: all
	${PERLPGM} ./testme.pl

