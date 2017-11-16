.global _start

.global bootmain
.type bootmain, @function

.global __put_vga_byte
.type __put_vga_byte, @function


.text
.code16
	jmpl $0x07c0,$_start
_start:

	mov $0x07c0, %ax
	mov $0x7c00, %esp
	mov %ax, %ds
	mov %ax, %ss
	mov %ax, %es
	mov %ax, %gs
	mov %ax, %fs

	mov $0b10, %ax
	bsfl %ax, %dx

	calll bootmain


cur:
	jmp cur

__put_vga_byte:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx #you should save ebx esi edi

	movw $0xb800, %ax
	movw %ax, %es
	movl 8(%ebp), %eax
	movl 12(%ebp), %ebx
	mov %bl, %es:(%eax)
	
	pop %ebx
	leavel
	retl

.code32
