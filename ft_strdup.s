;	char	*ft_strdup(const char *s);
;				type	size	name	register
;	argument	char *	8(ptr)	s   	rdi 
;	variable	size_t	8(long)	i		rax

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
	cmp rax, 0
	je .return
	mov rdi, rax
	pop rsi
	call ft_strcpy
	ret

.return:
	ret

