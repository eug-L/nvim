-- vim.cmd [[
-- "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
-- "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
-- "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
-- if (empty($TMUX))
--   if (has("nvim"))
--   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
--   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
--   endif
--   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
--   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
--   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
--   if (has("termguicolors"))
--     set termguicolors
--   endif
-- endif
-- ]]

local colorscheme = "everforest"

local termguicolorsbl = {
  'gruvbox8',
  'gruvbox8_soft',
  'gruvbox8_hard',
}

local function fixColor(value)
  for _, v in ipairs(termguicolorsbl) do
    if v == value then
      return false
    end
  end

  return true
end

if fixColor(colorscheme) then
  vim.opt.termguicolors = true
end
vim.opt.background = "dark"

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_termcolors = 16
vim.g.gruvbox_material_background = "hard"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
