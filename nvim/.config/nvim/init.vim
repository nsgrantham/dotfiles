" ==============================
"   Plugins
" ==============================

call plug#begin('~/.dotfiles/nvim/.config/nvim/plugged')

" Color schemes
Plug 'dracula/vim'

" Utilities
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

call plug#end()


" ==============================
"   Color schemes
" ==============================

colorscheme dracula
let g:lightline = { 'colorscheme': 'Dracula' }


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

" Status bar
set noshowmode      " Do not show mode, it is already shown in vim-airline

" Lines
"set nowrap          " No line wrapping
set number          " Activate linenumbers
set relativenumber  " Linenumbers relative to current line
set numberwidth=5   " Max digits for linenumbers

" Indentation
set tabstop=8      " Maximum width of tab character, in spaces
set softtabstop=0  " Non-zero value other than tabstop will mix tabs & spaces
set expandtab      " Insert spaces instead of tab characters
set shiftwidth=4   " Size of an indent, in spaces (should evenly divide tabstop)

" Window
set noerrorbells  " Disable error bells
set title         " Show the filename in the window titlebar

" Undo syntax concealing
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Highlight first character in line that exceeds 80-character max
" Best to have at end of .vimrc for GUI Vim
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Enter prose mode for editing markdown files and other non-code text
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd wrap linebreak
  set complete+=s
  colorscheme dracula
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
