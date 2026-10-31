CC = gcc
CFLAGS = -Wall -Wextra -g -I.
OBJ = hellomake.o hellofunc.o
hellomake: $(OBJ)
	$(CC) -o $@ $^
%.o: %.c hellomake.h
	$(CC) $(CFLAGS) -c $< -o $@
.PHONY: clean
clean:
	rm -f $(OBJ) hellomake
