local lsp_signature_ok, signature = pcall(require, "lsp_signature")
if not lsp_signature_ok then
  return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  return
end

local illuminate_ok, illuminate = pcall(require, "illuminate")
if not illuminate_ok then
  return
end

local navic_ok, navic = pcall(require, "nvim-navic")
local navbuddy_ok, navbuddy = pcall(require, "nvim-navbuddy")

local lsp_status = require("user.lsp.lsp-status")
local icons = require("user.icons")
local signature_config = require("user.lsp.lsp-signature").config

local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

-- local function lsp_highlight_document(client)
--   illuminate.on_attach(client)
-- --   -- Set autocommands conditional on server_capabilities
-- --   if client.resolved_capabilities.document_highlight then
-- --     vim.api.nvim_exec(
-- --       [[
-- --       augroup lsp_document_highlight
-- --         autocmd! * <buffer>
-- --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
-- --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
-- --       augroup END
-- --     ]],
-- --       false
-- --     )
-- --   end
-- end

M.on_attach = function(client, bufnr)
  -- if client.name == "tsserver" or client.name == "clangd" then
  --   client.resolved_capabilities.document_formatting = false
  -- end
  if client.server_capabilities.documentSymbolProvider then
    if navic_ok then
      navic.attach(client, bufnr)
    end
    if navbuddy_ok then
      navbuddy.attach(client, bufnr)
    end
  end


  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
  M.capabilities = vim.tbl_extend("keep", M.capabilities, lsp_status.capabilities)
  if client.name == "clangd" then
    M.capabilities.offsetEncoding = { "utf-16" }
  end

  signature.on_attach(signature_config, bufnr)
  lsp_status.on_attach(client)

  lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)
end

return M
