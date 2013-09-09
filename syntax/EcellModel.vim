" Vim syntax file
" Language: E-cell Model
" Maintainer: Takeshi ITOH <takeshi.ito.doraemon@gmail.com>
" Last Change:  2013 Sep. 9
" Version: 0.10
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
syn keyword EcellModelStepper DifferentialStepper DiscreateEventStepper
syn keyword EcellModelStepper DiscreteTimeStepper PassiveStepper
syn keyword EcellModelStepper DAEStepper ESSYNSStepper FixedDAE1Stepper
syn keyword EcellModelStepper FixedODE1Stepper FluxDistributionStepper
syn keyword EcellModelStepper ODE23Stepper ODE45Stepper ODEStepper TauLeapStepper
syn keyword EcellModelSystem System
syn keyword EcellModelVariable Variable
syn keyword EcellModelProcess Process
syn keyword EcellModelProcess ConstantFluxProcess DecayFluxProcess
syn keyword EcellModelProcess ExpressionAlgebraicProcess ExpressionAssignmentProcess
syn keyword EcellModelProcess ExpressionFluxProcess GillespieProcess GMAProcess
syn keyword EcellModelProcess MassActionFluxProcess MichaelisUniUniFluxProcess
syn keyword EcellModelProcess PythonFluxProcess PythonProcess QuasiDynamicFluxProcess
syn keyword EcellModelProcess SSystemProcess TauLeapProcess

" Property
syn keyword EcellModelProperty Name Priority StepperID Value VariableReferenceList

" List
syn cluster EcellModelListChildren contains=EcellModelNumber,EcellModelString,EcellModelList
syn region EcellModelList matchgroup=EcellModelListDelimiter
      \ start="\[" end="\]" contains=@EcellModelListChildren

" Entity ID
" TODO

" System Path
" TODO

" Number
syn match EcellModelNumber "\<0\>"
syn match EcellModelNumber "\<-\=[1-9]\d*\>"
syn match EcellModelNumber "\<-\=[1-9]\d*\.\d\+\>"
syn match EcellModelNumber "\<-\=0\.\d\+\>"
syn match EcellModelNumber "\<-\=[1-9]\d*[eE][+-]\=\d\+\>"
syn match EcellModelNumber "\<-\=[1-9]\d*\.\d\+[eE][+-]\=\d\+\>"
syn match EcellModelNumber "\<-\=0\.\d\+[eE][+-]\=\d\+\>"

" String
syn region EcellModelString start=+'+ end=+'+
syn region EcellModelString start=+"+ end=+"+

" Semicolon
syn match EcellModelSemicolon ";"

" Comment
syn match EcellModelComment "#.*$" contains=EcellModelToDo

" ToDo
syn keyword EcellModelTodo contained TODO NOTE FIXME XXX

" Include Python Syntax
syn include @Python syntax/python.vim

" PythonPreProc
unlet b:current_syntax
syn region EcellModelPythonPreProc matchgroup=EcellModelPythonPreProcDelimiter
      \ start="@{" end="}" contains=@Python
syn region EcellModelPythonPreProc matchgroup=EcellModelPythonPreProcDelimiter
      \ start="@(" end=")" contains=@Python

" Python Expression in Process
" TODO from-scrach syntax definition needed
"      because PythonExpression has not complete python syntax
syn region EcellModelPythonExpression matchgroup=EcellModelPythonExpressionDelimiter
      \ start="Expression\s\+\"" end="\"" contains=@Python

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
  HiLink EcellModelProcess   Title
  HiLink EcellModelProperty  Identifier
  HiLink EcellModelSemicolon SpecialChar
  HiLink EcellModelNumber    Number
  HiLink EcellModelString    String
  HiLink EcellModelComment   Comment
  HiLink EcellModelTODO      TODO
  HiLink EcellModelListDelimiter             Delimiter
  HiLink EcellModelPythonPreProcDelimiter    Delimiter
  HiLink EcellModelPythonExpressionDelimiter Delimiter

  delcommand HiLink
endif

let b:current_syntax = "EcellModel"

let &cpo = s:save_cpo
unlet s:save_cpo
