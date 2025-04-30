local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.cmd [[packadd lazy.nvim]]
end

require("lazy").setup({
  { 'preservim/nerdtree' },
  { 'morhetz/gruvbox' },
  { 'franbach/miramare' },
  { 'elixir-editors/vim-elixir', ft = { 'elixir' } },
  { 'pangloss/vim-javascript', ft = { 'elixir' } },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'ryanoasis/vim-devicons' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'olimorris/codecompanion.nvim' },
  { 'MeanderingProgrammer/render-markdown.nvim' }
})
