CC		= gcc

NASM		= nasm -f

RM		= rm -f

PLATFORM	= macho64

CFLAGS		+= -W -Wall -Werror -Wextra

CFLAGS		+= -ansi -pedantic

LDFLAGS		= -shared -fPIC

NAME		= libmlc.so

SRCS		= strlen.S	\
		  strchr.S	\
		  memset.S	\
		  memcpy.S	\
		  strcmp.S	\
		  memmove.S	\
		  strncmp.S	\
		  strcasecmp.S

OBJS		= $(SRCS:.S=.o)

all:		$(NAME)

%.o:		%.S
		$(NASM) $(PLATFORM) $<

$(NAME):	$(OBJS)
		$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re