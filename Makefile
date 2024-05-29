BASE  = stow \
	bash-completion \
	fzf \
	psmisc \
	tmux \
	vim

# mail
#DEPS += isync \
#	lynx \
#	msmtp \
#	neomutt \
#	source-highlight \
#	urlscan
#	# oauth2.py
#	# libsasl2-modules-kdexoauth2
#
## news
#DEPS += newsboat
#
## neovim
#DEPS += ripgrep \
#	fd-find \
#	neovim \
#	-- for mason.nvim:
#	npm \
#	python3-pip \
#	python3-venv \
#	rustup \

# sway
DEPS += ark \
	bemenu \
	breeze-icon-theme \
	copyq \
	desktop-base \
	dolphin \
	gnome-keyring \
	grim \
	jq \
	kio-extras \
	libnotify-bin \
	mako-notifier \
	ntp \
	pavucontrol \
	python3-i3ipc \
	slurp \
	sway \
	swayidle \
	swaylock \
	udisks2 \
	vlc \
	waybar \
	wf-recorder \
	wireplumber \
	wl-clipboard \
	wtype \
	xdg-desktop-portal-wlr
	#light

.PHONY: all deps clean

all:
	mkdir -p $$HOME/.config/systemd/user $$HOME/.local/bin $$HOME/.cache/vim/bkp $$HOME/.cache/vim/swp $$HOME/.cache/vim/und $$HOME/.cache/nvim/bkp $$HOME/.cache/nvim/swp $$HOME/.cache/nvim/und
	sudo apt install $(BASE)
	stow --verbose --restow --target=$$HOME .
	$$HOME/.config/tmux/plugins/tpm/bin/install_plugins
	# *************** ADJUST '@continuum-save-interval' IN tmux.conf !
	# ln -s ~/.config/sway/desktop ~/.config/sway/autostart

deps:
	mkdir -p $$HOME/.cache/neomutt
	sudo apt install $(DEPS)
	fc-cache

clean:
	stow --verbose --delete --target=$$HOME .
	fc-cache
