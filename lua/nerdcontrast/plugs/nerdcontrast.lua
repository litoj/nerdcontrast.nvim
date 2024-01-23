-- for lazy-loading other groups that don't deserve a separate file
return {
	-- Vim regex syntax
	sqlType = 'String',
	sqlOperator = 'Operator',

	xmlAttrib = '@attribute',
	xmlEqual = 'Operator',
	xmlTag = 'Delimiter',
	xmlTagName = 'Tag',

	diffAdded = 'DiffAdd',
	diffRemoved = 'DiffDelete',

	-- PLUGINS
	DevIconMd = 'Fg1',
	FzfLuaBorder = 'FloatBorder',
	FzfLuaTitle = 'FloatTitle',
	FzfLuaSearch = 'Search',
	FzfLuaCursor = { fg = 'Ac2', bold = true, underline = true },
	FzfLuaCursorLine = { bg = 'CursorLine', underline = true },
	UfoFoldedBg = 'Pmenu',
	UfoFoldedFg = 'Fg2',
	UfoFoldedEllipsis = { fg = 'Conceal', bold = true },
	LspSignatureActiveParameter = { bold = true, sp = 'Ac1', underdouble = true },
	MarkSignHl = { fg = 'Ac3', italic = true },
	i3ConfigShParam = 'Parameter',

	-- Nerdcontrast
	Url = { fg = 'LightBlue', sp = 'LightBlue', underline = true },
	Bold = { bold = true },
	Italic = { italic = true },
}
