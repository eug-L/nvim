local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
  return
end

local gitblame_ok, git_blame = pcall(require, "gitblame")
if not gitblame_ok then
  return
end

local icons = require "user.icons"

local function isempty(s)
  return s == nil or s == ""
end

local nvim_gps = function()
  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() then
    return ""
  end

  if gps_location == "error" then
    return ""
  else
    if not isempty(gps_location) then
      return gps_location
    else
      return ""
    end
  end
end

local spaces = {
  function()
    return "s:" .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
  end,
  padding = 0,
}


local modified = {
  function()
    local status = vim.api.nvim_exec([[

    function! GetModifiedStatus()
      if getbufinfo('%')[0].changed
        echo "Modified"
      endif
    endfunction
    call GetModifiedStatus()

    ]], true)

    if status == 'Modified' then
      return "+ "
    else
      return ""
    end
  end,
  padding = 0,
  separator = "%#SLSeparator#",
}

local diagnostics = {
  "diagnostics",
  -- sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "hint" },
  symbols = {
    error = icons.diagnostics.Error .. " ",
    warn = icons.diagnostics.Warning .. " ",
    hint = icons.diagnostics.Hint .. " "
  },
  colored = false,
  -- update_in_insert = false,
  -- always_visible = true,
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = require('user.appearance.colorscheme'),
    -- component_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {'vim-plug', 'NvimTree'},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    -- lualine_a = {
    --   'mode',
    --   modified
    -- },
    lualine_a = {
      'filename',
    },
    -- lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {
      'progress',
      'location',
      diagnostics,
      -- 'filename',
    },
    lualine_c = {
      { nvim_gps },
    },
    -- lualine_x = {
    --   'encoding',
    --   'fileformat',
    --   'filetype'
    -- },
    lualine_x = {
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
    },
    -- lualine_y = {'progress'},
    lualine_y = {'branch'},
    -- lualine_z = {'location'}
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 0,
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        'windows',
        show_filename_only = true,
        show_modifield_status = true,
        padding = 1
      }
    },
    lualine_x = {
      spaces,
    },
    lualine_y = {
      'encoding',
      'filetype'
    },
    lualine_z = {}
  },
  extensions = {}
}
