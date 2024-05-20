NAME = push_swap

BONUS = checker

RM = rm -f

CFLAGS = -Wall -Werror -Wextra -I ./include

SRCS_M = $(wildcard srcs/*.c)
SRCS_M += $(wildcard *.c)
SRCS = $(filter-out checker.c, $(SRCS_M))

BONUS_SRCS = $(filter-out push_swap.c, $(SRCS_M))
BONUS_SRCS += $(wildcard gnl/*.c)

OBJS = $(SRCS:.c=.o)

BONUS_OBJS = $(BONUS_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) include/push_swap.h Makefile
	cc $(CFLAGS) $(OBJS) -o $(NAME)

bonus: $(BONUS_OBJS) include/push_swap.h Makefile
	cc $(CFLAGS) $(BONUS_OBJS) -o $(BONUS)

clean:
	$(RM) $(OBJS) $(BONUS_OBJS)

fclean: clean
	$(RM) $(NAME) $(BONUS) push_swap.o

re: fclean all

.PHONY: all clean fclean re
