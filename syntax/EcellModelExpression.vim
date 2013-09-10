" Vim syntax file
" Language: Original Expression Syntax for E-cell Model Expression Process
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 9
" Version: 0.19
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
syn keyword EcellModelExpressionConstant true false pi NaN INF N_A exp

" Mathematical Function
syn keyword EcellModelExpressionFunction abs ceil exp fact floor log log10 pow
syn keyword EcellModelExpressionFunction sqrt sec sin cos tan sinh cosh tanh coth
syn keyword EcellModelExpressionFunction csch sech asin acos atan asec acsc acot
syn keyword EcellModelExpressionFunction asinh acosh atanh asech acsch acoth

" Funciton
syn keyword EcellModelExpressionFunction eq neq gt lt geq leq and or xor not

" Object
syn keyword EcellModelExpressionObject self VariableReference System

" Object Attribute
syn keyword EcellModelExpressionAttribute getSuperSystem Value MolarConc NumberConc
syn keyword EcellModelExpressionAttribute TotalVelocity Velocity Size SizeN_A

" Number
syn match EcellModelExpressionNumber "\<0\>"
syn match EcellModelExpressionNumber "\<[1-9]\d*\>"
syn match EcellModelExpressionNumber "\<[1-9]\d*\.\d\+\>"
syn match EcellModelExpressionNumber "\<0\.\d\+\>"
syn match EcellModelExpressionNumber "\<[1-9]\d*[eE][+-]\=\d\+\>"
syn match EcellModelExpressionNumber "\<[1-9]\d*\.\d\+[eE][+-]\=\d\+\>"
syn match EcellModelExpressionNumber "\<0\.\d\+[eE][+-]\=\d\+\>"

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

  HiLink EcellModelExpressionConstant  Constant
  HiLink EcellModelExpressionFunction  Function
  HiLink EcellModelExpressionObject    Constant
  HiLink EcellModelExpressionAttribute Statement
  HiLink EcellModelExpressionNumber    Constant

  delcommand HiLink
endif

let b:current_syntax = "EcellModelExpression"

let &cpo = s:save_cpo
unlet s:save_cpo
