-- requires smdv from pip
vim.g.instant_markdown_autostart = 0

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>md", ":InstantMarkdownPreview<CR>", opts)
