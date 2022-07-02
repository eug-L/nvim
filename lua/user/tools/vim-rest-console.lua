vim.g.vrc_set_default_mapping = 0

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>rr", ":call VrcQuery()<CR>", opts)
