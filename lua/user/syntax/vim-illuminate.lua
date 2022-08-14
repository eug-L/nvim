vim.g.Illuminate_ftblacklist = { "alpha", "html" }
-- vim.cmd [[
-- let g:Illuminate_ftHighlightGroups = {
--       \ '*:blacklist': ['#[0-9A-Fa-f]*']
--       \ }
-- ]]

vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
