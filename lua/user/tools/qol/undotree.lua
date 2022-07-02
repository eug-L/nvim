vim.g.undotree_HighlightChangedText = 0

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>ut", ":UndotreeToggle<CR>:UndotreeFocus<CR>", opts)
keymap("n", "<Leader>uf", ":UndotreeFocus<CR>", opts)
