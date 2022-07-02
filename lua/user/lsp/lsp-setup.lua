local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local servers = require("user.lsp.servers")

function tableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

local all_servers = tableConcat(servers.local_servers, servers.installer_servers)

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
	return
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

for _, lsp in ipairs(all_servers) do
	local settings = {}

	if lsp == "sumneko_lua" then
		settings.Lua = {
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

	lspconfig[lsp].setup({
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = capabilities,
		settings = settings,
	})
end
