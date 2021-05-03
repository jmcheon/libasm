
; void	ft_list_remove_if(t_list **begin_list, void *data_ref, 
;							int (*cmp)(), void (*free_fct)(void *));

;			type			size	name		register 
; argument	t_list**		8(ptr)	begin_list	rdi
; argument	void*			8(ptr)	data_ref	rsi
; argument	int(*)()		8(ptr)	cmp			rdx
; argument	void(*)(void*)	8(ptr)	free_fct	rcx	

; variable	t_list*			8(ptr)	temp		r8
; variable	t_list*			8(ptr)	prev		r9
; variable	t_list*			8(ptr)	curr		r10

section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	cmp rdi, 0
	je .return
	mov r9, 0			;	prev = NULL
	mov r10, [rdi]		;	curr = *begin_list
	cmp rdx, 0
	je .return
	cmp rcx, 0
	je .return
	jmp .loop

.loop:
	cmp qword[rdi], 0	;	if *begin_list = NULL
	je .return
	cmp r10, 0			;	if curr == NULL
	je .return
	jmp .second_loop


.second_loop:
	cmp r10, 0
	je .if_curr_check
	push r10
	push r9
	push r8
	push rdx
	push rcx
	push rdi
	push rsi
	mov rdi, [r10]		;	curr->data as an argument
	cmp rdi, 0
	je .compare_null
	call rdx			;	call cmp function
	jmp .compare_end

.compare_null:
	xor rdi, rsi
	mov rax, rdi
	jmp .compare_end

.compare_end:
	pop rsi
	pop rdi
	pop rcx
	pop rdx
	pop r8
	pop r9
	pop r10
	cmp rax, 0			;	cmp funtion return value check
	jne .if_curr_check
	jmp .if_compare

.if_compare:
	cmp r9, 0			;	if prev == NULL
	jne .if_ture
	je .if_else
	jmp .next

.if_ture:
	mov r11, [r10 + 8]
	mov [r9 + 8], r11	;	prev->next = curr->next
	jmp .next

.if_else:
	mov r11, [r10 + 8]
	mov [rdi], r11		;	*begin_list = curr->next
	jmp .next

.next:
	push r9
	push rdx
	push rcx
	push rsi
	push rdi
	push r8
	push r10
	mov rdi, [r10]		;	curr->data as an argument
	call rcx			;	call free_fct function  
	pop r10
	pop r8
	mov r8, r10			;	temp = curr 
	mov r10, [r10 + 8]	;	curr = curr->next
	pop rdi
	push rdi
	push r10
	push r8
	mov rdi, r8			;	free(temp)
	call free
	pop r8
	pop r10
	pop rdi
	pop rsi
	pop rcx
	pop rdx
	pop r9
	jmp .second_loop

.if_curr_check:
	cmp r10, 0
	je .return
	mov r9, r10			;	prev = curr
	mov r10, [r10 + 8]	;	curr = curr->next
	jmp .loop

.return:
	ret
