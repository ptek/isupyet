SHELL=/bin/bash
TITLE_START='\033[0;33m+ '
TITLE_END='...\033[0m'

all: run
	@echo -e $(TITLE_START)Done $(TITLE_END)

configure:
	@echo -e $(TITLE_START)Configuring $(TITLE_END)
	cabal-dev configure

build:
	@echo -e $(TITLE_START)Building $(TITLE_END)
	cabal-dev install
	rm -rf bin
	mkdir bin
	cp cabal-dev/bin/isupyet bin/
	strip bin/*

run: build
	@echo -e $(TITLE_START)Runnin for Localhost $(TITLE_END)
	bin/isupyet localhost

clean:
	rm -rf dist/
	rm -rf cabal-dev/

rebuild: clean build
