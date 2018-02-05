BREW := $(shell command -v ~/.linuxbrew/bin/brew 2> /dev/null)

default: bootstrap orion dotfiles

dotfiles:
	for file in $(shell find $(CURDIR) -maxdepth 1 -name ".*" -not -name ".dotfiles" -not -name ".git" -not -name ".gitignore" -not -name ".travis.yml"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

bootstrap:
ifndef BREW
	git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
endif
	~/.linuxbrew/bin/brew update && ~/.linuxbrew/bin/brew bundle

orion:
	for file in $(shell find $(CURDIR) -maxdepth 1 -name "orion-*.jq"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.orion/$$f; \
	done;

test:
	@find $(CURDIR) -type f -not -ipath "*/.git*" -exec grep -Iq -E '^\#\!.*bash.*' {} \; -and -print |\
	xargs shellcheck --shell=bash

.PHONY: dotfiles bootstrap orion test
.NOTPARALLEL: dotfiles bootstrap orion test
