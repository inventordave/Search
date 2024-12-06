# Makefile for FILE Search tool.

compiler=gcc
warnings=-Wall -Wextra
optimize=-O3
debug=-g -DDEBUG
target=-mconsole
libs=-lole32 -loleaut32
noexe=-c

OUTPUT=-o fs.exe

# $@	This special variable seems to refer to first prerequisite in recipe.
# $^	This special variable seems to refer to any as-yet referenced prerequisits in the recipe 


filesearch:  stringy colour error regex 
	  $(compiler) $(optimise) $(warnings) $(debug) $(target) colour.o barnyard.o str.o fs.o ansivt2.o error.o regex/regexd.o $(OUTPUT)

fs: fs.c fs.h ../colour/colour.h
	$(compiler) $(optimise) $(warnings) $(debug) $(target) $(noexe) -o fs.o		fs.c 

stringy: str.c str.h ../colour/colour.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o str.o				str.c

colour: ../colour/colour.c ../colour/colour.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o colour.o 			../colour/colour.c

error: error.c error.h
	$(compiler) $(optimise) $(warnings) $(debug) $(noexe) -o error.o 			error.c

regex:
	make -C ./regex libd

	
clean:
	rm -f *.o
	rm -f *.exe

