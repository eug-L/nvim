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

vim.cmd [[
function! VimwikiLinkHandler(link)
  if stridx(a:link, "http") != -1
    try
      let browser = '$HOME/.scripts/open_link.sh'
      execute '!sh "'.browser.'" ' . a:link
      return 1
    endtry
  endif
  return 0
endfunction
]]

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>ws", ":sp<CR>:VimwikiIndex<CR>", opts)
keymap("n", "<Leader>wsp", ":VimwikiSplitLink<CR>", opts)
keymap("n", "<Leader>wvs", ":VimwikiVSplitLink<CR>", opts)
