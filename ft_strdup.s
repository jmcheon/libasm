
;				type	size	name   
;	argument	char *	8(ptr)	s    

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	call ft_strlen
	inc rax
	push rdi
	mov rdi, rax
	call malloc
	pop r9
	mov rdi, rax
	mov rsi, r9
	call ft_strcpy
	ret

