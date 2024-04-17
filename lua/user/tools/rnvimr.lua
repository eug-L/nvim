-- Default keybindings
-- '<C-t>': 'NvimEdit tabedit',
-- '<C-x>': 'NvimEdit split',
-- '<C-v>': 'NvimEdit vsplit',
-- '<C-o>': 'NvimEdit drop',
-- 'gw': 'JumpNvimCwd',
-- 'yw': 'EmitRangerCwd'

vim.g.rnvimr_enable_ex = 0
vim.g.rnvimr_enable_picker = 1

vim.g.rnvimr_ranger_cmd = {'ranger', '--cmd=set draw_borders both'}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>rt", ":RnvimrToggle<CR>", opts)
