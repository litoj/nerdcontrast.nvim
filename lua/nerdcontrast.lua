vim.o.termguicolors = os.getenv("TERM") ~= "linux"
local M = {}
local colors = {
	None = {"NONE", "NONE"},
	Black = {"#2a2a2a", 0},
	Black2 = {"#454545", 0},
	Magenta = {"#a030a8", 5}, -- 9d2098
	Pink = {"#c06680", 13},
	Red = {"#cc2815", 1},
	Brown = {"#885515", 3},
	Orange = {"#cc6415", 3},
	Yellow = {"#cca815", 3},
	Olive = {"#99a015", 2},
	Green = {"#54a015", 2},
	Cyan = {"#32a08d", 6},
	Blue = {"#3870c0", 4},
	Grey = {"#5c5a58", 8},
	Grey2 = {"#7a7876", 8},
	LightGrey2 = {"#959391", 7},
	LightGrey = {"#bdbcbb", 7},
	LightMagenta = {"#c850e0", 5},
	LightPink = {"#e7909a", 13},
	LightRed = {"#f03522", 9},
	LightOrange = {"#f09322", 11},
	LightYellow = {"#e8d822", 11},
	LightOlive = {"#b0cd22", 10},
	LightGreen = {"#66d022", 10},
	LightCyan = {"#66e0c0", 14}, -- 50e8b0"
	LightBlue = {"#50a8f0", 12},
	White2 = {"#dfddda", 15},
	White = {"#f0eeea", 15},
}
M.colors = colors

colors.Highlight = colors.Green -- highlight
colors.LightHighlight = colors.LightGreen -- highlight
colors.Contrast = colors.Magenta -- contrast
colors.LightContrast = colors.LightMagenta -- contrast

M.themeDep = {
	Folded = {{fg = "Fg2", bg = "Bg"}, {italic = true, bold = true}},
	CursorLineNR = {{fg = "Fg3", bg = "Bg"}},
	Todo = {{fg = "Bg", bg = "Contrast"}, {bold = true}},
	LspReferenceRead = {{bg = "Bg", fg = "LightCyan"}, {bold = true}},
	LspReferenceText = {{bg = "Bg2"}, {bold = true, underline = true}},
	LspReferenceWrite = {{bg = "Bg", fg = "LightOrange"}, {bold = true}},
	BufferCurrent = {{fg = "Fg"}, {bold = true}},
	Comment = {{fg = "Fg4"}, {italic = true}},
	Underlined = {{fg = "Fg3"}, {underline = true}},
	Link = {{fg = "Fg4"}, {italic = true}},
	NvimTreeCursorLine = {{bg = "Bg"}, {bold = true}},
}

local highlights = {
	Highlight = "Green",
	LightHighlight = "LightGreen",
	Contrast = "Magenta",
	LightContrast = "LightMagenta",
	-- Basics
	Search = {fg = "LightMagenta", bold = true},
	IncSearch = "Search",
	VertSplit = "Fg6",
	StatusLine = "Bg",
	StatusLineNC = "Bg2",
	TabLineFill = {},
	TabLineSel = "White",
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
	Url = {fg = "LightBlue", sp = "LightBlue", underline = true},
	Constant = {fg = "Magenta", italic = true},
	FloatBorder = "Contrast",
	NormalFloat = "Fg",
	CursorColumn = "Bg",
	CursorLine = "Bg",
	LineNr = "Fg5",
	NonText = "Fg7", -- used for listchars (indent)
	SpecialKey = "Orange",
	Keyword = "Blue",
	Include = "Keyword",
	Boolean = "Keyword",
	PreProc = "Cyan",
	Define = "PreProc",
	Statement = "Keyword",
	Special = "Magenta",
	SpecialChar = "Orange",
	Delimiter = "LightRed",
	Operator = "Red",
	Command = "LightBlue",
	Conditional = "Command",
	Repeat = "Command",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Identifier = "Fg",
	Type = "Fg",
	Function = "Fg",
	Variable = "Green",
	Parameter = "Olive",
	-- TreeSitter
	["@field"] = "LightGreen",
	["@variable"] = "Variable",
	["@parameter"] = "Parameter",
	["@constructor"] = "Type",
	["@keyword.operator"] = "Keyword",
	["@environment"] = "Constant",
	["@attribute"] = "Parameter",
	["@storageclass"] = "Keyword",
	["@type.builtin"] = "Keyword",
	["@variable.builtin.java"] = "Keyword",
	["@constant.builtin"] = "Keyword",
	["@function.builtin"] = "Keyword",
	-- TreeSitter language highlight changes
	["@property"] = "@field", -- C/CPP
	["@include.c"] = "PreProc",
	["@property.css"] = "Parameter",
	["@type.qualifier"] = "Keyword", -- Java
	["@attribute.java"] = "PreProc",
	["@tag"] = "Statement", -- HTML
	["@tag.delimiter"] = "Delimiter", -- HTML
	["@tag.attribute"] = "Parameter", -- XML
	["@string.special"] = "LightOrange", -- Vim regex
	["@constructor.lua"] = "Delimiter",
	["@field.yaml"] = "Variable",
	["@label.json"] = "Variable",
	["@type.query"] = "Keyword",
	["@none.bash"] = "String",
	-- LaTeX
	["@text.environment.latex"] = "Keyword",
	["@text.environment.name.latex"] = "Constant",
	["@text.reference.latex"] = "Title",
	["@text.title"] = "Title",
	["@text.emphasis"] = {italic = true},
	["@text.strong"] = {bold = true},
	["@text.math"] = "Pink",
	["@function.latex"] = "Variable",
	["@error.latex"] = "String",
	["@namespace.latex"] = "Command",
	["@environment.latex"] = "Command",
	-- Markdown
	["@text.literal"] = "Cyan",
	["@text.uri"] = "Link",
	["@text.reference"] = "Url",
	["@none"] = "Fg",

	-- Vim syntax highlight changes
	sqlType = "String",
	sqlStatement = "Command",
	sqlOperator = "Operator",

	xmlAttrib = "Parameter",
	xmlEqual = "Operator",
	xmlTag = "Delimiter",
	xmlTagName = "Label",

	i3ConfigCommand = "Command",

	DiffAdd = "Green",
	DiffChange = "Cyan",
	DiffDelete = "Red",
	DiffText = "Yellow",
	diffAdded = "DiffAdd",
	diffChanged = "DiffChange",
	diffDiffer = "DiffChange",
	diffBDiffer = "diffDiffer",
	diffRemoved = "DiffRemove",
	gitcommitSummary = "Title",
	gitcommitHeader = "Title",
	gitcommitFile = "String",
	gitcommitArrow = "Delimiter",
	gitcommitBranch = "Green",
	gitcommitType = "Keyword",

	helpHeadline = "Title",
	helpHeader = "LightHighlight",
	helpHyperTextJump = "Command",
	helpHyperTextEntry = "LightMagenta",
	helpCommand = "String",
	helpTag = "Parameter",
	helpOption = "Variable",
	helpSpecial = "Parameter",
	helpExample = "Cyan",
	helpType = "Keyword",
	helpIdentifier = "helpType",
	helpFunction = "LightCyan",
	helpStructure = "@field",
	helpSectionDelim = "Delimiter",
	helpStorageClass = "Keyword",
	helpURL = "Url",
	helpLabel = "LightMagenta",
	helpException = "Orange",
	helpTypeDef = "Keyword",
	helpBar = "Delimiter",
	helpStar = "Delimiter",
	helpBackTick = "Delimiter",

	-- PLUGINS

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
	NvimTreeExecFile = {fg = "LightGreen", bold = true},
	Directory = {fg = "Green", bold = true},
	NvimTreeSymlink = {fg = "Cyan", bold = true},
	NvimTreeSpecialFile = "Fg",
	NvimTreeOpenedFile = {fg = "Orange", bold = true},
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
	BufferTabpageFill = "Fg5",
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
	-- DapUI
	DapUIStop = "LightRed",
	DapUIRestart = "LightRed",
	DapUIStepOver = "Green",
	DapUIStepInto = "Green",
	DapUIStepOut = "LightYellow",
	DapUIStepBack = "LightMagenta",
	DapUIPlayPause = "LightOrange",
	DapUIUnavailable = "Fg3",
	DapUIThread = "Fg",
	DapUICurrentFrameName = {fg = "Contrast", underline = true},
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
	-- FzfLua
	FzfLuaBorder = "FloatBorder",
	FzfLuaTitle = "FloatTitle",
	-- Cmp
	CmpItemAbbrMatch = "LightBlue",
	CmpItemKind = "Delimiter",
	CmpItemKindText = "String",
	CmpItemKindKeyword = "Keyword",
	CmpItemKindFunction = "Command",
	CmpItemKindMethod = "CmpItemKindFunction",
	CmpItemKindField = "@field",
	CmpItemKindVariable = "Variable",
	CmpItemKindEnum = "Constant",
	CmpItemKindEnumMember = "Constant",
	CmpItemKindConstant = "Constant",
	CmpItemKindProperty = "@field",
	CmpItemKindUnit = "Number",
	CmpItemKindValue = "Normal",
	CmpItemKindFile = "Brown",
	CmpItemKindFolder = "Brown",
	CmpItemKindOperator = "Operator",
	CmpItemKindSnippet = "Macro",
	CmpItemKindConstructor = "CmpItemKindMethod",
	CmpItemKindClass = "Pink",
	CmpItemKindTable = "LightCyan",
	CmpItemKindStruct = "CmpItemKindTable",
	CmpItemKindInterface = "CmpItemKindClass",
	-- Ufo
	UfoFoldedBg = "Bg",
	UfoFoldedFg = "Fg2",

	-- Extra
	Neo = {fg = "Cyan", bold = true},
	Vim = {fg = "Green", bold = true},
	FloatTitle = {fg = "Olive", bold = true},
}

for i, v in pairs(colors) do vim.api.nvim_set_hl(0, i, {fg = v[1], ctermfg = v[2]}) end
function M.hi(tbl)
	for k, v in pairs(tbl) do
		if type(v) == "string" then
			vim.api.nvim_set_hl(0, k, {link = v})
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
			vim.api.nvim_set_hl(0, k, v)
		end
	end
end

local function check()
	local ok, fl = pcall(require, "feline")
	if ok then fl.use_theme({fg = colors.Fg[1], bg = colors.Bg[1]}) end
end

if vim.v.vim_did_enter ~= 1 then
	vim.api.nvim_create_autocmd("VimEnter", {once = true, callback = check})
end

M.setup = function()
	vim.g.colors_name = "nerdcontrast"
	if highlights then
		M.hi(highlights)
		highlights = nil
	end
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
		vim.api.nvim_set_hl(0, "Normal", {
			ctermfg = 0,
			ctermbg = 15,
			fg = "#000000",
			bg = vim.g.bg_none and "NONE" or "#faf8ff",
		})
		vim.api.nvim_set_hl(0, "Visual", {link = "Bg"})
	else
		link({"White", "White2", "LightGrey", "LightGrey2", "Grey2", "Grey", "Black2", "Black"})
		vim.g.terminal_color_0 = colors.Black[1]
		vim.g.terminal_color_15 = colors.White[1]
		vim.api.nvim_set_hl(0, "Normal", {
			ctermbg = 0,
			ctermfg = 15,
			fg = "#f0eeea",
			bg = vim.g.bg_none and "NONE" or "#101010",
		})
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
	check()
end
return M
