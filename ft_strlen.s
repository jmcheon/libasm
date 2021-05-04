;	size_t	ft_strlen(const char *s);
;				type	size	name	register   
;	argument	char *	8(ptr)	s   	rdi 
;	variable	size_t	8(long)	i   	rax 

section .text
	global ft_strlen


ft_strlen:
	mov rax, 0
	jmp .loop
	
	.loop:
		cmp BYTE [rdi + rax], 0 
		jne .increment
		jmp .endloop

	.increment:
		inc rax 
		jmp .loop

	.endloop:
		ret

