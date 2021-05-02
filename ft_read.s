
;ssizeof ft_read(int fd, void *buf, size_t count);

;			type		size		name	register 
; argument	int			4(int)		fd		edi	
; argument	void*		8(ptr)		buf		rsi	
; argument	size_t		8(long)		count	rdx	

section .text
	global ft_read
	extern	__errno_location 


ft_read:
	mov	rax, 0	; sys_read
	syscall
	cmp	rax, 0
	jl	.error
	ret	

.error:
	neg	rax
	mov	rdi, rax
	call __errno_location
	mov	[rax], rdi
	mov	rax, -1	
	ret

