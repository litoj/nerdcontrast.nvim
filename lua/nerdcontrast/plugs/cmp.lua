return {
	CmpItemAbbrMatch = 'LightBlue',
	CmpItemKind = 'Normal',

	CmpItemKindMethod = { bg = 'LightBlue' },
	CmpItemKindFunction = 'CmpItemKindMethod',
	CmpItemKindConstructor = 'CmpItemKindMethod',

	CmpItemKindModule = { fg = 'Red', reverse = true },
	CmpItemKindInterface = 'CmpItemKindClass',
	CmpItemKindClass = { fg = 'Slate', { reverse = true } },
	CmpItemKindStruct = 'CmpItemKindClass',
	CmpItemKindEnum = { bg = 'Magenta' },
	CmpItemKindTypeParameter = 'CmpItemKindClass',

	CmpItemKindField = { fg = 'LightGreen', reverse = true },
	CmpItemKindProperty = 'CmpItemKindField',
	CmpItemKindVariable = { fg = 'Green', reverse = true },
	CmpItemKindConstant = 'CmpItemKindEnum',
	CmpItemKindEnumMember = 'CmpItemKindEnum',

	CmpItemKindKeyword = { bg = 'Blue' },
	CmpItemKindOperator = { bg = 'Red' },
	CmpItemKindEvent = { bg = 'LightOrange' },
	CmpItemKindSnippet = 'Bg3',

	CmpItemKindText = { bg = 'Yellow' },
	CmpItemKindUnit = { bg = 'LightPink' },
	CmpItemKindFile = { bg = 'Brown', {} },
	CmpItemKindFolder = { fg = 'Brown', { reverse = true } },
}
