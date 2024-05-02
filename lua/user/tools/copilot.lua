local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>cs", ":Copilot panel<CR>", opts)

vim.cmd [[
let g:copilot_filetypes = {
    \ '*': v:false,
    \ }
]]
-- -- copilot.lua
-- local status_ok, copilot = pcall(require, "copilot")
-- if not status_ok then
--   return
-- end

-- copilot.setup({
--   panel = {
--     enabled = true,
--     auto_refresh = false,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-CR>"
--     },
--     layout = {
--       position = "bottom", -- | top | left | right
--       ratio = 0.4
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = false,
--     debounce = 75,
--     keymap = {
--       accept = "<M-l>",
--       accept_word = false,
--       accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = false,
--     markdown = false,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = 'node', -- Node.js version must be > 16.x
--   server_opts_overrides = {
--     trace = "verbose",
--     settings = {
--       advanced = {
--         debugOverrideEngine = "codegen",
--         debugOverrideProxyUrl = "http://localhost:5432",
--         debugTestOverrideProxyUrl = "http://localhost:5432",
--       }
--     },
--   },
-- })
