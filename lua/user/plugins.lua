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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

return packer.startup({
  function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"

    -- use "rakr/vim-colors-rakr"
    use "NLKNguyen/papercolor-theme"
    use "cormacrelf/vim-colors-github"
    use "morhetz/gruvbox"
    use "lifepillar/vim-gruvbox8"
    use "sainnhe/everforest"
    use "joshdick/onedark.vim"
    use "sainnhe/sonokai"
    use "yong1le/darkplus.nvim"
    use { "folke/tokyonight.nvim", branch = "main" }
    use "sainnhe/gruvbox-material"

    use "kyazdani42/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"

    use "tpope/vim-liquid"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ':TSUpdate'
    }
    use "MaxMEllon/vim-jsx-pretty"
    use "nvim-treesitter/playground"
    use "RRethy/vim-illuminate"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-nvim-lsp"

    use "hrsh7th/vim-vsnip"
    use "rafamadriz/friendly-snippets"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"

    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"
    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"

    use "tpope/vim-capslock"
    use "tpope/vim-commentary"
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
    use "SmiteshP/nvim-gps"
    use "kyazdani42/nvim-tree.lua"
    use "diepm/vim-rest-console"
    use "puremourning/vimspector"
    use "folke/which-key.nvim"
    use "moll/vim-bbye"
    use "nvim-telescope/telescope.nvim"

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

