-- require('winbar')
require('user.functions')
require('user.commands')
require('user.keymaps')
require('user.plugins')
require('user.autocommands')

-- require('user.git.vim-fugitive')
require('user.git.gitsigns')
require('user.git.git-blame')

require('user.lsp.lsp-installer')
require('user.lsp.handlers').setup()
-- require('user.lsp.null-ls')
require('user.lsp.lsp-signature')

require('user.syntax.treesitter')
require('user.syntax.vim-illuminate')
-- require('user.syntax.vim-polygot')

require('user.tools.qol.impatient')
require('user.tools.qol.quick-scope')
require('user.tools.qol.vim-instant-markdown')
require('user.tools.qol.undotree')
require('user.tools.qol.vim-maximizer')
require('user.tools.qol.whichkey')
require('user.tools.qol.vim-bbye')
require('user.tools.qol.registers')
require('user.tools.qol.vim-tmux-navigator')
require('user.tools.qol.harpoon')

require('user.tools.fzf-vim')
require('user.tools.rnvimr')
require('user.tools.vimspector')
require('user.tools.vimwiki')
require('user.tools.nvim-tree')
require('user.tools.vim-rest-console')
require('user.tools.cmp')
require('user.tools.telescope')
require('user.tools.color-picker')
require('user.tools.toggleterm')
require('user.tools.todo-comments')

require('user.appearance.colorscheme')
require('user.appearance.gps')
require('user.appearance.lualine')
require('user.appearance.nvim-web-devicons')
require('user.appearance.colorizer')
require('user.appearance.alpha-nvim')
require('user.appearance.dressing')
require('user.appearance.minimap')

require('user.highlight')
require('user.options')

--[[
function! ConvertAndFillBuffer(from, to, file)
  execute "%!pandoc -f ".a:from." -t ".a:to." ".a:file
endfunction
function! ConvertAndSaveOut(from, to, file)
  execute "w !pandoc -f ".a:from." -t ".a:to." > ".a:file
endfunction
command! -nargs=* ConvertIn call ConvertAndFillBuffer(<f-args>)
command! -nargs=* ConvertOut call ConvertAndSaveOut(<f-args>)

" WSL YANK SUPPORT
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif
--]]

-- vim.g.neovide_scroll_animation_length = 0.3
-- vim.g.neovide_cursor_vfx_mode = "torpedo"
-- vim.g.neovide_cursor_vfx_mode = "wireframe"
-- vim.g.neovide_cursor_animation_length=0.13
