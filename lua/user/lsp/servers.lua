local M = {}

M.installer_servers = {
  "clangd",
}

M.local_servers = {
  "tsserver",
  "theme_check", -- requires .theme-check.yml at root
  "cssls",
  "sumneko_lua",
  "jsonls",
  "html",
  "bashls",
}

return M
