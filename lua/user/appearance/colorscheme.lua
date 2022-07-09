local colorscheme = "everforest"
vim.opt.background = "dark"

local termguicolorsbl = {
  'gruvbox8',
  'gruvbox8_soft',
  'gruvbox8_hard',
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

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_termcolors = 16
-- vim.g.gruvbox_material_background = "hard"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

return colorscheme
