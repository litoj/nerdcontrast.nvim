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

	diffAdded = 'Green',
	diffRemoved = 'Red',

	-- PLUGINS
	DevIconMd = 'Fg1',
	FzfLuaBorder = 'FloatBorder',
	FzfLuaTitle = 'FloatTitle',
	FzfLuaSearch = 'Search',
	FzfLuaCursor = { fg = 'Magenta', bold = true, underline = true },
	FzfLuaCursorLine = { bg = 'Bg2', underline = true },
	UfoFoldedBg = 'Bg2',
	UfoFoldedFg = 'Fg2',
	UfoFoldedEllipsis = { fg = 'Orange', bold = true },
	LspSignatureActiveParameter = 'Bold',
	MarkSignHl = { fg = 'LightCyan', italic = true },
	i3ConfigShParam = '@parameter',

	-- Nerdcontrast
	Neo = { fg = 'Cyan', bold = true },
	Vim = { fg = 'Green', bold = true },
	Url = { fg = 'LightBlue', sp = 'LightBlue', underline = true },
	Bold = { bold = true },
	Italic = { italic = true },
}
