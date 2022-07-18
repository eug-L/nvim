local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }

-- keymap("n", "<Leader>dl", ":call vimspector#Launch()<CR>", opts)
keymap("n", "<Leader>dl", ":call vimspector#Restart()<CR>", opts)
keymap("n", "<Leader>dX", ":call vimspector#Reset()<CR>", opts)
keymap("n", "<Leader>si", ":call vimspector#StepInto()<CR>", opts)
keymap("n", "<Leader>so", ":call vimspector#StepOut()<CR>", opts)
keymap("n", "<Leader>sv", ":call vimspector#StepOver()<CR>", opts)
keymap("n", "<Leader>dn", ":call vimspector#Continue()<CR>", opts)
-- keymap("n", "<Leader>dr", ":call vimspector#Restart()<CR>", opts)
keymap("n", "<Leader>drc", ":call vimspector#RunToCursor()<CR>", opts)
keymap("n", "<Leader>db", ":call vimspector#ToggleBreakpoint()<CR>", opts)
keymap("n", "<Leader>dx", ":call vimspector#ClearBreakpoints()<CR>", opts)
keymap("n", "<Leader>dC", ':call vimspector#ShowOutput("Console")<CR>', opts)
keymap("n", "<Leader>dS", ':call vimspector#ShowOutput("stderr")<CR>', opts)
keymap("n", "<Leader>dc", ':call vimspector#RunToCursor()<CR>', opts)

-- vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_base_dir = os.getenv("HOME") .. '/.config/vimspector-config'
vim.g.vimspector_sign_priority = {
  vimspectorBP = 11,
  vimspectorBPCond = 11,
  vimspectorBPDisabled = 11,
}

vim.cmd([[

sign define vimspectorBP            text= texthl=WarningMsg
sign define vimspectorBPCond        text=ﱢ texthl=WarningMsg
sign define vimspectorBPLog         text=ﱢ texthl=SpellRare
sign define vimspectorBPDisabled    text= texthl=LineNr
sign define vimspectorPC            text= texthl=MatchParen linehl=CursorLine
sign define vimspectorPCBP          text=  texthl=MatchParen linehl=CursorLine
sign define vimspectorCurrentThread text=   texthl=MatchParen linehl=CursorLine
sign define vimspectorCurrentFrame  text=   texthl=Special    linehl=CursorLine

func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
nnoremap <Leader>da :call AddToWatch()<CR>

]], false)
