local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local icons = require("user.icons")

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
   [[                               __                ]],
   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
   dashboard.button( "e", icons.ui.NewFile .. "  New File" , ":ene <BAR> startinsert <CR>"),
   dashboard.button( "h", icons.ui.History .. "  Recent Files" , ":History<CR>"),
   dashboard.button( "f", icons.ui.Search .. "  Find Files" , ":Files<CR>"),
   dashboard.button( "s", icons.ui.Project .. "  Restore Session" , ":RestoreSession<CR>"),
   dashboard.button( "q", icons.ui.SignOut .. "  Quit" , ":qa<CR>"),
}
local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)
