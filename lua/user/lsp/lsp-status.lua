local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
if not lsp_status_ok then
  return
end

lsp_status.register_progress()

local icons = require("user.icons")

lsp_status.config({
  kind_label = {},
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ["start"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[1]),
        },
        ["end"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[2]),
        },
      }

      return require("lsp-status.util").in_range(cursor_pos, value_range)
    end
  end,
  indicator_errors = icons.diagnostics.Error,
  indicator_warnings = icons.diagnostics.Warning,
  indicator_hint = icons.diagnostics.Hint,
  indicator_info = icons.diagnostics.Information,
  indicator_ok = "ok",
  status_symbol = icons.misc.Robot .. " ",
  current_function = false,
  show_filename = false,
})

return lsp_status
