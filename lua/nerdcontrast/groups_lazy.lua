return {
	-- Custom
	Neo = {fg = "Cyan", bold = true},
	Vim = {fg = "Green", bold = true},
	Highlight = "Green",
	LightHighlight = "LightGreen",
	Contrast = "Magenta",
	LightContrast = "LightMagenta",
	Command = "LightBlue",
	Field = "LightGreen",
	Namespace = {fg = "LightGreen", italic = true},
	-- Messages
	ErrorMsg = {fg = "LightRed", bold = true},
	WarningMsg = {fg = "LightOrange", bold = true},
	Question = {fg = "LightYellow", bold = true},
	Error = {sp = "LightRed", undercurl = true},
	-- UI extra
	Search = {fg = "LightContrast", bold = true},
	IncSearch = {fg = "LightBlue", bold = true},
	Folded = {{fg = "Fg2", bg = "Bg1"}, {italic = true, bold = true}},
	Title = {fg = "LightHighlight", bold = true},
	Todo = {{fg = "Bg1", bg = "Contrast"}, {bold = true}},
	Underlined = {{fg = "Fg3"}, {underline = true}},
	Url = {fg = "LightBlue", sp = "LightBlue", underline = true},
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
	["@lsp.type.macro"] = "Constant", -- cpp/c wrong assesment
	["@lsp.mod.readonly"] = "Bg2",
	["@lsp.mod.static"] = {italic = true},
	["@lsp.typemod.function.defaultLibrary"] = "Keyword",
	["@lsp.typemod.variable.defaultLibrary"] = {fg = "Blue", italic = true},
	["@lsp.typemod.variable.static"] = {fg = "LightGreen", italic = true},

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
	-- Ufo
	UfoFoldedBg = "Bg1",
	UfoFoldedFg = "Fg2",
	-- LspSignature
	LspSignatureActiveParameter = {bold = true},
}
