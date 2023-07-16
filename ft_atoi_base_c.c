#include "libasm.h"

int		ft_check_base(char *base)
{
	int i;
	int j;

	i = 0;
	while (base[i])
	{
		j = i + 1;
		while (base[j])
		{
			if (base[i] == base[j])
				return (0);
			j++;
		}
		if (base[i] == '+' || base[i] == '-' || base[i] == ' ' ||
				(base[i] >= 9 && base[i] <= 13))
			return (0);
		i++;
	}
	if (i < 2)
		return (0);
	return (i);
}

int		ft_change_nbr(char *base, char c)
{
	int i;

	i = 0;
	while (base[i])
	{
		if (base[i] == c)
			return (i);
		i++;
	}
	return (-1);
}

int		ft_atoi_base_c(char *str, char *base)
{
	int i;
	int n;
	int sign;
	int base_num;

	if (str == NULL || base == NULL)
		return (0);
	if (!ft_check_base(base))
		return (0);
	base_num = ft_check_base(base);
	i = 0;
	while (str[i] != '\0' && (str[i] == ' ' || (str[i] >= 9 && str[i] <= 13)))
		i++;
	n = 0;
	sign = 1;
	while (str[i] == '-' || str[i] == '+')
	{
		if (str[i] == '-')
			sign *= -1;
		i++;
	}
	while (str[i] && ft_change_nbr(base, str[i]) > -1)
	{
		n = (n * base_num) + ft_change_nbr(base, str[i]);
		i++;
	}
	return (n * sign);
}

