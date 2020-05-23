if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if test "$FISH_LOGIN_LOADED" !=  "true"
	# Go lang directories
	set -gx GOROOT (brew --prefix go)/libexec
	set -gx GOPATH "$HOME/.go"
	set -gx PATH "$GOPATH/bin:$GOROOT/bin:$PATH"
	test -d "$GOPATH" || mkdir "$GOPATH"
	test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"

	# Rust lang settings
	set -gx PATH "$HOME/.cargo/bin:$PATH"

	# Nim lang, Haskell, Feral binaries
	set -gx PATH "$HOME/.nimble/bin:$HOME/.local/bin:$HOME/.feral/bin:$PATH"

	# Default gcc = homebrew llvm
	set -gx PATH "/usr/local/opt/llvm/bin:$PATH"
	set -gx CPPFLAGS "-I/usr/local/opt/llvm/include $CPPFLAGS"
	set -gx LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib $LDFLAGS"

	# Set EDITOR
	set -gx EDITOR "/usr/local/bin/nvim"

	# Custom programming stuff
	set -gx USE_CCACHE yes

	set -gx FISH_LOGIN_LOADED "true"
end

alias vim="/usr/local/bin/nvim"

# set ls_extended as ls command
alias ls='ls_extended -Asn'
alias l='ls -lAh'
alias ll='ls -lah'

# Copy and paste
alias copy='pbcopy'
alias paste='pbpaste'

# Git shortcuts
alias git='/usr/local/bin/hub'
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gc='git commit'
alias gcl='git clone'

# Set tree colors
alias tree='tree -lFC'

# Fish prompt settings reconfigure
set SPACEFISH_PROMPT_FIRST_PREFIX_SHOW "true"
set SPACEFISH_CHAR_SUFFIX "  "
set SPACEFISH_TIME_SHOW "true"
set SPACEFISH_USER_SHOW "always"
set SPACEFISH_HOST_SHOW "always"
set SPACEFISH_DIR_TRUNC "0"
set SPACEFISH_EXEC_TIME_ELAPSED "5"
set SPACEFISH_BATTERY_SHOW "charged"
set SPACEFISH_EXIT_CODE_SHOW "true"

neofetch
