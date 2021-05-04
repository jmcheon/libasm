NAME = libasm.a

SRCS = ./ft_strlen.s \
	   ./ft_strcpy.s \
	   ./ft_strdup.s \
	   ./ft_strcmp.s \
	   ./ft_read.s \
	   ./ft_write.s \

SRCS_B = ./ft_list_push_front.s \
		 ./ft_list_sort.s \
		 ./ft_list_remove_if.s \
		 ./ft_list_size.s \
		 ./ft_atoi_base.s \

OBJS = $(SRCS:.s=.o)
	
OBJS_B = $(SRCS_B:.s=.o)

NASM = nasm

CC = clang

LIB = libasm.h

LIBC = ar -rcs

%.o : %.s
	$(NASM) -f elf64 $< -o $@


$(NAME) : $(OBJS)
	$(LIBC) $(NAME) $(OBJS)


all : $(NAME)

bonus : $(NAME) $(OBJS_B)
	$(LIBC) $(NAME) $(OBJS) $(OBJS_B)

clean :
	rm -f $(OBJS) $(OBJS_B)

fclean : clean
	rm -f $(NAME)
	rm -f a.out
	rm -f libasm.h.gch

re : fclean all

test : bonus
	$(CC) main.c $(LIB) $(NAME)

.PHONY : all bonus clean fclean re test 
