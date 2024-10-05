local M = {}

M.installer_servers = {
  "clangd",
  "tailwindcss",
  "gopls",
  "svelte",
  "rust_analyzer",
  "intelephense",
}

M.local_servers = {
  "ts_ls",
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
