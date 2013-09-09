" Vim indent file
" Language: E-cell Model
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 9
" Version: 0.1.7
" License: Same as Vim.

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let s:save_cpo = &cpo
set cpo&vim

" E-cell Model syntax is similar to C/C++, so built-in indentation will work.
setlocal cindent

let b:undo_indent = "setl cin<"

let &cpo = s:save_cpo
unlet s:save_cpo
