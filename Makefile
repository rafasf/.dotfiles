dotfiles := $(HOME)/.dotfiles
tpm := $(HOME)/.config/tmux/plugins/tpm
xdgenv_label := dev.rafasf.xdgenv

.PHONY: setup install brew tmux-plugins launchctl check

# Full fresh-machine setup, in dependency order. Run after `brew install
# stow` and cloning this repo (see README).
setup: install brew tmux-plugins launchctl check

install:
	stow --restow \
		--ignore ".DS_Store" \
		--target="$(HOME)" \
		--dir="$(dotfiles)" \
		configurations

brew:
	brew bundle install --file="$(dotfiles)/Brewfile"

tmux-plugins:
	@if [ ! -d "$(tpm)" ]; then \
		git clone https://github.com/tmux-plugins/tpm "$(tpm)"; \
	fi
	"$(tpm)/bin/install_plugins"

launchctl:
	@launchctl bootout "gui/$$(id -u)/$(xdgenv_label)" 2>/dev/null || true
	launchctl bootstrap "gui/$$(id -u)" "$(HOME)/Library/LaunchAgents/$(xdgenv_label).plist"

check:
	bin/check-xdg-sync
