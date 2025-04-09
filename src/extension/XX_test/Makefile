EXTENSION = test
EXTVERSION = 1.0

MODULE_big = test
OBJS = test.o

DATA = test--1.0.sql

TESTS = $(wildcard test/sql/*.sql)
REGRESS = $(patsubst test/sql/%.sql,%,$(TESTS))
REGRESS_OPTS = --inputdir=test --load-extension=$(EXTENSION)

PG_CONFIG ?= pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

#PG_SRC = /usr/local/src/postgresql

#CFLAGS += -I$(PG_SRC)/src/include
#CFLAGS += -I$(PG_SRC)/src/backend

CC = clang
#CXX = clang++

#CFLAGS += -Wall -Wextra -Werror -fsanitize=undefined,address -O2
#CFLAGS += -fno-omit-frame-pointer -g
CFLAGS += -Xclang -load -Xclang clang-tidy

.PHONY: pre-build

pre-build:
	@echo "Running pre-build command..."
	./runClang.sh

include $(PGXS)
