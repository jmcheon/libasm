
;ssizeof ft_write(int fd, const void *buf, size_t count);

;			type		size		name	register 
; argument	int			4(int)		fd		edi	
; argument	void*		8(ptr)		buf		rsi	
; argument	size_t		8(long)		count	rdx	

section .text
	global ft_write
	extern	__errno_location


ft_write:
	mov	rax, 1				;	sys_write
	syscall
	cmp	rax, 0
	jl	.error
	ret	

.error:
	neg	rax
	mov	rdi, rax			;	temp for calling 
	call __errno_location	;	return value of errno_location is pointer to errno	
	mov	[rax], rdi			;	putting rdi in errno
	mov	rax, -1	
	ret
