
;				type	size	name   
;	argument	char *	8(ptr)	s    
;	variable	size_t	8(long)	i    

section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0
	jmp .loop
	
	.loop:
		mov dh, BYTE [rsi + rax]
		mov dl, BYTE [rdi + rax]
		cmp dl, 0
		jne .check_diff
		jmp .endloop

	.check_diff:
		cmp dh, dl 
		jne .endloop
		jmp .increment

	.increment:
		inc rax 
		jmp .loop

	.greater:
		mov rax, -1
		ret
	.less:
		mov rax, 1
		ret
	.equel:
		mov rax, 0
		ret

	.endloop:
		cmp dh, dl
		ja .greater 
		jb .less
		je .equel

