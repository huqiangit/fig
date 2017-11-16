typedef unsigned char u8;
typedef unsigned short u16;
extern void __put_vga_byte(void* addr, u8 byte);

void puts(char* str){
	for(int i=0; str[i] != 0; i++) {
		__put_vga_byte((void*)(i*2),*(str+i)); 
	}
}
void putc(int i, int j, char c) {
	__put_vga_byte((void*)(i*160+j*2), c);
}

void set() {
	for (int i = 0; i < 80*25*2; i+=2) {
		__put_vga_byte((void*)i, '0');
	}
}

void outb(void* addr, u16 data) {
	
}

void bootmain(){
	set();
}
