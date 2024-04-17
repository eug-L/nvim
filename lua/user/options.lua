local options = {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  number = true,
  relativenumber = true,
  showcmd = true,
  ignorecase = true,
  smartcase = true,
  undodir = os.getenv('HOME') .. '/.config/nvim/undodir',
  undofile = true,
  compatible = false,
  errorbells = false,
  hlsearch = true,
  swapfile = false,
  backup = false,
  ttimeout = false,
  timeoutlen = 500,
  ttimeoutlen = 50,
  cursorline = false,
  cursorcolumn = true,
  scrolloff = 10,
  -- completeopt = { "menuone", "noinsert", "noselect" },
  equalalways = true,
  suffixesadd = '.js',
  wildignorecase = true,
  wildmenu = true,
  laststatus = 3,
  splitbelow = true,
  splitright = true,
  hidden = true,
  signcolumn = "yes",
  showmode = false,
  linebreak = true,
  updatetime = 100,
  lisp = true,
  guicursor = "",
  mouse = "a",
  showtabline = 2,
  guifont = "JetBrainsMonoNL Nerd Font:h10.5",
}

vim.cmd([[

filetype plugin on
syntax on
" set t_Co=256
"set t_ZH=<C-V><Esc>3m
"set t_ZR=<C-V><Esc>23m
"set formatoptions-=cro

]])

vim.opt.shortmess:append "c"
vim.opt.path:append "**"
vim.opt.wildignore:append "**/node_modules/*,**/.git/*,tags,package-lock.json"
vim.opt.formatoptions:remove { "c", "r", "o" }

vim.g.sessions_dir = '/mnt/shared/nvim/sessions'

for k, v in pairs(options) do
  vim.opt[k] = v
end
