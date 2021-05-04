
; int	ft_list_size(t_list *begin_list);

;			type		size	name		register 
; argument	t_list*		8(ptr)	begin_list	rdi
; variable	size_t		8(long)	i			rax

section .text
	global ft_list_size

ft_list_size:
	mov rax, 0
	mov rsi, rdi
	jmp .loop

.loop
	cmp rsi, 0			;	if list == NULL
	jz .return
	mov rsi, [rsi + 8]	;	list = list->next
	inc rax
	loop .loop
	
.return:
	ret
