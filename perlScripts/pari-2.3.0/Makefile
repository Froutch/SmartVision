# This file was created by Configure. All changes made will be lost
# next time Configure is run.
#
SHELL = /bin/sh
VERS = pari-2.3.0 released

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
	@echo "	ctags			Generate VI/VIM tags file in ./src"
	@echo "	etags			Generate Emacs  tags file in ./src"
	@echo "	tune	                Generate tuning utility"
	@echo "Available extra tests: test-all test-compat test-ellglobalred test-galois test-intnum test-qfbsolve test-rfrac test-round4 test-stark test-ploth"

all::
	@-cd doc && $(MAKE) doc
	@$(MAKE) gp

gp bench test-kernel test-all test-compat test-ellglobalred test-galois test-intnum test-qfbsolve test-rfrac test-round4 test-stark test-ploth dotest-compat dotest-ellglobalred dotest-galois dotest-intnum dotest-qfbsolve dotest-rfrac dotest-round4 dotest-stark dotest-ploth install cleanobj cleantest install-bin install-doc install-data install-lib-sta install-bin-sta dobench tune::
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

clean:: cleandoc cleanobj

distrib:
	config/settar $(VERS) released
tag:
	@echo cvs tag release-2-3-0
alpha: tag
	config/settar $(VERS) alpha
beta: tag
	config/settar $(VERS) beta
release: tag
	config/settar $(VERS) released

dosdistrib: gpman
	-zip -kr GPB_230.ZIP GP.EXE README README.DOS ../EMX/README.DOC ../RSX/README.TXT
	-zip -k GPD_230.ZIP doc/*.tex doc/gphelp doc/gp.man examples misc/gprc* misc/gpalias

etags:
	cd src; sh make_emacs_tags

ctags:
	src/make_vi_tags "/var/www/michel/perlScripts/pari-2.3.0/src"

