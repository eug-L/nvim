vim.g.minimap_width = 10
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_left = 0
vim.g.minimap_highlight_range = 1
vim.g.minimap_highlight_search = 0
vim.g.minimap_git_colors = 1
vim.g.minimap_block_filetypes = {'fugitive', 'nerdtree', 'tagbar', 'fzf'}
vim.g.minimap_close_filetypes = {'startify', 'netrw', 'vim-plug', 'alpha', 'Alpha'}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<Leader>mp", ":MinimapToggle<CR>", opts)
