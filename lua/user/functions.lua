vim.cmd [[
function! JQ()
  setlocal modifiable
  setlocal filetype=json
  setlocal foldmethod=syntax
  nnoremap <buffer> L zo
  nnoremap <buffer> H zc
  nnoremap <buffer> q ZQ
  execute "%!jq ."
  execute "foldopen!"
endfunction

function! MakeSession()
  let currentDir = split(getcwd(), "/")[-1]
  execute "mksession! ".g:sessions_dir."/".currentDir.".vim"
endfunction

function! CurrentDirSession()
  let currentDir = split(getcwd(), "/")[-1]
  execute "%bd | source ".g:sessions_dir."/".currentDir.".vim"
endfunction

function! SmoothScroll(up)
  if a:up
    let scrollaction="\<C-y>"
  else
    let scrollaction="\<C-e>"
  endif
  exec "normal " . scrollaction
  redraw
  let counter=1
  while counter<&scroll
    let counter+=1
    sleep 3m
    redraw
    exec "normal " . scrollaction
  endwhile
endfunction

" Wipe all deleted (unloaded & unlisted) or all unloaded buffers
function! BufferWipeout(listed) abort
    let l:buffers = filter(getbufinfo(), {_, v -> !v.loaded && (!v.listed || a:listed)})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunction
command! -bar -bang BuffersCleanup call BufferWipeout(<bang>0)

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
]]

local M = {}

local expect = function (expected, fn, description)
  local result = fn()
  if result ~= expected then
    error('error: ' .. description)
  end
end

local reject = function (expected, fn, description)
  local result = fn()
  if result == expected then
    error('error: ' .. description)
  end
end

local cache_time = 5 * 60 * 1000
local password = nil
local timer = nil

M.write = function(bang)
  -- prompt pw if no password or !
  if bang == '!' or password == nil then
    password = vim.fn.inputsecret('Password: ')
    if timer ~= nil then
      timer:stop()
    end
    -- timeout to clear pw
    timer = vim.defer_fn(function()
      password = nil
    end, cache_time)
  end

  local askpass = vim.fn.tempname()

  expect(0, function () return vim.fn.writefile({''}, askpass, 's') end, 'writefile (touch)')
  reject(0, function () return vim.fn.setfperm(askpass, 'rwx------') end, 'setfperm')
  expect(0, function () return vim.fn.writefile({'#!/bin/bash', '/bin/echo -n ' .. vim.fn.shellescape(password)}, askpass, 's') end, 'writefile (fill)')

  pcall(function()
    vim.cmd('silent write !env SUDO_ASKPASS=' .. vim.fn.shellescape(askpass) .. ' sudo -A tee % > /dev/null')
  end)

  if vim.v.shell_error ~= 0 then
    -- Common cause of this is wrong password, so invalidate the cache.
    password = nil
    if timer ~= nil then
      timer:stop()
    end
  end

  expect(0, function () return vim.fn.delete(askpass) end, 'delete')
end

M.reloadConfig = function()
  local plenary_reload_ok, plenary_reload = pcall(require, "plenary.reload")
  if not plenary_reload_ok then
    return
  end
  plenary_reload.reload_module("lualine", true)
  plenary_reload.reload_module("which-key", true)

  for name, _ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

M.harpoonMark = function()
  local harpoon_ok, harpoon_ui = pcall(require, "harpoon.ui")
  if not harpoon_ok then
    return
  end

  if vim.v.count > 0 then
    harpoon_ui.nav_file(vim.v.count)
  end
end

return M
