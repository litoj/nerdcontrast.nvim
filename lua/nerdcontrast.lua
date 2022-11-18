local M = {}
local colors = {
	None = {"NONE", "NONE"},
	Black = {"#222222", 0},
	Black2 = {"#3a3a3a", 0},
	Violet = {"#8040ad", 5},
	Magenta = {"#ad30a8", 5}, -- 9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cca815", 3},
	Olive = {"#99a015", 2},
	Green = {"#54a015", 2},
	Cyan = {"#32a08d", 6},
	Blue = {"#3268ad", 4},
	Grey = {"#5a5856", 8},
	Grey2 = {"#7a7876", 8},
	LightGrey2 = {"#969390", 7},
	LightGrey = {"#bdbcbb", 7},
	LightViolet = {"#a04ddd", 5},
	LightMagenta = {"#bd40b7", 5},
	LightPink = {"#e7909a", 13},
	LightRed = {"#f03522", 9},
	LightOrange = {"#f09322", 11},
	LightYellow = {"#e8d822", 11},
	LightOlive = {"#b0cd22", 10},
	LightGreen = {"#77dd22", 10},
	LightCyan = {"#66e0c0", 14}, -- 50e8b0"
	LightBlue = {"#40a3e0", 12},
	White2 = {"#e0ddda", 15},
	White = {"#f0eeea", 15},
}
M.colors = colors

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

M.themeDep = {
	Folded = {{fg = "Fg2", bg = "Bg"}, {bold = true}},
	CursorLineNR = {{fg = "Fg3", bg = "Bg"}},
	Todo = {{fg = "Bg", bg = "Contrast"}, {bold = true}},
	FIXME = {{fg = "Bg", bg = "Orange"}, {bold = true}},
	DELETE = {{fg = "Bg", bg = "Red"}, {bold = true}},
	IMPORTANT = {{fg = "Bg", bg = "Red"}, {bold = true, underline = true}},
	OPTIONAL = {{fg = "Bg", bg = "Green"}, {bold = true}},
	DiffAdd = {{fg = "Green", bg = "Bg"}},
	DiffChange = {{fg = "Cyan", bg = "Bg"}},
	DiffDelete = {{fg = "Red", bg = "Bg"}},
	DiffText = {{fg = "Yellow", bg = "Bg"}},
	LspReferenceRead = {{bg = "Bg"}, {bold = true}},
	LspReferenceText = {{bg = "Bg"}, {bold = true}},
	LspReferenceWrite = {{bg = "Bg"}, {bold = true}},
	BufferCurrent = {{fg = "Fg"}, {bold = true}},
	Comment = {{fg = "Fg4"}, {italic = true}},
	Url = {{fg = "Fg3"}, {italic = true}},
}

local highlights = {
	Highlight = "Green",
	LightHighlight = "LightGreen",
	Contrast = "Magenta",
	LightContrast = "LightMagenta",
	-- Basics
	Search = "Title",
	IncSearch = "Search",
	VertSplit = "Fg6",
	StatusLine = "Bg",
	StatusLineNc = "Bg2",
	Pmenu = "Bg",
	PmenuSel = "Bg2",
	PmenuSbar = "Bg2",
	PmenuThumb = "Bg3",
	FoldColumn = "Fg",
	SignColumn = "Fg",
	Title = {fg = "LightHighlight", bold = true},
	MatchParen = {fg = "LightYellow", italic = true, bold = true},
	ErrorMsg = {fg = "LightRed", bold = true},
	WarningMsg = {fg = "LightOrange", bold = true},
	Question = {fg = "LightYellow", bold = true},
	Error = {sp = "LightRed", undercurl = true},
	Underlined = {fg = "LightBlue", sp = "LightBlue", underline = true},
	Constant = {fg = "Magenta", italic = true},
	FloatBorder = "Contrast",
	CursorColumn = "Bg",
	CursorLine = "Bg",
	LineNr = "Fg5",
	NonText = "Fg8",
	SpecialKey = "Violet",
	Keyword = "Blue",
	Include = "Keyword",
	Boolean = "Keyword",
	PreProc = "Cyan",
	Define = "PreProc",
	Statement = "Keyword",
	Special = "Keyword",
	SpecialChar = "Orange",
	Delimiter = "LightRed",
	Operator = "Red",
	Command = "LightBlue",
	Conditional = "Command",
	Repeat = "Command",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Type = "Fg",
	Function = "Fg",
	Identifier = "Fg",
	Variable = "Green",
	Parameter = "Olive",
	-- TreeSitter
	["@field"] = "Fg",
	["@variable"] = "Variable",
	["@parameter"] = "Parameter",
	["@constructor"] = "Identifier",
	["@keyword.operator"] = "Keyword",
	["@environment"] = "Constant",
	["@attribute"] = "Parameter",
	["@tag"] = "Statement", -- HTML
	-- TreeSitter language highlight changes
	["@tag.delimiter"] = "Delimiter", -- HTML
	["@tag.attribute"] = "Parameter", -- XML
	["@string.special"] = "LightOrange", -- Vim regex
	["@constructor.lua"] = "Delimiter",
	["@field.yaml"] = "Variable",
	["@label.json"] = "Variable",
	["@none.bash"] = "String",

	["@function.latex"] = "Variable",
	["@error.latex"] = "String",
	["@text.environment.latex"] = "Keyword",
	["@text.environment.name.latex"] = "Constant",
	["@text.reference.latex"] = "Title",
	["@text.title"] = "Title",
	["@text.emphasis.latex"] = {italic = true},
	["@text.strong.latex"] = {bold = true},
	["@text.math"] = "Number",
	["@namespace.latex"] = "Command",
	["@environment.latex"] = "Command",
	-- Vim syntax highlight changes
	sqlType = "String",
	sqlStatement = "Command",
	sqlOperator = "Operator",

	markdownUrl = "Url",
	markdownListMarker = "Delimiter",
	markdownLinkTextDelimiter = "Delimiter",
	markdownLinkDelimiter = "Delimiter",
	markdownEscape = "SpecialChar",
	markdownCode = "Cyan",
	markdownCodeBlock = "Fg2",
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

	xmlAttrib = "Parameter",
	xmlEqual = "Operator",
	xmlTag = "Delimiter",
	xmlTagName = "Label",

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
	-- Barbar
	BufferVisible = "Fg",
	BufferVisibleMod = "LightRed",
	BufferVisibleSign = "LightContrast",
	BufferCurrentSign = "LightHighlight",
	BufferInactive = "Fg3",
	BufferInactiveMod = "Orange",
	BufferInactiveSign = "Fg3",
	BufferCurrentMod = {fg = "LightRed", bold = true},
	BufferTabpages = "Cyan",
	BufferTabpageFill = "None",
	-- NvimTree
	NvimTreeExecFile = {fg = "LightGreen", bold = true},
	Directory = "Fg4",
	NvimTreeSymlink = {fg = "Cyan", bold = true},
	NvimTreeSpecialFile = {fg = "Pink", bold = true},
	NvimTreeOpenedFile = {fg = "Violet", bold = true},
	-- Lsp
	DiagnosticVirtualTextError = {fg = "Red", italic = true, bold = true},
	DiagnosticVirtualTextWarn = {fg = "Orange", italic = true},
	DiagnosticVirtualTextHint = {fg = "LightGrey", italic = true},
	DiagnosticVirtualTextInfo = {fg = "LightGrey", italic = true},
	DiagnosticUnderlineError = {sp = "Red", undercurl = true},
	DiagnosticUnderlineWarn = {sp = "Orange", undercurl = true},
	DiagnosticUnderlineHint = {sp = "LightGrey", underline = true},
	DiagnosticUnderlineInfo = {sp = "LightGrey", undercurl = true},
	DiagnosticError = "Red",
	DiagnosticWarn = "Orange",
	DiagnosticHint = "Fg3",
	DiagnosticInfo = "LightOlive",
	-- Dapui
	DapUIStop = "LightRed",
	DapUIRestart = "LightRed",
	DapUIStepOver = "Green",
	DapUIStepInto = "Green",
	DapUIStepOut = "LightYellow",
	DapUIStepBack = "LightMagenta",
	DapUIPlayPause = "LightOrange",
	DapUIThread = "Contrast",
	DapUICurrentFrameName = {underline = true},
	DapUIFrameName = "Fg3",
	DapUIFloatBorder = "FloatBorder",
	DapUILineNumber = "LineNr",
	DapUIStoppedThread = "Orange",
	DapUIBreakpointsCurrentLine = "DiagnosticSignInfo",
	DapUIBreakpointsLine = "Red",
	DapUIBreakpointsInfo = "Red",
	DapUIBreakpointsPath = "Brown",
	DapUIWatchesEmpty = "Red",
	DapUIWatchesError = "Red",
	DapUIModifiedValue = "Cyan",
	DapUIType = "Keyword",
	DapUIVariable = "Variable",
	DapUISource = "Brown",
	DapUIScope = "Contrast",
	DapUIWatchesValue = "Fg",
	DapUIValue = "Fg",
	DapUIDecoration = "Fg",
	-- Telescope
	TelescopeBorder = "FloatBorder",
	TelescopeNormal = "Fg",
	TelescopeMultiSelection = "Bg2",
	TelescopeSelection = "Bg2",
	TelescopePreviewMatch = "Bg",
	TelescopeMatching = {bold = true},
	TelescopePromptPrefix = "LightHighlight",
	-- Cmp
	CmpItemAbbrMatch = "LightBlue",
	CmpItemKind = "Delimiter",
	CmpItemKindText = "String",
	CmpItemKindKeyword = "Keyword",
	CmpItemKindFunction = "Command",
	CmpItemKindMethod = "Command",
	CmpItemKindTable = "Parameter",
	CmpItemKindField = "LightCyan",
	CmpItemKindVariable = "Variable",
	CmpItemKindEnum = "Constant",
	CmpItemKindEnumMember = "Constant",
	CmpItemKindConstant = "Constant",
	CmpItemKindProperty = "String",
	CmpItemKindUnit = "Number",
	CmpItemKindValue = "Number",
	CmpItemKindFile = "Brown",
	CmpItemKindFolder = "Brown",
	CmpItemKindOperator = "Operator",
	CmpItemKindSnippet = "Macro",
	-- Extra
	Neo = {fg = "Cyan", bold = true},
	Vim = {fg = "Green", bold = true},
}

for i, v in pairs(colors) do vim.api.nvim_set_hl(0, i, {fg = v[1], ctermfg = v[2]}) end
function M.hi(tbl)
	for i, v in pairs(tbl) do
		if type(v) == "string" then
			vim.api.nvim_set_hl(0, i, {link = v})
		else
			if v.fg then
				v.ctermfg = colors[v.fg][2]
				v.fg = colors[v.fg][1]
			end
			if v.bg then
				v.ctermbg = colors[v.bg][2]
				v.bg = colors[v.bg][1]
			end
			if v.sp then v.sp = colors[v.sp][1] end
			vim.api.nvim_set_hl(0, i, v)
		end
	end
end
M.hi(highlights)

vim.fn.matchadd("Todo", "TODO")
vim.fn.matchadd("Todo", "Todo")
vim.fn.matchadd("Todo", "NOTE")
vim.fn.matchadd("Todo", "Note")
vim.fn.matchadd("FIXME", "FIXME")
vim.fn.matchadd("FIXME", "WARN")
vim.fn.matchadd("DELETE", "DELETE")
vim.fn.matchadd("DELETE", "ERROR")
vim.fn.matchadd("IMPORTANT", "IMPORTANT")
vim.fn.matchadd("OPTIONAL", "OPTIONAL")
vim.fn.matchadd("OPTIONAL", "Optional")

M.load = function()
	vim.o.termguicolors = os.getenv("TERM") ~= "linux"
	vim.g.colors_name = "nerdcontrast"
	if vim.fn.exists("syntax_on") then vim.cmd.syntax "reset" end
	local link = function(links)
		local idx
		for i, link in ipairs(links) do
			if i == 1 then
				idx = "Fg"
			else
				idx = "Fg" .. i
			end
			colors[idx] = colors[link]
			vim.api.nvim_set_hl(0, idx, {link = link})
		end
		for i, link in ipairs(links) do
			if i == #links then
				idx = "Bg"
			else
				idx = "Bg" .. (#links - i + 1)
			end
			colors[idx] = colors[link]
			vim.api.nvim_set_hl(0, idx, {bg = colors[link][1], ctermbg = colors[link][2]})
		end
	end
	if vim.o.background == "light" then
		link({"Black", "Black2", "Grey", "Grey2", "LightGrey2", "LightGrey", "White2", "White"})
		vim.g.terminal_color_15 = colors.Black[1]
		vim.g.terminal_color_0 = colors.White[1]
		vim.api.nvim_set_hl(0, "Normal", {ctermfg = 0, ctermbg = 15, fg = "#000000", bg = "#faf8ff"})
		vim.api.nvim_set_hl(0, "Visual", {link = "Bg"})
	else
		link({"White", "White2", "LightGrey", "LightGrey2", "Grey2", "Grey", "Black2", "Black"})
		vim.g.terminal_color_0 = colors.Black[1]
		vim.g.terminal_color_15 = colors.White[1]
		vim.api.nvim_set_hl(0, "Normal", {ctermbg = 0, ctermfg = 15, fg = "#f0eeea", bg = "NONE"})
		vim.api.nvim_set_hl(0, "Visual", {link = "Bg2"})
	end
	for i, v in pairs(M.themeDep) do
		if not v[2] then v[2] = {} end
		if v[1].fg then
			v[2].fg = colors[v[1].fg][1]
			v[2].ctermfg = colors[v[1].fg][2]
		end
		if v[1].bg then
			v[2].bg = colors[v[1].bg][1]
			v[2].ctermbg = colors[v[1].bg][2]
		end
		if v[1].sp then v[2].sp = colors[v[1].sp][1] end
		vim.api.nvim_set_hl(0, i, v[2])
	end
	local present, glc = pcall(require, "galaxyline.themes.colors")
	if present then
		glc.nerdcontrast = {
			bg = colors.Bg[1],
			fg = colors.Fg[1],
			fg_alt = colors.Grey[1],
			yellow = colors.Yellow[1],
			cyan = colors.Cyan[1],
			green = colors.Green[1],
			orange = colors.Orange[1],
			magenta = colors.Magenta[1],
			blue = colors.Blue[1],
			red = colors.Red[1],
		}
		vim.api.nvim_set_hl(0, "GalaxylineFillSection", {bg = colors.Bg[1]})
	end
end
return M
