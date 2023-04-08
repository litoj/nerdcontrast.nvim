return {
	-- InfoColumn/Cursor
	FoldColumn = "Fg1",
	SignColumn = "Fg1",
	CursorColumn = "Bg1",
	CursorLine = "Bg1",
	LineNr = "Fg5",
	CursorLineNr = {{fg = "Fg3", bg = "Bg1"}},
	-- Menu elements
	FloatTitle = {fg = "Olive", bold = true}, -- Custom group
	FloatBorder = "Contrast",
	NormalFloat = "Fg1",
	Pmenu = "Bg1",
	PmenuSel = "Bg2",
	PmenuSbar = "Bg2",
	PmenuThumb = "Bg3",
	VertSplit = "Fg6",
	TabLineFill = "",
	TabLineSel = "White",
	StatusLine = "Bg1",
	StatusLineNC = "Bg2",
	MatchParen = {fg = "LightYellow", italic = true, bold = true},
	Conceal = {{fg = "Orange", bg = "Bg3"}},
	NonText = "Fg7", -- used for listchars (indent)
	SpecialKey = "Orange",
	-- Code
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
	Repeat = "Command",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Identifier = "Fg1",
	Type = "Fg3",
	Function = "Fg1",
	Constant = {fg = "Magenta", italic = true},
	Variable = "Green",
	Parameter = "Olive",
}
