local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local installer_servers = require('user.lsp.servers').installer_servers

local settings = {
	ensure_installed = installer_servers,
	automatic_installation = false,
	ui = {
		check_outdated_servers_on_open = true,
		border = "none",
		icons = {
			server_installed = "◍",
			server_pending = "◍",
			server_uninstalled = "◍",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

lsp_installer.setup(settings)

require("user.lsp.lsp-setup")
