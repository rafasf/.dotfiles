dotfiles := $(HOME)/.dotfiles

install:
	stow --restow \
		--ignore ".DS_Store" \
		--target="$(HOME)" \
		--dir="$(dotfiles)" \
		configurations

check:
	bin/check-xdg-sync
