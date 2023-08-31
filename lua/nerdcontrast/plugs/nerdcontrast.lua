-- for lazy-loading other groups that don't deserve a separate file
return {
	-- Vim regex syntax
	sqlType = 'String',
	sqlOperator = 'Operator',

	xmlAttrib = '@attribute',
	xmlEqual = 'Operator',
	xmlTag = 'Delimiter',
	xmlTagName = 'Label',

	DiffAdd = 'Green',
	DiffChange = 'Cyan',
	DiffDelete = 'Red',
	DiffText = 'Yellow',

	-- PLUGINS
	DevIconMd = 'Fg1',
	FzfLuaBorder = 'FloatBorder',
	FzfLuaTitle = 'FloatTitle',
	FzfLuaSearch = 'Search',
	FzfLuaCursor = { fg = 'LightMagenta', bold = true, underline = true },
	FzfLuaCursorLine = { bg = 'Bg2', { underline = true } },
	UfoFoldedBg = 'Bg2',
	UfoFoldedFg = 'Fg2',
	UfoFoldedEllipsis = { fg = 'LightOrange', bold = true },
	LspSignatureActiveParameter = { bold = true },
	MarkSignHl = { fg = 'LightCyan', italic = true },

	-- Nerdcontrast
	Neo = { fg = 'Cyan', bold = true },
	Vim = { fg = 'Green', bold = true },
	Url = { fg = 'LightBlue', sp = 'LightBlue', underline = true },
}
