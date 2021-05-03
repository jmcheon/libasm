#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct s_list
{
	void	*data;
	struct	s_list *next;
} t_list;

ssize_t	ft_read(int fd, void *buf, size_t count);
ssize_t	ft_write(int fd, const void *buf, size_t count);
size_t	ft_strlen(const char *s);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dst, const char *src);
char	*ft_strdup(const char *s);

int		ft_atoi_base(char *str, char *base);
int		ft_list_size(t_list *begin_list);
void	ft_list_push_front(t_list **begin_list, void *data);
int	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, 
		int (*cmp)(), void (*free_fct)(void *));



int		ft_atoi_base_c(char *str, char *base);
void	ft_list_remove_if_old(t_list **begin_list, void *data_ref,
		int (*cmp)());
void	ft_list_remove_if_string(t_list **begin_list, void *data_ref,
		int (*cmp)(), void (*free_fct)(void *));






#endif
