
; int	ft_atoi_base(char *str, char *base);

;			type		size		name		register 
; argument	char*		8(ptr)		str			rdi
; argument	char*		8(ptr)		base		rsi	

; variable	int			4(int)		n			r10	
; variable	int			4(int)		sign		r11	
; variable	size_t		8(long)		base_num	r12	
; variable	size_t		8(long)		i			rax

section .text
	global ft_atoi_base

ft_atoi_base:
	cmp rdi, 0
	je .return_zero
	cmp rsi, 0
	je .return_zero
	call .ft_check_base	
	cmp rax, 0
	je .return_zero
	mov r12, rax ;	initialize base_num value
	mov rax, 0	 ;	i = 0
	jmp .atoi_base_str_check

.increment:
	inc rax

.atoi_base_str_check:
	cmp byte[rdi + rax], 0
	jne .skip_white_spaces
	jmp .atoi_base_sign_check

.skip_white_spaces:
	cmp byte[rdi + rax], 0x20 ;	' '
	je .increment
	cmp byte[rdi + rax], 0x09 ;	'\t'
	je .increment
	cmp byte[rdi + rax], 0x0a ;	'\n'
	je .increment
	cmp byte[rdi + rax], 0x0b ;	'\v'
	je .increment
	cmp byte[rdi + rax], 0x0c ;	'\f'
	je .increment
	cmp byte[rdi + rax], 0x0d ;	'\r'
	je .increment
	jmp .atoi_base_sign_check
	
.atoi_base_sign_check:
	mov r10, 0 ;	n = 0
	mov r11, 1 ;	sign = 1
	jmp .sign_loop

.sign_increment:
	inc rax

.sign_loop:
	cmp byte[rdi + rax], 0x2b ;	'+'
	je .sign_check
	cmp byte[rdi + rax], 0x2d ;	'-'
	je .sign_check
	jmp .atoi_get_nbr

.sign_check:
	cmp byte[rdi + rax], 0x2d ;	'-'
	je .sign_assigned
	jmp .sign_increment 

.sign_assigned:
	mov rdx, -1
	imul r11, rdx
	jmp .sign_increment

.atoi_get_nbr:
	cmp byte[rdi + rax], 0 
	je .atoi_return
	mov rdx, rax
	call .ft_change_nbr
	cmp rax, -1
	jg .get_nbr
	jmp .atoi_return

.get_nbr:
	imul r10, r12 ;	n *= base_num
	add r10, rax  
	mov rax, rdx
	inc rax
	jmp .atoi_get_nbr
	
.atoi_return:
	imul r11, r10 ;	n * sign
	mov rax, r11
	ret

; int	ft_change_nbr(char *base, char c);

;			type		size		name	register 
; argument	char*		8(ptr)		base	rsi
; argument	char		1(byte)		c		cl ;	byte[rdi + rax]

; variable	size_t		8(long)		i		r13	

.ft_change_nbr:
	mov r13, 0 ;	i = 0
	mov cl, byte[rdi + rax] ;	argument c
	jmp .change_nbr_loop

.change_nbr_loop:
	cmp byte[rsi + r13], 0
	je	.change_nbr_exit
	jmp .change_nbr_char_check

.change_nbr_char_check:
	cmp byte[rsi + r13], cl 
	je .change_nbr_return
	inc r13
	jmp .change_nbr_loop

.change_nbr_return:
	mov rax, r13
	ret

.change_nbr_exit:
	mov rax, -1
	ret


; int	ft_check_base(char *base);

;			type		size		name	register 
; argument	char*		8(ptr)		base	rsi

; variable	size_t		8(long)		i		rax
; variable	size_t		8(long)		j		rcx


.ft_check_base:
	mov rax, 0
	jmp .check_base_loop

.check_base_loop:
	cmp byte[rsi + rax], 0
	je .return
	mov rcx, rax
	inc rcx
	jmp .check_base_inner_loop

.check_base_inner_loop:
	cmp byte[rsi + rcx], 0
	je .invalid_char_check
	mov r9b, byte[rsi + rcx]
	cmp byte[rsi + rax], r9b ;	double char check
	je .return_zero
	inc rcx
	jmp .check_base_inner_loop
	
.invalid_char_check:
	cmp byte[rsi + rax], 0x2b ;	'+'
	je .return_zero
	cmp byte[rsi + rax], 0x2d ;	'-'
	je .return_zero
	cmp byte[rsi + rax], 0x20 ;	' '
	je .return_zero
	cmp byte[rsi + rax], 0x09 ;	'\t'
	je .return_zero
	cmp byte[rsi + rax], 0x0a ;	'\n'
	je .return_zero
	cmp byte[rsi + rax], 0x0b ;	'\v'
	je .return_zero
	cmp byte[rsi + rax], 0x0c ;	'\f'
	je .return_zero
	cmp byte[rsi + rax], 0x0d ;	'\r'
	je .return_zero
	inc rax
	jmp .check_base_loop

.return:
	cmp rax, 2
	jl .return_zero
	ret

.return_zero:
	mov rax, 0
	ret
