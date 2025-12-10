CC = cc
CFLAGS = -Wall -Wextra -Werror
NAME = miniRT

# Source directories and files
SRC_DIR = ./src
MAIN_SRC = main.c
PROJECT_SOURCES = $(MAIN_SRC) \
				  $(SRC_DIR)/print/print.c \
				  $(SRC_DIR)/scene/scene.c \
				  $(SRC_DIR)/scene/canvas.c \
				  $(SRC_DIR)/scene/object_create.c \
				  $(SRC_DIR)/trace/ray/ray.c \
				  $(SRC_DIR)/trace/hit/hit_sphere.c \
				  $(SRC_DIR)/utils/vec3_utils.c

# Object files
OBJECTS = $(PROJECT_SOURCES:.c=.o)

# libft directory
LIBFT_DIR = ./libft
LIBFT_LIB = $(LIBFT_DIR)/libft.a

# minilibx directory
MLX_DIR = ./minilibx-linux
MLX_LIB = $(MLX_DIR)/libmlx.a

# Include paths
INCLUDES = -I./include -I$(LIBFT_DIR) -I$(MLX_DIR)

# Library paths and flags
LDFLAGS = -L$(LIBFT_DIR) -L$(MLX_DIR)
LDLIBS = -lft -lmlx -lX11 -lXext -lm

all: $(LIBFT_LIB) $(MLX_LIB) $(NAME)

$(NAME): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJECTS) $(LDFLAGS) $(LDLIBS)

$(LIBFT_LIB):
	make -C $(LIBFT_DIR)

$(MLX_LIB):
	@cd $(MLX_DIR) && ./configure 2>/dev/null
	make -C $(MLX_DIR)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJECTS)
	make -C $(LIBFT_DIR) clean
	@cd $(MLX_DIR) && [ -f Makefile.gen ] && make clean -f Makefile.gen || true

fclean: clean
	rm -f $(NAME)
	make -C $(LIBFT_DIR) fclean
	@cd $(MLX_DIR) && [ -f Makefile.gen ] && make clean -f Makefile.gen || true

re: fclean all

.PHONY: all clean fclean re