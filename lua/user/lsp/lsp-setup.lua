local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local servers = require("user.lsp.servers")

local function tableConcat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

local all_servers = tableConcat(servers.local_servers, servers.installer_servers)

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  autostart = false,
  -- handlers = {
  --   ["window/logMessage"] = function(err, method, params, client_id)
  --     if params and params.type <= vim.lsp.protocol.MessageType.Log then
  --       vim.lsp.handlers["window/logMessage"](err, method, params, client_id)
  --     end
  --   end,
  --   ["window/showMessage"] = function(err, method, params, client_id)
  --     if params and params.type <= vim.lsp.protocol.MessageType.Warning.Error then
  --       vim.lsp.handlers["window/showMessage"](err, method, params, client_id)
  --     end
  --   end,
  -- },
})

local handlers = require("user.lsp.handlers")

for _, lsp in ipairs(all_servers) do
  local params = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = {},
  }

  if lsp == "sumneko_lua" then
    params.settings.Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    }
  end

  if lsp == "clangd" then
    params.capabilities.offsetEncoding = { "utf-16" }
  end

  if lsp == "clangd" then
    local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
    if not lsp_status_ok then
      return
    end

    params.init_options = { clangdFileStatus = true }
    params.handlers = lsp_status.extensions.clangd.setup()
  end

  lspconfig[lsp].setup(params)
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<Leader>ls", ":LspStart<CR>", opts)
keymap("n", "<Leader>lx", ":LspStop<CR>", opts)
keymap("n", "<Leader>li", ":LspInfo<CR>", opts)
