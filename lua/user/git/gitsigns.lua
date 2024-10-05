local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup({
  -- signs = {
  --   add = {hl = 'GitSignsAdd' , text = '▎', numhl='GitSignsAddNr' , linehl='GitSignsAddLn'},
  --   change = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  --   delete = {hl = 'GitSignsDelete', text = '▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --   topdelete = {hl = 'GitSignsDelete', text = '▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --   changedelete = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  -- },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  -- yadm = {
  --   enable = false
  -- },
  on_attach = function ()
    -- local function map(mode, l, r, opts)
    --   opts = opts or { noremap = true }
    --   vim.api.nvim_set_keymap(mode, l, r, opts)
    -- end

    -- map("n", "<Leader>gs", ":Gitsigns preview_hunk<CR>")
    -- map("n", "<Leader>gn", ":Gitsigns next_hunk<CR>")
    -- map("n", "<Leader>gp", ":Gitsigns prev_hunk<CR>")
    -- map("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>")
    -- map("n", "<Leader>gS", ":Gitsigns stage_hunk<CR>")
    -- map("n", "<Leader>gU", ":Gitsigns undo_stage_hunk<CR>")


    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>gn', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '<leader>gp', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>gS', gitsigns.stage_hunk)
    map('n', '<leader>gr', gitsigns.reset_hunk)
    -- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gaS', gitsigns.stage_buffer)
    map('n', '<leader>gU', gitsigns.undo_stage_hunk)
    map('n', '<leader>gaR', gitsigns.reset_buffer)
    map('n', '<leader>gs', gitsigns.preview_hunk)
    -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    -- map('n', '<leader>hd', gitsigns.diffthis)
    -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    -- map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
