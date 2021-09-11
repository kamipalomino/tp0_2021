# Globales
CC = gcc

SRC = $(shell find ./src -type f -iname "*.c" -exec basename {} \;)
OBJ = $(SRC:%.c=./obj/%.o)

LINK = -lcommons -lpthread
CFLAGS = -c

build: makefolder $(OBJ)

debug: CFLAGS := $(CFLAGS) -g
debug: build

./obj/%.o: ./src/%.c
	$(CC) $(CFLAGS) $< -o $@ $(LINK)
	
makefolder:
	if [! -d ./obj ]; then mkdir obj; fi


# Clean

clean:
	rm -rf obj
	rm -rf *.out