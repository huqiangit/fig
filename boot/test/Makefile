CFLAGS := $(CFLAGS) $(DEFS) $(LABDEFS) -O3 -fno-builtin -I$(TOP) -MD
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -std=gnu99
CFLAGS += -static
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs 

all:
	gcc $(CFLAGS) -c -m16 m.c -fno-omit-frame-pointer
	gcc -c -m16 f.c #-fno-omit-frame-pointer
	ld -m elf_i386 m.o f.o -e m
	objdump -d m.o -m i8086
	objdump -d f.o -m i8086
	objdump -d a.out -m i8086
