EXTENSION = aggregate_functions
EXTVERSION = 1.0

MODULE_big = aggregate_functions
OBJS = aggregate_functions.o

DATA = aggregate_functions--1.0.sql

TESTS = $(wildcard test/sql/*.sql)
REGRESS = $(patsubst test/sql/%.sql,%,$(TESTS))
REGRESS_OPTS = --inputdir=test --load-extension=$(EXTENSION)

PG_CONFIG ?= pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

PG_CFLAGS += -fdump-tree-original
PG_CFLAGS += -I/usr/local/postgresql-17.2/include/
#PG_CPPFLAGS += -Xclang -ast-dump -fsyntax-only

include $(PGXS)
