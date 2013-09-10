" Vim syntax file
" Language: Modified Python in E-cell Model PythonProcess
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 10
" Version: 0.17
" License: Same as Vim.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" Start with default Python syntax
runtime! syntax/python.vim
unlet b:current_syntax

" Object
syn keyword PythonProcessObject self VariableReference System

" Object and Attribute
syn keyword PythonProcessAttribute Activity addValue getSuperSystem Priority
syn keyword PythonProcessAttribute setFlux StepperID Coefficient MolarConc
syn keyword PythonProcessAttribute Name NumberConc IsFixed IsAccessor Value
syn keyword PythonProcessAttribute Velocity Size SizeN_A StepperID

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_python_expression_syntax_inits")
  if version < 508
    let did_python_expression_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink PythonProcessObject    Constant
  HiLink PythonProcessAttribute Statement

  delcommand HiLink
endif

let b:current_syntax = "PythonProcess"

let &cpo = s:save_cpo
unlet s:save_cpo
