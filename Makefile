NAME = libasm.a

SRCS = ./ft_strlen.s \


OBJS = $(SRCS:.s=.o)

NASM = nasm

LIBC = ar -rcs

%.o : %.s
	$(NASM) -f elf64 $< -o $@


$(NAME) : $(OBJS)
	$(LIBC) $(NAME) $(OBJS)


all : $(NAME)

clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(NAME)

re : fclean all

.PHONY : all clean fclean re
