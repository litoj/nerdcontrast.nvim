local gid = vim.api.nvim_create_augroup("LspTokenHighlight", {clear = true})
vim.api.nvim_create_autocmd('LspTokenUpdate', {
	group = gid,
	callback = function(args)
		local token = args.data.token
		if token.modifiers.readonly and token.type == 'variable' and
				(token.modifiers.static or token.modifiers.fileScope) then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, 'Constant')
		elseif token.modifiers.globalScope and token.modifiers.defaultLibrary and token.type == 'variable' then
			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, 'Namespace')
		end
	end,
})
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
	FloatBorder = "Magenta",
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
	Visual = "Bg1",
	Search = {fg = "LightMagenta", bold = true},
	IncSearch = {fg = "LightBlue", bold = true},
	Folded = {{fg = "Fg2", bg = "Bg1"}, {italic = true, bold = true}},
	MatchParen = {fg = "LightYellow", italic = true, bold = true},
	Conceal = {{fg = "Orange", bg = "Bg3"}},
	NonText = "Fg7", -- used for listchars (indent)
	SpecialKey = "Orange",
	-- Messages
	ErrorMsg = {fg = "LightRed", bold = true},
	WarningMsg = {fg = "LightOrange", bold = true},
	Question = {fg = "LightYellow", bold = true},
	Error = {sp = "LightRed", undercurl = true},
	-- Code
	Title = {fg = "LightGreen", bold = true},
	Todo = {{fg = "Bg1", bg = "Magenta"}, {bold = true}},
	Underlined = {{fg = "Fg3"}, {underline = true}},
	Bold = {bold = true},
	Url = {fg = "LightBlue", sp = "LightBlue", underline = true},
	Comment = {{fg = "Fg4"}, {italic = true}},
	Keyword = "Blue",
	Include = "Keyword",
	Boolean = {fg = "Blue", italic = true},
	PreProc = "Cyan",
	Define = "PreProc",
	Statement = "Keyword",
	Special = "Magenta",
	SpecialChar = "Orange",
	Delimiter = "LightRed",
	Operator = "Red",
	Conditional = "LightBlue",
	Repeat = "Conditional",
	String = "Yellow",
	Character = "LightYellow",
	Number = "LightPink",
	Identifier = "Fg1",
	-- Type = "SlateGray",
	Type = "Fg2",
	Function = "Fg1",
	Constant = {fg = "Magenta", italic = true},
	Variable = "Green",
	Tag = "Parameter",
	Parameter = "LightOlive",
	-- Lsp
	LspReferenceRead = {{bg = "Bg1", fg = "LightCyan"}, {bold = true}},
	LspReferenceText = {{bg = "Bg2"}, {bold = true, underline = true}},
	LspReferenceWrite = {{bg = "Bg1", fg = "LightOrange"}, {bold = true}},
	DiagnosticUnnecessary = {{sp = "Fg4"}, {underdotted = true}},
	["@lsp"] = "",
	["@lsp.type.property"] = "Field",
	["@lsp.type.variable"] = "Variable",
	["@lsp.type.parameter"] = "Parameter",
	["@lsp.type.namespace"] = "Namespace",
	["@lsp.type.macro"] = "Macro",
	["@lsp.mod.readonly"] = "Bg1",
	["@lsp.mod.static"] = {italic = true},
	["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
	["@lsp.typemod.variable.defaultLibrary"] = "Namespace",
	["@lsp.typemod.variable.classScope"] = "Field",
	["@lsp.typemod.variable.globalScope"] = {fg = "LightGreen", italic = true},
	["@lsp.typemod.variable.fileScope"] = {fg = "LightGreen", italic = true},
	["@lsp.typemod.class.declaration"] = {{fg = "Fg2"}, {bold = true}},

	-- Vim regex syntax
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
	FzfLuaSearch = "Search",
	FzfLuaCursor = {fg = "LightMagenta", bold = true, underline = true},
	FzfLuaCursorLine = {{bg = "Bg1"}, {underline = true}},
	-- Ufo
	UfoFoldedBg = "Bg1",
	UfoFoldedFg = "Fg2",
	-- LspSignature
	LspSignatureActiveParameter = {bold = true},
	-- Custom
	Neo = {fg = "Cyan", bold = true},
	Vim = {fg = "Green", bold = true},
	Command = "LightBlue",
	Field = "LightGreen",
	Namespace = {fg = "Cyan", italic = true},
}
