
include ../../CONFIG

all:
	swig -python -o ./holder_python.c ../holder.i
	cc -fpic -I${PYTHONHEADERS} -I.. -c holder_python.c ../except.c
	cc -fpic ${PYTHONLIBS} -shared except.o holder_python.o -o _holder.so

clean:
	rm -f _holder.so 
	rm -f except.o 
	rm -f holder.py
	rm -f holder.pyc  
	rm -f holder_python.c
	rm -f holder_python.o

check: all
	python ./testme.py

