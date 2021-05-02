#include "libasm.h"

void	ft_strlen_check()
{
	printf("========================\n");
	printf("ft_strlen check\n");
	printf("mine = %ld\n", ft_strlen("hello"));
	printf("real = %ld\n", strlen("hello"));
	printf("mine = %ld\n", ft_strlen("bonjour tout le monde"));
	printf("real = %ld\n", strlen("bonjour tout le monde"));
}

void	ft_strcpy_check()
{
	char dst[100];

	printf("========================\n");
	printf("ft_strcpy check\n");
	printf("mine = %s\n", ft_strcpy(dst, "hello"));
	printf("real = %s\n", strcpy(dst, "hello"));
}

void	ft_strcmp_check()
{
	printf("========================\n");
	printf("ft_strcmp check\n");
	printf("mine = %d\n", ft_strcmp("abcde", "abcde"));
	printf("real = %d\n", strcmp("abcde", "abcde"));
	printf("mine = %d\n", ft_strcmp("abcde", "abdde"));
	printf("real = %d\n", strcmp("abcde", "abdde"));
	printf("mine = %d\n", ft_strcmp("abcde", "abbde"));
	printf("real = %d\n", strcmp("abcde", "abbde"));
	
	printf("mine= %d\n", ft_strcmp("abcde", "abcde\0fg"));
	printf("real = %d\n", strcmp("abcde", "abcde\0fg"));
	printf("mine= %d\n", ft_strcmp("abcde", "abcde0g"));
	printf("real = %d\n", strcmp("abcde", "abcde0g"));
	
	printf("mine= %d\n", ft_strcmp("abcde", "g"));
	printf("real = %d\n", strcmp("abcde", "g"));

	printf("mine= %d\n", ft_strcmp("abcde", "0"));
	printf("real = %d\n", strcmp("abcde", "0"));
}

void	ft_strdup_check()
{
	char *s;

	s = NULL;
	printf("========================\n");
	printf("ft_strdup check\n");
	printf("real = %s\n", s = strdup("abcde"));
	free(s);
	s = NULL;
	printf("mine = %s\n", s = ft_strdup("abcde"));
	free(s);
	s = NULL;
}

void	ft_write_check()
{
	printf("========================\n");
	printf("ft_write check\n");
	printf("real = %zd\n",  write(42, "bonjour", 7));
	printf("mine = %zd\n", ft_write(42, "bonjour", 7));
}

void	ft_read_check(char *str)
{
	printf("========================\n");
	printf("ft_read check\n");
	printf("real = %zd\n",  read(42, str, 7));
	printf("mine = %zd\n", ft_read(42, str, 7));
}

void	ft_atoi_base_check(char *str, char *base)
{
	printf("========================\n");
	printf("ft_atoi_base check\n");
	printf("real = %d\n",  ft_atoi_base_c("123", "0123456789"));
	printf("mine = %d\n", ft_atoi_base("123", "0123456789"));
	printf("========================\n");
	//printf("rbase = %d\n",  ft_check_base(base));
	printf("real = %d\n",  ft_atoi_base_c(str, base));
	printf("mine = %d\n", ft_atoi_base(str, base));
}

t_list		*ft_lstnew(void *data)
{
	t_list	*head;

	if (!(head = (t_list *)malloc(sizeof(t_list))))
		return (NULL);
	head->data = data;
	head->next = NULL;
	return (head);
}

void	ft_lst_display(t_list *lst)
{
	while (lst)
	{
		printf("%d ", (int)lst->data);
		lst = lst->next;
	}
	printf("\n");
}

void	ft_lst_string_display(t_list *lst)
{
	while (lst)
	{
		printf("%s ", (int)lst->data);
		lst = lst->next;
	}
	printf("\n");
}

int	*compare_integer(void *n1, void *n2)
{
	return ((int)n1 - (int)n2);
}

void	free_fct(void *data)
{
	if (data)
		free(data);
}

void	ft_list_check()
{
	t_list *lst;
	int i1 = 1;
	int i2 = 2;

	lst = ft_lstnew((void*)1);
	ft_list_push_front(&lst, (void*)2);
	ft_list_push_front(&lst, (void*)1);
	ft_list_push_front(&lst, (void*)14);
	ft_list_push_front(&lst, (void*)4);
	ft_list_push_front(&lst, (void*)7);
	ft_list_push_front(&lst, (void*)1);
	printf("========================\n");
	printf("ft_list_check\n");
	ft_lst_display(lst);
	printf("ft_list_size = %d\n", ft_list_size(lst));
	ft_list_sort(&lst, &compare_integer);
	printf("call ft_list_sort : \n");
	ft_lst_display(lst);
	ft_list_remove_if_old(&lst, (void*)1, &compare_integer);
	printf("call ft_list_remove_if_old : \n");
	ft_lst_display(lst);

}

void	ft_list_check_string()
{
	t_list *lst;

	lst = ft_lstnew(strdup("bread"));
	ft_list_push_front(&lst, strdup("milk"));
	ft_list_push_front(&lst, strdup("apple"));
	printf("========================\n");
	printf("ft_list_check_string\n");
	ft_lst_string_display(lst);
	printf("ft_list_size = %d\n", ft_list_size(lst));
	ft_list_sort(&lst, strcmp);
	printf("call ft_list_sort : \n");
	ft_lst_string_display(lst);
	ft_list_remove_if(&lst, "bread", strcmp, free_fct);
	printf("call ft_list_remove_if : \n");
	ft_lst_string_display(lst);
}

void	ft_list_check_string_decimal()
{
	t_list *lst;

	lst = ft_lstnew(strdup("2"));
	ft_list_push_front(&lst, strdup("1"));
	ft_list_push_front(&lst, strdup("5"));
	ft_list_push_front(&lst, strdup("3"));
	printf("========================\n");
	printf("ft_list_check_string\n");
	ft_lst_string_display(lst);
	printf("ft_list_size = %d\n", ft_list_size(lst));
	ft_list_sort(&lst, strcmp);
	printf("call ft_list_sort : \n");
	ft_lst_string_display(lst);
	ft_list_remove_if(&lst, "3", strcmp, free_fct);
	printf("call ft_list_remove_if : \n");
	ft_lst_string_display(lst);
}

int	main(int argc, char **argv)
{
	//ft_strlen_check();
	//ft_strcpy_check();
	//ft_strcmp_check();
	//ft_strdup_check();
	//ft_write_check();
	ft_read_check(argv[1]);
	ft_atoi_base_check(argv[1], argv[2]);
	ft_list_check();
	ft_list_check_string();
	ft_list_check_string_decimal();
	return (0);
}
