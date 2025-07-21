# Simple Makefile for test.c
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
TARGET = test
SOURCE = test.c

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Clean up generated files
clean:
	rm -f $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Analyze with your custom clang
analyze:
	~/repos/llvm-project/release/bin/clang --analyze -Xclang -analyzer-checker=postgres.PostgresChecker $(SOURCE)

# Force rebuild
rebuild: clean all

# Mark targets as phony (not files)
.PHONY: all clean run analyze rebuild
