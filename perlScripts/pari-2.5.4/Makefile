# This file was created by Configure. All changes made will be lost
# next time Configure is run.
#
SHELL = /bin/sh
VERS = pari-2.5.4 released
TAG=release-2-5-4

dft target::
	@echo "Possible targets are:"
	@echo "	all             	 Compilation + Documentation"
	@echo "	gp			 Compilation"
	@echo "	bench                    Compilation + quick test"
	@echo "	dobench                	 Test only"
	@echo "	doc			 Documentation"
	@echo "	install			 Installation"
	@echo "	clean, cleantest         Clean up"
	@echo "For pari maintainers..."
	@echo "	dbg	                Compile gp binary suitable for debugging"
	@echo "	prf	                Compile gp binary suitable for profiling"
	@echo "	distrib,alpha,beta,release  Create a new distribution"
	@echo "	snapshot                Create a snapshot"
	@echo "	ctags			Generate VI/VIM tags file in ./src"
	@echo "	etags			Generate Emacs  tags file in ./src"
	@echo "	tune	                Generate tuning utility"
	@echo "	test-all	        Thorough regression tests (slow)"

all::
	@$(MAKE) gp
	@-cd doc && $(MAKE) doc

gp bench test-kernel test-all test-addprimes test-analyz test-apply test-arith test-aurifeuille test-bezout test-bnfisintnorm test-bnr test-charpoly test-combinat test-compat test-contfrac test-cxtrigo test-debugger test-det test-diffop test-ell test-ellglobalred test-elliptic test-ellsea test-ellweilpairing test-err test-exact0 test-extract test-factorint test-ff test-ffisom test-galois test-galoisinit test-graph test-ideal test-idealappr test-idealramgroups test-intformal test-intnum test-ispower test-krasner test-linear test-list test-lll test-mat test-matsnf test-member test-minim test-modpr test-multivar-mul test-nf test-nffactor test-nfhilbert test-nfields test-nfrootsof1 test-number test-objets test-padic test-partition test-polchebyshev test-polmod test-polred test-polyser test-printf test-program test-qf test-qfbsolve test-quad test-quadclassunit test-quadray test-random test-resultant test-rfrac test-rnf test-rnfkummer test-round4 test-select test-stark test-subcyclo test-subfields test-subst test-sumiter test-thue test-trans test-zetak test-zn test-ploth dotest-addprimes dotest-analyz dotest-apply dotest-arith dotest-aurifeuille dotest-bezout dotest-bnfisintnorm dotest-bnr dotest-charpoly dotest-combinat dotest-compat dotest-contfrac dotest-cxtrigo dotest-debugger dotest-det dotest-diffop dotest-ell dotest-ellglobalred dotest-elliptic dotest-ellsea dotest-ellweilpairing dotest-err dotest-exact0 dotest-extract dotest-factorint dotest-ff dotest-ffisom dotest-galois dotest-galoisinit dotest-graph dotest-ideal dotest-idealappr dotest-idealramgroups dotest-intformal dotest-intnum dotest-ispower dotest-krasner dotest-linear dotest-list dotest-lll dotest-mat dotest-matsnf dotest-member dotest-minim dotest-modpr dotest-multivar-mul dotest-nf dotest-nffactor dotest-nfhilbert dotest-nfields dotest-nfrootsof1 dotest-number dotest-objets dotest-padic dotest-partition dotest-polchebyshev dotest-polmod dotest-polred dotest-polyser dotest-printf dotest-program dotest-qf dotest-qfbsolve dotest-quad dotest-quadclassunit dotest-quadray dotest-random dotest-resultant dotest-rfrac dotest-rnf dotest-rnfkummer dotest-round4 dotest-select dotest-stark dotest-subcyclo dotest-subfields dotest-subst dotest-sumiter dotest-thue dotest-trans dotest-zetak dotest-zn dotest-ploth install cleanall cleanobj cleantest install-bin install-doc install-docpdf install-data install-lib-sta install-bin-sta dobench dyntest-all statest-all tune::
	@dir=`config/objdir`; echo "Making $@ in $$dir";\
	 if test ! -d $$dir; then echo "Please run Configure first!"; exit 1; fi;\
	cd $$dir && $(MAKE) $@

dbg gp.dbg::
	@dir=`config/objdir`.dbg; echo "Making gp in $$dir";\
	 if test ! -d $$dir; then echo "Please run Configure -g first!"; exit 1; fi;\
	cd $$dir && $(MAKE) gp

prf gp.prf::
	@dir=`config/objdir`.prf; echo "Making gp in $$dir";\
	 if test ! -d $$dir; then echo "Please run Configure -pg first!"; exit 1; fi;\
	cd $$dir && $(MAKE) gp

doc docps docpdf gpman cleandoc::
	cd doc && $(MAKE) $@

clean:: cleandoc cleanall

distrib:
	config/settar $(VERS) released

alpha:
	config/settar $(VERS) alpha
beta:
	config/settar $(VERS) beta
release:
	config/settar $(VERS) released
snapshot:
	config/settar $(VERS) snapshot

dosdistrib: gpman
	-zip -kr GPB_254.ZIP GP.EXE README README.DOS ../EMX/README.DOC ../RSX/README.TXT
	-zip -k GPD_254.ZIP doc/*.tex doc/gphelp doc/gp.man examples misc/gprc* misc/gpalias

etags:
	cd src; sh ../config/make_emacs_tags

ctags:
	config/make_vi_tags "/var/www/michel/perlScripts/pari-2.5.4/src"

checkspaces:
	config/checkspaces

