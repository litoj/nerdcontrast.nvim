return {
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
	["@include.cpp"] = "PreProc",
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
	["@none"] = "Fg1",
}
