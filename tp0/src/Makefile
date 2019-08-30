CC = gcc
CFLAGS = -o0 -g -Wall -Werror -pedantic -std=c99

OBJECTS = command.o
EXEC = tp0

VALGRIND = valgrind --track-origins=yes --leak-check=full
VALGRIND-V = $(VALGRIND) -v

all: $(EXEC)

command.o: command.c command.h
	$(CC) $(CFLAGS) -c command.c -o command.o

$(EXEC): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) main.c -o $(EXEC) -lm

run: $(EXEC)
	./$(EXEC)

valgrind: $(EXEC)
	$(VALGRIND) ./$(EXEC)

valgrind-verb: $(EXEC)
	$(VALGRIND-V) ./$(EXEC)

clean:
	rm -f *.o $(EXEC)
