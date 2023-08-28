SRC = client.c server.c

CC = gcc

OBJ = $(patsubst src%, obj%, $(SRC:.c=.o))

LFT = ft_printf/libft_printf.a

LIB = -L ./ft_printf -lft_printf

INC = -I ./inc -I ./ft_printf

FLAGS = -Wall -Werror -Wextra

RM = rm -rf


all : server client

server : server.o $(LFT)
	$(CC) $(FLAGS) -o $@ $< $(LIB)

client : client.o $(LFT)
	$(CC) $(FLAGS) -o $@ $< $(LIB)

obj/%.o : src/%.c
	$(CC) $(CFLAGS) -o $@ -c $< 

$(LFT):
	@echo "compiling libft"
	@make -s -C ft_printf
	@echo "libft ready"

clean :
	$(RM) $(OBJ)

libclean : 
	@make fclean -C ft_printf

fclean : clean libclean
	$(RM) server client $(LFT)

re : fclean all

.PHONY: all clean fclean re%      
