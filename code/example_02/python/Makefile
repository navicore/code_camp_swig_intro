
include ../../CONFIG

all:
	swig -python -o ./holder_python.c ../holder.i
	cc -fpic -I${PYTHONHEADERS} -I.. -c holder_python.c
	cc -fpic ${PYTHONLIBS} -shared holder_python.o -o _holder.so

clean:
	rm -f _holder.so 
	rm -f holder.py
	rm -f holder.pyc  
	rm -f holder_python.c
	rm -f holder_python.o

check: all
	python ./testme.py

