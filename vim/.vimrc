" ==============================
"   Init
" ==============================

set nocompatible  " Use vi over vim (must be first in .vimrc)
syntax on         " Enable syntax highlighting

" ==============================
"   Plugins
" ==============================

call plug#begin('~/.dotfiles/.vim/plugins')

Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

call plug#end()


" ==============================
"   Keybindings and mappings 
" ==============================

" Navigate between panes with Ctrl+direction
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l


" ==============================
"   Settings
" ==============================

set backspace=indent,eol,start " Allow different backspacing in insert mode

" Lines
set nowrap          " No line wrapping
set number          " Activate linenumbers
set relativenumber  " Linenumbers relative to current line
set numberwidth=5   " Max digits for linenumbers
"set cursorline      " Highlight current line
set ruler           " Always show the cursor position

" Search
set hlsearch        " Highlight searches
set incsearch       " Highlight dynamically as pattern is typed

" Indentation
set tabstop=8      " Maximum width of tab character, in spaces
set softtabstop=0  " Non-zero value other than tabstop will mix tabs & spaces
set expandtab      " Insert spaces instead of tab characters
set shiftwidth=4   " Size of an indent, in spaces (should evenly divide tabstop)
set smarttab       " When at beginning of line, go to next indent of next tabstop

" Window
set noerrorbells  " Disable error bells
set title         " Show the filename in the window titlebar

" Highlight first character in line that exceeds 80-character max
" Best to have at end of .vimrc for GUI Vim
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
