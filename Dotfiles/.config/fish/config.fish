if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if test "$FISH_LOGIN_LOADED" !=  "true"
	# Go lang directories
	set -gx GOPATH "$HOME/.go"
	set -gx PATH "$PATH:$GOPATH/bin"
	test -d "$GOPATH" || mkdir "$GOPATH"
	test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"

	# Rust lang settings
	set -gx PATH "$PATH:$HOME/.cargo/bin"

	# Default gcc = homebrew llvm
	set -gx PATH "/usr/local/opt/llvm/bin:$PATH"
	set -gx CPPFLAGS "-I/usr/local/opt/llvm/include $CPPFLAGS"
	set -gx LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib $LDFLAGS"

	# Set Qt paths
	set -gx PATH "/usr/local/opt/qt/bin:$PATH"
	set -gx CPPFLAGS "-I/usr/local/opt/qt/include $CPPFLAGS"
	set -gx LDFLAGS "-L/usr/local/opt/qt/lib $LDFLAGS"

	# Set haskell (stack) path
	set -gx PATH "$HOME/.local/bin:$PATH"

	set -gx FISH_LOGIN_LOADED "true"
end

alias vim="nvim"

# set exa as ls command
alias ls='exa -s name -F'
alias l='ls -la'

# Copy and paste
alias copy='pbcopy'
alias paste='pbpaste'

# Git shortcuts
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gc='git commit'
alias gcl='git clone'

echo ''
neofetch
