set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

set noexpandtab
set shiftwidth=8
set tabstop=8
set autoindent
set relativenumber
set number
set backspace=indent,eol,start

" Remove cursor change in nvim.
"set guicursor=

" Enable python3 support ( for YCM ) in nvim.
let g:python3_host_prog = '/usr/local/bin/python3'

" For vimtex with neovim
let g:vimtex_compiler_progname = 'nvr'

" NERDTree setting.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" add fzf in run time path.
set rtp+=/usr/local/opt/fzf

" ViM-Plug begins.
call plug#begin('~/.local/share/nvim/plugged')

" Plugin for code completion server - clang_complete
"Plug 'xavierd/clang_complete'

" YCM
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer' }

" Plugin for file management.
Plug 'scrooloose/nerdtree'

" Plugin for git support in file management.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plugin for colors of files/folders in file management.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plugin for Lively Previewing LaTeX PDF Output.
Plug 'xuhdev/vim-latex-live-preview'

" Plugin for Nim support
Plug 'zah/nim.vim'

" Plugin for Latex
Plug 'lervag/vimtex'

" Plugin for (better) Rust syntax highlighting
Plug 'rust-lang/rust.vim'

" Plugin for Fish support
Plug 'dag/vim-fish'

" Plugin for Feral support
Plug 'Feral-Lang/Feral-Vim'

" Plugin for TOML support
Plug 'cespare/vim-toml'

" Plugins for powerline via ViM-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim themes
"Plug 'chriskempson/base16-vim'
"Plug 'cormacrelf/vim-colors-github'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'davidcelis/vim-ariake-dark'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'artanikin/vim-synthwave84'
"Plug 'DankNeon/vim'
"Plug 'morhetz/gruvbox'

" Displays indentation level with thin line
"Plug 'yggdroot/indentLine'

" ViM-Plug ends.
call plug#end()

filetype plugin indent on    " required

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'gruvbox'

"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_light = 'hard'

" Set ViM color scheme
set termguicolors
set background=dark
"colorscheme synthwave84

" Customization

set showcmd
let mapleader = ' '

" Split controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Other editing
"clear highlight
nnoremap <leader><leader> :noh<CR>
nnoremap <leader>q :bd<CR>

" Split direction
set splitbelow
set splitright
