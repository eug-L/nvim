vim.g.vimwiki_list = {
  {
    path = '/mnt/shared/notes/vimwiki/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/vimwiki/',
    syntax = 'markdown',
    ext = '.md',
  }
}

vim.g.vimwiki_global_ext = 0

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>ws", ":sp<CR>:VimwikiIndex<CR>", opts)
keymap("n", "<Leader>wsp", ":VimwikiSplitLink<CR>", opts)
keymap("n", "<Leader>wvs", ":VimwikiVSplitLink<CR>", opts)
