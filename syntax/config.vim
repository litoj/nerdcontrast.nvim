" Vim syntax file
" Language: toml with edits for common config styles support

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

setlocal commentstring=#%s

" define the config syntax
syn match   configDelimiter "[()\[\];,:{}]"
syn match   configOperator  "[=|&\*\+\<\>.]"
syn match   configComment   "\(dnl.*\)\|\(\(#\|//\).*\)" contains=@Spell
syn region  configComment   start="/\*" end="\*/" contains=@Spell
syn match   configNumber    "[-+ ]*\d[.0-9]*" contained contains=configOperator
syn match   configHex       "[a-f0-9]\{6\}" contained
syn match   configValue    "[^=]*$" contained contains=configNumber,configOperator,configDelimiter,configKeyword,configHex
syn match   configVariable "\w\+\s*=" contained contains=configOperator
syn match   configLine     "^\s*\w\+\s*=.*$" contains=configVariable,configValue,configNumber
syn match   configLabel    "\w\+\s*{" contained contains=configDelimiter
syn region  configBlock    start=".*{$" end="}$" contains=configLabel,configDelimiter,configComment,configLine,configString,configOperator transparent

" This shortens the script, see syn-ext-match..
syn region  configString    start=+\z(["'`]\)+ skip=+\\\z1+ end=+\z1+ contains=@Spell

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link configDelimiter Delimiter
hi def link configOperator  Operator
hi def link configComment   Comment
hi def link configNumber    Number
hi def link configVariable  Variable
hi def link configLabel     @field
hi def link configString    String
hi def link configHex       Constant
hi def link configValue     String


let b:current_syntax = "config"

