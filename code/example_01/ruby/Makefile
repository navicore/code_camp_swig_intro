
include ../../CONFIG

all:
	swig -module helloworld -ruby -o ./helloworld_ruby.c ../helloworld.h
	cc -fpic -I${RUBYHEADERS} -I.. -c helloworld_ruby.c
	cc -fpic -I${RUBYHEADERS} -I.. -c ../helloworld.c
	cc ${RUBYLIBS} -shared helloworld.o helloworld_ruby.o -o helloworld.so
	rm -f helloworld.bundle
	ln -s helloworld.so helloworld.bundle

clean:
	rm -f helloworld.bundle  
	rm -f helloworld.so  
	rm -f helloworld.o  
	rm -f helloworld_ruby.c  
	rm -f helloworld_ruby.o

check: all
	ruby ./testme.rb

