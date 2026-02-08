return vim.tbl_extend('force', require'nerdcontrast.theme.nc', {
	-- Variable types
	Constant = 'Violet',
	BuiltinVar = 'Cyan',
	Parameter = 'Olive',
	Field = 'LightGreen',
	Variable = 'Green',

	-- Control stmt
	Keyword = 'Blue',
	Statement = 'LightBlue',
	Repeat = 'LightBlue',
	Conditional = 'LightBlue',
	PreProc = 'FgCyan',
	FlowControl = 'LightRed', -- custom for return+break+continue statements

	Define = 'Magenta',
	Type = 'FgBlue',
	Label = 'LightViolet',
	Tag = 'Blue',
	Title = 'LightAc2',

	Operator = 'FgRed',
	Delimiter = 'LightRed',
	-- Data types
	Function = 'Fg1',
	BuiltinFn = 'LightBlue',
	Special = 'Magenta',
	SpecialKey = 'Orange',
	SpecialChar = 'LightOrange',

	Exception = 'FgMagenta',
	Directory = 'Green',
	File = 'FgYellow',
})
