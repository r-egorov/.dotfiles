syntax on

set number
set ruler
set noerrorbells
set nu
set nowrap
set smartindent
set cindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

highlight MoreThan80 ctermbg=blue guibg=blue
:2match MoreThan80 /\%81v.\+/

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

