-- for lazy-loading other groups that don't deserve a separate file
return {
	MoreMsg = 'Comment',
	ModeMsg = 'Fg3',
	-- Vim regex syntax
	sqlType = 'String',
	sqlOperator = 'Operator',

	xmlAttrib = '@attribute',
	xmlEqual = 'Operator',
	xmlTag = 'Delimiter',
	xmlTagName = 'Tag',

	diffAdded = 'DiffAdd',
	diffRemoved = 'DiffDelete',

	shOption = 'Parameter',

	-- PLUGINS
	DevIconMd = 'Fg1',
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
