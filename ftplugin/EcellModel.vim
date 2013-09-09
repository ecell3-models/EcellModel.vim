" Vim filetype plugin file
" Language: E-cell Model
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 9
" Version: 0.14
" License: Same as Vim.

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim

setl tabstop=4
setl softtabstop=4
setl shiftwidth=4

let &cpo = s:save_cpo
unlet s:save_cpo
