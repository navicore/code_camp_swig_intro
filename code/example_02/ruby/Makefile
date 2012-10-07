
include ../../CONFIG

all:
	swig -ruby -o ./holder_ruby.c ../holder.i
	cc -fpic -I${RUBYHEADERS} -I.. -c holder_ruby.c
	cc ${RUBYLIBS} -fpic -shared holder_ruby.o -o holder.so
	rm -f holder.bundle
	ln -s holder.so holder.bundle

clean:
	rm -f holder.bundle  
	rm -f holder.so  
	rm -f holder_ruby.c  
	rm -f holder_ruby.o

check: all
	ruby ./testme.rb

