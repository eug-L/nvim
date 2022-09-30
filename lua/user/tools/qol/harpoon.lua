local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "M", ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "''", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "'.", ':lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "',", ':lua require("harpoon.ui").nav_prev()<CR>', opts)
