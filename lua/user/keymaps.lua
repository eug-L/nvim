local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- NORMAL --
-- nnoremap <C-j> :m .+1<CR>
-- nnoremap <C-k> :m .-2<CR>

-- Paste from global clipboard
keymap("n", "<Leader>p", '"+p', opts)

-- Navigation
keymap("n", "J", '<C-e>', opts)
keymap("n", "K", '<C-y>', opts)

vim.cmd [[
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
]]
-- keymap("n", "j", 'gj', opts)
-- keymap("n", "k", 'gk', opts)

-- Insert line
keymap("n", "<Leader>o", "o<Esc>", opts)
keymap("n", "<Leader>O", "O<Esc>", opts)

-- Windows
keymap("n", "<Leader><Right>", ":vertical resize +5<CR>", opts)
keymap("n", "<Leader><Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<Leader><Up>", ":resize +2<CR>", opts)
keymap("n", "<Leader><Down>", ":resize -2<CR>", opts)
keymap("n", "<Leader>vm", ":resize <CR>", opts)
keymap("n", "<Leader>wn", "<C-w>w", opts)

-- Config
keymap("n", "<Leader>S", ":source ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<Leader>vr", ":edit ~/.config/nvim/init.vim<CR>", opts)
keymap("n", "<Leader>vl", ":edit ~/.config/nvim/lua/init.lua<CR>", opts)

-- Undo all
keymap("n", "<Leader>ua", ":e!<CR>", opts)

-- Current file path
keymap("n", "<Leader>pa", ':echo expand("%:p")<CR>', opts)
keymap("n", "<Leader>pw", ':echo expand("%p")<CR>', opts)

-- Search all with vimgrep
keymap("n", "<Leader>vg", "q:ivimgrep //j **/* <Bar> copen<Esc>0f/a", opts)

-- Set no readonly
keymap("n", "<Leader>nr", ":set noreadonly<CR>", opts)

-- Set modifiable
keymap("n", "<Leader>mo", ":set modifiable<CR>", opts)

-- Set shiftwidth
keymap("n", "<Leader>sw2", ":set shiftwidth=2<CR>", opts)
keymap("n", "<Leader>sw4", ":set shiftwidth=4<CR>", opts)

-- Exit neovim
keymap("n", "<Leader>q", "ZQ", opts)
keymap("n", "<Leader>z", ":qa!<CR>", opts)

-- Tabs
keymap("n", "<Leader>tn", ":tabnew<CR>", opts)
keymap("n", "<Leader>tc", ":tabclose<CR>", opts)
keymap("n", "<Leader>tl", ":+tabmove<CR>", opts)
keymap("n", "<Leader>th", ":-tabmove<CR>", opts)
keymap("n", "<Leader>t;", ":tablast<CR>", opts)
keymap("n", "H", ":tabprevious<CR>", opts)
keymap("n", "L", ":tabnext<CR>", opts)

-- Change directory to current directory
keymap("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

-- Format JSON
keymap("n", "<Leader>jq", ":call JQ()<CR>", opts)

-- Sessions
keymap("n", "<Leader>ss", ":call MakeSession()<CR>", {})
keymap("n", "<Leader>rss", ":call CurrentDirSession()<CR>", opts)

-- Scrolling
keymap("n", "<C-u>", ":call SmoothScroll(1)<CR>", opts)
keymap("n", "<C-d>", ":call SmoothScroll(0)<CR>", opts)

-- Buffers
keymap("n", "<Leader>nn", ":enew<CR>", opts)
keymap("n", "<Leader>Bc", ":BuffersCleanup!<CR>", opts)
keymap("n", "<Leader>ee", ":e!<CR>", opts)

-- Search
keymap("n", "<Leader>se", ":!s ", opts)



-- INSERT --
keymap("i", "<C-u>", "<C-g>u<C-u>", opts)
keymap("i", "<C-w>", "<C-g>u<C-w>", opts)



-- VISUAL --
-- Move lines
keymap("v", "<C-k>", ":m '<-2<CR>gv", opts)
keymap("v", "<C-j>", ":m '>+1<CR>gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Search highlighted
keymap("v", "*", 'y/<C-r>"<CR>', opts)

-- Copy to global clipboard
keymap("v", "<Leader>y", '"+y', opts)
keymap("v", "Y", '"+y', opts)

-- Highlight all
keymap("v", "A", "ggvVG", opts)

-- Reload config
keymap("n", "<Leader>R", ":lua require('user.functions').reloadConfig()<CR>", opts)

-- Set filetype
keymap("n", "<Leader>sf", ":set filetype=", {})

-- Formatting
keymap("n", "<Leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("v", "<Leader>F", ":lua vim.lsp.buf.range_formatting()<CR>", opts)

-- null-ls
keymap("n", "<Leader>nl", ":lua require('user.lsp.null-ls')<CR>", opts)
