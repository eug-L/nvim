local M = {}

M.currentScopes = function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
  -- local my_sidebar = widgets.sidebar(widgets.scopes)
  -- my_sidebar.open()
end

return M
