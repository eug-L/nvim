vim.cmd([[

command! -bang -nargs=* Rg
\ call fzf#vim#grep("rg --glob '!tags' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

command! RestoreSession call fzf#run(fzf#wrap({
  \ 'source': 'ls -a | grep -wvE "^.$|^..$"',
  \ 'sink': 'source',
  \ 'dir': '/mnt/shared/nvim/sessions/',
  \ 'window': {
    \ 'width': 0.3,
    \ 'height': 0.3
    \ },
  \ 'options': '--preview='
\ }))

]])

vim.env.FZF_DEFAULT_OPTS = os.getenv('FZF_DEFAULT_OPTS') .. ' --preview "bat --color=always"'
vim.env.FZF_DEFAULT_COMMAND = 'fd --type f'

vim.g.fzf_colors = {
  fg = {'fg', 'Normal'},
  bg = {'bg', 'Normal'},
  hl = {'fg', 'Comment'},
	['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
	['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
	['hl+'] = {'fg', 'Statement'},
	info = {'fg', 'PreProc'},
	border = {'fg', 'Ignore'},
	prompt = {'fg', 'Conditional'},
	pointer = {'fg', 'Exception'},
	marker = {'fg', 'Keyword'},
	spinner = {'fg', 'Label'},
	header = {'fg', 'Comment'},
}

vim.g.fzf_layout = {
  window = {
    width = 0.8,
    height = 0.5,
  }
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- scrolling preview => Shift-Up/Shift-Down

keymap("n", "<Leader>f", ":Files<CR>", opts)
keymap("n", "<Leader>g", ":GitFiles<CR>", opts)
keymap("n", "<Leader>bb", ":Buffers<CR>", opts)
keymap("n", "<Leader>bd", ":BD<CR>", opts)
keymap("n", "<Leader>l", ":Lines<CR>", opts)
keymap("n", "<Leader>sa", ":Rg<CR>", opts)
keymap("n", "<Leader>st", ":BTags<CR>", opts)
keymap("n", "<Leader>sb", ":BLines<CR>", opts)
keymap("n", "<Leader>h", ":History<CR>", opts)
keymap("n", "<Leader>c", ":Commits<CR>", opts)
keymap("n", "<Leader>rs", ":RestoreSession<CR>", opts)
keymap("n", "<Leader>co", ":Colors<CR>", opts)
