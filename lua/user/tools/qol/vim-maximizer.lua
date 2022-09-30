local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>mm", ":MaximizerToggle<CR>", opts)
