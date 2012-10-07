
include ../../CONFIG

all:
	swig -module helloworld -python -o ./helloworld_python.c ../helloworld.h
	cc -fpic -I${PYTHONHEADERS} -I.. -c helloworld_python.c
	cc -fpic -I${PYTHONHEADERS} -I.. -c ../helloworld.c
	cc ${PYTHONLIBS} -shared helloworld.o helloworld_python.o -o _helloworld.so

clean:
	rm -f _helloworld.so  
	rm -f helloworld.py	 
	rm -f helloworld_python.c
	rm -f helloworld.o	 
	rm -f helloworld.pyc  
	rm -f helloworld_python.o

check: all
	python ./testme.py

