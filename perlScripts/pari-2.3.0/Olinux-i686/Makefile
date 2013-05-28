# Makefile for Pari/GP -- i686 running linux (ix86 kernel) 32-bit version
#
#  This file was created by Configure. Any change made to it will be
#  lost when Configure is run.
#
SHELL      = /bin/sh
PERL       = /usr/bin/perl
AR	   = ar

SIZEOF_LONG= 4

CC_FLAVOR  =
CC         = /usr/bin/gcc $(CC_FLAVOR)
CPPFLAGS   = -I. -I../src/headers
CFLAGS     = -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer   
DLCFLAGS   = 
LD_FLAVOR  = $(CC_FLAVOR)
LD         = /usr/bin/gcc $(LD_FLAVOR)
LDFLAGS    = -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer    -Wl,--export-dynamic 
DLLD_FLAVOR  = $(LD_FLAVOR)
DLLD       = /usr/bin/gcc $(DLLD_FLAVOR)
DLLDFLAGS  = -shared  $(CFLAGS) $(DLCFLAGS) -Wl,-shared,-soname=$(LIBPARI_SONAME)
EXTRADLLDFLAGS = -lc ${LIBS}
CPP        = /usr/bin/gcc  -E -I.

# HIGHLY EXPERIMENTAL (only tested with gmp-4.0 on ix86 and Ultra).
# If you've configured and compiled GMP and would like to tune PARI using
# the nice cycle counting functions in GMP, uncomment the 4 lines below
# (correct the first one to the path to your gmp source tree).
#
#GMP     = /some/directory/gmp-4.0/tune
#GMPFLAGS= -DGMP_TIMER
#GMPO1 = $(GMP)/time.o $(GMP)/freq.o
#GMPOBJS=$(GMPO1) $(GMPO2)
#
#You may need to add a few object files to GMPOBJS. On UltraSparc, uncomment
#the following line
#GMPO2 = $(GMP)/sparcv9.o

_O	   = .o
_A	   = .a
LIB_PREFIX = lib
DLLIB_PREFIX = lib
LIBPARI_BASE = pari
LIBPARI      = $(LIB_PREFIX)pari
DLLIBPARI    = $(DLLIB_PREFIX)pari
LIBPARI_STA  = $(LIBPARI)$(_A)
LIBPARI_SO   = $(DLLIBPARI).so
SOLIBPARI    = $(DLLIB_PREFIX)$(LIBPARI_BASE).so
LIBPARI_DYN   = $(SOLIBPARI).2.3.0
LIBPARI_SONAME= $(SOLIBPARI).2
DL_DFLT_NAME = NULL

EXPORT_FILE   = 
EXPORT_CREATE = 
EXPORT_LIB    = 
EXPORT_LIB_CREATE = 
DLLD_IGNORE   = 

RUNPTH       = -Wl,-rpath,/var/www/michel/perlScripts/pari-2.3.0/Olinux-i686:/usr/local/lib:/usr/lib
RUNPTH_FINAL = -Wl,-rpath,/usr/local/lib:/usr/lib
LDDYN        = -L/usr/local/lib -lpari
LIBS         = -ldl -lm

RM = rm -f
MV = mv -f
LN = ln -s
CP_F = cp -f
STRIP      = strip
STRIPFLAGS =

# Change these installation directories to suit your needs.
# DESTDIR is used to install to a false hierachy (to build a Debian package)
INCLUDEDIR= "$(DESTDIR)/usr/local/include"
LIBDIR    = "$(DESTDIR)/usr/local/lib"
BINDIR    = "$(DESTDIR)/usr/local/bin"
MANDIR    = "$(DESTDIR)/usr/local/share/man/man1"
EMACSDIR  = "$(DESTDIR)/usr/local/share/emacs/site-lisp/pari"
DATADIR   = "$(DESTDIR)/usr/local/share/pari"
SYSDATADIR= "$(DESTDIR)/usr/local/lib/pari"

EXDIR     = $(DATADIR)/examples
MISCDIR   = $(DATADIR)/misc
DOCDIR    = $(DATADIR)/doc

INSTALL = ../config/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

# Readline
RLINCLUDE = 
RLLIBS    = 
# GMP
GMPINCLUDE = 
# Graphic library.
QTDIR      = ""
MOC        = $(QTDIR)/bin/moc
PLOTCFLAGS = 
PLOTLIBS   = 
CPLUSPLUS  = g++

FLTKDIR    = ""

TOPLDDYN   = -L"/var/www/michel/perlScripts/pari-2.3.0/Olinux-i686" $(RLLIBS)
# Description system
DESC          = pari.desc
DESC_HELP_GEN = ../src/desc/gen_proto ../src/desc/PARI/822.pm
TMPSUF        = -linux-i686-6595.tmp

DOTEST=env "LD_LIBRARY_PATH=.:$$LD_LIBRARY_PATH" $(SHELL) ../src/test/dotest 32

OBJS   =  mp$(_O) mpinl$(_O) alglin1$(_O) alglin2$(_O) arith1$(_O) arith2$(_O) base1$(_O) base2$(_O) base3$(_O) base4$(_O) base5$(_O) bibli1$(_O) bibli2$(_O) buch1$(_O) buch2$(_O) buch3$(_O) buch4$(_O) Flx$(_O) galconj$(_O) gen1$(_O) gen2$(_O) gen3$(_O) ifactor1$(_O) perm$(_O) polarit1$(_O) polarit2$(_O) polarit3$(_O) Qfb$(_O) RgX$(_O) rootpol$(_O) subcyclo$(_O) subgroup$(_O) trans1$(_O) trans2$(_O) trans3$(_O) anal$(_O) compat$(_O) default$(_O) errmsg$(_O) es$(_O) init$(_O) intnum$(_O) members$(_O) sumiter$(_O) aprcl$(_O) elldata$(_O) elliptic$(_O) galois$(_O) groupid$(_O) kummer$(_O) mpqs$(_O) nffactor$(_O) part$(_O) stark$(_O) subfield$(_O) thue$(_O)
OBJSGP =  gp$(_O) gp_init$(_O) gp_rl$(_O) highlvl$(_O) whatnow$(_O) plotport$(_O) plotnull$(_O)

gp: gp-dyn ../gp lib-dyn

../gp: gp-dyn
	-$(RM) $@
	-$(LN) Olinux-i686/gp-dyn $@

all: gp-sta gp-dyn lib-sta

lib-sta: $(LIBPARI_STA)
lib-dyn: $(LIBPARI_DYN)

$(LIBPARI_STA): ../src/funclist $(OBJS)
	-$(RM) $@
	$(AR) r $@ $(OBJS)
	-/usr/bin/ranlib $@

kerntest$(_O): ../src/test/kerntest.c
	$(CC) -c $(CFLAGS) -I../src/language $(CPPFLAGS) -o $@ ../src/test/kerntest.c

kerntest:  mp$(_O) mpinl$(_O) kerntest$(_O)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@  mp$(_O) mpinl$(_O) kerntest$(_O) $(LIBS)

mpinl$(_O): .headers parilvl0.h parilvl1.h ../src/kernel/none/mpinl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o mpinl$(_O) ../src/kernel/none/mpinl.c

test-kernel:: kerntest
	@./kerntest > gp.out;	diff -c gp.out ../src/test/32/kernel > kern.dif;	if test -s kern.dif; then echo "KERNEL BUG"; else echo OK; fi

tune.o: ../src/test/tune.c
	$(CC) $(CFLAGS) $(GMPFLAGS) $(CPPFLAGS) -o $@ $< -c

tune: tune-sta
	-$(RM) tune ../tune
	-$(LN) tune-sta tune
	-$(LN) Olinux-i686/tune ../tune

tune-dyn: tune.o $(LIBPARI_DYN)
	$(LD) $(LDFLAGS) $(RUNPTH) -o $@ $< $(GMPOBJS) -L. $(LDDYN) $(LIBS)
tune-sta: tune.o $(LIBPARI_STA)
	$(LD) $(LDFLAGS) -o $@ $< $(GMPOBJS) ./$(LIBPARI_STA) $(LIBS)

gp-sta: ../src/funclist $(OBJS) $(OBJSGP)
	$(RM) $@
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(OBJSGP) $(RUNPTH) $(RLLIBS) $(PLOTLIBS) $(LIBS)
	@:  gp-sta

cleanemacs:
	$(RM) ../emacs/*.elc
cleantest:
	$(RM) *.dif gp.out pari.ps
cleanobj:
	-$(RM) *$(_O) mp.c *.s pariinl.h parilvl0.h parilvl1.h libpari* tune* gp-sta gp-dyn
cleandesc:
	-$(RM) ../src/desc/$(DESC) *$(TMPSUF)

clean: cleanobj cleantest cleanemacs cleandesc

.headers: pariinl.h ../src/headers/paricast.h ../src/headers/paricom.h ../src/headers/parierr.h ../src/headers/parigen.h ../src/headers/pari.h ../src/headers/parinf.h ../src/headers/pariold.h ../src/headers/pariport.h ../src/headers/paristio.h ../src/headers/parisys.h ../src/headers/paritune.h ../src/headers/paritype.h
	@touch $@

install: install-lib-dyn install-include install-bin install-man install-misc install-doc install-examples install-cfg install-data

install-include:
	-mkdir -p $(INCLUDEDIR)/pari
	-for i in paricfg.h pariinl.h; do \
	  $(INSTALL_DATA) $$i $(INCLUDEDIR)/pari; done
	-for i in paridecl paripriv paricast paricom parierr parigen pari parinf pariold pariport paristio parisys paritune paritype ; do \
	   $(INSTALL_DATA) ../src/headers/$$i.h  $(INCLUDEDIR)/pari; done
	-$(RM) $(INCLUDEDIR)/pari/genpari.h
	-$(LN) pari.h $(INCLUDEDIR)/pari/genpari.h

install-bin: install-bin-dyn

install-bin-dyn: gp-dyn
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.3 $(BINDIR)/gp
	-$(LD) -o $(BINDIR)/gp-2.3 $(LDFLAGS) $(OBJSGP) $(RUNPTH_FINAL) $(TOPLDDYN) $(LDDYN) $(PLOTLIBS) $(LIBS)
	-$(STRIP) $(STRIPFLAGS) $(BINDIR)/gp-2.3
	@:  $(BINDIR)/gp-2.3
	-$(LN) gp-2.3 $(BINDIR)/gp

install-bin-sta: gp-sta
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.3 $(BINDIR)/gp
	$(INSTALL_PROGRAM) gp-sta $(BINDIR)/gp-2.3
	-$(LN) gp-2.3 $(BINDIR)/gp
# Can't strip it if we want install() to work on OSF.
#	-$(STRIP) $(STRIPFLAGS)  $(BINDIR)/gp-2.3
	@:  $(BINDIR)/gp-2.3

install-man::
	-mkdir -p $(MANDIR)
	-$(RM) $(MANDIR)/pari.1 $(MANDIR)/gp.1 $(MANDIR)/gp-2.3.1
	$(INSTALL_DATA) ../doc/gphelp.1 $(MANDIR)
	$(INSTALL_DATA) ../doc/gp.1 $(MANDIR)/gp-2.3.1
	-$(LN) gp.1 $(MANDIR)/pari.1
	-$(LN) gp-2.3.1 $(MANDIR)/gp.1

install-misc: 
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

install-cfg::
	-mkdir -p $(SYSDATADIR)
	-$(INSTALL_DATA) pari.cfg $(SYSDATADIR)
	-if test -n "../src/funclist"; then	   mkdir -p $(DATADIR)/PARI;	   $(INSTALL_DATA) ../src/desc/PARI/822.pm $(DATADIR)/PARI;	   $(INSTALL_DATA) ../src/desc/$(DESC) $(DATADIR); fi

install-doc::
	-mkdir -p $(BINDIR) $(DOCDIR)
	-cd ../doc; $(MAKE) all
	-$(INSTALL_PROGRAM) ../doc/gphelp    $(BINDIR)
	-$(INSTALL_DATA) ../doc/Makefile     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/translations $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appa.tex     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appb.tex     $(DOCDIR)
	-$(INSTALL_DATA) ../doc/appc.tex     $(DOCDIR)
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
	-$(INSTALL_DATA) ../doc/libpari.dvi    $(DOCDIR)
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
	-$(INSTALL_DATA) ../examples/extgcd.c    $(EXDIR)
	-$(INSTALL_DATA) ../examples/rho.gp      $(EXDIR)
	-$(INSTALL_DATA) ../examples/squfof.gp   $(EXDIR)
	-$(INSTALL_DATA) ../examples/taylor.gp   $(EXDIR)

install-data:
	-if test -d ../data; then cd ../data; 	   for d in `ls`; do 	     mkdir -p $(DATADIR)/$$d && 	     for f in `ls $$d`; do 	       $(INSTALL_DATA) $$d/$$f $(DATADIR)/$$d; 	     done >/dev/null;	   done; 	 fi

install-lib-sta: $(LIBPARI_STA)
	-mkdir -p $(LIBDIR)
	-$(RM) $(LIBDIR)/$(LIBPARI_STA)
	$(INSTALL_DATA) $(LIBPARI_STA) $(LIBDIR)/$(LIBPARI_STA)

install-lib-dyn-base:
	-mkdir -p $(LIBDIR)
	-$(RM) $(LIBDIR)/$(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SONAME) $(LIBDIR)/$(LIBPARI_SO)
	$(INSTALL_PROGRAM) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_DYN)
install-lib-dyn-link: install-lib-dyn-base
	-if test "$(LIBPARI_SONAME)" != "$(LIBPARI_SO)"; then 	  $(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SONAME);	  $(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SO); fi
install-lib-dyn: $(LIBPARI_DYN) install-lib-dyn-link

pariinl.h: parilvl0.h parilvl1.h
	cat parilvl0.h parilvl1.h > pariinl.h

bench: gp-sta gp-dyn
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200
dobench::
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200
test-all: gp-sta gp-dyn
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200   compat  ellglobalred  galois  intnum  qfbsolve  rfrac  round4  stark
dotest-all::
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200   compat  ellglobalred  galois  intnum  qfbsolve  rfrac  round4  stark
test-compat: gp-sta gp-dyn
	@$(DOTEST) compat
dotest-compat::
	@$(DOTEST) compat
test-ellglobalred: gp-sta gp-dyn
	@$(DOTEST) ellglobalred
dotest-ellglobalred::
	@$(DOTEST) ellglobalred
test-galois: gp-sta gp-dyn
	@$(DOTEST) galois
dotest-galois::
	@$(DOTEST) galois
test-intnum: gp-sta gp-dyn
	@$(DOTEST) intnum
dotest-intnum::
	@$(DOTEST) intnum
test-qfbsolve: gp-sta gp-dyn
	@$(DOTEST) qfbsolve
dotest-qfbsolve::
	@$(DOTEST) qfbsolve
test-rfrac: gp-sta gp-dyn
	@$(DOTEST) rfrac
dotest-rfrac::
	@$(DOTEST) rfrac
test-round4: gp-sta gp-dyn
	@$(DOTEST) round4
dotest-round4::
	@$(DOTEST) round4
test-stark: gp-sta gp-dyn
	@$(DOTEST) stark
dotest-stark::
	@$(DOTEST) stark
test-ploth: gp-sta gp-dyn
	@$(DOTEST) ploth
dotest-ploth::
	@$(DOTEST) ploth

gp-dyn: ../src/funclist $(OBJSGP) $(LIBPARI_DYN) $(EXPORT_LIB)
	$(RM) $@
	$(LD) -o $@ $(LDFLAGS) $(OBJSGP) $(RUNPTH) $(TOPLDDYN) $(LDDYN) $(PLOTLIBS) $(LIBS)
	@:  gp-dyn

$(LIBPARI_DYN): ../src/funclist $(OBJS) $(EXPORT_FILE)
	-$(RM) $(LIBPARI_DYN)
	$(DLLD_IGNORE)$(DLLD) -o $(LIBPARI_DYN) $(DLLDFLAGS) $(OBJS) $(EXTRADLLDFLAGS) $(EXPORT_FILE)
	-if test "$(LIBPARI_DYN)" != "$(LIBPARI_SO)"; then 	  $(RM) $(LIBPARI_SO);	  $(LN) $(LIBPARI_DYN) $(LIBPARI_SO); fi
	-if test "$(LIBPARI_DYN)" != "$(LIBPARI_SONAME)"; then 	  $(RM) $(LIBPARI_SONAME);	  $(LN) $(LIBPARI_DYN) $(LIBPARI_SONAME); fi
desc:: ../src/language/init.h ../src/gp/gp_init.h ../src/gp/highlvl.h ../src/language/members.h

../src/funclist::
	@-cksum `env LANG= ls -d ../src/functions/*/* | grep -v CVS` > funclist$(TMPSUF)
	@-sh ../config/mv-if-diff funclist$(TMPSUF) ../src/funclist

../src/desc/$(DESC): ../src/funclist ../src/desc/merge_822 ../src/desc/PARI/822.pm
	cd ../src/desc && $(PERL) merge_822 ../functions/*/* > def$(TMPSUF)
	mv ../src/desc/def$(TMPSUF) $@

../src/language/members.h: ../src/desc/$(DESC) ../src/desc/gen_member
	cd ../src/desc && $(PERL) gen_member $(DESC) > members$(TMPSUF)
	mv ../src/desc/members$(TMPSUF) $@

../src/language/init.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	cd ../src/desc && $(PERL) gen_proto basic $(DESC) > init$(TMPSUF)
	mv ../src/desc/init$(TMPSUF) $@

../src/gp/gp_init.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	cd ../src/desc && $(PERL) gen_proto gp $(DESC) > gp_init$(TMPSUF)
	mv ../src/desc/gp_init$(TMPSUF) $@

../src/gp/highlvl.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	cd ../src/desc && $(PERL) gen_proto highlevel $(DESC) > highlvl$(TMPSUF)
	mv ../src/desc/highlvl$(TMPSUF) $@

L0MODS=../src/kernel/ix86/asm0.h ../src/kernel/none/addll.h ../src/kernel/none/mulll.h ../src/kernel/none/bfffo.h ../src/kernel/none/divll.h
parilvl0.h: $(L0MODS)
	../config/genkernel ../src/kernel/ix86/asm0.h > parilvl0.h
L1OBJS=../src/kernel/none/tune.h ../src/kernel/none/int.h ../src/kernel/none/level1.h
parilvl1.h: $(L1OBJS) ../src/headers/paritune.h
	cat $(L1OBJS) > parilvl1.h
MP_C=../src/kernel/none/mp.c ../src/kernel/none/cmp.c ../src/kernel/none/gcdll.c ../src/kernel/none/ratlift.c  ../src/kernel/none/invmod.c ../src/kernel/none/gcd.c ../src/kernel/none/mp_indep.c ../src/kernel/none/add.c
mp.c: $(MP_C)
	cat $(MP_C) > mp.c
mp$(_O): .headers mp.c
	$(CC) -c $(CFLAGS) $(DLCFLAGS) $(CPPFLAGS) -o mp$(_O) mp.c

alglin1$(_O): .headers  ../src/basemath/alglin1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o alglin1$(_O) ../src/basemath/alglin1.c
alglin2$(_O): .headers  ../src/basemath/alglin2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o alglin2$(_O) ../src/basemath/alglin2.c
arith1$(_O): .headers  ../src/basemath/arith1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o arith1$(_O) ../src/basemath/arith1.c
arith2$(_O): .headers  ../src/basemath/arith2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o arith2$(_O) ../src/basemath/arith2.c
base1$(_O): .headers  ../src/basemath/base1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o base1$(_O) ../src/basemath/base1.c
base2$(_O): .headers  ../src/basemath/base2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o base2$(_O) ../src/basemath/base2.c
base3$(_O): .headers  ../src/basemath/base3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o base3$(_O) ../src/basemath/base3.c
base4$(_O): .headers  ../src/basemath/base4.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o base4$(_O) ../src/basemath/base4.c
base5$(_O): .headers  ../src/basemath/base5.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o base5$(_O) ../src/basemath/base5.c
bibli1$(_O): .headers  ../src/basemath/bibli1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o bibli1$(_O) ../src/basemath/bibli1.c
bibli2$(_O): .headers  ../src/basemath/bibli2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o bibli2$(_O) ../src/basemath/bibli2.c
buch1$(_O): .headers  ../src/basemath/buch1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o buch1$(_O) ../src/basemath/buch1.c
buch2$(_O): .headers  ../src/basemath/buch2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o buch2$(_O) ../src/basemath/buch2.c
buch3$(_O): .headers  ../src/basemath/buch3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o buch3$(_O) ../src/basemath/buch3.c
buch4$(_O): .headers  ../src/basemath/buch4.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o buch4$(_O) ../src/basemath/buch4.c
Flx$(_O): .headers  ../src/basemath/Flx.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o Flx$(_O) ../src/basemath/Flx.c
galconj$(_O): .headers  ../src/basemath/galconj.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o galconj$(_O) ../src/basemath/galconj.c
gen1$(_O): .headers  ../src/basemath/gen1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o gen1$(_O) ../src/basemath/gen1.c
gen2$(_O): .headers  ../src/basemath/gen2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o gen2$(_O) ../src/basemath/gen2.c
gen3$(_O): .headers  ../src/basemath/gen3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o gen3$(_O) ../src/basemath/gen3.c
ifactor1$(_O): .headers  ../src/basemath/ifactor1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o ifactor1$(_O) ../src/basemath/ifactor1.c
perm$(_O): .headers  ../src/basemath/perm.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o perm$(_O) ../src/basemath/perm.c
polarit1$(_O): .headers  ../src/basemath/polarit1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o polarit1$(_O) ../src/basemath/polarit1.c
polarit2$(_O): .headers  ../src/basemath/polarit2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o polarit2$(_O) ../src/basemath/polarit2.c
polarit3$(_O): .headers  ../src/basemath/polarit3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o polarit3$(_O) ../src/basemath/polarit3.c
Qfb$(_O): .headers  ../src/basemath/Qfb.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o Qfb$(_O) ../src/basemath/Qfb.c
RgX$(_O): .headers  ../src/basemath/RgX.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o RgX$(_O) ../src/basemath/RgX.c
rootpol$(_O): .headers  ../src/basemath/rootpol.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o rootpol$(_O) ../src/basemath/rootpol.c
subcyclo$(_O): .headers  ../src/basemath/subcyclo.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o subcyclo$(_O) ../src/basemath/subcyclo.c
subgroup$(_O): .headers  ../src/basemath/subgroup.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o subgroup$(_O) ../src/basemath/subgroup.c
trans1$(_O): .headers  ../src/basemath/trans1.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o trans1$(_O) ../src/basemath/trans1.c
trans2$(_O): .headers  ../src/basemath/trans2.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o trans2$(_O) ../src/basemath/trans2.c
trans3$(_O): .headers  ../src/basemath/trans3.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o trans3$(_O) ../src/basemath/trans3.c
aprcl$(_O): .headers  ../src/modules/aprcl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o aprcl$(_O) ../src/modules/aprcl.c
elldata$(_O): .headers  ../src/modules/elldata.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o elldata$(_O) ../src/modules/elldata.c
elliptic$(_O): .headers  ../src/modules/elliptic.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o elliptic$(_O) ../src/modules/elliptic.c
galois$(_O): .headers  ../src/modules/galois.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o galois$(_O) ../src/modules/galois.c
groupid$(_O): .headers  ../src/modules/groupid.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o groupid$(_O) ../src/modules/groupid.c
kummer$(_O): .headers  ../src/modules/kummer.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o kummer$(_O) ../src/modules/kummer.c
mpqs$(_O): .headers  ../src/modules/mpqs.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o mpqs$(_O) ../src/modules/mpqs.c
nffactor$(_O): .headers  ../src/modules/nffactor.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o nffactor$(_O) ../src/modules/nffactor.c
part$(_O): .headers  ../src/modules/part.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o part$(_O) ../src/modules/part.c
stark$(_O): .headers  ../src/modules/stark.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o stark$(_O) ../src/modules/stark.c
subfield$(_O): .headers  ../src/modules/subfield.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o subfield$(_O) ../src/modules/subfield.c
thue$(_O): .headers  ../src/modules/thue.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o thue$(_O) ../src/modules/thue.c
anal$(_O): .headers ../src/language/anal.h ../src/language/members.h ../src/language/anal.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o anal$(_O) ../src/language/anal.c
compat$(_O): .headers  ../src/language/compat.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o compat$(_O) ../src/language/compat.c
default$(_O): .headers ../src/language/anal.h ./paricfg.h ../src/language/default.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o default$(_O) ../src/language/default.c
errmsg$(_O): .headers  ../src/language/errmsg.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o errmsg$(_O) ../src/language/errmsg.c
es$(_O): .headers ../src/language/anal.h ../src/language/es.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o es$(_O) ../src/language/es.c
init$(_O): .headers ../src/language/anal.h ../src/language/init.h ../src/language/init.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o init$(_O) ../src/language/init.c
intnum$(_O): .headers  ../src/language/intnum.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o intnum$(_O) ../src/language/intnum.c
members$(_O): .headers  ../src/language/members.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o members$(_O) ../src/language/members.c
sumiter$(_O): .headers ../src/language/anal.h ../src/language/sumiter.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(DLCFLAGS) -o sumiter$(_O) ../src/language/sumiter.c
gp$(_O): .headers ../src/language/anal.h ../src/gp/gp.h ./paricfg.h ../src/gp/gp.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/language $(RLINCLUDE) -o gp$(_O) ../src/gp/gp.c
gp_init$(_O): .headers ../src/graph/rect.h ../src/gp/gp_init.h ../src/gp/gp_init.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/graph -o gp_init$(_O) ../src/gp/gp_init.c
gp_rl$(_O): .headers ../src/language/anal.h ../src/gp/gp.h ./paricfg.h ../src/gp/gp_rl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/language $(RLINCLUDE) -o gp_rl$(_O) ../src/gp/gp_rl.c
highlvl$(_O): .headers ../src/gp/highlvl.h ../src/gp/highlvl.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -DDL_DFLT_NAME=$(DL_DFLT_NAME) -o highlvl$(_O) ../src/gp/highlvl.c
whatnow$(_O): .headers  ../src/gp/whatnow.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o whatnow$(_O) ../src/gp/whatnow.c
plotport$(_O): .headers ../src/graph/rect.h ../src/graph/plotport.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -I../src/graph -o plotport$(_O) ../src/graph/plotport.c
plotnull$(_O): .headers ../src/graph/rect.h ../src/graph/plotnull.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(PLOTCFLAGS) -o plotnull$(_O) ../src/graph/plotnull.c
.PHONY: gp dft clean
