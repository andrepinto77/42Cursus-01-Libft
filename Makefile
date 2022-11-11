# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abaltaza <abaltaza@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/10 10:34:36 by abaltaza          #+#    #+#              #
#    Updated: 2022/11/10 10:34:36 by abaltaza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

DIR_SRCS = scrs 
DIR_OBJS = objs 
SUBDIRS = is to mem str put lst math gnl printf

SRCS_DIRS	= $(foreach dir, $(SUBDIRS), $(addprefix $(DIR_SRCS)/, $(dir)))
OBJS_DIRS	= $(foreach dir, $(SUBDIRS), $(addprefix $(DIR_OBJS)/, $(dir)))
SRCS		= $(foreach dir, $(SRCS_DIRS), $(wildcard $(dir)/*.c))
OBJS		= $(subst $(DIR_SRCS), $(DIR_OBJS), $(SRCS:.c=.o))

INCLUDES	= -I includes

CC		= cc -g
CFLAGS	= -Wall -Wextra -Werror
RM		= rm -f
AR = ar rcs

$(DIR_OBJS)/%.o :	$(DIR_SRCS)/%.c
			@mkdir -p $(DIR_OBJS) $(OBJS_DIRS)
			@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

all:		$(NAME)

$(NAME):	$(OBJS)
			@ar -rcs $(NAME) $(OBJS)
			@ranlib $(NAME)

clean:
			@$(RM) $(OBJS)
			@$(RM) -r $(DIR_OBJS)

fclean:		clean
			@$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re