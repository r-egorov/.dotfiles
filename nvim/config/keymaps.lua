local keymap = vim.keymap.set

-- Normal mode mappings
keymap("n", "<leader>n", ":NERDTreeFocus<CR>", { desc = "NERDTree Focus" })
keymap("n", "<C-n>", ":NERDTreeToggle<CR>", { desc = "NERDTree Toggle" })
keymap("n", "<A-h>", "<C-O>", { desc = "Cursor to older position" })
keymap("n", "<A-l>", "<C-I>", { desc = "Cursor to newer position" })

-- Telescope mappings
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope Live Grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope Buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope Help Tags" })

-- CodeCompanion mappings
keymap("n", "<leader>cc", ":CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion Chat Toggle" })
