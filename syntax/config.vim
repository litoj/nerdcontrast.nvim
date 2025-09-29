" Vim syntax file
" Language: toml with edits for common config styles support

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

setlocal commentstring=#%s

" define the config syntax
syn match   configComment   "\(dnl\|#\|//\).*" contains=@Spell
syn match   configComment   "^\s*;.*"
syn region  configComment   start="\(\s\|^\)\zs/\*" end="\*/" contains=@Spell
syn match   configDelimiter "[()\[\];,:{}]"
syn match   configOperator  "[=|&\*\+\<\>.]"
syn match   configOption    "\s-[A-Za-z-]\w*"
syn match   configNumber    "[-+ ]*\d[.0-9]*" contained contains=configOperator
syn match   configHex       "[0-9A-Za-f]\{6\}" contained
syn keyword configBool true false yes no auto contained
syn cluster configContent   contains=configBool,configNumber,configOperator,configDelimiter,configHex,configOption

syn match   configValue    "[^=].*$" contained contains=@configContent,@configString
syn match   configVariable "[^ =#'"./;][^ =#'"]*\s*=" contained contains=configOperator
syn match   configLine     "^\s*[^ =#'"./;][^ =#'"]*\s*=.*$" contains=configVariable,configValue,configNumber
syn match   configField    "[0-9A-Za-z_:=-]\+\s*{" contained contains=configDelimiter
syn match   configLabel    "^\[[0-9A-Za-z_ -]\+\]$" contains=configDelimiter
syn region  configBlock    start=".*{$" end="}$" contains=configField,configDelimiter,configComment,configLine,@configString,configOperator transparent

" This shortens the script, see syn-ext-match..
syn region  configStrS   start=+'+ end=+'+ contains=@configContent,configStrD,configStrB keepend
syn region  configStrD   start=+"+ skip=+\\"+ end=+"+ contains=@configContent,configStrS,configStrB keepend
syn region  configStrB   start=+`+ skip=+\\`+ end=+`+ contains=@configContent,configStrD,configStrS keepend
syn cluster configString contains=configStrS,configStrD,configStrB

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link configComment   Comment
hi def link configDelimiter Delimiter
hi def link configOperator  Operator
hi def link configNumber    Number
hi def link configOption    shOption
hi def link configBool      Boolean
hi def link configVariable  Variable
hi def link configField     Field
hi def link configString    String
hi def link configStrS      configString
hi def link configStrD      configString
hi def link configStrB      configString
hi def link configHex       Constant


let b:current_syntax = "config"

