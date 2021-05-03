;	int	ft_strcmp(const char *s1, const char *s2)
;				type	size	name   register
;	argument	char *	8(ptr)	s1		rdi 
;	argument	char *	8(ptr)	s2		rsi 
;	variable	size_t	8(long)	i		rax 

section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0
	jmp .loop
	
	.loop:
		movzx edx, BYTE [rsi + rax]
		movzx ecx, BYTE [rdi + rax]
		cmp ecx, 0
		jne .check_diff
		jmp .return

	.check_diff:
		cmp edx, ecx
		jne .return
		jmp .increment

	.increment:
		inc rax 
		jmp .loop

	.return:
		sub ecx, edx
		mov eax, ecx 
		ret
