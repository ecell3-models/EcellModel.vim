" Vim syntax file
" Language: Python Expression for E-cell Model Process
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 9
" Version: 0.13
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

" Constant
syn keyword PythonExpressionConstant true false pi NaN INF N_A exp

" Mathematical Function
syn keyword PythonExpressionFunction abs ceil exp fact floor log log10 pow
syn keyword PythonExpressionFunction sqrt sec sin cos tan sinh cosh tanh coth
syn keyword PythonExpressionFunction csch sech asin acos atan asec acsc acot
syn keyword PythonExpressionFunction asinh acosh atanh asech acsch acoth

" Funciton
syn keyword PythonExpressionFunction eq neq gt lt geq leq and or xor not

" Object
syn keyword PythonExpressionObject self VariableReference System

" Object Attribute
syn keyword PythonExpressionAttribute Activity addValue getSuperSystem Priority
syn keyword PythonExpressionAttribute setFlux StepperID Coefficient MolarConc
syn keyword PythonExpressionAttribute Name NumberConc IsFixed IsAccessor Value
syn keyword PythonExpressionAttribute Velocity Size SizeN_A StepperID

" Number
syn match PythonExpressionNumber "0"
syn match PythonExpressionNumber "-\=[1-9]\d*"
syn match PythonExpressionNumber "-\=[1-9]\d*\.\d\+"
syn match PythonExpressionNumber "-\=0\.\d\+"
syn match PythonExpressionNumber "-\=[1-9]\d*[eE][+-]\=\d\+"
syn match PythonExpressionNumber "-\=[1-9]\d*\.\d\+[eE][+-]\=\d\+"
syn match PythonExpressionNumber "-\=0\.\d\+[eE][+-]\=\d\+"

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

  HiLink PythonExpressionConstant  Constant
  HiLink PythonExpressionFunction  Funcion
  HiLink PythonExpressionObject    Constant
  HiLink PythonExpressionAttribute Statement
  HiLink PythonExpressionNumber    Constant

  delcommand HiLink
endif

let b:current_syntax = "PythonExpression"

let &cpo = s:save_cpo
unlet s:save_cpo
