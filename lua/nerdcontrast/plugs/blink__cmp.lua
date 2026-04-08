return {
	BlinkCmpLabelMatch = 'PmenuMatch',
	BlinkCmpDocBorder = 'FloatBorder',
	BlinkCmpSignatureHelpBorder = 'FloatBorder',
	BlinkCmpGhostText = { fg = 'Fg3', italic = true },

	BlinkCmpKindMethod = { fg = 'Function', reverse = true },
	BlinkCmpKindFunction = 'BlinkCmpKindMethod',
	BlinkCmpKindConstructor = 'BlinkCmpKindMethod',

	BlinkCmpKindModule = { fg = 'BuiltinVar', reverse = true },
	BlinkCmpKindClass = { fg = 'Type', reverse = true },
	BlinkCmpKindInterface = 'BlinkCmpKindClass',
	BlinkCmpKindStruct = 'BlinkCmpKindClass',
	BlinkCmpKindTypeParameter = 'BlinkCmpKindClass',
	BlinkCmpKindEnum = { fg = 'Constant', reverse = true },

	BlinkCmpKindEnumMember = 'BlinkCmpKindEnum',
	BlinkCmpKindConstant = 'BlinkCmpKindEnum',
	BlinkCmpKindField = { fg = 'Field', reverse = true },
	BlinkCmpKindProperty = 'BlinkCmpKindField',
	BlinkCmpKindVariable = { fg = 'Variable', reverse = true },

	BlinkCmpKindKeyword = { fg = 'Keyword', reverse = true },
	BlinkCmpKindOperator = { fg = 'Operator', reverse = true },
	BlinkCmpKindEvent = { fg = 'SpecialKey', reverse = true },
	BlinkCmpKindSnippet = 'Bg3',

	BlinkCmpKindText = { fg = 'String', reverse = true },
	BlinkCmpKindUnit = { fg = 'Number', reverse = true },
	BlinkCmpKindFile = { fg = 'File', reverse = true },
	BlinkCmpKindFolder = 'BlinkCmpKindFile',
	BlinkCmpKindCopilot = 'BlinkCmpKindSnippet',
}
