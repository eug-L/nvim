local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>oo", ":ObsidianQuickSwitch<CR>", opts)
keymap("n", "<Leader>os", ":ObsidianSearch<CR>", opts)
keymap("n", "<Leader>on", ":ObsidianNew<CR>", opts)

