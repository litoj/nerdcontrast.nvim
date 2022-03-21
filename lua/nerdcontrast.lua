_G.colours = {
	None = {"NONE", "NONE"},
	Black = {"#222222", "0"},
	Violet = {"#9040a8", "5"},
	Magenta = {"#ad30a8", "5"}, -- 9d2098
	Pink = {"#c06680", "13"},
	Red = {"#cc2815", "1"},
	Brown = {"#885515", "3"},
	Orange = {"#cc6415", "3"},
	Yellow = {"#cfa815", "3"},
	Olive = {"#99a015", "2"},
	Green = {"#54a015", "2"},
	Cyan = {"#32a08d", "6"},
	Blue = {"#3268ad", "4"},
	Grey = {"#5a5856", "8"},
	LightGrey = {"#969390", "7"},
	LightViolet = {"#ad4dd0", "5"},
	LightMagenta = {"#bd40b7", "5"},
	LightPink = {"#e7909a", "13"},
	LightRed = {"#f03522", "9"},
	LightOrange = {"#f09322", "11"},
	LightYellow = {"#f0e822", "11"},
	LightOlive = {"#c0e022", "10"},
	LightGreen = {"#85f022", "10"},
	LightCyan = {"#80f0c8", "14"}, -- 50e8b0"
	LightBlue = {"#40a3e0", "12"},
	MarineBlue = {"#88c0e0", "12"},
	White = {"#f0eeea", "15"},
}

-- name=text type=fg/bg
local function genColour(name, type)
	return string.format(" gui%s=%s cterm%s=%s", type, colours[name][1], type, colours[name][2])
end

function _G.hi(group, fg, bg, extra, extra_colour)
	if fg then
		fg = genColour(fg, "fg")
	else
		fg = ""
	end
	if bg then
		bg = genColour(bg, "bg")
	else
		bg = ""
	end
	if extra then
		extra = string.format(" gui=%s cterm=%s", extra, extra)
		if extra_colour then
			extra_colour = " guisp=" .. colours[extra_colour][1]
		else
			extra_colour = ""
		end
	else
		extra = ""
		extra_colour = ""
	end
	vim.cmd(string.format("hi %s%s%s%s%s", group, fg, bg, extra, extra_colour))
end

colours.Highlight = colours.Green -- highlight
colours.LightHighlight = colours.LightGreen -- highlight
colours.Contrast = colours.Magenta -- contrast
colours.LightContrast = colours.LightMagenta -- contrast

for i, val in pairs(colours) do
	vim.cmd(string.format("hi %s guifg=%s ctermfg=%s", i, val[1], val[2]))
end

hi("Pmenu", "White", "None")
hi("PmenuSel", "Black", "Highlight")
hi("PmenuSbar", nil, "None")
hi("PmenuThumb", nil, "Highlight")

hi("Normal", "White", "None")
hi("Title", "LightHighlight", nil, "NONE")
hi("Search", "Black", "LightOlive", "bold")
hi("IncSearch", "Black", "LightOlive", "bold")
hi("Visual", nil, "Black", "reverse")
hi("SignColumn", "Grey", "None")
hi("FoldColumn", "Black", "None")
hi("Folded", "Highlight", "Black", "bold")
hi("CursorColumn", nil, "Black")
hi("CursorLine", nil, "Black")
hi("CursorLineNR", "LightGrey", "Black", "NONE")
hi("ColorColumn", nil, "Black")
hi("Function", "White", nil) -- , "bold")
hi("Comment", "LightGrey", nil, "italic")
hi("MatchParen", "LightYellow", "None", "italic,bold")
hi("VertSplit", "LightGrey", "Black", "NONE")
hi("StatusLineNC", "Black", "LightGrey")
hi("ErrorMsg", "LightRed", "None", "bold")
hi("WarningMsg", "LightOrange", "None", "bold")
hi("Question", "LightYellow", "None", "bold")
hi("Error", "None", "None", "undercurl", "LightRed")
hi("Todo", "Black", "Magenta", "bold,underline", "Blue")
hi("DiffAdd", "Green", "Black", "NONE")
hi("DiffChange", "Cyan", "Black", "NONE")
hi("DiffDelete", "Red", "Black", "NONE")
hi("DiffText", "Yellow", "Black", "NONE")
hi("Underlined", "LightBlue", "None", "underline", "LightBlue")
hi("Url", "LightGrey", "None", "italic")
hi("Constant", "Magenta", "None", "italic")
vim.cmd([[
hi link FloatBorder Magenta
hi clear LineNr
hi link LineNr Grey
hi clear StatusLine LightGrey
hi link StatusLine LightGrey 
hi clear NonText
hi link NonText Violet
hi clear SpecialKey
hi link SpecialKey NonText
hi clear Type
hi link Type Normal
hi link Keyword Blue
hi clear Special
hi link Special Keyword
hi link SpecialChar Orange
hi link Delimiter LightRed
hi link Operator Red
hi clear Statement
hi link Statement Keyword
hi clear PreProc
hi link PreProc Cyan
hi link Command LightBlue
hi link Define PreProc
hi link Conditional Command
hi link Repeat Command
hi link Include Keyword
hi link String Yellow
hi link Character LightYellow
hi link Number LightPink
hi link Boolean Keyword
hi clear Identifier
hi link Identifier Normal
hi link Variable Green
hi link Field LightGreen
hi link Parameter Olive
hi link TSField Field
hi link TSVariable Variable
hi link TSMath Number
hi link TSConstructor Identifier
hi link TSParameter Parameter
hi link TSKeywordOperator Keyword
hi link commentTSConstant Constant
hi link TSEnvironmentName Constant
hi link TSTagAttribute Parameter

hi link latexTSFunction TSVariable
hi link latexTSEnvironment Command

hi link luaTSConstructor Delimiter
"hi link luaTSField Normal

hi link sqlType String
hi link sqlStatement Command
hi link sqlOperator Operator

hi link cmakeVariableValue Variable
hi link cmakeVariable Variable
hi link cmakeEnvironment Constant
hi link cmakeArguments Olive
hi link cmakeEscaped SpecialChar

hi link markdownUrl Url
hi link markdownListMarker Delimiter
hi link markdownLinkTextDelimiter Delimiter
hi link markdownLinkDelimiter Delimiter
hi link markdownEscape SpecialChar
hi link markdownCode Cyan
hi link markdownCodeBlock LightGrey
hi link markdownItalicDelimiter Delimiter
hi link markdownBoldDelimiter Delimiter
hi link markdownBoldItalicDelimiter Delimiter
hi link shDeref Variable
hi link shShellVariables Variable
hi link shVariable Variable
hi link shQuote String
hi link shPosnParm Delimiter
hi link shArithmetic Operator
hi link shExpr Operator
hi link shOption Parameter
hi link shStatement Normal
hi link luaConstant Keyword
hi link luaTable Delimiter
hi link luaIn Repeat
hi link luaFunction Keyword

hi link xmlAttrib Type
hi link xmlEqual Operator
hi link xmlTag Delimiter
hi link xmlTagName Keyword

hi link yamlTSField TSKeyword

hi link bashTSConstant TSVariable
hi bashTSConstant gui=italic
hi link bashTSNone TSString

" Packer
hi link packerSuccess Title
hi link packerPackageName Title
hi link packerProgress Number
" NvimTree
hi! link NvimTreeIndentMarker Contrast
hi! link NvimTreeImageFile Yellow
hi! link NvimTreeGitDirty LightOrange
hi! link NvimTreeGitDeleted DiffDelete
hi! link NvimTreeGitMerge DiffChange
hi! link NvimTreeGitRenamed DiffChange
hi! link NvimTreeGitStaged DiffAdd
hi! link NvimTreeGitNew DiffAdd
hi! link NvimTreeRootFolder LightContrast
hi! link NvimTreeFolderIcon Highlight
"Startify
hi link StartifyHeader LightContrast
hi link StartifySection LightHighlight
hi link StartifyBracket Grey
hi link StartifyNumber Red
hi link StartifySpecial Black
hi link StartifyFooter Black
hi link StartifyPath LightGrey
hi link StartifySlash LightGrey
hi link StartifyFile White
"Barbar
hi link BufferVisible White
hi link BufferVisibleMod LightRed
hi link BufferVisibleSign LightContrast
hi link BufferCurrentSign LightHighlight
hi link BufferInactive LightGrey
hi link BufferInactiveMod Orange
hi link BufferInactiveSign LightGrey
]])

-- NvimTree
hi("NvimTreeExecFile", "LightGreen", nil, "bold")
hi("Directory", "Green", nil, "bold")
hi("NvimTreeSymlink", "Cyan", nil, "bold")
hi("NvimTreeSpecialFile", "Pink", nil, "bold")
hi("NvimTreeOpenedFile", "Violet", nil, "bold")

-- Barbar
hi("BufferCurrent", "White", nil, "bold")
hi("BufferCurrentMod", "LightRed", nil, "bold")
hi("BufferTabPages", "White", nil, "bold")

-- hi("ReferenceRead", nil, "Grey", "bold")
-- hi("ReferenceText", nil, "Grey", "bold")
-- hi("ReferenceWrite", nil, "Grey", "bold")
hi("DiagnosticVirtualTextError", "Red", nil, "italic,bold")
hi("DiagnosticVirtualTextWarn", "Orange", nil, "italic")
hi("DiagnosticVirtualTextHint", "LightGrey", nil, "italic")
hi("DiagnosticVirtualTextInfo", "LightGrey", nil, "italic")
hi("DiagnosticUnderlineError", nil, nil, "undercurl", "Red")
hi("DiagnosticUnderlineWarn", nil, nil, "undercurl", "Orange")
hi("DiagnosticUnderlineInfo", nil, nil, "undercurl", "LightGrey")
hi("DiagnosticUnderlineHint", nil, nil, "underline", "LightGrey")
hi("Todo", nil, "Contrast", "bold")
vim.cmd([[
hi clear DiagnosticError
hi link DiagnosticError Red
hi clear DiagnosticWarn
hi link DiagnosticWarn Orange
hi clear DiagnosticInfo
hi link DiagnosticInfo LightOlive
hi clear DiagnosticHint
hi link DiagnosticHint LightGrey
" Lspsaga
hi link LspSagaLightBulbSign LightYellow
hi link LspFloatWinBorder FloatBorder
hi link LspSagaCodeActionBorder LspFloatWinBorder
hi link LspSagaCodeActionTruncateLine LspFloatWinBorder
hi link LspSagaDefPreviewBorder LspFloatWinBorder
hi link LspSagaDocTruncateLine LspFloatWinBorder
hi link LspSagaDiagnosticBorder LspFloatWinBorder
hi link LspSagaDiagnosticTruncateLine LspFloatWinBorder
hi link LspSagaHoverBorder LspFloatWinBorder
hi link LspSagaLspFinderBorder LspFloatWinBorder
hi link LspSagaRenameBorder LspFloatWinBorder
hi link LspSagaSignatureHelpBorder LspFloatWinBorder
hi link LspSagaShTruncateLine LspFloatWinBorder
hi link LspSagaAutoPreview LightOlive
hi link DefinitionPreviewTitle LightOlive
hi link TargetWord LightOlive
hi link LspSagaCodeActionTitle LightOlive
hi link LspSagaCodeActionContent Olive
hi link LspSagaDiagnosticHeader LightOlive
hi link LspSagaFinderSelection LightOlive
hi link DefinitionCount  Red
hi link ReferencesCount  Red
" Telescope
hi link TelescopeBorder FloatBorder
hi link TelescopeNormal Pmenu
hi link TelescopeMultiSelection PmenuSel
" Git
hi link diffAdded DiffAdd
hi link diffChanged DiffChange
hi link diffDiffer DiffChange
hi link diffBDiffer diffDiffer
hi link diffRemoved DiffRemove
hi link gitcommitSummary Title
hi link gitcommitHeader Title
" Cmp
hi link CmpItemKindDefault Delimiter
hi link CmpItemKindTextDefault String
hi link CmpItemKindKeywordDefault Keyword
hi link CmpItemKindFunctionDefault Command
hi link CmpItemKindMethodDefault Command
hi link CmpItemKindKeywordDefault Keyword
hi link CmpItemKindTableDefault Parameter
hi link CmpItemKindFieldDefault Field
hi link CmpItemKindVariableDefault Variable
hi link CmpItemKindEnumDefault Constant
hi link CmpItemKindEnumMemberDefault Constant
hi link CmpItemKindConstantDefault Constant
hi link CmpItemKindPropertyDefault String
hi link CmpItemKindUnitDefault Number
hi link CmpItemKindValueDefault Number
hi link CmpItemKindFileDefault Brown
hi link CmpItemKindFolderDefault Brown
hi link CmpItemKindOperatorDefault Operator
hi link CmpItemKindSnippetDefault Macro
]])

hi("TelescopeSelection", "LightHighlight", "Grey", "bold")
hi("TelescopeMatching", "LightOrange")
hi("TelescopePromptPrefix", "LightHighlight")
