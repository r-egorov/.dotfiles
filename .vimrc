syntax on

set number
set relativenumber
set ruler
set noerrorbells
set nu
set wrap
set smartindent
set cindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set path+=**
set wildmenu
set cursorcolumn

highlight MoreThan80 ctermbg=blue guibg=blue
:2match MoreThan80 /\%81v.\+/

call plug#begin('~/.vim/plugged')
	Plug 'franbach/miramare'
	Plug 'preservim/nerdtree'
call plug#end()

set termguicolors

let g:miramare_transparent_background = 0

colorscheme miramare

map <C-n> :NERDTreeToggle<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

