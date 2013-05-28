# Makefile for Pari/GP -- i686 running linux (ix86 kernel) 32-bit version
#
#  This file was created by Configure. Any change made to it will be
#  lost when Configure is run.
#
TOPDIR="/var/www/michel/perlScripts/pari-2.5.4"

SHELL      = /bin/sh
PERL       = /usr/bin/perl
BISON      = bison
AR	   = ar

SIZEOF_LONG= 4

CC_FLAVOR  =
CC         = /usr/bin/gcc $(CC_FLAVOR)
CPPFLAGS   = -I. -I../src/headers
CFLAGS     = -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer   
DLCFLAGS   = -fPIC
KERNELCFLAGS  = -funroll-loops
LD_FLAVOR  = $(CC_FLAVOR)
LD         = /usr/bin/gcc $(LD_FLAVOR)
LDFLAGS    = -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer    -Wl,--export-dynamic 
DLLD_FLAVOR  = $(LD_FLAVOR)
DLLD       = /usr/bin/gcc $(DLLD_FLAVOR)
DLLDFLAGS  = -shared  $(CFLAGS) $(DLCFLAGS) -Wl,-shared,-soname=$(LIBPARI_SONAME) 
EXTRADLLDFLAGS = -lc ${LIBS}
RUNTEST    = 

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
LIBPARI_DYN   = $(SOLIBPARI).2.5.4
LIBPARI_SONAME= $(SOLIBPARI).3
DL_DFLT_NAME = NULL

LD_INSTALL_NAME  = 

EXPORT_FILE   = 
EXPORT_CREATE = 
EXPORT_LIB    = 
EXPORT_LIB_CREATE = 
DLLD_IGNORE   = 
DLLTOOL = 

RUNPTH       = -Wl,-rpath,$(TOPDIR)/Olinux-i686:"/usr/local/lib":/usr/lib
RUNPTH_FINAL = -Wl,-rpath,"/usr/local/lib":/usr/lib
LDDYN        = -lpari
LIBS         = -lm
GMPLIBS      = 
DL_LIBS      = -ldl
STA_LIBS     = $(GMPLIBS) $(LIBS)

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

TOPLDDYN   = "/var/www/michel/perlScripts/pari-2.5.4/Olinux-i686"
# Description system
DESC          = pari.desc
DESC_HELP_GEN = ../src/desc/gen_proto ../src/desc/PARI/822.pm
TMPSUF        = linux-i686.tmp

DOTEST=env "RUNTEST=$(RUNTEST)" "LD_LIBRARY_PATH=.:$$LD_LIBRARY_PATH" $(SHELL) ../src/test/dotest 32

OBJS   =  mp$(_O) mpinl$(_O) alglin1$(_O) alglin2$(_O) arith1$(_O) arith2$(_O) base1$(_O) base2$(_O) base3$(_O) base4$(_O) base5$(_O) bb_group$(_O) bibli1$(_O) bibli2$(_O) bit$(_O) buch1$(_O) buch2$(_O) buch3$(_O) buch4$(_O) concat$(_O) ellanal$(_O) elliptic$(_O) F2x$(_O) FF$(_O) Flx$(_O) FpE$(_O) FpV$(_O) FpX$(_O) galconj$(_O) gen1$(_O) gen2$(_O) gen3$(_O) Hensel$(_O) hnf_snf$(_O) ifactor1$(_O) lll$(_O) nffactor$(_O) perm$(_O) polarit1$(_O) polarit2$(_O) polarit3$(_O) prime$(_O) Qfb$(_O) QX_factor$(_O) random$(_O) RgV$(_O) RgX$(_O) rootpol$(_O) subcyclo$(_O) subgroup$(_O) trans1$(_O) trans2$(_O) trans3$(_O) ZV$(_O) ZX$(_O) anal$(_O) compat$(_O) compile$(_O) default$(_O) errmsg$(_O) es$(_O) eval$(_O) hash$(_O) init$(_O) intnum$(_O) members$(_O) paricfg$(_O) pariinl$(_O) parse$(_O) sumiter$(_O) aprcl$(_O) DedekZeta$(_O) elldata$(_O) ellsea$(_O) galois$(_O) galpol$(_O) groupid$(_O) krasner$(_O) kummer$(_O) mpqs$(_O) part$(_O) stark$(_O) subfield$(_O) thue$(_O)
OBJSGP =  gp$(_O) gp_init$(_O) gp_rl$(_O) highlvl$(_O) whatnow$(_O) plotport$(_O) plotnull$(_O)

.PHONY: gp dft clean

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
	$(CC) -c -I../src/language $(CPPFLAGS) $(CFLAGS) -o $@ ../src/test/kerntest.c

dummy$(_O): ../src/test/dummy.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -o $@ ../src/test/dummy.c

kerntest:  mp$(_O) mpinl$(_O) dummy$(_O) kerntest$(_O)
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@  mp$(_O) mpinl$(_O) dummy$(_O) kerntest$(_O) $(STA_LIBS)

mpinl$(_O): .headers parilvl0.h parilvl1.h ../src/kernel/none/mpinl.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $(DLCFLAGS) -o mpinl$(_O) ../src/kernel/none/mpinl.c

test-kernel:: kerntest
	@./kerntest > gp.out;	diff -c gp.out ../src/test/32/kernel > kern.dif;	if test -s kern.dif; then echo "KERNEL BUG"; else echo OK; fi

tune.o: ../src/test/tune.c
	$(CC) $(GMPFLAGS) $(CPPFLAGS) $(CFLAGS) -o $@ $< -c

tune: mpinl.h tune-sta
	-$(RM) tune ../tune
	-$(LN) tune-sta tune
	-$(LN) Olinux-i686/tune ../tune

tune-dyn: tune.o $(LIBPARI_DYN)
	$(LD) -L. $(LDFLAGS) $(RUNPTH) -o $@ $< $(GMPOBJS) $(LDDYN) $(STA_LIBS)
tune-sta: tune.o $(LIBPARI_STA)
	$(LD) $(LDFLAGS) $(RUNPTH) -o $@ $< $(GMPOBJS) ./$(LIBPARI_STA) $(STA_LIBS)

gp-sta: ../src/funclist $(OBJS) $(OBJSGP)
	$(RM) $@
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(OBJSGP) $(RUNPTH) $(RLLIBS) $(PLOTLIBS) $(DL_LIBS) $(STA_LIBS)
	@:  gp-sta

cleantest:
	$(RM) *.dif gp.out pari.ps
cleanobj:
	-$(RM) *$(_O) mp.c *.s mpinl.h parilvl0.h parilvl1.h libpari* gp-sta gp-dyn kerntest
cleandesc:
	-$(RM) ../src/desc/$(DESC) *$(TMPSUF)
cleantune:
	-$(RM) tune tune-sta tune.o

cleanall: cleanobj cleantune cleantest cleandesc

clean: cleanall


# sleep 3 to avoid problems with NFS and slightly out of synch
# fileserver/host. We are recompiling everything anyway.
.headers: mpinl.h ../src/headers/paricast.h ../src/headers/paricom.h ../src/headers/parierr.h ../src/headers/parigen.h ../src/headers/pari.h ../src/headers/pariinl.h ../src/headers/parinf.h ../src/headers/pariold.h ../src/headers/paristio.h ../src/headers/parisys.h ../src/headers/paritune.h
	@sleep 3; touch $@

install: install-lib-dyn install-include install-bin install-man install-misc install-doc install-examples install-cfg install-data

install-include:
	-mkdir -p $(INCLUDEDIR)/pari
	-for i in paricfg.h mpinl.h; do \
	  $(INSTALL_DATA) $$i $(INCLUDEDIR)/pari; done
	-for i in paridecl paripriv paricast paricom parierr parigen pari pariinl parinf pariold paristio parisys paritune ; do \
	   $(INSTALL_DATA) ../src/headers/$$i.h  $(INCLUDEDIR)/pari; done
	-$(RM) $(INCLUDEDIR)/pari/genpari.h
	-$(LN) pari.h $(INCLUDEDIR)/pari/genpari.h

install-bin: install-bin-dyn

install-bin-dyn: gp-dyn install-lib-dyn
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.5 $(BINDIR)/gp
	$(LD) -o $(BINDIR)/gp-2.5 -L$(LIBDIR) $(LDFLAGS) $(OBJSGP) $(RUNPTH_FINAL) $(LDDYN) $(RLLIBS) $(PLOTLIBS) $(LIBS) $(DL_LIBS)
	-$(STRIP) $(STRIPFLAGS) $(BINDIR)/gp-2.5
	@:  $(BINDIR)/gp-2.5
	-$(LN) gp-2.5 $(BINDIR)/gp

install-bin-sta: gp-sta
	-mkdir -p $(BINDIR)
	-$(RM) $(BINDIR)/gp-2.5 $(BINDIR)/gp
	$(INSTALL_PROGRAM) gp-sta $(BINDIR)/gp-2.5
	-$(LN) gp-2.5 $(BINDIR)/gp
# Can't strip it if we want install() to work on OSF.
#	-$(STRIP) $(STRIPFLAGS)  $(BINDIR)/gp-2.5
	@:  $(BINDIR)/gp-2.5

install-man::
	-mkdir -p $(MANDIR)
	-$(RM) $(MANDIR)/pari.1 $(MANDIR)/gp.1 $(MANDIR)/gp-2.5.1
	$(INSTALL_DATA) ../doc/gphelp.1 $(MANDIR)
	$(INSTALL_DATA) ../doc/gp.1 $(MANDIR)/gp-2.5.1
	-$(LN) gp.1 $(MANDIR)/pari.1
	-$(LN) gp-2.5.1 $(MANDIR)/gp.1

install-misc:
	-mkdir -p $(MISCDIR) $(BINDIR)
	$(INSTALL_PROGRAM) ../misc/tex2mail $(BINDIR)
	$(INSTALL_DATA) ../doc/tex2mail.1 $(MANDIR)
	$(INSTALL_DATA) ../misc/README    $(MISCDIR)
	$(INSTALL_DATA) ../misc/color.dft $(MISCDIR)
	$(INSTALL_DATA) ../misc/gpalias   $(MISCDIR)
	$(INSTALL_PROGRAM) ../misc/gpflog $(MISCDIR)
	$(INSTALL_DATA) ../misc/gprc.dft  $(MISCDIR)
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
	-$(INSTALL_DATA) ../doc/appd.tex     $(DOCDIR)
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

install-docpdf::
	-mkdir -p $(BINDIR) $(DOCDIR)
	-cd ../doc; $(MAKE) docpdf
	-$(INSTALL_DATA) ../doc/libpari.pdf  $(DOCDIR)
	-$(INSTALL_DATA) ../doc/users.pdf    $(DOCDIR)
	-$(INSTALL_DATA) ../doc/tutorial.pdf $(DOCDIR)
	-$(INSTALL_DATA) ../doc/refcard.pdf  $(DOCDIR)

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
	$(DLLD_IGNORE)$(DLLD) -o $(LIBDIR)/$(LIBPARI_DYN) $(DLLDFLAGS) $(OBJS) $(EXTRADLLDFLAGS) $(GMPLIBS) $(EXPORT_FILE) $(LD_INSTALL_NAME)
install-lib-dyn-link: install-lib-dyn-base
	-if test "$(LIBPARI_SONAME)" != "$(LIBPARI_SO)"; then 	  $(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SONAME);	  $(LN) $(LIBPARI_DYN) $(LIBDIR)/$(LIBPARI_SO); fi
install-lib-dyn: $(LIBPARI_DYN) install-lib-dyn-link

mpinl.h: parilvl0.h parilvl1.h
	cat parilvl0.h parilvl1.h > mpinl.h

bench: gp-sta gp-dyn
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200
dobench::
	@$(DOTEST)   objets  analyz  number  polyser  linear  elliptic  sumiter  graph  program  trans  nfields_200
test-all: gp-sta gp-dyn
	@$(DOTEST) addprimes analyz apply arith aurifeuille bezout bnfisintnorm bnr charpoly combinat compat contfrac cxtrigo debugger det diffop ell ellglobalred elliptic ellsea ellweilpairing err exact0 extract factorint ff ffisom galois galoisinit graph ideal idealappr idealramgroups intformal intnum ispower krasner linear list lll mat matsnf member minim modpr multivar-mul nf nffactor nfhilbert nfields nfrootsof1 number objets padic partition polchebyshev polmod polred polyser printf program qf qfbsolve quad quadclassunit quadray random resultant rfrac rnf rnfkummer round4 select stark subcyclo subfields subst sumiter thue trans zetak zn
dotest-all::
	@$(DOTEST) addprimes analyz apply arith aurifeuille bezout bnfisintnorm bnr charpoly combinat compat contfrac cxtrigo debugger det diffop ell ellglobalred elliptic ellsea ellweilpairing err exact0 extract factorint ff ffisom galois galoisinit graph ideal idealappr idealramgroups intformal intnum ispower krasner linear list lll mat matsnf member minim modpr multivar-mul nf nffactor nfhilbert nfields nfrootsof1 number objets padic partition polchebyshev polmod polred polyser printf program qf qfbsolve quad quadclassunit quadray random resultant rfrac rnf rnfkummer round4 select stark subcyclo subfields subst sumiter thue trans zetak zn
dyntest-all: gp-dyn
	@env dotestSUF=dyn make test-all
statest-all: gp-sta
	@env dotestSUF=sta make test-all
test-addprimes: gp-sta gp-dyn
	@$(DOTEST) addprimes
dotest-addprimes::
	@$(DOTEST) addprimes
test-analyz: gp-sta gp-dyn
	@$(DOTEST) analyz
dotest-analyz::
	@$(DOTEST) analyz
test-apply: gp-sta gp-dyn
	@$(DOTEST) apply
dotest-apply::
	@$(DOTEST) apply
test-arith: gp-sta gp-dyn
	@$(DOTEST) arith
dotest-arith::
	@$(DOTEST) arith
test-aurifeuille: gp-sta gp-dyn
	@$(DOTEST) aurifeuille
dotest-aurifeuille::
	@$(DOTEST) aurifeuille
test-bezout: gp-sta gp-dyn
	@$(DOTEST) bezout
dotest-bezout::
	@$(DOTEST) bezout
test-bnfisintnorm: gp-sta gp-dyn
	@$(DOTEST) bnfisintnorm
dotest-bnfisintnorm::
	@$(DOTEST) bnfisintnorm
test-bnr: gp-sta gp-dyn
	@$(DOTEST) bnr
dotest-bnr::
	@$(DOTEST) bnr
test-charpoly: gp-sta gp-dyn
	@$(DOTEST) charpoly
dotest-charpoly::
	@$(DOTEST) charpoly
test-combinat: gp-sta gp-dyn
	@$(DOTEST) combinat
dotest-combinat::
	@$(DOTEST) combinat
test-compat: gp-sta gp-dyn
	@$(DOTEST) compat
dotest-compat::
	@$(DOTEST) compat
test-contfrac: gp-sta gp-dyn
	@$(DOTEST) contfrac
dotest-contfrac::
	@$(DOTEST) contfrac
test-cxtrigo: gp-sta gp-dyn
	@$(DOTEST) cxtrigo
dotest-cxtrigo::
	@$(DOTEST) cxtrigo
test-debugger: gp-sta gp-dyn
	@$(DOTEST) debugger
dotest-debugger::
	@$(DOTEST) debugger
test-det: gp-sta gp-dyn
	@$(DOTEST) det
dotest-det::
	@$(DOTEST) det
test-diffop: gp-sta gp-dyn
	@$(DOTEST) diffop
dotest-diffop::
	@$(DOTEST) diffop
test-ell: gp-sta gp-dyn
	@$(DOTEST) ell
dotest-ell::
	@$(DOTEST) ell
test-ellglobalred: gp-sta gp-dyn
	@$(DOTEST) ellglobalred
dotest-ellglobalred::
	@$(DOTEST) ellglobalred
test-elliptic: gp-sta gp-dyn
	@$(DOTEST) elliptic
dotest-elliptic::
	@$(DOTEST) elliptic
test-ellsea: gp-sta gp-dyn
	@$(DOTEST) ellsea
dotest-ellsea::
	@$(DOTEST) ellsea
test-ellweilpairing: gp-sta gp-dyn
	@$(DOTEST) ellweilpairing
dotest-ellweilpairing::
	@$(DOTEST) ellweilpairing
test-err: gp-sta gp-dyn
	@$(DOTEST) err
dotest-err::
	@$(DOTEST) err
test-exact0: gp-sta gp-dyn
	@$(DOTEST) exact0
dotest-exact0::
	@$(DOTEST) exact0
test-extract: gp-sta gp-dyn
	@$(DOTEST) extract
dotest-extract::
	@$(DOTEST) extract
test-factorint: gp-sta gp-dyn
	@$(DOTEST) factorint
dotest-factorint::
	@$(DOTEST) factorint
test-ff: gp-sta gp-dyn
	@$(DOTEST) ff
dotest-ff::
	@$(DOTEST) ff
test-ffisom: gp-sta gp-dyn
	@$(DOTEST) ffisom
dotest-ffisom::
	@$(DOTEST) ffisom
test-galois: gp-sta gp-dyn
	@$(DOTEST) galois
dotest-galois::
	@$(DOTEST) galois
test-galoisinit: gp-sta gp-dyn
	@$(DOTEST) galoisinit
dotest-galoisinit::
	@$(DOTEST) galoisinit
test-graph: gp-sta gp-dyn
	@$(DOTEST) graph
dotest-graph::
	@$(DOTEST) graph
test-ideal: gp-sta gp-dyn
	@$(DOTEST) ideal
dotest-ideal::
	@$(DOTEST) ideal
test-idealappr: gp-sta gp-dyn
	@$(DOTEST) idealappr
dotest-idealappr::
	@$(DOTEST) idealappr
test-idealramgroups: gp-sta gp-dyn
	@$(DOTEST) idealramgroups
dotest-idealramgroups::
	@$(DOTEST) idealramgroups
test-intformal: gp-sta gp-dyn
	@$(DOTEST) intformal
dotest-intformal::
	@$(DOTEST) intformal
test-intnum: gp-sta gp-dyn
	@$(DOTEST) intnum
dotest-intnum::
	@$(DOTEST) intnum
test-ispower: gp-sta gp-dyn
	@$(DOTEST) ispower
dotest-ispower::
	@$(DOTEST) ispower
test-krasner: gp-sta gp-dyn
	@$(DOTEST) krasner
dotest-krasner::
	@$(DOTEST) krasner
test-linear: gp-sta gp-dyn
	@$(DOTEST) linear
dotest-linear::
	@$(DOTEST) linear
test-list: gp-sta gp-dyn
	@$(DOTEST) list
dotest-list::
	@$(DOTEST) list
test-lll: gp-sta gp-dyn
	@$(DOTEST) lll
dotest-lll::
	@$(DOTEST) lll
test-mat: gp-sta gp-dyn
	@$(DOTEST) mat
dotest-mat::
	@$(DOTEST) mat
test-matsnf: gp-sta gp-dyn
	@$(DOTEST) matsnf
dotest-matsnf::
	@$(DOTEST) matsnf
test-member: gp-sta gp-dyn
	@$(DOTEST) member
dotest-member::
	@$(DOTEST) member
test-minim: gp-sta gp-dyn
	@$(DOTEST) minim
dotest-minim::
	@$(DOTEST) minim
test-modpr: gp-sta gp-dyn
	@$(DOTEST) modpr
dotest-modpr::
	@$(DOTEST) modpr
test-multivar-mul: gp-sta gp-dyn
	@$(DOTEST) multivar-mul
dotest-multivar-mul::
	@$(DOTEST) multivar-mul
test-nf: gp-sta gp-dyn
	@$(DOTEST) nf
dotest-nf::
	@$(DOTEST) nf
test-nffactor: gp-sta gp-dyn
	@$(DOTEST) nffactor
dotest-nffactor::
	@$(DOTEST) nffactor
test-nfhilbert: gp-sta gp-dyn
	@$(DOTEST) nfhilbert
dotest-nfhilbert::
	@$(DOTEST) nfhilbert
test-nfields: gp-sta gp-dyn
	@$(DOTEST) nfields
dotest-nfields::
	@$(DOTEST) nfields
test-nfrootsof1: gp-sta gp-dyn
	@$(DOTEST) nfrootsof1
dotest-nfrootsof1::
	@$(DOTEST) nfrootsof1
test-number: gp-sta gp-dyn
	@$(DOTEST) number
dotest-number::
	@$(DOTEST) number
test-objets: gp-sta gp-dyn
	@$(DOTEST) objets
dotest-objets::
	@$(DOTEST) objets
test-padic: gp-sta gp-dyn
	@$(DOTEST) padic
dotest-padic::
	@$(DOTEST) padic
test-partition: gp-sta gp-dyn
	@$(DOTEST) partition
dotest-partition::
	@$(DOTEST) partition
test-polchebyshev: gp-sta gp-dyn
	@$(DOTEST) polchebyshev
dotest-polchebyshev::
	@$(DOTEST) polchebyshev
test-polmod: gp-sta gp-dyn
	@$(DOTEST) polmod
dotest-polmod::
	@$(DOTEST) polmod
test-polred: gp-sta gp-dyn
	@$(DOTEST) polred
dotest-polred::
	@$(DOTEST) polred
test-polyser: gp-sta gp-dyn
	@$(DOTEST) polyser
dotest-polyser::
	@$(DOTEST) polyser
test-printf: gp-sta gp-dyn
	@$(DOTEST) printf
dotest-printf::
	@$(DOTEST) printf
test-program: gp-sta gp-dyn
	@$(DOTEST) program
dotest-program::
	@$(DOTEST) program
test-qf: gp-sta gp-dyn
	@$(DOTEST) qf
dotest-qf::
	@$(DOTEST) qf
test-qfbsolve: gp-sta gp-dyn
	@$(DOTEST) qfbsolve
dotest-qfbsolve::
	@$(DOTEST) qfbsolve
test-quad: gp-sta gp-dyn
	@$(DOTEST) quad
dotest-quad::
	@$(DOTEST) quad
test-quadclassunit: gp-sta gp-dyn
	@$(DOTEST) quadclassunit
dotest-quadclassunit::
	@$(DOTEST) quadclassunit
test-quadray: gp-sta gp-dyn
	@$(DOTEST) quadray
dotest-quadray::
	@$(DOTEST) quadray
test-random: gp-sta gp-dyn
	@$(DOTEST) random
dotest-random::
	@$(DOTEST) random
test-resultant: gp-sta gp-dyn
	@$(DOTEST) resultant
dotest-resultant::
	@$(DOTEST) resultant
test-rfrac: gp-sta gp-dyn
	@$(DOTEST) rfrac
dotest-rfrac::
	@$(DOTEST) rfrac
test-rnf: gp-sta gp-dyn
	@$(DOTEST) rnf
dotest-rnf::
	@$(DOTEST) rnf
test-rnfkummer: gp-sta gp-dyn
	@$(DOTEST) rnfkummer
dotest-rnfkummer::
	@$(DOTEST) rnfkummer
test-round4: gp-sta gp-dyn
	@$(DOTEST) round4
dotest-round4::
	@$(DOTEST) round4
test-select: gp-sta gp-dyn
	@$(DOTEST) select
dotest-select::
	@$(DOTEST) select
test-stark: gp-sta gp-dyn
	@$(DOTEST) stark
dotest-stark::
	@$(DOTEST) stark
test-subcyclo: gp-sta gp-dyn
	@$(DOTEST) subcyclo
dotest-subcyclo::
	@$(DOTEST) subcyclo
test-subfields: gp-sta gp-dyn
	@$(DOTEST) subfields
dotest-subfields::
	@$(DOTEST) subfields
test-subst: gp-sta gp-dyn
	@$(DOTEST) subst
dotest-subst::
	@$(DOTEST) subst
test-sumiter: gp-sta gp-dyn
	@$(DOTEST) sumiter
dotest-sumiter::
	@$(DOTEST) sumiter
test-thue: gp-sta gp-dyn
	@$(DOTEST) thue
dotest-thue::
	@$(DOTEST) thue
test-trans: gp-sta gp-dyn
	@$(DOTEST) trans
dotest-trans::
	@$(DOTEST) trans
test-zetak: gp-sta gp-dyn
	@$(DOTEST) zetak
dotest-zetak::
	@$(DOTEST) zetak
test-zn: gp-sta gp-dyn
	@$(DOTEST) zn
dotest-zn::
	@$(DOTEST) zn
test-ploth: gp-sta gp-dyn
	@$(DOTEST) ploth
dotest-ploth::
	@$(DOTEST) ploth

gp-dyn: ../src/funclist $(OBJSGP) $(LIBPARI_DYN) $(EXPORT_LIB)
	$(RM) $@
	$(LD) -o $@ -L$(TOPLDDYN) $(LDFLAGS) $(OBJSGP) $(RUNPTH) $(RLLIBS) $(LDDYN) $(PLOTLIBS) $(LIBS) $(DL_LIBS)
	@:  gp-dyn

$(LIBPARI_DYN): ../src/funclist $(OBJS) $(EXPORT_FILE)
	-$(RM) $(LIBPARI_DYN)
	$(DLLD_IGNORE)$(DLLD) -o $(TOPLDDYN)/$(LIBPARI_DYN) $(DLLDFLAGS) $(OBJS) $(EXTRADLLDFLAGS) $(GMPLIBS) $(EXPORT_FILE)
	-if test "$(LIBPARI_DYN)" != "$(LIBPARI_SO)"; then 	  $(RM) $(LIBPARI_SO);	  $(LN) $(LIBPARI_DYN) $(LIBPARI_SO); fi
	-if test "$(LIBPARI_DYN)" != "$(LIBPARI_SONAME)"; then 	  $(RM) $(LIBPARI_SONAME);	  $(LN) $(LIBPARI_DYN) $(LIBPARI_SONAME); fi
../src/language/parse.h: ../src/language/parse.y
	$(BISON) -d ../src/language/parse.y -o ../src/language/parse.c
../src/language/parse.c: ../src/language/parse.h
	@:

../src/funclist::
	@-../config/genfunclist ../src/desc
../src/desc/$(DESC): ../src/funclist ../src/desc/merge_822 ../src/desc/PARI/822.pm
	f=funclist-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) merge_822 ../funclist > $$f) && mv ../src/desc/$$f $@
../src/gp/whatnow.h: ../src/desc/whatnow ../src/whatnow
	f=whatnow-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) whatnow > $$f) && mv ../src/desc/$$f $@
../src/language/init.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	f=init-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) gen_proto basic $(DESC) > $$f) && mv ../src/desc/$$f $@
../src/language/default.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	f=default-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) gen_proto default $(DESC) > $$f) && mv ../src/desc/$$f $@
../src/gp/gp_default.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	f=gp_default-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) gen_proto gp_default $(DESC) > $$f) && mv ../src/desc/$$f $@
../src/gp/gp_init.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	f=gp_init-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) gen_proto gp $(DESC) > $$f) && mv ../src/desc/$$f $@
../src/gp/highlvl.h: ../src/desc/$(DESC) $(DESC_HELP_GEN)
	f=highlvl-$$$$-$(TMPSUF); (cd ../src/desc && $(PERL) gen_proto highlevel $(DESC) > $$f) && mv ../src/desc/$$f $@
L0MODS=../src/kernel/ix86/asm0.h ../src/kernel/none/addll.h ../src/kernel/none/mulll.h ../src/kernel/none/bfffo.h ../src/kernel/none/divll.h
parilvl0.h: $(L0MODS)
	../config/genkernel ../src/kernel/ix86/asm0.h > parilvl0.h
L1OBJS=../src/kernel/none/int.h ../src/kernel/none/level1.h
parilvl1.h: $(L1OBJS) ../src/headers/paritune.h
	if test -r ./tune.h; then d=.; else d=../src/kernel/none; fi;          cat $$d/tune.h $(L1OBJS) > parilvl1.h
MP_C=../src/kernel/none/mp.c ../src/kernel/none/cmp.c ../src/kernel/none/gcdll.c ../src/kernel/none/ratlift.c  ../src/kernel/none/invmod.c ../src/kernel/none/gcd.c ../src/kernel/none/gcdext.c ../src/kernel/none/mp_indep.c ../src/kernel/none/add.c
mp.c: $(MP_C)
	cat $(MP_C) > mp.c
mp$(_O): .headers mp.c
	$(CC) -c $(CFLAGS) $(KERNELCFLAGS) $(DLCFLAGS) $(CPPFLAGS) -o mp$(_O) mp.c

alglin1$(_O): .headers  ../src/basemath/alglin1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o alglin1$(_O) ../src/basemath/alglin1.c
alglin2$(_O): .headers  ../src/basemath/alglin2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o alglin2$(_O) ../src/basemath/alglin2.c
arith1$(_O): .headers  ../src/basemath/arith1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o arith1$(_O) ../src/basemath/arith1.c
arith2$(_O): .headers  ../src/basemath/arith2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o arith2$(_O) ../src/basemath/arith2.c
base1$(_O): .headers  ../src/basemath/base1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o base1$(_O) ../src/basemath/base1.c
base2$(_O): .headers  ../src/basemath/base2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o base2$(_O) ../src/basemath/base2.c
base3$(_O): .headers  ../src/basemath/base3.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o base3$(_O) ../src/basemath/base3.c
base4$(_O): .headers  ../src/basemath/base4.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o base4$(_O) ../src/basemath/base4.c
base5$(_O): .headers  ../src/basemath/base5.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o base5$(_O) ../src/basemath/base5.c
bb_group$(_O): .headers  ../src/basemath/bb_group.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o bb_group$(_O) ../src/basemath/bb_group.c
bibli1$(_O): .headers  ../src/basemath/bibli1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o bibli1$(_O) ../src/basemath/bibli1.c
bibli2$(_O): .headers  ../src/basemath/bibli2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o bibli2$(_O) ../src/basemath/bibli2.c
bit$(_O): .headers  ../src/basemath/bit.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o bit$(_O) ../src/basemath/bit.c
buch1$(_O): .headers  ../src/basemath/buch1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o buch1$(_O) ../src/basemath/buch1.c
buch2$(_O): .headers  ../src/basemath/buch2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o buch2$(_O) ../src/basemath/buch2.c
buch3$(_O): .headers  ../src/basemath/buch3.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o buch3$(_O) ../src/basemath/buch3.c
buch4$(_O): .headers  ../src/basemath/buch4.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o buch4$(_O) ../src/basemath/buch4.c
concat$(_O): .headers  ../src/basemath/concat.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o concat$(_O) ../src/basemath/concat.c
ellanal$(_O): .headers  ../src/basemath/ellanal.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o ellanal$(_O) ../src/basemath/ellanal.c
elliptic$(_O): .headers  ../src/basemath/elliptic.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o elliptic$(_O) ../src/basemath/elliptic.c
F2x$(_O): .headers  ../src/basemath/F2x.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o F2x$(_O) ../src/basemath/F2x.c
FF$(_O): .headers  ../src/basemath/FF.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o FF$(_O) ../src/basemath/FF.c
Flx$(_O): .headers  ../src/basemath/Flx.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o Flx$(_O) ../src/basemath/Flx.c
FpE$(_O): .headers  ../src/basemath/FpE.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o FpE$(_O) ../src/basemath/FpE.c
FpV$(_O): .headers  ../src/basemath/FpV.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o FpV$(_O) ../src/basemath/FpV.c
FpX$(_O): .headers  ../src/basemath/FpX.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o FpX$(_O) ../src/basemath/FpX.c
galconj$(_O): .headers  ../src/basemath/galconj.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o galconj$(_O) ../src/basemath/galconj.c
gen1$(_O): .headers  ../src/basemath/gen1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o gen1$(_O) ../src/basemath/gen1.c
gen2$(_O): .headers  ../src/basemath/gen2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o gen2$(_O) ../src/basemath/gen2.c
gen3$(_O): .headers  ../src/basemath/gen3.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o gen3$(_O) ../src/basemath/gen3.c
Hensel$(_O): .headers  ../src/basemath/Hensel.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o Hensel$(_O) ../src/basemath/Hensel.c
hnf_snf$(_O): .headers  ../src/basemath/hnf_snf.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o hnf_snf$(_O) ../src/basemath/hnf_snf.c
ifactor1$(_O): .headers  ../src/basemath/ifactor1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o ifactor1$(_O) ../src/basemath/ifactor1.c
lll$(_O): .headers  ../src/basemath/lll.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o lll$(_O) ../src/basemath/lll.c
nffactor$(_O): .headers  ../src/basemath/nffactor.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o nffactor$(_O) ../src/basemath/nffactor.c
perm$(_O): .headers  ../src/basemath/perm.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o perm$(_O) ../src/basemath/perm.c
polarit1$(_O): .headers  ../src/basemath/polarit1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o polarit1$(_O) ../src/basemath/polarit1.c
polarit2$(_O): .headers  ../src/basemath/polarit2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o polarit2$(_O) ../src/basemath/polarit2.c
polarit3$(_O): .headers  ../src/basemath/polarit3.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o polarit3$(_O) ../src/basemath/polarit3.c
prime$(_O): .headers  ../src/basemath/prime.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o prime$(_O) ../src/basemath/prime.c
Qfb$(_O): .headers  ../src/basemath/Qfb.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o Qfb$(_O) ../src/basemath/Qfb.c
QX_factor$(_O): .headers  ../src/basemath/QX_factor.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o QX_factor$(_O) ../src/basemath/QX_factor.c
random$(_O): .headers  ../src/basemath/random.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o random$(_O) ../src/basemath/random.c
RgV$(_O): .headers  ../src/basemath/RgV.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o RgV$(_O) ../src/basemath/RgV.c
RgX$(_O): .headers  ../src/basemath/RgX.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o RgX$(_O) ../src/basemath/RgX.c
rootpol$(_O): .headers  ../src/basemath/rootpol.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o rootpol$(_O) ../src/basemath/rootpol.c
subcyclo$(_O): .headers  ../src/basemath/subcyclo.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o subcyclo$(_O) ../src/basemath/subcyclo.c
subgroup$(_O): .headers  ../src/basemath/subgroup.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o subgroup$(_O) ../src/basemath/subgroup.c
trans1$(_O): .headers  ../src/basemath/trans1.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o trans1$(_O) ../src/basemath/trans1.c
trans2$(_O): .headers  ../src/basemath/trans2.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o trans2$(_O) ../src/basemath/trans2.c
trans3$(_O): .headers  ../src/basemath/trans3.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o trans3$(_O) ../src/basemath/trans3.c
ZV$(_O): .headers  ../src/basemath/ZV.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o ZV$(_O) ../src/basemath/ZV.c
ZX$(_O): .headers  ../src/basemath/ZX.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o ZX$(_O) ../src/basemath/ZX.c
aprcl$(_O): .headers  ../src/modules/aprcl.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o aprcl$(_O) ../src/modules/aprcl.c
DedekZeta$(_O): .headers  ../src/modules/DedekZeta.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o DedekZeta$(_O) ../src/modules/DedekZeta.c
elldata$(_O): .headers  ../src/modules/elldata.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o elldata$(_O) ../src/modules/elldata.c
ellsea$(_O): .headers  ../src/modules/ellsea.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o ellsea$(_O) ../src/modules/ellsea.c
galois$(_O): .headers  ../src/modules/galois.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o galois$(_O) ../src/modules/galois.c
galpol$(_O): .headers  ../src/modules/galpol.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o galpol$(_O) ../src/modules/galpol.c
groupid$(_O): .headers  ../src/modules/groupid.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o groupid$(_O) ../src/modules/groupid.c
krasner$(_O): .headers  ../src/modules/krasner.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o krasner$(_O) ../src/modules/krasner.c
kummer$(_O): .headers  ../src/modules/kummer.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o kummer$(_O) ../src/modules/kummer.c
mpqs$(_O): .headers  ../src/modules/mpqs.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o mpqs$(_O) ../src/modules/mpqs.c
part$(_O): .headers  ../src/modules/part.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o part$(_O) ../src/modules/part.c
stark$(_O): .headers  ../src/modules/stark.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o stark$(_O) ../src/modules/stark.c
subfield$(_O): .headers  ../src/modules/subfield.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o subfield$(_O) ../src/modules/subfield.c
thue$(_O): .headers  ../src/modules/thue.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o thue$(_O) ../src/modules/thue.c
anal$(_O): .headers ../src/language/anal.h ../src/language/parse.h ../src/language/anal.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o anal$(_O) ../src/language/anal.c
compat$(_O): .headers  ../src/language/compat.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o compat$(_O) ../src/language/compat.c
compile$(_O): .headers ../src/language/anal.h ../src/language/tree.h ../src/language/opcode.h ../src/language/compile.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o compile$(_O) ../src/language/compile.c
default$(_O): .headers  ../src/language/default.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o default$(_O) ../src/language/default.c
errmsg$(_O): .headers  ../src/language/errmsg.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o errmsg$(_O) ../src/language/errmsg.c
es$(_O): .headers ../src/language/anal.h ../src/language/es.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o es$(_O) ../src/language/es.c
eval$(_O): .headers ../src/language/anal.h ../src/language/opcode.h ../src/language/eval.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o eval$(_O) ../src/language/eval.c
hash$(_O): .headers  ../src/language/hash.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o hash$(_O) ../src/language/hash.c
init$(_O): .headers ../src/language/anal.h ../src/language/init.h ../src/language/default.h ../src/language/init.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o init$(_O) ../src/language/init.c
intnum$(_O): .headers ../src/language/anal.h ../src/language/intnum.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o intnum$(_O) ../src/language/intnum.c
members$(_O): .headers  ../src/language/members.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o members$(_O) ../src/language/members.c
paricfg$(_O): .headers ./paricfg.h ../src/language/paricfg.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o paricfg$(_O) ../src/language/paricfg.c
pariinl$(_O): .headers  ../src/language/pariinl.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o pariinl$(_O) ../src/language/pariinl.c
parse$(_O): .headers ../src/language/anal.h ../src/language/parse.h ../src/language/parsec.h ../src/language/tree.h ../src/language/parse.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o parse$(_O) ../src/language/parse.c
sumiter$(_O): .headers ../src/language/anal.h ../src/language/sumiter.c
	$(CC) -c $(CPPFLAGS) $(DLCFLAGS) $(CFLAGS) -o sumiter$(_O) ../src/language/sumiter.c
gp$(_O): .headers ../src/gp/gp.h ../src/gp/gp.c
	$(CC) -c $(CPPFLAGS) -I../src/language $(RLINCLUDE) $(CFLAGS) -o gp$(_O) ../src/gp/gp.c
gp_init$(_O): .headers ../src/graph/rect.h ../src/gp/gp_init.h ../src/gp/gp_default.h ../src/gp/gp_init.c
	$(CC) -c $(CPPFLAGS) -I../src/graph $(CFLAGS) -o gp_init$(_O) ../src/gp/gp_init.c
gp_rl$(_O): .headers ../src/gp/gp.h ../src/gp/gp_rl.c
	$(CC) -c $(CPPFLAGS) -I../src/language $(RLINCLUDE) $(CFLAGS) -o gp_rl$(_O) ../src/gp/gp_rl.c
highlvl$(_O): .headers ../src/graph/rect.h ../src/gp/highlvl.h ../src/gp/highlvl.c
	$(CC) -c $(CPPFLAGS) -DDL_DFLT_NAME=$(DL_DFLT_NAME) $(CFLAGS) -o highlvl$(_O) ../src/gp/highlvl.c
whatnow$(_O): .headers ../src/gp/whatnow.h ../src/gp/whatnow.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -o whatnow$(_O) ../src/gp/whatnow.c
plotport$(_O): .headers ../src/graph/rect.h ../src/graph/plotport.c
	$(CC) -c $(CPPFLAGS) -I../src/graph $(CFLAGS) -o plotport$(_O) ../src/graph/plotport.c
plotnull$(_O): .headers ../src/graph/rect.h ../src/graph/plotnull.c
	$(CC) -c $(CPPFLAGS) $(PLOTCFLAGS) $(CFLAGS) -o plotnull$(_O) ../src/graph/plotnull.c
