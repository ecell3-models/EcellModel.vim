" Vim syntax file
" Language: E-cell Model
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 8
" Version: 0.1.2
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

" Keyword
syn keyword EcellModelStepper Stepper
syn keyword EcellModelSystem System
syn keyword EcellModelVariable Variable
syn keyword EcellModelProcess Process

" Property
" TODO: add many more
syn keyword EcellModelProperty StepperID Value VariableReferenceList

" List
" TODO

" Number
syn match EcellModelNumber "\<[1-9]\d*\>"
syn match EcellModelNumber "\<[1-9]\d*\.\d\+\>"
syn match EcellModelNumber "\<[1-9]\d*\.\d\+e-\=\d+\>"

" String
syn region EcellModelString start=+'+ end=+'+
syn region EcellModelString start=+"+ end=+"+

" Semicolon
syn match EcellModelSemicolon ";"

" Comment
syn match EcellModelComment "#.*$" contains=EcellModelToDo

" ToDo
syn keyword EcellModelTodo contained TODO NOTE FIXME XXX

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ecell_model_syntax_inits")
  if version < 508
    let did_ecell_model_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink EcellModelStepper   Type
  HiLink EcellModelSystem    PreProc
  HiLink EcellModelVariable  Label
  HiLink EcellModelProcess   Function
  HiLink EcellModelProperty  Identifier
  HiLink EcellModelSemicolon SpecialChar
  HiLink EcellModelNumber    Number
  HiLink EcellModelString    String
  HiLink EcellModelComment   Comment
  HiLink EcellModelTODO      TODO

  delcommand HiLink
endif

let b:current_syntax = "EcellModel"

let &cpo = s:save_cpo
unlet s:save_cpo
