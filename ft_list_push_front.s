
; void	ft_list_push_front(t_list **begin_list, void *data);

;			type		size	name		register 
; argument	t_list**	8(ptr)	begin_list	rdi
; argument	void*		8(ptr)	data		rsi	

section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:
	push rdi
	push rsi
	mov rdi, 0x10
	call malloc
	cmp rax, 0
	je .return

	pop rsi
	pop rdi
	mov [rax], rsi		;	list->data = data
	mov rcx, [rdi]		;	temp = *begin_list
	mov [rax + 8], rcx	;	list->next = temp 
	mov [rdi], rax		;	*begin_list = list	
	ret
	

.return:
	ret

