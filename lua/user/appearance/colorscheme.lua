local colorscheme = "nord"
vim.opt.background = "dark"

local termguicolorsbl = {
  'gruvbox8',
  'gruvbox8_soft',
  'gruvbox8_hard',
  -- 'onehalflight',
}

local function fixColor(value)
  for _, v in ipairs(termguicolorsbl) do
    if v == value then
      return true
    end
  end

  return false
end

if not fixColor(colorscheme) then
  vim.opt.termguicolors = true
end

if colorscheme == "onehalflight" then
  vim.cmd([[
    hi DiagnosticInfo guifg=Blue
    hi DiagnosticHint guifg=Grey
  ]])
end

vim.g.catppuccin_flavour = "frappe"
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_termcolors = 16
vim.g.gruvbox_material_background = "medium"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

if colorscheme == "iceberg" then
  vim.g.terminal_color_0 = '#757CA3'
end

return colorscheme
