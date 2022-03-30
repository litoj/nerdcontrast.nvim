_G.colors = {
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
local function genColor(name, type)
	return string.format(" gui%s=%s cterm%s=%s", type, colors[name][1], type, colors[name][2])
end

function _G.hi(group, fg, bg, extra, extra_color)
	if fg then
		fg = genColor(fg, "fg")
	else
		fg = ""
	end
	if bg then
		bg = genColor(bg, "bg")
	else
		bg = ""
	end
	if extra then
		extra = string.format(" gui=%s cterm=%s", extra, extra)
		if extra_color then
			extra_color = " guisp=" .. colors[extra_color][1]
		else
			extra_color = ""
		end
	else
		extra = ""
		extra_color = ""
	end
	vim.cmd(string.format("hi %s%s%s%s%s", group, fg, bg, extra, extra_color))
end

for i, val in pairs(colors) do vim.cmd(string.format("hi %s guifg=%s ctermfg=%s", i, val[1], val[2])) end

colors.Bg = colors.Black
colors.Fg = colors.White

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

vim.cmd([[
hi link Highlight Green
hi link LightHighlight LightGreen
hi link Contrast Magenta
hi link LightContrast LightMagenta
]])

local highlights = {
	{"Pmenu", "Fg", "None"},
	{"PmenuSel", "Bg", "Highlight"},
	{"Visual", nil, "Bg", "reverse"},
	{"Search", "Bg", "LightOlive", "bold"},
	{"IncSearch", "Bg", "LightOlive", "bold"},
	{"FoldColumn", "Bg", "None"},
	{"Folded", "LightGrey", "Bg", "bold"},
	{"CursorColumn", "None", "Bg"},
	{"CursorLine", "None", "Bg"},
	{"CursorLineNR", "LightGrey", "Bg", "NONE"},
	{"VertSplit", "LightGrey", "Bg", "NONE"},
	{"StatusLineNC", "Bg", "LightGrey"},
	{"Todo", "Bg", "Contrast", "bold"},
	{"DiffAdd", "Green", "Bg", "NONE"},
	{"DiffChange", "Cyan", "Bg", "NONE"},
	{"DiffDelete", "Red", "Bg", "NONE"},
	{"DiffText", "Yellow", "Bg", "NONE"},
	-- {"luaTSField", "Fg"},
}

function _G.hiTheme(group, fg, bg, extra, extra_color)
	table.insert(highlights, {group, fg, bg, extra, extra_color})
end

hi("PmenuSbar", nil, "None")
hi("PmenuThumb", nil, "Highlight")

hi("SignColumn", "Grey", "None")
hi("Comment", "LightGrey", nil, "italic")
hi("Title", "LightHighlight", nil, "NONE")
hi("MatchParen", "LightYellow", "None", "italic,bold")
hi("ErrorMsg", "LightRed", "None", "bold")
hi("WarningMsg", "LightOrange", "None", "bold")
hi("Question", "LightYellow", "None", "bold")
hi("Error", "None", "None", "undercurl", "LightRed")
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
hi link Function Normal
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
hi link StartifySpecial Bg
hi link StartifyFooter Bg
hi link StartifyPath LightGrey
hi link StartifySlash LightGrey
hi link StartifyFile Fg
"Barbar
hi link BufferVisible Fg
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
hiTheme("BufferCurrent", "Fg", nil, "bold")
hi("BufferCurrentMod", "LightRed", nil, "bold")
vim.cmd("hi link BufferTabPager BufferCurrent")

-- hiTheme("ReferenceRead", nil, "Grey", "bold")
-- hiTheme("ReferenceText", nil, "Grey", "bold")
-- hiTheme("ReferenceWrite", nil, "Grey", "bold")
hi("DiagnosticVirtualTextError", "Red", nil, "italic,bold")
hi("DiagnosticVirtualTextWarn", "Orange", nil, "italic")
hi("DiagnosticVirtualTextHint", "LightGrey", nil, "italic")
hi("DiagnosticVirtualTextInfo", "LightGrey", nil, "italic")
hi("DiagnosticUnderlineError", nil, nil, "undercurl", "Red")
hi("DiagnosticUnderlineWarn", nil, nil, "undercurl", "Orange")
hi("DiagnosticUnderlineInfo", nil, nil, "undercurl", "LightGrey")
hi("DiagnosticUnderlineHint", nil, nil, "underline", "LightGrey")
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
hi link CmpItemMenuDefault Pmenu
hi link CmpItemAbbrDefault Pmenu
hi link CmpItemAbbrMatch Pmenu
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

return function()
	if vim.g.WhiteTheme then
		colors.Fg = colors.Black
		colors.Bg = colors.White
		vim.g.terminal_color_15 = colors.Black[1]
		vim.g.terminal_color_0 = colors.White[1]
		vim.cmd([[
hi link Fg Black
hi link Bg White
]])
		vim.cmd("hi Normal ctermfg=0 ctermbg=15 guifg=#000000 guibg=#ffffff")
	else
		colors.Bg = colors.Black
		colors.Fg = colors.White
		vim.g.terminal_color_0 = colors.Black[1]
		vim.g.terminal_color_15 = colors.White[1]
		vim.cmd([[
hi link Bg Black
hi link Fg White
		]])
		vim.cmd("hi Normal ctermfg=15 ctermbg=0 guifg=#f0eeea guibg=NONE")
	end
	for _, v in pairs(highlights) do hi(v[1], v[2], v[3], v[4], v[5]) end
end
