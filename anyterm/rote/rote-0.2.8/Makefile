# Makefile for librote
#
# Copyright (c) 2004 Bruno T. C. de Oliveira
# 
# LICENSE INFORMATION:
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
# Copyright (c) 2002 Bruno T. C. de Oliveira

SOURCES=$(wildcard *.c)
HEADERS=$(wildcard *.h)

OBJECTS=$(patsubst %.c,%.o,$(SOURCES))

ROTE_VERSION=0.2.8
ROTE_SONAME=librote.so.0

CC=gcc
CFLAGS=-g -O2 -Wall -fPIC
LIBS=-lutil -lncurses 
LDFLAGS=
prefix=/usr/local
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include
bindir=${exec_prefix}/bin

all: librote.so.$(ROTE_VERSION)

install: all
	mkdir -p $(DESTDIR)$(includedir)/rote
	rm -f $(DESTDIR)$(includedir)/rote/*.h
	cp rote.h $(DESTDIR)$(includedir)/rote
	mkdir -p $(DESTDIR)$(libdir)
	cp librote.so.$(ROTE_VERSION) $(DESTDIR)$(libdir)
	cd $(DESTDIR)$(libdir) && ln -sf librote.so.$(ROTE_VERSION) librote.so
	cd $(DESTDIR)$(libdir) && ln -sf librote.so.$(ROTE_VERSION) $(ROTE_SONAME)
	chmod 755 rote-config
	mkdir -p $(DESTDIR)$(bindir)
	cp -p rote-config $(DESTDIR)$(bindir)
	@echo "-----------------------------------------------------------"
	@echo "ROTE - Our Own Terminal Emulation Library v$(ROTE_VERSION)"
	@echo
	@echo "Include files installed at: $(DESTDIR)$(includedir)"
	@echo "Library files installed at: $(DESTDIR)$(libdir)"
	@echo "rote-config executable    : $(DESTDIR)$(bindir)/rote-config"
	@echo
	@echo "To find out what compiler arguments you should use to"
	@echo "compile programs that use rote, use the rote-config"
	@echo "program (make sure $(DESTDIR)$(bindir) is in your path)."
	@echo "-----------------------------------------------------------"
        
librote.so.$(ROTE_VERSION): $(OBJECTS)
	$(CC) $(CFLAGS) -shared -o $@ -Wl,-soname=$(ROTE_SONAME) $(OBJECTS) $(LDFLAGS) $(LIBS)

.depends: $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) -MM $(SOURCES) >.depends
	
-include .depends

clean:
	rm -f *.o .depends librote.so.*

pristine: clean
	rm -rf autom4te.cache configure config.status config.log Makefile rote-config

.PHONY: clean all install pristine

