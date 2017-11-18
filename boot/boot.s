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

.global __read_disk_to
.type __read_disk_to @function
__read_disk_to:
	pushl %ebp
	movl %esp, %ebp



	leavel
	retl

.global __cp_mem
.type __cp_mem @function
#ds:si -> es:di
#@ds  +0x08(ebp)
#@si  +0x0c(ebp)
#@es  +0x10(ebp)
#@di  +0x14(ebp)
__copy_mem:
	pushl %ebp
	movl %esp, %ebp

	push %ds
	push %si
	push %es
	push %di
	movw 0x08(%ebp), %ax
	movw %ax, %ds
	movw 0x0c(%ebp), %ax
	movw %ax, %si
	movw 0x10(%ebp), %ax
	movw %ax, %es
	movw 0x14(%ebp), %ax
	movw %ax, %di
	pop %di
	pop %es
	pop %si
	pop %ds

	leavel
	retl

.code32
