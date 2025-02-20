" Plugin installation
call plug#begin()
  Plug 'preservim/nerdtree'

  " Color schemes
  Plug 'morhetz/gruvbox'
  Plug 'franbach/miramare'

  " Elixir plugins
  Plug 'elixir-editors/vim-elixir' , { 'for': 'elixir' }
  Plug 'pangloss/vim-javascript' , { 'for': 'elixir' }

  " LSP and autocompletion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Icons!
  Plug 'ryanoasis/vim-devicons'

  " Fuzzy find
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " CodeCompanion
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'olimorris/codecompanion.nvim'
  Plug 'MeanderingProgrammer/render-markdown.nvim'
call plug#end()

" Devicons
set guifont=JetBrainsMono_Nerd_Font:h11

" General configuration
set completeopt=menuone,noinsert,noselect
set number
set relativenumber
set ruler
set splitright
set splitbelow
set ignorecase
set smartcase
set smartindent
set visualbell
set t_vb=
" set wrap
set nowrap
set linebreak
set colorcolumn=79
syntax on
filetype on
filetype plugin indent on

" PHP identation
autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab

" NERDTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Move cursor to older/newer position (I use it when
" I need to move after I went to definition, etc.)
nnoremap <A-h> <C-O>
nnoremap <A-l> <C-I>

" Colorscheme
" let g:miramare_transparent_background = 0
set termguicolors
colorscheme gruvbox

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

luafile ~/.config/nvim/config/lsp.lua
luafile ~/.config/nvim/config/codecompanion.lua
luafile ~/.config/nvim/config/options.lua

" CodeCompanion Mappings
nnoremap <leader>cc :CodeCompanionChat Toggle<CR>
