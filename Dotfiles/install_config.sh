#!/bin/bash

script_dir="${HOME}/Git/Electrux/OSX-Dots/Dotfiles"

mkdir -p ~/.config/nvim # ~/.mpd

#ln -sf ${script_dir}/.{ncmpcpp,zshrc} ~/
#ln -sf ${script_dir}/.mpd/mpd.conf ~/.mpd/mpd.conf
#ln -sf ${script_dir}/.config/ranger ~/.config/
#ln -sf ${script_dir}/.doom.d ~/
ln -sf ${script_dir}/.config/fish ~/.config/
ln -sf ${script_dir}/.vimrc ~/

# neovim
ln -sf ${script_dir}/.vimrc ~/.config/nvim/init.vim

# (neo)vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Oh My ZSH
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g')"
#mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
#git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
#git clone https://github.com/rupa/z.git ~/Git/z

#brew install python3 vim neovim jq fzf peco git zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions neofetch youtube-dl cmake llvm syncthing ruby gnutls sfml hub && brew tap homebrew/cask-fonts && brew cask install iterm2 google-chrome vlc qbittorrent discord steam visual-studio-code font-iosevka-nerd-font epic-games && brew services start syncthing && pip3 install neovim
brew install python3 vim neovim jq fzf peco git fish neofetch youtube-dl cmake llvm syncthing ruby gnutls sfml hub && brew tap homebrew/cask-fonts && brew cask install iterm2 google-chrome vlc qbittorrent discord steam visual-studio-code font-iosevka-nerd-font epic-games && brew services start syncthing && pip3 install neovim
#git clone https://github.com/b4b4r07/emoji-cli.git ~/Git/emoji-cli

sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
chsh -s /usr/local/bin/fish
