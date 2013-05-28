# Makefile for Pari/GP -- i686 running linux (ix86 kernel) 32-bit version
#
#  This file was created by Configure. Any change made to it will be
#  lost when Configure is run.
#
SHELL      = /bin/sh

AS         = /usr/bin/as
ASFLAGS    = 
AR	   = ar

CC         = /usr/bin/gcc
CPPFLAGS   = -I. -I../src/headers
CFLAGS     = -O3 -DGCC_INLINE -Wall -Wno-implicit -fomit-frame-pointer  
LD         = /usr/bin/gcc
LDFLAGS    = -O3 -DGCC_INLINE -Wall -Wno-implicit -fomit-frame-pointer   -Xlinker -export-dynamic
DLLD       = /usr/bin/ld
DLLDFLAGS  = -shared -soname $(LIBPARI_SONAME) -lc -lm
EXTRADLLDFLAGS = 
CPP        = /usr/bin/gcc  -E -I.

_O	   = .o
_A	   = .a
LIB_PREFIX = lib
LIBPARI    = $(LIB_PREFIX)pari
LIBPARI_STA= $(LIBPARI)$(_A)
LIBPARI_SO = $(LIBPARI).so
LIBPARI_DYN   = $(LIBPARI_SO).2.1.7
LIBPARI_SONAME= $(LIBPARI_SO).1

RUNPTH       = -Xlinker -rpath -Xlinker  /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/Olinux-i686:/usr/local/lib:
RUNPTH_FINAL = -Xlinker -rpath -Xlinker  /usr/local/lib:
LDDYN        = -L/usr/local/lib -lpari
DLCFLAGS     = 
LIBS         = -ldl -lm
DYNLIBS      = 
DYNFLAGS     = 
DYNRELOC     = 

RM = rm -f
MV = mv -f
LN = ln -s
STRIP      = strip
STRIPFLAGS =


# Change these installation directories to suit your needs.
# DESTDIR is used to install to a false hierachy (to build a Debian package)
INCLUDEDIR = $(DESTDIR)/usr/local/include/pari
LIBDIR = $(DESTDIR)/usr/local/lib
BINDIR = $(DESTDIR)/usr/local/bin
DATADIR= $(DESTDIR)/usr/local/lib/pari/galdata
MANDIR = $(DESTDIR)/usr/local/man/man1
ALLDIR = $(DESTDIR)/usr/local/lib/pari
READMEDIR = $(ALLDIR)
DOCDIR  = $(ALLDIR)/doc
EMACSDIR= $(ALLDIR)/emacs
EXDIR   = $(ALLDIR)/examples
MISCDIR = $(ALLDIR)/misc

INSTALL = ../config/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

# Graphic library.
PLOTFILE   = plotnull.c
PLOTCFLAGS = 
PLOTLIBS   = 
GNUPLOT_OBJS = 
# Try uncommenting this line if you're using X11 and linking fails:
#  PLOTLIBS=-L -lX11

TOPLDDYN     = -L/var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/Olinux-i686 $(RLLIBS)

OBJS   =  kernel$(_O) mp$(_O) alglin1$(_O) alglin2$(_O) arith1$(_O) arith2$(_O) base1$(_O) base2$(_O) base3$(_O) base4$(_O) base5$(_O) bibli1$(_O) bibli2$(_O) buch1$(_O) buch2$(_O) buch3$(_O) buch4$(_O) galconj$(_O) gen1$(_O) gen2$(_O) gen3$(_O) ifactor1$(_O) polarit1$(_O) polarit2$(_O) polarit3$(_O) rootpol$(_O) subgroup$(_O) trans1$(_O) trans2$(_O) trans3$(_O) elliptic$(_O) galois$(_O) kummer$(_O) mpqs$(_O) nffactor$(_O) stark$(_O) subfield$(_O) thue$(_O) anal$(_O) compat$(_O) errmsg$(_O) es$(_O) helpmsg$(_O) init$(_O) sumiter$(_O) mpinl$(_O)
OBJSGP =  gp$(_O) gp_init$(_O) gp_rl$(_O) highlvl$(_O) whatnow$(_O) plot$(_O) plotport$(_O)
OBJSDGP =  gp-dyn$(_O) gp_init-dyn$(_O) gp_rl-dyn$(_O) highlvl-dyn$(_O) whatnow-dyn$(_O) plot-dyn$(_O) plotport-dyn$(_O)

dft: gp 
	-

gp: gp-dyn ../gp lib-dyn
	-

../gp: gp-dyn
	-$(RM) $@
	-$(LN) Olinux-i686/gp-dyn $@

all: gp-sta gp-dyn lib-sta

lib-sta: $(LIBPARI_STA)
lib-dyn: $(LIBPARI_DYN)

$(LIBPARI_STA): $(OBJS)
	-$(RM) $@
	$(AR) r $@ $(OBJS)

kerntest$(_O): ../src/test/kerntest.c 
	$(CC) -c $(CFLAGS) -I../src/language $(CPPFLAGS) -o $@ $<

kerntest:  kernel$(_O) mp$(_O) mp$(_O) kerntest$(_O)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@  kernel$(_O) mp$(_O) kerntest$(_O) $(LIBS)

test-kernel:: kerntest
	@./kerntest > gp.out;	diff -c gp.out ../src/test/32/kernel > kern.dif;	if test -s kern.dif; then echo "KERNEL BUG"; else echo OK; fi


gp-sta: $(OBJS) $(OBJSGP) $(GNUPLOT_OBJS)
	$(RM) $@
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(OBJSGP) $(GNUPLOT_OBJS) $(RUNPTH) $(RLLIBS) $(PLOTLIBS) $(LIBS)

bench: gp-sta gp-dyn dobench
test-compat: gp-sta gp-dyn dotest-compat
test-graphic: gp-sta gp-dyn dotest-graphic

cleantest:
	$(RM) *.dif gp.out pari.ps

dobench::
	@env "LD_LIBRARY_PATH=.;$$LD_LIBRARY_PATH" ../src/test/dotest 4
dotest-compat::
	@env "LD_LIBRARY_PATH=.;$$LD_LIBRARY_PATH" ../src/test/dotest 4 -c
dotest-graphic::
	@env "LD_LIBRARY_PATH=.;$$LD_LIBRARY_PATH" ../src/test/dotest 4 -g

cleanobj: cleantest
	-$(RM) *$(_O) *.s pariinl.h $(LIBPARI_STA) libpari.* gp-sta gp-dyn

clean: cleanobj

.headers:  pariinl.h ../src/headers/pari.h ../src/headers/paritype.h ../src/headers/paricast.h ../src/headers/paricom.h ../src/headers/parierr.h ../src/headers/parigen.h ../src/headers/paristio.h ../src/headers/parisys.h ../src/headers/pariport.h
	@touch $@

install: install-lib-dyn install-include install-bin install-man install-misc install-data install-doc install-examples

install-include:
	-mkdir -p $(INCLUDEDIR)
	$(INSTALL_DATA) paricfg.h                 $(INCLUDEDIR)
	-for i in pariinl; do \
	   $(INSTALL_DATA) $$i.h                $(INCLUDEDIR); done
	-for i in pari paritype paricast paricom parierr parigen paristio parisys pariport paridecl; do \
	   $(INSTALL_DATA) ../src/headers/$$i.h   $(INCLUDEDIR); done
	-$(RM) $(INCLUDEDIR)/genpari.h
	-$(LN) pari.h $(INCLUDEDIR)/genpari.h

install-bin: install-bin-dyn

install-bin-dyn: gp-dyn
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.1 $(BINDIR)/gp
	-$(LD) -o $(BINDIR)/gp-2.1 $(LDFLAGS) $(OBJSGP) $(RUNPTH_FINAL) $(TOPLDDYN) $(LDDYN) $(PLOTLIBS) $(LIBS)
	-$(STRIP) $(STRIPFLAGS) $(BINDIR)/gp-2.1
	-$(LN) gp-2.1 $(BINDIR)/gp

install-bin-sta: gp-sta
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.1 $(BINDIR)/gp
	$(INSTALL_PROGRAM) gp-sta $(BINDIR)/gp-2.1
	-$(LN) gp-2.1 $(BINDIR)/gp
# Can't strip it if we want install() to work on Linux or OSF.
#	$(STRIP) $(STRIPFLAGS) $(BINDIR)/gp-2.1

install-man::
	-mkdir -p $(MANDIR)
	$(INSTALL_DATA) ../doc/gphelp.1 $(MANDIR)
	$(INSTALL_DATA) ../doc/gp.1 $(MANDIR)
	-$(RM) $(MANDIR)/pari.1
	-$(LN) gp.1 $(MANDIR)/pari.1

install-misc:  install-top
	-mkdir -p $(MISCDIR) $(BINDIR)
	$(INSTALL_PROGRAM) ../misc/tex2mail $(BINDIR)
	$(INSTALL_DATA) ../doc/tex2mail.1 $(MANDIR)
	$(INSTALL_DATA) ../misc/README    $(MISCDIR)
	$(INSTALL_DATA) ../misc/color.dft $(MISCDIR)
	$(INSTALL_DATA) ../misc/gpalias   $(MISCDIR)
	$(INSTALL_PROGRAM) ../misc/gpflog $(MISCDIR)
	$(INSTALL_DATA) ../misc/gprc.dft  $(MISCDIR)
	$(INSTALL_DATA) ../misc/new.dic   $(MISCDIR)
	$(INSTALL_DATA) ../misc/pari.xpm  $(MISCDIR)
	$(INSTALL_PROGRAM) ../misc/xgp    $(MISCDIR)

install-top::
	-mkdir -p $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/AUTHORS      $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/Announce.2.1 $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/CHANGES      $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/COMPAT       $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/COPYING      $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/CVS.txt      $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/MACHINES     $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/NEW          $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/README       $(READMEDIR)
	$(INSTALL_DATA) /var/www/michel/perlScripts/Math-Pari-2.01080605/pari-2.1.7/TODO         $(READMEDIR)

install-doc::
	-mkdir -p $(BINDIR) $(DOCDIR)
	-cd ../doc; $(MAKE) all
	-$(INSTALL_PROGRAM) ../doc/gphelp    $(BINDIR)
	-$(INSTALL_DATA) ../doc/Makefile     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/translations $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appa.tex     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appb.tex     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appc.tex     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/paricfg.tex.in $(DOCDIR)
	-$(INSTALL_DATA) ../doc/parimacro.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/pdfmacs.tex  $(DOCDIR)
	-$(INSTALL_DATA) ../doc/refcard.tex  $(DOCDIR)
	-$(INSTALL_DATA) ../doc/tutorial.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/users.tex    $(DOCDIR)
	-$(INSTALL_DATA) ../doc/usersch1.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/usersch2.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/usersch3.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/usersch4.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/usersch5.tex $(DOCDIR)
	-$(INSTALL_DATA) ../doc/paricfg.tex  $(DOCDIR)
	-$(INSTALL_DATA) ../doc/users.dvi    $(DOCDIR)
	-$(INSTALL_DATA) ../doc/tutorial.dvi $(DOCDIR)
	-$(INSTALL_DATA) ../doc/refcard.dvi  $(DOCDIR)
	-$(INSTALL_DATA) ../doc/refcard.ps   $(DOCDIR)

install-examples:
	-mkdir -p $(EXDIR)
	-$(INSTALL_DATA) ../examples/EXPLAIN     $(EXDIR)
	-$(INSTALL_DATA) ../examples/Inputrc     $(EXDIR)
	-$(INSTALL_DATA) ../examples/Makefile    $(EXDIR)
	-$(INSTALL_DATA) ../examples/bench.gp    $(EXDIR)
	-$(INSTALL_DATA) ../examples/cl.gp       $(EXDIR)
	-$(INSTALL_DATA) ../examples/classno.gp  $(EXDIR)
	-$(INSTALL_DATA) ../examples/contfrac.gp $(EXDIR)
	-$(INSTALL_DATA) ../examples/lucas.gp    $(EXDIR)
	-$(INSTALL_DATA) ../examples/matexp.c    $(EXDIR)
	-$(INSTALL_DATA) ../examples/rho.gp      $(EXDIR)
	-$(INSTALL_DATA) ../examples/squfof.gp   $(EXDIR)
	-$(INSTALL_DATA) ../examples/taylor.gp   $(EXDIR)

install-data:
	-mkdir -p $(DATADIR)
	-for f in ../data/*; do $(INSTALL_DATA)  $$f $(DATADIR); done 2>/dev/null

install-lib-sta: $(LIBPARI_STA)
	-mkdir -p $(LIBDIR)
	-$(RM) $(LIBDIR)/$(LIBPARI_STA)
	$(INSTALL_DATA) $(LIBPARI_STA) $(LIBDIR)/$(LIBPARI_STA).2.1
	-$(LN) $(LIBPARI_STA).2.1 $(LIBDIR)/$(LIBPARI_STA)

install-lib-dyn: $(LIBPARI_DYN)
	-mkdir -p $(LIBDIR)
	-$(RM) $(LIBDIR)/$(LIBPARI_DYN)
	$(INSTALL_PROGRAM) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_DYN)
	-$(RM) $(LIBDIR)/$(LIBPARI_SONAME)
	-$(RM) $(LIBDIR)/$(LIBPARI_SO)
	-$(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SONAME)
	-$(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SO)

gp-dyn: $(OBJSGP) $(LIBPARI_DYN) $(GNUPLOT_OBJS)
	$(RM) $@
	$(LD) -o $@ $(LDFLAGS) $(OBJSGP) $(GNUPLOT_OBJS) $(RUNPTH) $(TOPLDDYN) $(LDDYN) $(PLOTLIBS) $(LIBS)

$(LIBPARI_DYN): $(OBJS)
	-$(RM) $(LIBPARI_DYN)
	$(DLLD) -o $@ $(DLLDFLAGS) $(OBJS) $(EXTRADLLDFLAGS)
	-$(RM) $(LIBPARI_SONAME)
	-$(RM) $(LIBPARI_SO)
	-$(LN) $(LIBPARI_DYN) $(LIBPARI_SONAME)
	-$(LN) $(LIBPARI_DYN) $(LIBPARI_SO)
pariinl.h: ../src/kernel/ix86/level0.h ../src/kernel/none/level1.h
	cat ../src/kernel/ix86/level0.h ../src/kernel/none/level1.h > $@
level0.s: ../src/kernel/ix86/l0asm.c ../src/kernel/ix86/l0asm.h
	$(CPP) ../src/kernel/ix86/l0asm.c | sed -e '/^#/d' -e '/^ *#line/d' -e 's/%  */%/g' > level0.s
kernel.o:  level0.s
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o kernel.o level0.s
mp.o: .headers ../src/kernel/none/mp.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o mp.o ../src/kernel/none/mp.c
mpinl.o: .headers ../src/kernel/none/level1.h
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o mpinl.o ../src/kernel/none/level1.c


alglin1$(_O): .headers  ../src/basemath/alglin1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o alglin1$(_O) ../src/basemath/alglin1.c
alglin2$(_O): .headers  ../src/basemath/alglin2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o alglin2$(_O) ../src/basemath/alglin2.c
arith1$(_O): .headers  ../src/basemath/arith1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o arith1$(_O) ../src/basemath/arith1.c
arith2$(_O): .headers  ../src/basemath/arith2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o arith2$(_O) ../src/basemath/arith2.c
base1$(_O): .headers ../src/headers/parinf.h ../src/basemath/base1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o base1$(_O) ../src/basemath/base1.c
base2$(_O): .headers  ../src/basemath/base2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o base2$(_O) ../src/basemath/base2.c
base3$(_O): .headers  ../src/basemath/base3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o base3$(_O) ../src/basemath/base3.c
base4$(_O): .headers  ../src/basemath/base4.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o base4$(_O) ../src/basemath/base4.c
base5$(_O): .headers  ../src/basemath/base5.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o base5$(_O) ../src/basemath/base5.c
bibli1$(_O): .headers ../src/headers/parinf.h ../src/basemath/bibli1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o bibli1$(_O) ../src/basemath/bibli1.c
bibli2$(_O): .headers  ../src/basemath/bibli2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o bibli2$(_O) ../src/basemath/bibli2.c
buch1$(_O): .headers  ../src/basemath/buch1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o buch1$(_O) ../src/basemath/buch1.c
buch2$(_O): .headers ../src/headers/parinf.h ../src/basemath/buch2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o buch2$(_O) ../src/basemath/buch2.c
buch3$(_O): .headers  ../src/basemath/buch3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o buch3$(_O) ../src/basemath/buch3.c
buch4$(_O): .headers  ../src/basemath/buch4.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o buch4$(_O) ../src/basemath/buch4.c
galconj$(_O): .headers  ../src/basemath/galconj.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o galconj$(_O) ../src/basemath/galconj.c
gen1$(_O): .headers  ../src/basemath/gen1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o gen1$(_O) ../src/basemath/gen1.c
gen2$(_O): .headers  ../src/basemath/gen2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o gen2$(_O) ../src/basemath/gen2.c
gen3$(_O): .headers  ../src/basemath/gen3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o gen3$(_O) ../src/basemath/gen3.c
ifactor1$(_O): .headers  ../src/basemath/ifactor1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o ifactor1$(_O) ../src/basemath/ifactor1.c
polarit1$(_O): .headers  ../src/basemath/polarit1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o polarit1$(_O) ../src/basemath/polarit1.c
polarit2$(_O): .headers  ../src/basemath/polarit2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o polarit2$(_O) ../src/basemath/polarit2.c
polarit3$(_O): .headers  ../src/basemath/polarit3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o polarit3$(_O) ../src/basemath/polarit3.c
rootpol$(_O): .headers  ../src/basemath/rootpol.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o rootpol$(_O) ../src/basemath/rootpol.c
subgroup$(_O): .headers  ../src/basemath/subgroup.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o subgroup$(_O) ../src/basemath/subgroup.c
trans1$(_O): .headers  ../src/basemath/trans1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o trans1$(_O) ../src/basemath/trans1.c
trans2$(_O): .headers  ../src/basemath/trans2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o trans2$(_O) ../src/basemath/trans2.c
trans3$(_O): .headers  ../src/basemath/trans3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o trans3$(_O) ../src/basemath/trans3.c
elliptic$(_O): .headers  ../src/modules/elliptic.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o elliptic$(_O) ../src/modules/elliptic.c
galois$(_O): .headers  ../src/modules/galois.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o galois$(_O) ../src/modules/galois.c
kummer$(_O): .headers  ../src/modules/kummer.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o kummer$(_O) ../src/modules/kummer.c
mpqs$(_O): .headers  ../src/modules/mpqs.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o mpqs$(_O) ../src/modules/mpqs.c
nffactor$(_O): .headers  ../src/modules/nffactor.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o nffactor$(_O) ../src/modules/nffactor.c
stark$(_O): .headers  ../src/modules/stark.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o stark$(_O) ../src/modules/stark.c
subfield$(_O): .headers  ../src/modules/subfield.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o subfield$(_O) ../src/modules/subfield.c
thue$(_O): .headers  ../src/modules/thue.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o thue$(_O) ../src/modules/thue.c
anal$(_O): .headers ../src/language/anal.h ../src/headers/parinf.h ../src/language/anal.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o anal$(_O) ../src/language/anal.c
compat$(_O): .headers  ../src/language/compat.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o compat$(_O) ../src/language/compat.c
errmsg$(_O): .headers  ../src/language/errmsg.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o errmsg$(_O) ../src/language/errmsg.c
es$(_O): .headers ../src/language/anal.h ../src/language/es.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o es$(_O) ../src/language/es.c
helpmsg$(_O): .headers  ../src/language/helpmsg.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o helpmsg$(_O) ../src/language/helpmsg.c
init$(_O): .headers ../src/language/anal.h ../src/language/init.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o init$(_O) ../src/language/init.c
sumiter$(_O): .headers ../src/language/anal.h ../src/language/sumiter.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o sumiter$(_O) ../src/language/sumiter.c
gp$(_O): .headers ../src/language/anal.h ../src/gp/gp.h ./paricfg.h ../src/gp/gp.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/language $(RLINCLUDE) -o gp$(_O) ../src/gp/gp.c
gp_init$(_O): .headers ../src/graph/rect.h ../src/gp/gp_init.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/graph -o gp_init$(_O) ../src/gp/gp_init.c
gp_rl$(_O): .headers ../src/language/anal.h ../src/gp/gp.h ./paricfg.h ../src/gp/gp_rl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/language $(RLINCLUDE) -o gp_rl$(_O) ../src/gp/gp_rl.c
highlvl$(_O): .headers  ../src/gp/highlvl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o highlvl$(_O) ../src/gp/highlvl.c
whatnow$(_O): .headers  ../src/gp/whatnow.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS)  -o whatnow$(_O) ../src/gp/whatnow.c
plot$(_O): .headers ../src/graph/rect.h ../src/graph/$(PLOTFILE)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(PLOTCFLAGS) -o plot$(_O) ../src/graph/$(PLOTFILE)
plotport$(_O): .headers ../src/graph/rect.h ../src/graph/plotport.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/graph -o plotport$(_O) ../src/graph/plotport.c
