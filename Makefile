CC = cc
CFLAGS = -Wall -Wextra -Werror
NAME = miniRT

# Source files
SOURCES = main.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# libft directory
LIBFT_DIR = ./libft
LIBFT_LIB = $(LIBFT_DIR)/libft.a

# Include paths
INCLUDES = -I$(LIBFT_DIR)

all: $(LIBFT_LIB) $(NAME)

$(NAME): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJECTS) $(LIBFT_LIB)

$(LIBFT_LIB):
	make -C $(LIBFT_DIR)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJECTS)
	make -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re