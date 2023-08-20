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

local colorscheme = require("user.appearance.colorscheme")

-- local icons = require("user.icons")

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

local lsp_progress = function()
  local result = ''
  local status = vim.api.nvim_exec([[echo LspStatus()]], true)

  -- if status and status ~= '' then
    result = result .. status
  -- end
  return result
end

local spaces = {
  function()
    return "s:" .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
  end,
  padding = 0,
}

-- local modified = {
--   function()
--     local status = vim.api.nvim_exec(
--       [[

--     function! GetModifiedStatus()
--       if getbufinfo('%')[0].changed
--         echo "Modified"
--       endif
--     endfunction
--     call GetModifiedStatus()

--     ]],
--       true
--     )

--     if status == "Modified" then
--       return "+ "
--     else
--       return ""
--     end
--   end,
--   padding = 0,
--   separator = "%#SLSeparator#",
-- }

-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_lsp" },
--   sections = { "error", "warn", "hint" },
--   symbols = {
--     error = icons.diagnostics.Error .. " ",
--     warn = icons.diagnostics.Warning .. " ",
--     hint = icons.diagnostics.Hint .. " ",
--   },
--   colored = false,
--   update_in_insert = true,
--   always_visible = true,
-- }

local config = {
  options = {
    icons_enabled = true,
    theme = colorscheme,
    -- component_separators = { left = '', right = ''},
    component_separators = { left = "", right = "" },
    -- section_separators = { left = '', right = ''},
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "vim-plug", "NvimTree" },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    -- lualine_a = {
    --   'mode',
    --   modified
    -- },
    lualine_a = {
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        -- shorting_target = 400, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = " +", -- Text to show when the file is modified.
          readonly = " -", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "[No Name]", -- Text to show for unnamed buffers.
        },
      },
    },
    -- lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {
      {
        "location",
        padding = 1,
      },
      {
        "progress",
        padding = 1,
      },
      {
        lsp_progress,
        padding = {
          left = 1,
          right = 1,
        },
        separators = nil,
      },
      -- diagnostics,
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
    lualine_y = { "branch" },
    lualine_z = {
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        mode = 0,
      },
    },
    lualine_b = {
      -- {
      --   "tabs",
      --   mode = 0,
      -- },
    },
    lualine_c = {
      {
        "windows",
        show_filename_only = true,
        show_modified_status = true,
        padding = 1,
      },
    },
    lualine_x = {
      spaces,
    },
    lualine_y = {
      "encoding",
      "filetype",
    },
    lualine_z = {},
  },
  extensions = {},
}

if colorscheme == "nord" or colorscheme == "mod8" or colorscheme == "nordfox" then
  config.tabline.lualine_a[1].tabs_color = {
    inactive = 'lualine_b_inactive'
  }
end

lualine.setup(config)
