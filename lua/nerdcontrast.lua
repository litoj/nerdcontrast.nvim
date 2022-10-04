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

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

local themeDep = {
	Pmenu = {{fg = "Fg"}},
	PmenuSel = {{fg = "Bg", bg = "Highlight"}},
	Visual = {{bg = "Bg", reverse = true}},
	Search = {{fg = "Bg", bg = "LightOlive"}, {bold = true}},
	IncSearch = {{fg = "Bg", bg = "LightOlive"}, {bold = true}},
	FoldColumn = {{fg = "Bg"}},
	Folded = {{fg = "LightGrey", bg = "Bg"}, {bold = true}},
	CursorColumn = {{bg = "Bg"}},
	CursorLine = {{bg = "Bg"}},
	CursorLineNR = {{fg = "LightGrey", bg = "Bg"}},
	VertSplit = {{fg = "LightGrey", bg = "Bg"}},
	StatusLineNC = {{fg = "Bg", bg = "LightGrey"}},
	Todo = {{fg = "Bg", bg = "Contrast"}, {bold = true}},
	DiffAdd = {{fg = "Green", bg = "Bg"}},
	DiffChange = {{fg = "Cyan", bg = "Bg"}},
	DiffDelete = {{fg = "Red", bg = "Bg"}},
	DiffText = {{fg = "Yellow", bg = "Bg"}},
	LspReferenceRead = {{bg = "Bg"}, {bold = true}},
	LspReferenceText = {{bg = "Bg"}, {bold = true}},
	LspReferenceWrite = {{bg = "Bg"}, {bold = true}},
	BufferCurrent = {{fg = "Fg"}, {bold = true}},
}

local highlights = {
	Highlight = "Green",
	LightHighlight = "LightGreen",
	Contrast = "Magenta",
	LightContrast = "LightMagenta",
	-- Basics
	PmenuSbar = {},
	PmenuThumb = {bg = "Highlight"},
	SignColumn = {fg = "Grey"},
	Comment = {fg = "LightGrey", italic = true},
	Title = {fg = "LightHighlight"},
	MatchParen = {fg = "LightYellow", italic = true, bold = true},
	ErrorMsg = {fg = "LightRed", bold = true},
	WarningMsg = {fg = "LightOrange", bold = true},
	Question = {fg = "LightYellow", bold = true},
	Error = {sp = "LightRed", undercurl = true},
	Underlined = {fg = "LightBlue", sp = "LightBlue", underline = true},
	Url = {fg = "LightGrey", italic = true},
	Constant = {fg = "Magenta", italic = true},
	FloatBorder = "Magenta",
	LineNr = "Grey",
	StatusLine = "LightGrey",
	NonText = "Violet",
	SpecialKey = "NonText",
	Type = "Fg",
	Function = "Fg",
	Keyword = "Blue",
	Special = "Keyword",
	SpecialChar = "Orange",
	Delimiter = "LightRed",
	Operator = "Red",
	Statement = "Keyword",
	PreProc = "Cyan",
	Command = "LightBlue",
	Define = "PreProc",
	Conditional = "Command",
	Repeat = "Command",
	Include = "Keyword",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Boolean = "Keyword",
	Identifier = "Normal",
	Variable = "Green",
	Field = "LightGreen",
	Parameter = "Olive",
	-- TreeSitter
	TSField = "Field",
	TSVariable = "Variable",
	TSMath = "Number",
	TSConstructor = "Identifier",
	TSParameter = "Parameter",
	TSKeywordOperator = "Keyword",
	TSEnvironmentName = "Constant",
	TSTagAttribute = "Parameter",
	-- TreeSitter language highlight changes
	["@constant.comment"] = "Constant",
	["@function.latex"] = "TSVariable",
	["@environment.latex"] = "Command",
	["@constructor.lua"] = "Delimiter",
	["@field.yaml"] = "TSKeyword",
	["@constant.bash"] = {fg = "LightGreen", italic = true},
	["@none.bash"] = "TSString",
	-- Vim syntax highlight changes
	sqlType = "String",
	sqlStatement = "Command",
	sqlOperator = "Operator",

	cmakeVariableValue = "Variable",
	cmakeVariable = "Variable",
	cmakeEnvironment = "Constant",
	cmakeArguments = "Olive",
	cmakeEscaped = "SpecialChar",

	markdownUrl = "Url",
	markdownListMarker = "Delimiter",
	markdownLinkTextDelimiter = "Delimiter",
	markdownLinkDelimiter = "Delimiter",
	markdownEscape = "SpecialChar",
	markdownCode = "Cyan",
	markdownCodeBlock = "LightGrey",
	markdownItalicDelimiter = "Delimiter",
	markdownBoldDelimiter = "Delimiter",
	markdownBoldItalicDelimiter = "Delimiter",
	shDeref = "Variable",
	shShellVariables = "Variable",
	shVariable = "Variable",
	shQuote = "String",
	shPosnParm = "Delimiter",
	shArithmetic = "Operator",
	shExpr = "Operator",
	shOption = "Parameter",
	shStatement = "Fg",

	xmlAttrib = "Type",
	xmlEqual = "Operator",
	xmlTag = "Delimiter",
	xmlTagName = "Keyword",

	i3ConfigCommand = "Command",

	diffAdded = "DiffAdd",
	diffChanged = "DiffChange",
	diffDiffer = "DiffChange",
	diffBDiffer = "diffDiffer",
	diffRemoved = "DiffRemove",
	gitcommitSummary = "Title",
	gitcommitHeader = "Title",

	-- Packer
	packerSuccess = "Title",
	packerPackageName = "Title",
	packerProgress = "Number",
	-- NvimTree
	NvimTreeIndentMarker = "Contrast",
	NvimTreeImageFile = "Yellow",
	NvimTreeGitDirty = "LightOrange",
	NvimTreeGitDeleted = "DiffDelete",
	NvimTreeGitMerge = "DiffChange",
	NvimTreeGitRenamed = "DiffChange",
	NvimTreeGitStaged = "DiffAdd",
	NvimTreeGitNew = "DiffAdd",
	NvimTreeRootFolder = "LightContrast",
	NvimTreeFolderIcon = "Highlight",
	-- Startify
	StartifyHeader = "LightContrast",
	StartifySection = "LightHighlight",
	StartifyBracket = "Grey",
	StartifyNumber = "Red",
	StartifySpecial = "Bg",
	StartifyFooter = "Bg",
	StartifyPath = "LightGrey",
	StartifySlash = "LightGrey",
	StartifyFile = "Fg",
	-- Barbar
	BufferVisible = "Fg",
	BufferVisibleMod = "LightRed",
	BufferVisibleSign = "LightContrast",
	BufferCurrentSign = "LightHighlight",
	BufferInactive = "LightGrey",
	BufferInactiveMod = "Orange",
	BufferInactiveSign = "LightGrey",
	-- NvimTree
	NvimTreeExecFile = {fg = "LightGreen", bold = true},
	Directory = {fg = "Green", bold = true},
	NvimTreeSymlink = {fg = "Cyan", bold = true},
	NvimTreeSpecialFile = {fg = "Pink", bold = true},
	NvimTreeOpenedFile = {fg = "Violet", bold = true},
	-- Barbar
	BufferCurrentMod = {fg = "LightRed", bold = true},
	BufferTabPager = "BufferCurrent",
	-- Lsp
	DiagnosticVirtualTextError = {fg = "Red", italic = true, bold = true},
	DiagnosticVirtualTextWarn = {fg = "Orange", italic = true},
	DiagnosticVirtualTextHint = {fg = "LightGrey", italic = true},
	DiagnosticVirtualTextInfo = {fg = "LightGrey", italic = true},
	DiagnosticUnderlineError = {sp = "Red", undercurl = true},
	DiagnosticUnderlineWarn = {sp = "Orange", undercurl = true},
	DiagnosticUnderlineInfo = {sp = "LightGrey", undercurl = true},
	DiagnosticUnderlineHint = {sp = "LightGrey", underline = true},
	DiagnosticError = "Red",
	DiagnosticWarn = "Orange",
	DiagnosticInfo = "LightOlive",
	DiagnosticHint = "LightGrey",
	-- Lspsaga
	LspSagaLightBulbSign = "LightYellow",
	LspFloatWinBorder = "FloatBorder",
	LspSagaCodeActionBorder = "LspFloatWinBorder",
	LspSagaCodeActionTruncateLine = "LspFloatWinBorder",
	LspSagaDefPreviewBorder = "LspFloatWinBorder",
	LspSagaDocTruncateLine = "LspFloatWinBorder",
	LspSagaDiagnosticBorder = "LspFloatWinBorder",
	LspSagaDiagnosticTruncateLine = "LspFloatWinBorder",
	LspSagaHoverBorder = "LspFloatWinBorder",
	LspSagaLspFinderBorder = "LspFloatWinBorder",
	LspSagaRenameBorder = "LspFloatWinBorder",
	LspSagaSignatureHelpBorder = "LspFloatWinBorder",
	LspSagaShTruncateLine = "LspFloatWinBorder",
	LspSagaAutoPreview = "LightOlive",
	DefinitionPreviewTitle = "LightOlive",
	TargetWord = "LightOlive",
	LspSagaCodeActionTitle = "LightOlive",
	LspSagaCodeActionContent = "Olive",
	LspSagaDiagnosticHeader = "LightOlive",
	LspSagaFinderSelection = "LightOlive",
	DefinitionCount = "Red",
	ReferencesCount = "Red",
	-- Telescope
	TelescopeBorder = "FloatBorder",
	TelescopeNormal = "Pmenu",
	TelescopeMultiSelection = "PmenuSel",
	TelescopeSelection = {fg = "LightHighlight", bg = "Grey", bold = true},
	TelescopeMatching = {fg = "LightOrange"},
	TelescopePromptPrefix = {fg = "LightHighlight"},
	-- Cmp
	CmpItemMenuDefault = "Pmenu",
	CmpItemAbbrDefault = "Pmenu",
	CmpItemAbbrMatch = "Pmenu",
	CmpItemKindDefault = "Delimiter",
	CmpItemKindTextDefault = "String",
	CmpItemKindKeywordDefault = "Keyword",
	CmpItemKindFunctionDefault = "Command",
	CmpItemKindMethodDefault = "Command",
	CmpItemKindTableDefault = "Parameter",
	CmpItemKindFieldDefault = "Field",
	CmpItemKindVariableDefault = "Variable",
	CmpItemKindEnumDefault = "Constant",
	CmpItemKindEnumMemberDefault = "Constant",
	CmpItemKindConstantDefault = "Constant",
	CmpItemKindPropertyDefault = "String",
	CmpItemKindUnitDefault = "Number",
	CmpItemKindValueDefault = "Number",
	CmpItemKindFileDefault = "Brown",
	CmpItemKindFolderDefault = "Brown",
	CmpItemKindOperatorDefault = "Operator",
	CmpItemKindSnippetDefault = "Macro",
}

function _G.hi_exec(group, opts, extra) end

for i, v in pairs(colors) do vim.api.nvim_set_hl(0, i, {fg = v[1], ctermfg = v[2]}) end
for i, v in pairs(highlights) do
	if type(v) == "string" then
		vim.api.nvim_set_hl(0, i, {link = v})
	else
		if v.fg then
			v.ctermfg = _G.colors[v.fg][2]
			v.fg = _G.colors[v.fg][1]
		end
		if v.bg then
			v.ctermbg = _G.colors[v.bg][2]
			v.bg = _G.colors[v.bg][1]
		end
		if v.sp then v.sp = _G.colors[v.sp][1] end
		vim.api.nvim_set_hl(0, i, v)
	end
end

return function()
	vim.g.colors_name = "nerdcontrast"
	if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
	if vim.g.WhiteTheme then
		vim.o.background = "light"
		colors.Fg = colors.Black
		colors.Bg = colors.White
		vim.g.terminal_color_15 = colors.Black[1]
		vim.g.terminal_color_0 = colors.White[1]
		vim.api.nvim_set_hl(0, "Fg", {link = "Black"})
		vim.api.nvim_set_hl(0, "Bg", {link = "White"})
		vim.api.nvim_set_hl(0, "Normal", {ctermfg = 0, ctermbg = 15, fg = "#000000", bg = "#ffffff"})
	else
		vim.o.background = "dark"
		colors.Bg = colors.Black
		colors.Fg = colors.White
		vim.g.terminal_color_0 = colors.Black[1]
		vim.g.terminal_color_15 = colors.White[1]
		vim.api.nvim_set_hl(0, "Fg", {link = "White"})
		vim.api.nvim_set_hl(0, "Bg", {link = "Black"})
		vim.api.nvim_set_hl(0, "Normal", {ctermbg = 0, ctermfg = 15, fg = "#f0eeea", bg = "NONE"})
	end
	for i, v in pairs(themeDep) do
		if not v[2] then v[2] = {} end
		if v[1].fg then
			v[2].fg = _G.colors[v[1].fg][1]
			v[2].ctermfg = _G.colors[v[1].fg][2]
		end
		if v[1].bg then
			v[2].bg = _G.colors[v[1].bg][1]
			v[2].ctermbg = _G.colors[v[1].bg][2]
		end
		if v[1].sp then v[2].sp = _G.colors[v[1].sp][1] end
		vim.api.nvim_set_hl(0, i, v[2])
	end
end
