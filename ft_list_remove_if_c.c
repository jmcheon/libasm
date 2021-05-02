#include "libasm.h"
#include <stdio.h>

void	ft_list_remove_if_string(t_list **begin_list, void *data_ref,
		int (*cmp)(), void (*free_fct)(void *))
{
	t_list	*prev;
	t_list	*curr;
	t_list	*temp;

	prev = NULL;
	curr = *begin_list;
	while (curr != NULL)
	{
		while (curr && (*cmp)(curr->data, data_ref) == 0)
		{
			if (prev != NULL)
				prev->next = curr->next;
			else
				*begin_list = curr->next;
			(*free_fct)(curr->data);
			temp = curr;
			curr = curr->next;
			free(temp);
		}
		if (curr != NULL)
		{
			prev = curr;
			curr = curr->next;
		}
	}
}


void	ft_list_remove_if_old(t_list **begin_list, void *data_ref,
		int (*cmp)())
{
	t_list	*prev;
	t_list	*curr;
	t_list	*temp;

	prev = NULL;
	curr = *begin_list;
	while (curr != NULL)
	{
		while (curr && (*cmp)(curr->data, data_ref) == 0)
		{
			if (prev != NULL)
				prev->next = curr->next;
			else
				*begin_list = curr->next;
			temp = curr;
			curr = curr->next;
			free(temp);
		}
		if (curr != NULL)
		{
			prev = curr;
			curr = curr->next;
		}
	}
}
