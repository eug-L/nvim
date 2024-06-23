local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- NORMAL --
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
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
vnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
]]
-- keymap("n", "j", 'gj', opts)
-- keymap("n", "k", 'gk', opts)

-- Insert line
-- keymap("n", "<Leader>o", "o<Esc>", opts)
-- keymap("n", "<Leader>O", "O<Esc>", opts)

-- Windows
keymap("n", "<Leader><Right>", ":vertical resize +5<CR>", opts)
keymap("n", "<Leader><Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<Leader><Up>", ":resize +2<CR>", opts)
keymap("n", "<Leader><Down>", ":resize -2<CR>", opts)
keymap("n", "<Leader>vm", ":resize <CR>", opts)
keymap("n", "<Leader>wn", "<C-w>w", opts)
keymap("n", "<Leader>wl", "<C-w>10l", opts)
keymap("n", "<Leader>wh", "<C-w>10h", opts)

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
keymap("n", "<Leader>j", ":call JQ()<CR>", opts)
-- keymap("n", "<Leader>j", ":lua require('user.functions').newJQ()<CR>", opts)

-- Sessions
-- keymap("n", "<Leader>ss", ":call MakeSession('')<CR>", {})
-- keymap("n", "<Leader>rss", ":call CurrentDirSession()<CR>", opts)
-- keymap("n", "<Leader>ms", "q:icall MakeSession('')<Esc>0f'a", {})
keymap("n", "<Leader>ss", ":SessionManager save_current_session<CR>", {})
keymap("n", "<Leader>sl", ":SessionManager load_session<CR>", {})
keymap("n", "<Leader>sd", ":SessionManager delete_session<CR>", {})

-- Scrolling
-- keymap("n", "<C-u>", ":call SmoothScroll(1)<CR>", opts)
-- keymap("n", "<C-d>", ":call SmoothScroll(0)<CR>", opts)

-- Buffers
keymap("n", "<Leader>nn", ":enew<CR>", opts)
keymap("n", "<Leader>Bc", ":BuffersCleanup!<CR>", opts)
keymap("n", "<Leader>ee", ":e!<CR>", opts)

-- Search
keymap("n", "<Leader>se", ":!s ", { noremap = true })

-- Copy file path
keymap("n", "<Leader>yp", ':let @+ = expand("%")<CR>', opts)
keymap("n", "<Leader>yP", ':let @+ = expand("%:p")<CR>', opts)

-- Yank all
keymap("n", "yA", ':%y+<CR>', opts)

-- Set Wrap
-- keymap("n", "sW", ':set wrap<CR>', opts)

-- rest.nvim
keymap("n", "<Leader>rr", '<Plug>RestNvim', opts)
keymap("n", "<Leader>rp", '<Plug>RestNvimPreview', opts)

-- JS test comment
keymap("n", "<Leader>tt", 'A // TEST:<ESC>', opts)

-- Add
keymap("n", "+", "<C-a>", opts)

-- Redo
keymap("n", "U", "<C-r>", opts)

-- Backwards to end of word
keymap("n", "s", "ge", opts)
keymap("n", "S", "gE", opts)


-- INSERT --
keymap("i", "<C-u>", "<C-g>u<C-u>", opts)
keymap("i", "<C-w>", "<C-g>u<C-w>", opts)



-- VISUAL --
-- Paste without clearing register
keymap("v", "p", "\"_dP", opts)

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

-- Formatting
-- keymap("v", "<Leader>F", ":lua vim.lsp.buf.range_formatting()<CR>", opts)

-- Split line at space
keymap("v", "K", "f <ESC>a<BS><CR><ESC>wV", { noremap = true })

-- Substitute
keymap("v", "<Leader>s", ":s/", { noremap = true })

-- Add
keymap("v", "+", "<C-a>", opts)

-- Backwards to end of word
keymap("v", "s", "ge", opts)
keymap("v", "S", "gE", opts)

-- Split line at space
keymap("n", "<Leader>se", ":!s ", { noremap = true })

-- Reload config
keymap("n", "<Leader>rR", ":lua require('user.functions').reloadConfig()<CR>", opts)

-- Set filetype
keymap("n", "<Leader>sf", ":set filetype=", {})
keymap("n", "<Leader>sfjs", ":set filetype=javascript<CR>", {})

-- Formatting
-- keymap("n", "<Leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<Leader>F", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- Color of text under cursor
keymap("n", "<Leader>ct", ":echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'fg')<CR>", opts)

-- null-ls
-- keymap("n", "<Leader>nl", ":lua require('user.lsp.null-ls')<CR>", opts)
keymap("n", "<Leader>nl", ":lua require('user.functions').loadNullLS()<CR>", opts)

keymap("n", "'", ":lua require('user.functions').harpoonMark()<CR>", opts)
