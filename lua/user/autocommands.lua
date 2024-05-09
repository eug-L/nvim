-- vim.api.nvim_create_autocmd({"CursorMoved", "BufWinEnter", "BufFilePost"}, {
--   callback = function()
--     local value = require("winbar").gps()

--     if value == nil then
--       value = ''
--     end

--     vim.opt_local.winbar = value
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "fugitive" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rest" },
  callback = function()
    local randomStr = require('user.functions').randomString(5)
    vim.b.vrc_output_buffer_name = randomStr .. ".json"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "vimwiki" },
  callback = function()
    vim.cmd [[
      set nowrap
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "minimap" },
  callback = function()
    vim.cmd [[
      set nocursorcolumn
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> ~ I~~<Esc>A~~<Esc>
    ]]
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.cmd [[
--       if &filetype != 'markdown'
--         let save = winsaveview()
--         keeppatterns %s/\s\+$//e
--         call winrestview(save)
--       endif
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.ejs" },
  callback = function()
    vim.opt.filetype = "html"
  end
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.cmd [[
--       if line('$') == 1 && getline(1) == ''
--         RestoreSession
--       endif
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "svelte" },
  callback = function()
    vim.cmd [[
      setlocal commentstring=<!--%s-->
    ]]
  end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "json" },
--   callback = function()
--     vim.cmd [[
--       setlocal modifiable
--       setlocal foldmethod=syntax
--       setlocal nowrap
--       nnoremap <buffer> zl zo
--       nnoremap <buffer> zh zc
--       execute "%!jq ."
--     ]]
--   end,
-- })
