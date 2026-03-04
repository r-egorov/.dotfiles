-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- CodeCompanion Mappings
vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanion Chat" })
