return {
	["@field"] = "Field",
	["@namespace"] = "Namespace",
	["@variable"] = "Variable",
	["@parameter"] = "Parameter",
	["@constructor"] = "Type",
	["@keyword.operator"] = "Keyword",
	["@environment"] = "Constant",
	["@attribute"] = "Parameter",
	["@storageclass"] = "Keyword",
	["@type.builtin"] = "Keyword",
	["@constant.builtin"] = "Keyword",
	["@function.builtin"] = "Keyword",
	["@variable.builtin"] = "Keyword",
	["@property"] = "@field",
	["@string.special"] = "Orange",
	-- TreeSitter language highlight changes
	["@text.reference.gitcommit"] = "Variable",
	["@text.uri.gitcommit"] = "String",
	-- Java
	["@type.qualifier"] = "Keyword",
	["@attribute.java"] = "PreProc",
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
	["@text.uri"] = {{fg = "Fg4"}, {italic = true}},
	["@text.reference"] = "Url",
	["@none"] = "Fg1",
	["@text.todo.checked.markdown"] = {{fg = "Bg1", bg = "Green"}, {bold = true}},
	-- HTML
	["@tag"] = "Statement",
	["@tag.delimiter"] = "Delimiter",
	-- Other
	["@type.builtin.kotlin"] = "Type",
	["@include.c"] = "PreProc",
	["@include.cpp"] = "PreProc",
	["@property.css"] = "Parameter",
	["@tag.attribute.xml"] = "Parameter",
	["@constructor.lua"] = "Delimiter",
	["@field.yaml"] = "Variable",
	["@label.json"] = "Variable",
	["@type.query"] = "Keyword",
	["@none.bash"] = "String",
	["@label.help"] = "LightMagenta",
	-- SQL
	["@type.qualifier.sql"] = "Conditional",
	["@keyword.operator.sql"] = "Conditional",
}
