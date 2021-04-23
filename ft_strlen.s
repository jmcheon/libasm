
;				type	size	name   
;	argument	char *	8(ptr)	s    
;	variable	size_t	8(long)	i    

section .text
	global ft_strlen


ft_strlen:
	push rbp
	mov rbp, rsp

	sub rsp, 0x20					;	32bits memories
	mov QWORD [rbp-0x18], rdi	;	argument s
	mov QWORD [rbp-0x10], 0		;	variable i 
	mov rax, QWORD [rbp-0x18]
	mov rdx, QWORD [rbp-0x10]
	
	.loop:
		cmp BYTE [rax+rdx], 0 
		jne .increment
		jmp .endloop

	.increment:
		inc rdx 
		jmp .loop

	.endloop:

	leave
	ret
