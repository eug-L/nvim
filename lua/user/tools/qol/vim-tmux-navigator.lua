local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.tmux_navigator_no_mappings = 1
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
