local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local install_ok, install = pcall(require, "nvim-treesitter.install")
if not install_ok then
  return
end

install.prefer_git = true

configs.setup {
  ensure_installed = {
    "javascript",
    "html",
    "css",
    "dockerfile",
    "graphql",
    "html",
    "json",
    "lua",
    "markdown",
    "php",
    "python",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "bash",
    "c",
    "make",
    "http",
  },
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true,
  },
  indents = {
    enable = true,
    disable = {""}
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
