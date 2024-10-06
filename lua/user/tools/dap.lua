local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

dap.adapters['pwa-node'] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {os.getenv('HOME') .. "/neovim-dap/js-debug/src/dapDebugServer.js", "${port}"},
  }
}

dap.configurations.javascript = {
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'pwa-node',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

local map = vim.api.nvim_set_keymap

local opts = { noremap = true }
map("n", "<Leader>ds", ':lua require("user.tools.dap-functions").currentScopes()<CR>', opts)
map('n', '<Leader>dl', ':lua require("dap").run()<CR>', opts)
map('n', '<Leader>dn', ':lua require("dap").continue()<CR>', opts)
map('n', '<Leader>db', ':lua require("dap").toggle_breakpoint()<CR>', opts)
map('n', '<Leader>dr', ':lua require("dap").repl.open()<CR>', opts)
map('n', '<Leader>dX', ':lua require("dap").disconnect()<CR>', opts)
map('n', '<Leader>dc', ':lua require("dap").run_to_cursor()<CR>', opts)
map('n', '<Leader>dl', ':lua require("dap").continue()<CR>', opts)

--🛑
vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='ﱢ', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
