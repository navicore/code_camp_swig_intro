
include ../../CONFIG

all:
	swig -module helloworld -perl5 -o helloworld_perl.c ../helloworld.h
	cc -D_GNU_SOURCE -fpic -I${PERLCORE} -I.. -c helloworld_perl.c
	cc -fpic -I${PERLCORE} -I.. -c ../helloworld.c
	cc -L${PERLCORE} ${PERLLIBS} -shared helloworld.o helloworld_perl.o -o helloworld.so
	rm -f helloworld.bundle
	ln -s helloworld.so helloworld.bundle

clean:
	rm -f helloworld.bundle  
	rm -f helloworld.pm  
	rm -f helloworld_perl.c
	rm -f helloworld.o	  
	rm -f helloworld.so  
	rm -f helloworld_perl.o

check: all
	${PERLPGM} ./testme.pl

