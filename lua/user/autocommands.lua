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
  pattern = { "qf", "help" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[
      if &filetype != 'markdown'
        let save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(save)
      endif
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.ejs" },
  callback = function()
    vim.opt.filetype = "html"
  end
})
