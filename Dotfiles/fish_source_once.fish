# Go lang settings
set -Ux GOROOT (brew --prefix go)/libexec
set -Ux GOPATH "$HOME/.go"
set -Ua fish_user_paths "$GOPATH/bin" "$GOROOT/bin"
test -d "$GOPATH" || mkdir "$GOPATH"
test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"

# Rust lang settings
set -Ua fish_user_paths "$HOME/.cargo/bin"

# Feral, Nim settings
set -Ua fish_user_paths "$HOME/.feral/bin" "$HOME/.nimble/bin"

# Default C/C++ compiler => Homebrew LLVM
set -Ua fish_user_paths "/usr/local/opt/llvm/bin"
set -Ux CPPFLAGS "-I/usr/local/opt/llvm/include $CPPFLAGS"
set -Ux LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib $LDFLAGS"

set -Ux EDITOR "/usr/local/bin/nvim"
