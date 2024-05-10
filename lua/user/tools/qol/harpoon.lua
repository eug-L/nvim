-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- keymap("n", "M", ':lua require("harpoon.mark").add_file()<CR>', opts)
-- keymap("n", "''", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
-- keymap("n", "'.", ':lua require("harpoon.ui").nav_next()<CR>', opts)
-- keymap("n", "',", ':lua require("harpoon.ui").nav_prev()<CR>', opts)


local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

-- REQUIRED
harpoon:setup({
    settings = {
      save_on_ui_close = true,
      save_on_toggle = true,
    }
      -- default = {
      --   select = function(list_item, list, option)
      --       local keys = vim.api.nvim_replace_termcodes('zz',true,false,true)

      --       -- vim.api.nvim_feedkeys('zz','n',false)
      --   end
      -- }
})
-- REQUIRED

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-r>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(4) end)

-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)



