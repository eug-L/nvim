-- -- appearance
-- -- Plug("altercation/vim-colors-solarized")
-- -- Plug("lifepillar/vim-solarized8")
-- -- Plug("sonph/onehalf', { 'rtp': 'vim' }
-- -- Plug("rakr/vim-colors-rakr")
-- -- Plug("itchyny/lightline.vim")
-- -- Plug("akinsho/bufferline.nvim")
-- -- Plug("sunjon/shade.nvim")

-- -- syntax/hightlighting
-- -- Plug("pangloss/vim-javascript")
-- -- Plug("plasticboy/vim-markdown")
-- -- Plug("leafgarland/typescript-vim")

-- -- lsp
-- -- Plug("williamboman/nvim-lsp-installer")

-- -- tools
-- -- Plug("voldikss/vim-floaterm")
-- -- Plug("mhartington/formatter.nvim")
-- -- Plug("NTBBloodbath/rest.nvim")
-- -- Plug("mfussenegger/nvim-dap")

local fn = vim.fn

-- Install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  print("Installling packer...")
  vim.cmd([[packadd packer.nvim]])
end

-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

vim.opt.runtimepath:append(os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/onehalf/vim')

return packer.startup({
  function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/impatient.nvim"

    use "morhetz/gruvbox"
    use "lifepillar/vim-gruvbox8"
    use "joshdick/onedark.vim"
    use "sainnhe/everforest"
    use "sainnhe/sonokai"
    use "sainnhe/gruvbox-material"
    use "sainnhe/edge"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "cocopon/iceberg.vim"
    use { "sonph/onehalf", rtp = "vim" }
    use "arcticicestudio/nord-vim"
    use "rakr/vim-one"
    use "easysid/mod8.vim"
    use "arzg/vim-colors-xcode"
    use "humanoid-colors/vim-humanoid-colorscheme"
    use "cranberry-clockworks/coal.nvim"
    use "https://git.sr.ht/~romainl/vim-bruin"
    use "EdenEast/nightfox.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "goolord/alpha-nvim"
    use "stevearc/dressing.nvim"

    use "tpope/vim-liquid"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ':TSUpdate'
    }
    -- use "MaxMEllon/vim-jsx-pretty"
    -- use "pangloss/vim-javascript"
    -- use "neoclide/vim-jsx-improve"
    use "sheerun/vim-polyglot"
    use "nvim-treesitter/playground"
    use "RRethy/vim-illuminate"
    use "tpope/vim-sleuth"
    use "wfxr/minimap.vim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "ray-x/lsp_signature.nvim"
    use "nvim-lua/lsp-status.nvim"
    -- use 'arkav/lualine-lsp-progress'
    -- use "zbirenbaum/copilot.lua"
    -- use "github/copilot.vim"
    use 'Exafunction/codeium.vim'

    use "hrsh7th/vim-vsnip"
    use "rafamadriz/friendly-snippets"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use 'simrat39/symbols-outline.nvim'

    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"
    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"

    use "tpope/vim-capslock"
    use "tpope/vim-commentary"
    use "folke/todo-comments.nvim"
    use {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end
    }
    use "junegunn/fzf.vim"
    use "kevinhwang91/rnvimr"
    use "unblevable/quick-scope"
    use "vimwiki/vimwiki"
    use "instant-markdown/vim-instant-markdown"
    use "mbbill/undotree"
    use "szw/vim-maximizer"
    use {
      "glacambre/firenvim",
      run = function()
        vim.fn['firenvim#install'](0)
      end
    }
    use "tversteeg/registers.nvim"
    use "christoomey/vim-tmux-navigator"
    use "akinsho/toggleterm.nvim"
    -- use "SmiteshP/nvim-gps"
    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    }
    use {
      "SmiteshP/nvim-navbuddy",
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      }
    }
    use "kyazdani42/nvim-tree.lua"
    use "diepm/vim-rest-console"
    use {
      "rest-nvim/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Keep the http file buffer above|left when split horizontal|vertical
          result_split_in_place = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Encode URL before making request
          encode_url = true,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
            -- executables or functions for formatting response body [optional]
            -- set them to false if you want to disable them
            formatters = {
              json = "jq",
              html = function(body)
                return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
              end
            },
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    }
    use "puremourning/vimspector"
    use "folke/which-key.nvim"
    use "moll/vim-bbye"
    use "nvim-telescope/telescope.nvim"
    use "ziontee113/color-picker.nvim"
    -- use "tpope/vim-obsession"
    use "ThePrimeagen/harpoon"
    use "vim-scripts/vis"
    use { "mg979/vim-visual-multi", branch = "master" }
    use "windwp/nvim-autopairs"
    use "Shatur/neovim-session-manager"

    use "MunifTanjim/nui.nvim"
    -- use({
    --   "jackMort/ChatGPT.nvim",
    --     requires = {
    --       "MunifTanjim/nui.nvim",
    --       "nvim-lua/plenary.nvim",
    --       "nvim-telescope/telescope.nvim"
    --     }
    -- })

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }
})
