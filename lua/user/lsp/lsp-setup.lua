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
  autostart = true,
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

  if lsp == "lua_ls" then
    params = {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {}
      }
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
