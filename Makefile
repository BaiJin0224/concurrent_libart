CC=gcc
LD=gcc
PREFIX=/usr/local
LIBDIR=$(PREFIX)/lib
INCLUDEDIR=$(PREFIX)/include
CFLAGS=-g -std=c99 -D_GNU_SOURCE -Wall -Werror -O3
SHCFLAGS=$(CFLAGS) -fPIC
SHLINKFLAGS=-shared

all:	src/concurrent_libart.so

src/concurrent_libart.so:	src/concurrent_libart.o
	$(LD) $(SHLINKFLAGS) -o $@ $<

src/concurrent_art.c:	src/concurrent_art.h

src/concurrent_libart.o:	src/concurrent_art.c
	$(CC) $(SHCFLAGS) -o $@ -c $<

install:	src/concurrent_libart.so
	mkdir -p $(DESTDIR)$(LIBDIR)
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp src/concurrent_libart.so $(DESTDIR)$(LIBDIR)/concurrent_libart.so
	chmod 555 $(DESTDIR)$(LIBDIR)/concurrent_libart.so
	cp src/art.h $(DESTDIR)$(INCLUDEDIR)/concurrent_art.h
	chmod 444 $(DESTDIR)$(INCLUDEDIR)/concurrent_art.h
