.PHONY: all

NVIM_PATH="$HOME/.config/nvim"

upgrade:
	@echo "Updating branch..."
	git pull
	@echo "Removing unused plugins..."
	nvim +PlugClean[!]
	@echo "Updating plugins..."
	nvim +PlugUpdate

full-upgrade: upgrade
	./vim_user_install.sh

plugins-clean: bundle/vim-plug
	@echo "Removing unused plugins..."
	nvim +PlugClean! +qall

plugins-install: bundle/vim-plug
	@echo "Installing plugins..."
	nvim +PlugInstall

plugins-purge:
	@echo "Removing all plugins..."
	@-rm -rf ~/.vim/bundle/

plugins-upgrade: bundle/vim-plug
	@echo "Installing plugins..."
	nvim +PlugUpdate

install: bundle/vim-plug
	@echo "Copying nvim init"
	mkdir -p ~/.config/nvim
	cp init.vim ~/.config/nvim
	@echo "Copying vimrc"
	cp .vimrc ~/


reinstall: plugins-purge install

bundle/vim-plug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


