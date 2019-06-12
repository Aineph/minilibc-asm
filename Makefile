CC		= gcc

NASM		= nasm

RM		= rm -f

CFLAGS		+= -W -Wall -Werror -Wextra

CFLAGS		+= -ansi -pedantic

LDFLAGS		= -shared -fPIC

ASMFLAGS	= -f macho64 --prefix _

NAME		= libmlc.so

SRCS		= strlen.S	\
		  strchr.S	\
		  memset.S	\
		  memcpy.S	\
		  strcmp.S	\
		  memmove.S	\
		  strncmp.S	\
		  strcasecmp.S	\
		  rindex.S	\
		  strstr.S	\
		  strpbrk.S	\
		  strcspn.S

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