
;ssizeof ft_write(int fd, const void *buf, size_t count);

;			type		size		name	register 
; argument	int			4(int)		fd		edi	
; argument	void*		8(ptr)		buf		rsi	
; argument	size_t		8(long)		count	rdx	

section .text
	global ft_write
	extern	__errno_location


ft_write:
	mov	rax, 1	; sys_write
	syscall
	cmp	rax, 0	; compare si le retour du syscall est egal a 0
	jl	.error	; si rax est inferieur a 0 on va a error
	ret	

.error:
	neg	rax
	;push rdi
	mov	rdi, rax; rdi sert de tampon car apres rax prendera le retour de errno location

	call __errno_location	; errno location renvoie un pointeur sur errno
	mov	[rax], rdi	; ici rax contient l'adresse de errno donc en faisant ca on met rdi dans errno
	mov	rax, -1	
	ret
