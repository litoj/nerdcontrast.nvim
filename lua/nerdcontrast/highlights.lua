return {
	Highlight = "Green",
	LightHighlight = "LightGreen",
	Contrast = "Magenta",
	LightContrast = "LightMagenta",
	-- Menu elements
	FloatTitle = {fg = "Olive", bold = true}, -- Custom group
	FloatBorder = "Contrast",
	NormalFloat = "Fg1",
	Pmenu = "Bg1",
	PmenuSel = "Bg2",
	PmenuSbar = "Bg2",
	PmenuThumb = "Bg3",
	-- InfoColumn/Cursor
	FoldColumn = "Fg1",
	SignColumn = "Fg1",
	CursorColumn = "Bg1",
	CursorLine = "Bg1",
	LineNr = "Fg5",
	CursorLineNr = {{fg = "Fg3", bg = "Bg1"}},
	-- Main UI
	VertSplit = "Fg6",
	TabLineFill = "",
	TabLineSel = "White",
	StatusLine = "Bg1",
	StatusLineNC = "Bg2",
	-- Code extras
	Search = {fg = "LightContrast", bold = true},
	IncSearch = "Search",
	Folded = {{fg = "Fg2", bg = "Bg1"}, {italic = true, bold = true}},
	Conceal = {{fg = "Orange", bg = "Bg3"}},
	MatchParen = {fg = "LightYellow", italic = true, bold = true},
	NonText = "Fg7", -- used for listchars (indent)
	SpecialKey = "Orange",
	Title = {fg = "LightHighlight", bold = true},
	Todo = {{fg = "Bg1", bg = "Contrast"}, {bold = true}},
	Underlined = {{fg = "Fg3"}, {underline = true}},
	Url = {fg = "LightBlue", sp = "LightBlue", underline = true},
	-- Messages
	ErrorMsg = {fg = "LightRed", bold = true},
	WarningMsg = {fg = "LightOrange", bold = true},
	Question = {fg = "LightYellow", bold = true},
	Error = {sp = "LightRed", undercurl = true},
	-- Code/Lsp
	LspReferenceRead = {{bg = "Bg1", fg = "LightCyan"}, {bold = true}},
	LspReferenceText = {{bg = "Bg2"}, {bold = true, underline = true}},
	LspReferenceWrite = {{bg = "Bg1", fg = "LightOrange"}, {bold = true}},
	Comment = {{fg = "Fg4"}, {italic = true}},
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
	Conditional = "LightBlue",
	Command = "LightBlue",
	Repeat = "Command",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Identifier = "Fg1",
	Type = {{fg = "Fg1"}, {italic = true}},
	Function = "Fg1",
	Constant = {fg = "Magenta", italic = true},
	Variable = "Green",
	Parameter = "Olive",

	-- Vim syntax highlight changes
	sqlType = "String",
	sqlStatement = "Command",
	sqlOperator = "Operator",

	xmlAttrib = "Parameter",
	xmlEqual = "Operator",
	xmlTag = "Delimiter",
	xmlTagName = "Label",

	DiffAdd = "Green",
	DiffChange = "Cyan",
	DiffDelete = "Red",
	DiffText = "Yellow",
	-- PLUGINS

	i3ConfigCommand = "Command",
	DevIconMd = "Fg1",

	-- FzfLua
	FzfLuaBorder = "FloatBorder",
	FzfLuaTitle = "FloatTitle",
	-- Ufo
	UfoFoldedBg = "Bg1",
	UfoFoldedFg = "Fg2",

	-- Extra
	Neo = {fg = "Cyan", bold = true},
	Vim = {fg = "Green", bold = true},
}
