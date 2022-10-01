_G.colors = {
	None = {"NONE", "NONE"},
	Black = {"#222222", 0},
	Violet = {"#8040ad", 5},
	Magenta = {"#ad30a8", 5}, -- 9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cfa815", 3},
	Olive = {"#99a015", 2},
	Green = {"#54a015", 2},
	Cyan = {"#32a08d", 6},
	Blue = {"#3268ad", 4},
	Grey = {"#5a5856", 8},
	LightGrey = {"#969390", 7},
	LightViolet = {"#a04ddd", 5},
	LightMagenta = {"#bd40b7", 5},
	LightPink = {"#e7909a", 13},
	LightRed = {"#f03522", 9},
	LightOrange = {"#f09322", 11},
	LightYellow = {"#f0e822", 11},
	LightOlive = {"#c0e022", 10},
	LightGreen = {"#77dd22", 10},
	LightCyan = {"#80f0c8", 14}, -- 50e8b0"
	LightBlue = {"#40a3e0", 12},
	MarineBlue = {"#88c0e0", 12},
	White = {"#f0eeea", 15},
}

function _G.hi(group, opts, extra)
	if not extra then extra = {} end
	if opts.fg then
		extra.fg = _G.colors[opts.fg][1]
		extra.ctermfg = _G.colors[opts.fg][2]
	end
	if opts.bg then
		extra.bg = _G.colors[opts.bg][1]
		extra.ctermbg = _G.colors[opts.bg][2]
	end
	if opts.sp then extra.sp = _G.colors[opts.sp][1] end
	vim.api.nvim_set_hl(0, group, extra)
end

function _G.hl(group, link) vim.api.nvim_set_hl(0, group, {link = link}) end

for i, val in pairs(colors) do vim.api.nvim_set_hl(0, i, {fg = val[1], ctermfg = val[2]}) end

colors.Bg = colors.Black
colors.Fg = colors.White

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

hl("Highlight", "Green")
hl("LightHighlight", "LightGreen")
hl("Contrast", "Magenta")
hl("LightContrast", "LightMagenta")

local highlights = {
	{"Pmenu", {fg = "Fg", bg = "None"}},
	{"PmenuSel", {fg = "Bg", bg = "Highlight"}},
	{"Visual", {bg = "Bg"}, {reverse = true}},
	{"Search", {fg = "Bg", bg = "LightOlive"}, {bold = true}},
	{"IncSearch", {fg = "Bg", bg = "LightOlive"}, {bold = true}},
	{"FoldColumn", {fg = "Bg", bg = "None"}},
	{"Folded", {fg = "LightGrey", bg = "Bg"}, {bold = true}},
	{"CursorColumn", {fg = "None", bg = "Bg"}},
	{"CursorLine", {fg = "None", bg = "Bg"}},
	{"CursorLineNR", {fg = "LightGrey", bg = "Bg"}},
	{"VertSplit", {fg = "LightGrey", bg = "Bg"}},
	{"StatusLineNC", {fg = "Bg", bg = "LightGrey"}},
	{"Todo", {fg = "Bg", bg = "Contrast"}, {bold = true}},
	{"DiffAdd", {fg = "Green", bg = "Bg"}},
	{"DiffChange", {fg = "Cyan", bg = "Bg"}},
	{"DiffDelete", {fg = "Red", bg = "Bg"}},
	{"DiffText", {fg = "Yellow", bg = "Bg"}},
	{"LspReferenceRead", {bg = "Bg"}, {bold = true}},
	{"LspReferenceText", {bg = "Bg"}, {bold = true}},
	{"LspReferenceWrite", {bg = "Bg"}, {bold = true}},
}

function _G.hiTheme(group, opts, extra) table.insert(highlights, {group, opts, extra}) end

hi("PmenuSbar", {bg = "None"})
hi("PmenuThumb", {bg = "Highlight"})
hi("SignColumn", {fg = "Grey", bg = "None"})
hi("Comment", {fg = "LightGrey"}, {italic = true})
hi("Title", {fg = "LightHighlight"})
hi("MatchParen", {fg = "LightYellow", bg = "None"}, {italic = true, bold = true})
hi("ErrorMsg", {fg = "LightRed", bg = "None"}, {bold = true})
hi("WarningMsg", {fg = "LightOrange", bg = "None"}, {bold = true})
hi("Question", {fg = "LightYellow", bg = "None"}, {bold = true})
hi("Error", {fg = "None", bg = "None", sp = "LightRed"}, {undercurl = true})
hi("Underlined", {fg = "LightBlue", bg = "None", sp = "LightBlue"}, {underline = true})
hi("Url", {fg = "LightGrey", bg = "None"}, {italic = true})
hi("Constant", {fg = "Magenta", bg = "None"}, {italic = true})
hl("FloatBorder", "Magenta")
hl("LineNr", "Grey")
hl("StatusLine", "LightGrey")
hl("NonText", "Violet")
hl("SpecialKey", "NonText")
hl("Type", "Fg")
hl("Function", "Fg")
hl("Keyword", "Blue")
hl("Special", "Keyword")
hl("SpecialChar", "Orange")
hl("Delimiter", "LightRed")
hl("Operator", "Red")
hl("Statement", "Keyword")
hl("PreProc", "Cyan")
hl("Command", "LightBlue")
hl("Define", "PreProc")
hl("Conditional", "Command")
hl("Repeat", "Command")
hl("Include", "Keyword")
hl("String", "Yellow")
hl("Character", "LightYellow")
hl("Number", "LightPink")
hl("Boolean", "Keyword")
vim.cmd "hi clear Identifier"
hl("Variable", "Green")
hl("Field", "LightGreen")
hl("Parameter", "Olive")
hl("TSField", "Field")
hl("TSVariable", "Variable")
hl("TSMath", "Number")
hl("TSConstructor", "Identifier")
hl("TSParameter", "Parameter")
hl("TSKeywordOperator", "Keyword")
hl("@constant.comment", "Constant")
hl("TSEnvironmentName", "Constant")
hl("TSTagAttribute", "Parameter")

hl("@function.latex", "TSVariable")
hl("@environment.latex", "Command")

hl("@constructor.lua", "Delimiter")

hl("sqlType", "String")
hl("sqlStatement", "Command")
hl("sqlOperator", "Operator")

hl("cmakeVariableValue", "Variable")
hl("cmakeVariable", "Variable")
hl("cmakeEnvironment", "Constant")
hl("cmakeArguments", "Olive")
hl("cmakeEscaped", "SpecialChar")

hl("markdownUrl", "Url")
hl("markdownListMarker", "Delimiter")
hl("markdownLinkTextDelimiter", "Delimiter")
hl("markdownLinkDelimiter", "Delimiter")
hl("markdownEscape", "SpecialChar")
hl("markdownCode", "Cyan")
hl("markdownCodeBlock", "LightGrey")
hl("markdownItalicDelimiter", "Delimiter")
hl("markdownBoldDelimiter", "Delimiter")
hl("markdownBoldItalicDelimiter", "Delimiter")
hl("shDeref", "Variable")
hl("shShellVariables", "Variable")
hl("shVariable", "Variable")
hl("shQuote", "String")
hl("shPosnParm", "Delimiter")
hl("shArithmetic", "Operator")
hl("shExpr", "Operator")
hl("shOption", "Parameter")
hl("shStatement", "Fg")

hl("xmlAttrib", "Type")
hl("xmlEqual", "Operator")
hl("xmlTag", "Delimiter")
hl("xmlTagName", "Keyword")

hl("@field.yaml", "TSKeyword")

hi("@constant.bash", {fg = "LightGreen"}, {italic = true})
hl("@none.bash", "TSString")

-- Packer
hl("packerSuccess", "Title")
hl("packerPackageName", "Title")
hl("packerProgress", "Number")
-- NvimTree
hl("NvimTreeIndentMarker", "Contrast")
hl("NvimTreeImageFile", "Yellow")
hl("NvimTreeGitDirty", "LightOrange")
hl("NvimTreeGitDeleted", "DiffDelete")
hl("NvimTreeGitMerge", "DiffChange")
hl("NvimTreeGitRenamed", "DiffChange")
hl("NvimTreeGitStaged", "DiffAdd")
hl("NvimTreeGitNew", "DiffAdd")
hl("NvimTreeRootFolder", "LightContrast")
hl("NvimTreeFolderIcon", "Highlight")
-- Startify
hl("StartifyHeader", "LightContrast")
hl("StartifySection", "LightHighlight")
hl("StartifyBracket", "Grey")
hl("StartifyNumber", "Red")
hl("StartifySpecial", "Bg")
hl("StartifyFooter", "Bg")
hl("StartifyPath", "LightGrey")
hl("StartifySlash", "LightGrey")
hl("StartifyFile", "Fg")
-- Barbar
hl("BufferVisible", "Fg")
hl("BufferVisibleMod", "LightRed")
hl("BufferVisibleSign", "LightContrast")
hl("BufferCurrentSign", "LightHighlight")
hl("BufferInactive", "LightGrey")
hl("BufferInactiveMod", "Orange")
hl("BufferInactiveSign", "LightGrey")

-- NvimTree
hi("NvimTreeExecFile", {fg = "LightGreen"}, {bold = true})
hi("Directory", {fg = "Green"}, {bold = true})
hi("NvimTreeSymlink", {fg = "Cyan"}, {bold = true})
hi("NvimTreeSpecialFile", {fg = "Pink"}, {bold = true})
hi("NvimTreeOpenedFile", {fg = "Violet"}, {bold = true})

-- Barbar
hiTheme("BufferCurrent", {fg = "Fg"}, {bold = true})
hi("BufferCurrentMod", {fg = "LightRed"}, {bold = true})
hl("BufferTabPager", "BufferCurrent")

hi("DiagnosticVirtualTextError", {fg = "Red"}, {italic = true, bold = true})
hi("DiagnosticVirtualTextWarn", {fg = "Orange"}, {italic = true})
hi("DiagnosticVirtualTextHint", {fg = "LightGrey"}, {italic = true})
hi("DiagnosticVirtualTextInfo", {fg = "LightGrey"}, {italic = true})
hi("DiagnosticUnderlineError", {sp = "Red"}, {undercurl = true})
hi("DiagnosticUnderlineWarn", {sp = "Orange"}, {undercurl = true})
hi("DiagnosticUnderlineInfo", {sp = "LightGrey"}, {undercurl = true})
hi("DiagnosticUnderlineHint", {sp = "LightGrey"}, {underline = true})
hl("i3ConfigCommand", "Command")
hl("DiagnosticError", "Red")
hl("DiagnosticWarn", "Orange")
hl("DiagnosticInfo", "LightOlive")
hl("DiagnosticHint", "LightGrey")
-- Lspsaga
hl("LspSagaLightBulbSign", "LightYellow")
hl("LspFloatWinBorder", "FloatBorder")
hl("LspSagaCodeActionBorder", "LspFloatWinBorder")
hl("LspSagaCodeActionTruncateLine", "LspFloatWinBorder")
hl("LspSagaDefPreviewBorder", "LspFloatWinBorder")
hl("LspSagaDocTruncateLine", "LspFloatWinBorder")
hl("LspSagaDiagnosticBorder", "LspFloatWinBorder")
hl("LspSagaDiagnosticTruncateLine", "LspFloatWinBorder")
hl("LspSagaHoverBorder", "LspFloatWinBorder")
hl("LspSagaLspFinderBorder", "LspFloatWinBorder")
hl("LspSagaRenameBorder", "LspFloatWinBorder")
hl("LspSagaSignatureHelpBorder", "LspFloatWinBorder")
hl("LspSagaShTruncateLine", "LspFloatWinBorder")
hl("LspSagaAutoPreview", "LightOlive")
hl("DefinitionPreviewTitle", "LightOlive")
hl("TargetWord", "LightOlive")
hl("LspSagaCodeActionTitle", "LightOlive")
hl("LspSagaCodeActionContent", "Olive")
hl("LspSagaDiagnosticHeader", "LightOlive")
hl("LspSagaFinderSelection", "LightOlive")
hl("DefinitionCount", "Red")
hl("ReferencesCount", "Red")
-- Telescope
hl("TelescopeBorder", "FloatBorder")
hl("TelescopeNormal", "Pmenu")
hl("TelescopeMultiSelection", "PmenuSel")
-- Git
hl("diffAdded", "DiffAdd")
hl("diffChanged", "DiffChange")
hl("diffDiffer", "DiffChange")
hl("diffBDiffer", "diffDiffer")
hl("diffRemoved", "DiffRemove")
hl("gitcommitSummary", "Title")
hl("gitcommitHeader", "Title")
-- Cmp
hl("CmpItemMenuDefault", "Pmenu")
hl("CmpItemAbbrDefault", "Pmenu")
hl("CmpItemAbbrMatch", "Pmenu")
hl("CmpItemKindDefault", "Delimiter")
hl("CmpItemKindTextDefault", "String")
hl("CmpItemKindKeywordDefault", "Keyword")
hl("CmpItemKindFunctionDefault", "Command")
hl("CmpItemKindMethodDefault", "Command")
hl("CmpItemKindKeywordDefault", "Keyword")
hl("CmpItemKindTableDefault", "Parameter")
hl("CmpItemKindFieldDefault", "Field")
hl("CmpItemKindVariableDefault", "Variable")
hl("CmpItemKindEnumDefault", "Constant")
hl("CmpItemKindEnumMemberDefault", "Constant")
hl("CmpItemKindConstantDefault", "Constant")
hl("CmpItemKindPropertyDefault", "String")
hl("CmpItemKindUnitDefault", "Number")
hl("CmpItemKindValueDefault", "Number")
hl("CmpItemKindFileDefault", "Brown")
hl("CmpItemKindFolderDefault", "Brown")
hl("CmpItemKindOperatorDefault", "Operator")
hl("CmpItemKindSnippetDefault", "Macro")

hi("TelescopeSelection", {fg = "LightHighlight", bg = "Grey"}, {bold = true})
hi("TelescopeMatching", {fg = "LightOrange"})
hi("TelescopePromptPrefix", {fg = "LightHighlight"})

return function()
	if vim.g.WhiteTheme then
		colors.Fg = colors.Black
		colors.Bg = colors.White
		vim.g.terminal_color_15 = colors.Black[1]
		vim.g.terminal_color_0 = colors.White[1]
		hl("Fg", "Black")
		hl("Bg", "White")
		vim.cmd("hi Normal ctermfg=0 ctermbg=15 guifg=#000000 guibg=#ffffff")
	else
		colors.Bg = colors.Black
		colors.Fg = colors.White
		vim.g.terminal_color_0 = colors.Black[1]
		vim.g.terminal_color_15 = colors.White[1]
		hl("Bg", "Black")
		hl("Fg", "White")
		vim.cmd("hi Normal ctermfg=15 ctermbg=0 guifg=#f0eeea guibg=NONE")
	end
	for _, v in pairs(highlights) do hi(v[1], v[2], v[3]) end
end
