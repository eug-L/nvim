local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>cp", "<cmd>PickColor<cr>", opts)
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

local status_ok, colorpicker = pcall(require, "color-picker")
if not status_ok then
  return
end

local icons = require "user.icons"

colorpicker.setup({ -- for changing icons & mappings
	-- ["icons"] = { "ﱢ", "" },
	-- ["icons"] = { "ﮊ", "" },
	-- ["icons"] = { "", "ﰕ" },
	-- ["icons"] = { "", "" },
	-- ["icons"] = { "", "" },
	["icons"] = { "ﱢ", icons.ui.Pencil },
	["border"] = "rounded", -- none | single | double | rounded | solid | shadow
	-- ["keymap"] = { -- mapping example:
	-- 	["U"] = "<Plug>ColorPickerSlider5Decrease",
	-- 	["O"] = "<Plug>ColorPickerSlider5Increase",
	-- },
})

vim.cmd([[hi FloatBorder guibg=NONE]])
