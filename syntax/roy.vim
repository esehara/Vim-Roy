" Vim syntax file
" Language: Roy (http://roy.brianmckenna.org/)
" Maintainer: Shigeo Esehara
" Last Change: 2011.11.29

if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

"keywords
syn keyword royStatement match case
syn keyword royStatement if else
syn keyword royStatement type data let
syn keyword royStatement case

"defined type or data
syn keyword type data let nextgroup=roySimbol skipwhite
syn match   roySimbol  "\%(\%(type\s\|data\s\|let\s\)\s*\)\@<=\h\%(\w\)*" contained
syn match   roySimbol  "[a-zA-Z][a-zA-Z0-9]*:"

"Braces,Parens
"syn match   royBraces "[{}]"
syn match   royParens  "[()]"

"Comment
syn match  royComment "//.*$" display contains=royTodo,@Spell
syn keyword royTodo   FIXME NOTE NOTES TODO XXX contained

"String
syn region royString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend

if version >= 508 || !exists("did_roy_syn_inits")
  if version <= 508
    let did_roy_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  
  HiLink royComment   Comment
  HiLink royString    String
  HiLink royStatement Statement
  HiLink roySimbol    Function
"  HiLink royBraces    Function
  HiLink royParens    Function
  HiLink royTodo      Todo

  delcommand HiLink
endif


let b:current_syntax = "roy"
