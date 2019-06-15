#
# Created by Nicolas Fez for minilibc-asm.
# Started on 10/06/2019.
#

CC		= gcc

NASM		= nasm

RM		= rm -f

CFLAGS		+= -W -Wall -Werror -Wextra

CFLAGS		+= -ansi -pedantic

LDFLAGS		= -shared -fPIC

ASMFLAGS	= -f elf64

NAME		= libmlc.so

SRCS		= src/strlen.S		\
		  src/strchr.S		\
		  src/memset.S		\
		  src/memcpy.S		\
		  src/strcmp.S		\
		  src/memmove.S		\
		  src/strncmp.S		\
		  src/strcasecmp.S	\
		  src/rindex.S		\
		  src/strstr.S		\
		  src/strpbrk.S		\
		  src/strcspn.S

OBJS		= $(SRCS:.S=.o)

all:		$(NAME)

%.o:		%.S
		$(NASM) $(ASMFLAGS) $<

$(NAME):	$(OBJS)
		$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
