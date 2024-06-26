local M = {}

M.installer_servers = {
  "clangd",
  "tailwindcss",
  "gopls",
  "svelte",
  "rust_analyzer",
}

M.local_servers = {
  "tsserver",
  "theme_check", -- requires .theme-check.yml at root
  "cssls",
  "lua_ls",
  "jsonls",
  "html",
  "bashls",
  "cmake",
  "pyright"
}

return M
