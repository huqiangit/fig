CFLAGS := $(CFLAGS) $(DEFS) $(LABDEFS) -O1 -fno-builtin -I$(TOP) -MD
CFLAGS += -fno-omit-frame-pointer
CFLAGS += -std=gnu99
CFLAGS += -static
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs 

all:boot.o bootmain.o
	ld -T boot.ld $^ -S -o mono.elf
	objdump -d mono.elf -m i8086
	objcopy -O binary mono.elf -R -o mono.img 
	cp mono.img ../

boot.o : boot.s
	as --32 boot.s -o boot.o
	objdump -d boot.o

bootmain.o : bootmain.c
	gcc $(CFLAGS) -c -m16 bootmain.c -o bootmain.o
	objdump -d bootmain.o

clean:
	rm boot.o bootmain.o

disasm:
	objdump -D -b binary -m i8086 mono.img 
