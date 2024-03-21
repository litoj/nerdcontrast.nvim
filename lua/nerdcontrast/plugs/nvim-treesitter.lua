return {
	['@variable'] = 'Variable',
	['@variable.parameter'] = 'Parameter',
	['@variable.member'] = 'Field', -- field; TODO: concrete distinctions
	['@property'] = 'Field', -- field with getter/setter
	['@attribute'] = 'Parameter', -- direct access public field, given on creation → parameter-like
	['@environment'] = 'Constant',
	['@constant.builtin'] = 'Boolean',
	['@variable.builtin'] = { fg = 'BuiltinVar', italic = true },
	['@function.builtin'] = { fg = 'BuiltinFn', italic = true },

	['@namespace'] = 'Label',
	['@keyword.directive'] = 'PreProc',
	['@module'] = 'Label',
	['@module.builtin'] = { fg = 'Label', italic = true },
	['@constructor'] = 'Type',
	['@type.builtin'] = { fg = 'Type', italic = true },

	['@storageclass'] = 'Keyword',
	['@keyword.conditional'] = 'Conditional',
	['@keyword.repeat'] = 'Repeat',
	['@string.special'] = 'LightOrange',
	['@punctuation.special'] = 'Delimiter',
	-- Java
	['@type.qualifier'] = 'Keyword',
	['@attribute.java'] = 'PreProc',
	-- HTML
	['@tag'] = 'Tag',
	['@tag.delimiter'] = 'Delimiter',
	['@tag.attribute'] = '@attribute',
	-- SQL
	['@type.qualifier.sql'] = 'Conditional',
	['@keyword.operator.sql'] = 'Conditional',
	-- Vim
	['@variable.builtin.vim'] = 'Variable',
	['@string.regex.vim'] = '@string.special',
	['@string.special.vim'] = '@string',
	-- Make
	['@symbol.make'] = 'Variable',
	['@string.make'] = 'Variable',
	['@operator.make'] = 'Delimiter',
	-- Other
	['@type.builtin.kotlin'] = 'Type',
	['@keyword.import.c'] = 'PreProc',
	['@keyword.import.cpp'] = 'PreProc',
	['@conceal.json'] = 'String',
	['@namespace.javascript'] = 'Variable',
	['@namespace.typescript'] = 'Variable',
	['@operator.regex'] = '@string.special',
	['@type.query'] = 'Keyword',
	['@constructor.lua'] = 'Delimiter',
	['@keyword.luadoc'] = 'PreProc',
	['@function.macro.luadoc'] = 'Constant',
	['@keyword.jsdoc'] = 'PreProc',
}
