vim.api.nvim_create_user_command(
  "Ctags",
  "! ctags --recurse=yes --exclude=.git --exclude=node_modules",
  {}
)

vim.api.nvim_create_user_command(
  "Th",
  "tab help <args>",
  { nargs = "*" }
)

vim.api.nvim_create_user_command(
  "Vh",
  "vertical botright help <args>",
  { nargs = "*" }
)
