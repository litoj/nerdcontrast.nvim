" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Todo
syn keyword makeTodo TODO FIXME XXX contained

" Comment
" Comments are started with a # and can only be used at the beginning of a line
syn match makeComment /^\s*#.*$/ contains=makeTodo
syn match makeNumber /[= (-][0-9.]\+\([ )]\|$\)/ contained contains=makeSep
syn match makeOperator /[\\*><|]/ contained

syn match makeSep /[+:=]/ contained
syn match makeValue /[+:]\?=.*[^\\]$/ contains=makeVarCall,makeEscapedChar,makeNumber,makeSep contained
syn region makeValue start=/[+:]\?=.*\\$/ end=/[^\\]$/ contains=makeVarCall,makeNumber,makeOperator,makeSep,makeEscapedChar contained

" Variable
syn match makeVarRepl /:.*=[^)]*/ contains=makeSep contained
syn match makeVariable /[0-9A-Za-z_]\+/ contained
syn match makeVarCall /\$([0-9A-Za-z_.:=]\+)/ contains=makeVariable,makeVarRepl contained
syn match makeVarLine /[0-9A-Za-z_]\+\s*[+:]\?=\s*.*/ contains=makeVariable,makeValue

syn match makeEscapedChar "\\[^$]"
syn match makeSpecial /^\.[A-Z_]\+ \?:\(\s*[0-9a-zA-Z_]\)*/ contains=makeSep,makeValue

syn match makeInclKeyword /^include/ contained
syn match makeInclude /^include [^ ]\+$/ contains=makeInclKeyword

syn match makeDeps /:.*$/ contains=makeSep,makeVarCall,makeVarLine contained
syn match makeTarget /^\([^.][^ :=]*\|\$([^ =]*)\):\( .*\)\?$/ contains=makeDeps,makeVarCall

" Command
syn match makeSilent "^\t@" contained
syn match makeParameter / -[^ ]\+/ contained contains=makeNumber,makeVarCall
syn match makeParams / .*[^\\]$/ contained contains=makeVarCall,makeOperator,makeNumber,makeParameter
syn region makeParams start=/ .*\\$/ end=/[^\\]$/ contained contains=makeVarCall,makeOperator,makeNumber,makeParameter keepend
syn match makeCommand /^\t[^ ]\+ .*/ contains=makeSilent,makeVarCall,makeParams

" Define the highlighting.
hi def link makeTodo Todo
hi def link makeComment Comment
hi def link makeNumber Number
hi def link makeOperator Operator
hi def link makeSep Operator
hi def link makeValue String
hi def link makeVarRepl Normal
hi def link makeVariable Variable
hi def link makeVarCall Delimiter
hi def link makeEscapedChar SpecialChar
hi def link makeSpecial Special
hi def link makeInclKeyword Keyword
hi def link makeInclude String
hi def link makeDeps PreProc
hi def link makeTarget Function
hi def link makeSilent Keyword
hi def link makeParameter Parameter
hi def link makeParams String

let b:current_syntax = "make"
