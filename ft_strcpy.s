;	char	*ft_strcpy(char *dst, const char *src);
;				type	size	name	register 
;	argument	char *	8(ptr)	dst   	rdi 
;	argument	char *	8(ptr)	src   	rsi 
;	variable	size_t	8(long)	i   	rax	

section .text
	global ft_strcpy


ft_strcpy:
	mov rax, 0
	jmp .loop
	
	.loop:
		mov dh, BYTE [rsi + rax]
		mov BYTE [rdi + rax], dh
		cmp dh, 0 
		jne .increment
		jmp .endloop

	.increment:
		inc rax 
		jmp .loop

	.endloop:
		mov rax, rdi
		ret

