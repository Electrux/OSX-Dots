# Path to your oh-my-zsh installation.
  export ZSH=/Users/elec/.oh-my-zsh

# MacOS thingy for fpath
  fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship-prompt/spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set zsh autosuggestions path
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set zsh syntax highlighting path
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Make output of less command colorized.
# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
#export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

# Make output of make colorized.
# Need colormake for this though
# alias make='/usr/local/bin/colormake'

# Alias vim to neovim and set neovim
# as the default EDITOR
alias vim="/usr/local/bin/nvim"
export EDITOR="/usr/local/bin/nvim"
# ZSH Pure Prompt
#autoload -U promptinit; promptinit
#prompt pure

# ZSH spaceship prompt settings reconfigure
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_CHAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_DIR_TRUNC="0"
SPACESHIP_EXEC_TIME_ELAPSED="5"
SPACESHIP_BATTERY_SHOW="charged"
SPACESHIP_EXIT_CODE_SHOW="true"

# added by travis gem
[ -f /Users/electrux/.travis/travis.sh ] && source /Users/electrux/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/Git/emoji-cli/emoji-cli.zsh

# Set default gcc to be homebrew llvm
export PATH="/usr/local/opt/llvm/bin:${PATH}"
export CPPFLAGS="-I/usr/local/include -I/usr/local/opt/llvm/include ${CPPFLAGS}"
export LDFLAGS="-L/usr/local/lib -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib ${LDFLAGS}"

## Set QT paths
#export PATH="/usr/local/opt/qt/bin:${PATH}"
#export CPPFLAGS="-I/usr/local/opt/qt/include ${CPPFLAGS}"
#export LDFLAGS="-L/usr/local/opt/qt/lib ${LDFLAGS}"

# Go lang settings
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix go)/libexec"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"

# Rust lang settings
source ~/.cargo/env

# Nim lang, Haskell, Feral binaries
export PATH="${HOME}/.nimble/bin:${HOME}/.local/bin:${HOME}/.feral/bin:${PATH}"

# Use hub instead of directly git to reduce work
alias git="/usr/local/bin/hub"

# Set exa as the ls command
#alias ls='exa -s name -F'
#alias l='ls -la'

# Set ls_extended as the ls command
alias ls='ls_extended -sn'
alias l='ls -lAh'
alias ll='ls -lah'

# Set tree colors
alias tree='tree -lFC'

# Compile + Run a source file
run() {
	filename="${1%%.*}"
	ext="${1#*.}"
	if [[ "$ext" == "c" ]]; then
	        $(echo "clang -std=c11 $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "cpp" ]]; then
	        $(echo "clang++ -std=c++17 $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "rs" ]]; then
		rustc $@ && ./${filename}
	elif [[ "$ext" == "d" ]]; then
		dmd $@ && ./${filename}
	elif [[ "$ext" == "py" ]]; then
	        python3 $@
	elif [[ "$ext" == "java" ]]; then
	        javac $@ && echo "Executing ${filename}" && java ${filename}
	fi
}

export USE_CCACHE=yes

function ccd {
	mkdir $1 && cd $1
}

# build book
function bb {
	git worktree add /tmp/book gh-pages
	mdbook build
	rm -rf /tmp/book/* # this won't delete the .git directory
	cp -rp book/* /tmp/book/
	cd /tmp/book
	git add -A
	git commit -m "updated pages on $(date)"
	git push origin gh-pages
	cd -
}

# build book (amend & force)
function bbf {
	git worktree add /tmp/book gh-pages
	mdbook build
	rm -rf /tmp/book/* # this won't delete the .git directory
	cp -rp book/* /tmp/book/
	cd /tmp/book
	git add -A
	git commit --amend
	git push --force origin gh-pages
	cd -
}

# build feral
function bf {
	CWD=$(pwd)
	cd ~/Git/Electrux/Feral-Lang/Feral
	rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j8 && make install
	cd $CWD
}

# build feral with mem profile summary
function bfm {
	CWD=$(pwd)
	cd ~/Git/Electrux/Feral-Lang/Feral
	rm -rf build && mkdir -p build && cd build && MEM_PROFILE=true cmake .. -DCMAKE_BUILD_TYPE=Release && make -j8 && make install
	cd $CWD
}

alias gs='git status'

alias b='rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j8 && make install; cd ..'
alias ccb='rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && make -j8 && make install; cd ..'
alias db='rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j8 && make install; cd ..'

alias sonarr='docker create --name=sonarr -e PUID=501 -e PGID=20 -e TZ=Asia/Kolkata -e UMASK_SET=022 -p 8989:8989 -v $HOME/sonarr/config:/config -v $HOME/Movies/Series:/tv -v $HOME/sonarr/downloads:/downloads --restart unless-stopped linuxserver/sonarr && docker start sonarr'
alias radarr='docker create --name=radarr -e PUID=501 -e PGID=20 -e TZ=Asia/Kolkata -e UMASK_SET=022 -p 7878:7878 -v $HOME/radarr/config:/config -v $HOME/Movies:/movies -v $HOME/radarr/downloads:/downloads --restart unless-stopped linuxserver/radarr && docker start radarr'
alias jackett='docker create --name=jackett -e PUID=501 -e PGID=20 -e TZ=Asia/Kolkata -p 9117:9117 -v $HOME/jackett/config:/config -v $HOME/jackett/downloads:/downloads --restart unless-stopped linuxserver/jackett && docker start jackett'

# Neofetch at beginning
echo ''
neofetch
