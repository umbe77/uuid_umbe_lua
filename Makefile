LUA ?= lua5.4
LUA_LIBDIR ?= $(shell pkg-config $(LUA) --libs)
LUA_INCDIR ?= $(shell pkg-config $(LUA) --cflags)

UUID_LIBDIR ?= $(shell pkg-config uuid --libs)
UUID_INCDIR ?= $(shell pkg-config uuid --cflags)

LIBFLAG ?= -shared
CFLAGS ?= -O2 -Wall -Werror

.PHONY: all clean

all: uuid_umbe_lua.so

uuid_umbe_lua.so: uuid_umbe_lua.o
	$(CC) $(LIBFLAG) $(LUA_LIBDIR) -o $@ $< $(UUID_LIBDIR)

%.o: %.c
	$(CC) -c $(CFLAGS) -fPIC $(LUA_INCDIR) $(UUID_INCDIR) $< -o $@

clean: 
	rm -f *.so *.o
