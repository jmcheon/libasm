
; void	ft_list_sort(t_list **begin_list, int (*cmp)());

;			type		size	name		register 
; argument	t_list**	8(ptr)	begin_list	rdi
; argument	int(*)()	8(ptr)	cmp			rsi	
; variable	t_list*		8(ptr)	a			r8
; variable	t_list*		8(ptr)	b			r9

section .text
	global ft_list_sort

ft_list_sort:
	mov rdx, rdi
	mov rcx, rsi
	mov r8, [rdx]		;	a = *begin_list
	jmp .first_loop

.first_loop:
	cmp r8, 0			;	if a == NULL
	je .return
	mov r9, [rdx]		;	b = *begin_list
	jmp .second_loop

.second_loop:
	mov r10, [r9 + 8]	;	b->next
	cmp r10, 0			;	if b->next == NULL
	je .a_next
	mov rdi, [r9]		;	b->data
	mov rsi, [r10]		;	b->next->data
	push r8
	push r9
	push r10
	push rdx
	push rcx
	call rcx 
	pop rcx
	pop rdx
	pop r10
	pop r9
	pop r8
	cmp rax, 0
	jg .list_swap_call
	jmp .b_next

.list_swap_call:
	mov rsi, [r9]		;	data = b->data
	mov rdi, [r10]		;	data2 = b->next->data	
	mov [r9], rdi		;	b->data = data2
	mov [r10], rsi		;	b->next->data = data
	jmp .b_next

.b_next:
	mov r9, [r9 + 8]	;	b = b->next
	jmp .second_loop
	
.a_next:
	mov r8, [r8 + 8]	;	a = a->next
	jmp .first_loop
	
.return:
	ret
