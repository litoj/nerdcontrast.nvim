return vim.tbl_extend('force', require'nerdcontrast.theme.nc', {
	-- Variable types
	Constant = 'Violet',
	BuiltinVar = 'Cyan',
	Field = 'LightGreen',
	Variable = 'Green',

	-- Control stmt
	Keyword = 'Blue',
	Statement = 'LightBlue',
	Repeat = 'LightBlue',
	Conditional = 'LightBlue',
	PreProc = 'FgCyan',
	FlowControl = 'Red', -- custom for return and break statements

	Define = 'BgRed',
	Type = 'FgBlue',
	Label = 'LightViolet',
	Tag = 'Blue',
	Title = 'LightAc2',

	Operator = 'Red',
	Delimiter = 'LightRed',
	-- Data types
	Function = 'Fg1',
	BuiltinFn = 'LightBlue',
	Number = 'FgRed',
	Boolean = 'Blue',
	String = 'Yellow',
	Character = 'LightYellow',
	Special = 'Magenta',
	SpecialKey = 'Orange',
	SpecialChar = 'LightOrange',

	Exception = 'FgMagenta',
	Directory = 'Green',
	File = 'FgYellow',
})
