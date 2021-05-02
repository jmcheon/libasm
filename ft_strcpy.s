
;				type	size	name   
;	argument	char *	8(ptr)	s    
;	variable	size_t	8(long)	i    

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

