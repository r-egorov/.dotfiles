" Plugin installation
call plug#begin()
  Plug 'preservim/nerdtree'

  " Color schemes
  Plug 'morhetz/gruvbox'  " colorscheme gruvbox
  Plug 'franbach/miramare'

  " Erlang plugins
  Plug 'vim-erlang/vim-erlang-tags'         , { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-omnicomplete' , { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-compiler'     , { 'for': 'erlang' }
  Plug 'vim-erlang/vim-erlang-runtime'      , { 'for': 'erlang' }
  
  " Elixir plugins
  Plug 'elixir-editors/vim-elixir' , { 'for': 'elixir' }
  Plug 'mhinz/vim-mix-format'      , { 'for': 'elixir' }

  " Elixir LSP
  Plug 'dense-analysis/ale'        ,
call plug#end()

" General configuration
set number
set relativenumber
set ruler
set nowrap
set smartindent
set visualbell
set t_vb=
set wrap
set linebreak
syntax on
filetype on
filetype plugin indent on

" NERDTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Colorscheme
let g:miramare_transparent_background = 0
colorscheme miramare

" Elixir file support
autocmd BufNewFile,BufRead *.ex,*.exs set syntax=elixir
autocmd BufNewFile,BufRead *.eex set syntax=eelixir

""""""""""""""
" Elixir LSP "
""""""""""""""
" Required, explicitly enable Elixir LS
let g:ale_linters = {}
let g:ale_linters.elixir = ['elixir-ls']

" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("~/elixir-ls")

" Optional, you can disable Dialyzer with this setting
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
""""""""""""

let g:mix_format_on_save = 1
