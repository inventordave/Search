# Makefile for FILE Search tool.

compiler=gcc
warnings=-Wall -Wextra
optimize=-O3
debug=-g -DDEBUG
target=-mconsole -D_WIN32_
libs=-lole32 -loleaut32
noexe=-c

OUTPUT=-o fs.exe

# $@	This special variable seems to refer to first prerequisite in recipe.
# $^	This special variable seems to refer to any as-yet referenced prerequisits in the recipe 


filesearch:  stringy colour error regex fs gcollect davelib
	  $(compiler) $(optimise) $(warnings) $(debug) $(target) \
	  colour.o stringy.o fs.o error.o ../wernee/regex_w/regexd.o ../davelib/io.o ../gcollect/gcd.o \
	  $(OUTPUT)

fs: fs.c fs.h ../colour/colour.h
	$(compiler) $(optimise) $(warnings) $(debug) $(target) $(noexe) -o fs.o		fs.c 

stringy: ../stringy/stringy.c ../stringy/stringy.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o stringy.o			../stringy/stringy.c

colour: ../colour/colour.c ../colour/colour.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o colour.o 			../colour/colour.c

error: error.c error.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o error.o 			error.c

regex:
	make -C ../wernee/regex_w/ libd

gcollect:
	make -C ../gcollect/ gcd
	
davelib:
	make -C ../davelib/
	
	
clean:
	rm -f *.o
	rm -f *.exe

