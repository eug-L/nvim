local M = {}

M.installer_servers = {
  "clangd",
  "tailwindcss",
  "gopls",
  "svelte",
}

M.local_servers = {
  "tsserver",
  "theme_check", -- requires .theme-check.yml at root
  "cssls",
  "sumneko_lua",
  "jsonls",
  "html",
  "bashls",
  "cmake",
  "pyright"
}

return M
