-- vim.g.codeium_disable_bindings = 1


-- keymap('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
-- keymap('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
-- keymap('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
-- keymap('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

vim.cmd [[
let g:codeium_filetypes = {
    \ "vimwiki": v:false,
    \ "markdown": v:false,
    \ "http": v:false,
    \ }
]]

vim.g.codeium_enabled = false

local M = {}

local next_completion = function()
  return vim.fn['codeium#CycleCompletions'](1)
end

local prev_completion = function()
  return vim.fn['codeium#CycleCompletions'](-1)
end

local get_completion = function()
  return vim.fn['codeium#Complete']()
end

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, expr = true }

keymap("i", "<M-;>", next_completion, opts)
-- keymap("i", "<M-.>", prev_completion, opts)
keymap("i", "<M-.>", get_completion, opts)
keymap("n", "<Leader>ai", ":CodeiumToggle<CR>", { noremap = true })

return M
